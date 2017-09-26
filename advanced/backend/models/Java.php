<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "java".
 *
 * @property integer $id
 * @property string $type
 * @property string $url
 * @property string $notice
 */
class Java extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'java';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'url'], 'required'],
            [['notice'], 'string'],
            [['type'], 'string', 'max' => 50],
            [['url'], 'string', 'max' => 500],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'url' => 'Url',
            'notice' => 'Notice',
        ];
    }
}
