<?php

namespace App\Controller\Admin;

use App\Classe\Mail;
use App\Entity\Order;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;

class OrderCrudController extends AbstractCrudController
{
    private $manager;
    private $admin;
    public function __construct(EntityManagerInterface $manager, AdminUrlGenerator $admin)
    {
        $this->manager=$manager;
        $this->admin=$admin;
    }

    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureActions(Actions $actions): Actions
    {
        $updatePreparation=Action::new('updatePreparation','Préparation en cours','fas fa-box-open')->linkToCrudAction('updatePreparation');
        $updateDelivery=Action::new('updateDelivery','Livraison en cours',"fas fa-truck")->linkToCrudAction('updateDelivery');
        return $actions
            ->add('detail',$updatePreparation)
            ->add('detail',$updateDelivery)
            ->add('index','detail');
    }

    public function updatePreparation(AdminContext $context)
    {
        $order=$context->getEntity()->getInstance();
        $order->setState(2);
        $this->manager->flush();
        $this->addFlash('notice',"<span style='color:green;'><strong>La commande".$order->getReference()." est bien <u>en cours de préparation</u></strong></span>");
        $url=$this->admin
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();
        return $this->redirect($url);
    }
    public function updateDelivery(AdminContext $context)
    {
        $order=$context->getEntity()->getInstance();
        $order->setState(3);
        $this->manager->flush();
        $this->addFlash('notice',"<span style='color:green;'><strong>La commande".$order->getReference()." est bien <u>en cours de livraison</u></strong></span>");
        $mail=new Mail();
        $mail->send($order->getUser()->getEmail(),$order->getUser()->getFirstName(),"Livraison","Votre commande est en cours de livraison");
        $url=$this->admin
            ->setController(OrderCrudController::class)
            ->setAction('index')
            ->generateUrl();
        return $this->redirect($url);
    }
    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            DateField::new('created_at'),
            TextField::new('user.getFullName','User'),
            TextEditorField::new('delivery','Adresse')->onlyOnDetail(),
            MoneyField::new('total')->setCurrency('EUR'),
            ChoiceField::new('state')->setChoices([
                'Non payé'=>0,
                'Payé'=>1,
                'Préparation'=>2,
                'Livraison en cours'=>3
            ]),
            ArrayField::new('orderDetails','Produits achetés')->hideOnIndex()
        ];
    }
    
}
