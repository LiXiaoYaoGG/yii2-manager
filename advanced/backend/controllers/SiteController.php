<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use Yansongda\Pay\Pay;
/**
 * Site controller
 */
class SiteController extends Controller
{
    protected $config = [
        'alipay' => [
            'app_id' => '2016080500169668',
            'notify_url' => 'http://yansongda.cn/alipay_notify.php',
            'return_url' => 'http://yansongda.cn/return.php',
            'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwGCJAvZymcjK0JGwndndZz9kVWqEAw5/WMTJxHW1n5eiZMLVEyEi4IMPnm2ftez/maNZqyvn2Trd/WycX+65q4pTDahNf2WLgI5vbWMchV7osdQw7042fugycpNYvwElWWm6R/rOiApgoJgFwhOhmZJ50ebAjtZjXmmz8g+99+lmXb4E/9FgM2gIQXuEfPFCRhYgDW7CvBnIeo9c/Co2amDIjdcgMfAweuNCjyVdVDcQee9OiPSiYoUsI/D4LgvUpm5kWmasUop8Sc6fUEP7kpDz8rwPm6NuobdIRV5T/RXzc7fu2o+hczBzqC/rV2V7bdpk9H1sDi5AS/rqMxXIwQIDAQAB',
            'private_key' => 'MIIEogIBAAKCAQEAt2VexTVKcRtQ0FPk37E30rbu91d7meteAN/3VycIMFPDQb8H5+7Sx6lujJ2av5iq+t5NT6mAbeAb0h9fCd9vAtvTR+pqgG1jqmBC5pDEeYXorL+o1A0LMWBJ8Kwmx9OJU/z1w4OhTk8WVsXUPIqbmenYXyhlMJTh9zWaLtgtVQTqE3j2gs3C8cGMbkt60qiNg/VHtHGO7Mlo/d16WU+IVv0mMGdEsgBuocTUPVJGgWC3R/nUuQDG0ieDdzIo0uFs4c5tYg57Tdn4/egioXkj7uYmBgph/DKQ5CqQlY+533Ecogtkevcf4ehuZwpONt/qqQ68+ZamzGoQrDEAhdnRiwIDAQABAoIBAG6XUm7Zk+pg7nqyHHJIC8GlTrUYrBBFPoqIhD6p6uY5nKUo7TuPaMu+AEwLPiYLig99vmErdabMXfp3sHfjpK20odPcKB0J2fAD3FPtOI2Pkp+Zc9VriDRePDhFl50oksdy40DjP4JZbr8kzLc1Xl+SBEhds6d4IEtSp4dYFP4O00VNIQDbZDTP1QdHdt4Xij9VxvD8HuSG2601yvE6AXbRaO8VT4kf+qaO4eEMKs1oorXOtFVgtjWSDnC4ZZniUFdjnXQqx862VE4DdzMECBG/IpuxcALuYUuQqx792HPFozH1DDoMSj4XIuzK2bTVwmPmwG570KZJi0NfAjOtqQECgYEA2Nul5dq36x+j3B9M28wPsA0yI3BsJoin8dwkDwdb9zp1Oeq4SFJc0IIbvodL0yM7HmeQSBnKJzZhFbJwrGBXLwx77fu9B1as7NJlheKAU1LPDDnK/AJ8FK87I2vC1TnqQ1ziwjIhNeqhCgDBO7pgOZWPNK+qEKmc/Da8s319m78CgYEA2H+LGHFigbEHB9dpl/EnN7FsqYH68Mg2m3v9C7cTXjeQN06bt5B1XjyedV/o8GdZUIsatuHS19iqASHImLo1zy69vM9cDPxexuhnAmDk8na7WQ3T8pd4EHTe51yHF7uC+ADN2pGkWCz1F62AyloyORkJJKc6UyshVQyAFIeILTUCgYByuJAk7vYJDq3yzyQryuIpsnFpyhmMsRKXomv4/12phmVphECFEf1D2PCwdIaqZaLqzMLJQcttvxjRD5sHtdepbiNJnLk9Xp8QkaVflJlqew5JW3GErBPUJXdVn7Zscrz5cfQL49Up3rvevNN8s3YgQHyH1L5VHkWML7DYC3UdpQKBgFG8vaAp1r4OPxBH1NcHtf3B37uTllFn1a4YPq44nXhZ0/n9lK7WPGmqy0yXPFPfQQo2qoxXcAoMBAtPXPPEgeJJzFrHkwJYGdRRE+sC+A1OpGb34IhbhXn5FdsVxO9B3S2S6CVYDUs5FgOtfs1nBkUmXZxYAp45z2jTwlt92/ztAoGAUD/qXCU/HJmn8qS0bPkHeQQ+xI0zTUfSOt1lQscqlpZXPWXE1HrdlNjtTwsCsnGs4JwxnnhSom2OFf8ZoAOLTD8CNhEctUUXtLApkun8iVrUA5TJ+CQQCqxvWTnbw3qzl8WPDQ+LDMfLQJkkzbkkhRMY1e9w1z703NYTCKQS1yY=',
        ],
    ];
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index','pay'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
    public function actionPay(){
        $config_biz = [
            'out_trade_no' => time(),
            'total_amount' => '1',
            'subject'      => 'test subject',
        ];

        $pay = new Pay($this->config);
        $data = $pay->driver('alipay')->gateway('wap')->pay($config_biz);
        var_dump($data);
    }
}
