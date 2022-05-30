<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\User;
use App\Form\RegisterType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class RegisterController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }
    #[Route('/inscription', name: 'register')]
    public function index(Request $request,UserPasswordHasherInterface $passwordHash): Response
    {
        $notif=null;
        $user=new User();
        $form=$this->createForm(RegisterType::class, $user);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $user=$form->getData();
            $search_email=$this->manager->getRepository(User::class)->findOneByEmail($user->getEmail());
            if(!$search_email){
                $password=$passwordHash->hashPassword($user,$user->getPassword());
                $user->setPassword($password);
                $this->manager->persist($user);
                $this->manager->flush();
                $mail=new Mail();
                $content="Bonjour ".$user->getFirstName()."<br/> Bienvenue sur la boutique dédié au made in France <br>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Aliquid impedit aperiam voluptatum mollitia magnam eaque molestias accusantium eveniet, ratione quos voluptate incidunt, vero obcaecati modi sit laudantium praesentium veritatis libero!";
                $mail->send($user->getEmail(),$user->getFirstName(),'Bienvenue sur la Boutique',$content);
                $notif="Votre inscription s'est correctement déroulée, vous pouvez maintenant vous connecter à votre compte.";
            }else{
                $notif="L'email que vous avez renseigné existe déjà.";
            }
            
           
        }
        return $this->renderForm('register/index.html.twig', ['form'=>$form,"notif"=>$notif]);
    }
}
