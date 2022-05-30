<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Entity\ResetPassword;
use App\Entity\User;
use App\Form\ResetPasswordType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;

class ResetPasswordController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }
    #[Route('/motdepasse-oublié', name: 'reset_password')]
    public function index(Request $request): Response
    {
        if($this->getUser()){
            return $this->redirectToRoute("home");
        }
        if($request->get('email')){
            $user=$this->manager->getRepository(User::class)->findOneByEmail($request->get('email'));
            if($user){
                $resetPassword=new ResetPassword();
                $resetPassword->setUser($user);
                $resetPassword->setToken(uniqid());
                $resetPassword->setCreateAt(new \DateTime());
                $this->manager->persist($resetPassword);
                $this->manager->flush();
                $mail=new Mail();
                $url=$this->generateUrl('update_password',[
                    'token'=>$resetPassword->getToken()
                ]);
               
                $content="Bonjour ".$user->getFirstname()."<br/>Vous avez demandé à réinitialiser votre mot de passe.</br></br>
                        Merci de bien vouloir cliquer sur le lien suivant pour <a href='http://127.0.0.1:8000".$url."'>mettre à jour votre mot de passe</a>";
                $mail->send($user->getEmail(),$user->getFirstname(),'Mot de passe oublié',$content);
                $this->addFlash('notice','Vous allez recevoir un mail pour reinitialiser votre mot de passe');
            }else{
                $this->addFlash('notice','Cette adresse mail est inconnue');
            }
        }
        return $this->render('reset_password/index.html.twig');
    }

    #[Route('/motdepasse-modifier/{token}', name: 'update_password')]
    public function update($token,Request $request,UserPasswordHasherInterface $hash)
    {
        $resetPassword=$this->manager->getRepository(ResetPassword::class)->findOneByToken($token);
        if(!$resetPassword){
            return $this->redirectToRoute('reset_password');
        }
        $now=new \DateTime();
        if($now > $resetPassword->getCreateAt()->modify('+ 10 min')){
            $this->addFlash('notice','Votre demande de reinitialisation de mot de passe à expiré');
            return $this->redirectToRoute('reset_password');
        }
        $form=$this->createForm(ResetPasswordType::class);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $newPwd=$form->get('new_password')->getData();
            $password=$hash->hashPassword($resetPassword->getUser(),$newPwd);
            $resetPassword->getUser()->setPassword($password);
            $this->manager->flush();
            $this->addFlash('notice','Votre mot de passe a été mis à jour');
            return $this->redirectToRoute('app_login');
        }
        return $this->renderForm('reset_password/update.html.twig',[
            'form'=>$form
        ]);
    }
}
