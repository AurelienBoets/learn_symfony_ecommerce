<?php

namespace App\Controller;

use App\Classe\Mail;
use App\Form\ContactType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ContactController extends AbstractController
{
    #[Route('/contact', name: 'contact')]
    public function index(Request $request,): Response
    {
        $form=$this->createForm(ContactType::class);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $this->addFlash('notice','Merci de nous avoir contacter, notre équipe va vous répondre dans les meilleurs délais');
            $mail=new Mail();
            $mail->send('test.boutique@outlook.com','La Boutique',"Demande de ".$form->get("prenom")->getData()." ".$form->get('nom')->getData()." ".$form->get('email')->getData(),$form->get('content')->getData());
        }
        return $this->renderForm('contact/index.html.twig', [
            'form' => $form
        ]);
    }
}
