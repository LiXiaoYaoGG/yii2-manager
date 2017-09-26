<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "rdp".
 *
 * @property integer $id
 * @property string $ip
 * @property integer $port
 * @property string $username
 * @property string $password
 * @property string $all_user_info
 * @property string $notice
 * @property integer $type
 * @property string $add_time
 */
class Rdp extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'rdp';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['ip', 'port', 'username', 'add_time'], 'required'],
            [['port', 'type'], 'integer'],
            [['all_user_info', 'notice'], 'string'],
            [['add_time'], 'safe'],
            [['ip'], 'string', 'max' => 15],
            [['username', 'password'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'ip' => 'Ip',
            'port' => 'Port',
            'username' => 'Username',
            'password' => 'Password',
            'all_user_info' => 'All User Info',
            'notice' => 'Notice',
            'type' => 'Type',
            'add_time' => 'Add Time',
        ];
    }
}
