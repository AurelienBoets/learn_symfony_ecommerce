<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class OrderValidateController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        return $this->manager=$manager;
    }
    #[Route('/commande/merci/{stripeSessionId}', name: 'app_order_validate')]
    public function index($stripeSessionId): Response
    {
        $order=$this->manager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);
        if(!$order || $order->getUser()!=$this->getUser()){
            return $this->redirectToRoute('home');
        }
        if(!$order->isIsPaid()){
            $order->setIsPaid(1);
            $this->manager->flush();
        }
        return $this->render('order_validate/index.html.twig',[
            'order'=>$order
        ]);
    }
}
