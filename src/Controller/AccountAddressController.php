<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Entity\Address;
use App\Form\AddressType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AccountAddressController extends AbstractController
{
    private $manager;
    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager=$manager;
    }
    #[Route('/compte/adresses', name: 'account_address')]
    public function index(): Response
    {
        return $this->render('account/address.html.twig');
    }
    #[Route('/compte/ajouter-adresse', name: 'account_address_add')]
    public function add(Request $request,Cart $cart): Response
    {
        $address=New Address();
        $form=$this->createForm(AddressType::class,$address);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $address->setUser($this->getUser());
            $this->manager->persist($address);
            $this->manager->flush();
            if($cart->get()){
                return $this->redirectToRoute('order');
            }
            return $this->redirectToRoute('account_address');
        }
        return $this->renderForm('account/address_add.html.twig',[
            'form'=>$form
        ]);
    }
    #[Route('/compte/modifier-adresse/{id}', name: 'account_address_edit')]
    public function edit(Request $request, $id): Response
    {
        $address=$this->manager->getRepository(Address::class)->findOneById($id);
        if(!$address || $address->getUser()!=$this->getUser()){
            return $this->redirectToRoute('account_address');
        }
        $form=$this->createForm(AddressType::class,$address);
        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()){
            $this->manager->flush();
            return $this->redirectToRoute('account_address');
        }
        return $this->renderForm('account/address_add.html.twig',[
            'form'=>$form
        ]);
    }
    #[Route('/compte/supprimer-adresse/{id}', name: 'account_address_delete')]
    public function delete($id): Response
    {
        $address=$this->manager->getRepository(Address::class)->findOneById($id);
        if($address && $address->getUser() ==$this->getUser()){
            $this->manager->remove($address);
            $this->manager->flush();
            return $this->redirectToRoute('account_address');
        }
        
            
            return $this->redirectToRoute('account_address');
    }
}
