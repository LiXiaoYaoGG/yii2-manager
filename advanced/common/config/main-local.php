<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=info',
            'username' => 'root',
            'password' => 'root',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => '******',
                'username' => '******',
                'password' => '******',
                'port' => '25',
                'encryption' => 'tls',
                ],
            'messageConfig'=>[
                'charset'=>'UTF-8',
                'from'=>['ccdatesite@126.com'=>'admin']
            ],
        ],
    ],
];
