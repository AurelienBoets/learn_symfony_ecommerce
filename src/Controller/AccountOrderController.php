<?php

namespace App\Controller;

use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountOrderController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        return $this->manager=$manager;
    }

    #[Route('/compte/mes-commandes', name: 'account_order')]
    public function index(): Response
    {
        $orders=$this->manager->getRepository(Order::class)->findSuccesOrders($this->getUser());
        return $this->render('account/order.html.twig',[
            'orders'=>$orders
        ]);
    }
    
    #[Route('/compte/mes-commandes/{reference}', name: 'account_order_show')]
    public function show($reference): Response
    {
        $order=$this->manager->getRepository(Order::class)->findOneByReference($reference);
        if(!$order || $order->getUser() != $this->getUser()){
            return $this->redirectToRoute('accpunt_order');
        }
        return $this->render('account/order_show.html.twig',[
            'order'=>$order
        ]);
    }
}
