<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Classe\Mail;
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
    public function index($stripeSessionId, Cart $cart): Response
    {
        $order=$this->manager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);
        if(!$order || $order->getUser()!=$this->getUser()){
            return $this->redirectToRoute('home');}
            if($order->getState()==0){
                $order->setState(1);
                $this->manager->flush();
                $mail=new Mail();
                $content="Merci pour votre commande.<br/>Lorem ipsum dolor quis veniam autem similique blanditiis, eos assumenda doloribus, perferendis suscipit ratione quae.";
                $mail->send($order->getUser()->getEmail(),$order->getUser()->getFirstName(),'Commande',$content);
            }
        if($order->getState()==1){
            $cart->remove();
        }
            
        return $this->render('order_validate/index.html.twig',[
            'order'=>$order
        ]);
    }
}
