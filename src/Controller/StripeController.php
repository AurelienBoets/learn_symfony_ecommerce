<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;
use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StripeController extends AbstractController
{
    #[Route('/commande/create-session/{reference}', name: 'stripe_create_session')]
    public function index(Cart $cart, EntityManagerInterface $manager,$reference): Response
    {
        $product_for_stripe = [];
        $YOUR_DOMAIN = 'http://127.0.0.1:8000';
        $order=$manager->getRepository(Order::class)->findOneByReference($reference);
        foreach ($order->getOrderDetails()->getValues() as $product) {
            $product_object=$manager->getRepository(Product::class)->findOneByName($product->getProduct());
            
            $product_for_stripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => $product->getPrice(),
                    'product_data' => [
                        'name' => $product->getProduct(),
                        'images' => [$YOUR_DOMAIN."/images/".$product_object->getIllustration()],
                    ],
                ],
                'quantity' => $product->getQuantity(),
            ];
        }
        $product_for_stripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => $order->getCarrierPrice()*100,
                    'product_data' => [
                        'name' => $order->getCarrierName(),
                        'images' => [$YOUR_DOMAIN],
                    ],
                ],
                'quantity' => 1,
            ];
        Stripe::setApiKey('sk_test_51L2yrFF3VpubawNfhZqA2gPystXyU4NKdzDIySKtWW36H0J3f3uan9hHcGIE7iQM0tXGvLB8KYcP613nP8W1m6I1003IX12fGT');
 
        $checkout_session = Session::create([
            'customer_email'=>$this->getUser()->getEmail(),
            'line_items' => [
                $product_for_stripe
            ],
            'payment_method_types' => [
                'card',
            ],
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}',
        ]);
        $order->setStripeSessionId($checkout_session->id);
        $manager->flush();
 
        return $this->redirect($checkout_session->url);
    }
}
