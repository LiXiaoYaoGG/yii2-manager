<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=121.41.82.144;dbname=info',
            'username' => 'root',
            'password' => 'mysql_jing',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.126.com',
                'username' => 'ccdatesite@126.com',
                'password' => '123qwe123qwe',
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
