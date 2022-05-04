<?php

namespace App\Controller;

use App\Form\ChangePasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class AccountPasswordController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }
    #[Route('/compte/password', name: 'account_password')]
    public function index(Request $request,UserPasswordHasherInterface $hash): Response
    {
        $notification="";
        $user=$this->getUser();
        $form=$this->createForm(ChangePasswordType::class,$user);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $oldpwd=$form->get("old_password")->getData();
            if($hash->isPasswordValid($user,$oldpwd)){
                $newpwd=$form->get("new_password")->getData();
                $password=$hash->hashPassword($user,$newpwd);
                $user->setPassword($password);
                $this->manager->flush();
                return $this->redirectToRoute('account');
            }else{
                $notification="Votre mot de passe actuel n'est pas le bon";
            }
        }
        return $this->renderForm('account/password.html.twig',[
            "form"=>$form,
            "notification"=>$notification
        ]);
    }
}
