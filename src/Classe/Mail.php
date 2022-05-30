<?php

namespace App\Classe;

use Mailjet\Client;
use Mailjet\Resources;

class Mail
{
    private $key="0643b4d5f66bed696f06dac6f39dfad6";
    private $secret="572f30183b371f103ab68d30accf07e2";

    public function send($to_email,$to_name,$subject,$content)
    {
        $mj=new Client($this->key,$this->secret, true,['version'=>'v3.1']);
        $body = [
            'Messages' => [
                [
                    'From' => [
                        'Email' => "test.boutique@outlook.com",
                        'Name' => "Test"
                    ],
                    'To' => [
                        [
                            'Email' => $to_email,
                            'Name' => $to_name
                        ]
                    ],
                    'TemplateID' => 3967762,
                    'TemplateLanguage' => true,
                    'Subject' => $subject,
                    'Variables' => [
                        'content'=>$content
            ]
                ]
            ]
        ];
        $response = $mj->post(Resources::$Email, ['body' => $body]);
    }
}
?>