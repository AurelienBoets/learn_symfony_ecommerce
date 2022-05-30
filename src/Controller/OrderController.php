<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Order;
use App\Entity\OrderDetails;
use App\Form\OrderType;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        return $this->manager=$manager;
    }

    #[Route('/commande', name: 'order')]
    public function index(Cart $cart,Request $request): Response
    {
        if(!$this->getUser()->getAddresses()->getValues()){
            return $this->redirectToRoute('account_address_add');
        }
        $form=$this->createForm(OrderType::class,null,[
            'user'=>$this->getUser()
        ]);
        return $this->renderForm('order/index.html.twig',[
            'form'=>$form,
            'cart'=>$cart->getFull()
        ]);
    }

    #[Route('/commande/recapitulatif', name: 'order_recap')]
    public function add(Cart $cart,Request $request): Response
    {
        if(!$this->getUser()->getAddresses()->getValues()){
            return $this->redirectToRoute('account_address_add');
        }
        $form=$this->createForm(OrderType::class,null,[
            'user'=>$this->getUser()
        ]);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $date=new DateTime();
            $carriers=$form->get('carriers')->getData();
            $delivery=$form->get('address')->getData();
            $deliverycontent=$delivery->getFirstname().''.$delivery->getLastname();
            $deliverycontent .='<br>'.$delivery->getPhone();
            if($delivery->getCompany()){
                $deliverycontent .='<br>'.$delivery->getCompany();
            }
            $deliverycontent .='<br>'.$delivery->getAddress();
            $deliverycontent .='<br>'.$delivery->getPostal().''.$delivery->getCity();
            $deliverycontent .='<br>'.$delivery->getCountry();
            $order=new Order();
            $reference=$date->format('dmY').'-'.uniqid();
            $order->setReference($reference);
            $order->setUser($this->getUser());
            $order->setCreatedAt($date);
            $order->setCarrierName($carriers->getName());
            $order->setCarrierPrice($carriers->getPrice());
            $order->setDelivery($deliverycontent);
            $order->setState(0);
            $this->manager->persist($order);
            foreach($cart->getFull() as $item){
                
                $orderDetails=new OrderDetails();
                $orderDetails->setMyOrder($order);
                $orderDetails->setProduct($item["product"]->getName());
                $orderDetails->setQuantity($item['quantity']);
                $orderDetails->setPrice($item['product']->getPrice());
                $orderDetails->setTotal($item['product']->getPrice()*$item['quantity']);
                $this->manager->persist($orderDetails);
            }
            $this->manager->flush();
            
            
               
            return $this->render('order/add.html.twig',[
                'cart'=>$cart->getFull(),
                'carrier'=>$carriers,
                'delivery'=>$deliverycontent,
                'reference'=>$order->getReference()
            ]);
            
        }
        return $this->redirectToRoute('cart');
    }
    
}