<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "article".
 *
 * @property integer $id
 * @property string $first_img
 * @property string $title
 * @property string $content
 * @property integer $g_id
 * @property integer $create_at
 * @property integer $updated_at
 * @property integer $visite_num
 *
 * @property ArticleGroup $g
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'article';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['first_img', 'title', 'content', 'g_id', 'create_at'], 'required'],
            [['content'], 'string'],
            [['g_id', 'create_at', 'updated_at', 'visite_num'], 'integer'],
            [['title'], 'string', 'max' => 200],
            [['first_img', 'title'], 'string', 'max' => 200],
            [['g_id'], 'exist', 'skipOnError' => true, 'targetClass' => ArticleGroup::className(), 'targetAttribute' => ['g_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'first_img' => '首图',
            'title' => '标题',
            'content' => '内容',
            'g_id' => '分类ID',
            'create_at' => '创建时间',
            'updated_at' => '更新时间',
            'visite_num' => '访问次数',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getG()
    {
        return $this->hasOne(ArticleGroup::className(), ['id' => 'g_id']);
    }
}
