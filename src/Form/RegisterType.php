<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Validator\Constraints\Length;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('lastname', TextType:: class, [
                'constraints' => new Length(255 , 2)
            ])
            ->add('firstname', TextType:: class, [
                'constraints' => new Length(255 , 2)
            ])
            ->add('email', EmailType:: class)
            ->add('phone', TelType::class)
            ->add('password', RepeatedType:: class, [
                'type' => PasswordType:: class,
                'invalid_message' => 'Le mot de passe et le confirmation doivent être identique',
                'required' =>true,
                'first_options' => [ 'label' => false, 
                    'attr' => [
                        'placeholder' => 'Votre mot de passe',
                    ]
                ],
                'second_options' => [ 'label' => false, 
                    'attr' => [
                        'placeholder' => 'Confirmez votre mot de passe',
                    ]
                ]
            ])
            ->add('submit' , SubmitType:: class, [
                'label' => "S'inscrire",
                'attr' => [
                    'class' => 'btnRegister'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
