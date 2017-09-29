<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "article_group".
 *
 * @property integer $id
 * @property string $name
 * @property integer $created_at
 * @property integer $updated_at
 *
 * @property Article[] $articles
 */
class ArticleGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'article_group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '分类名称',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public function beforeSave($insert) {
        if(parent::beforeSave($insert)){
            //如果是新增的话则添加创建时间
            if($insert){
                $this->created_at = time();
            }else{
                $this->updated_at = time();
            }
            return true;
        }else{
            return false;
        }
    }

        /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticles()
    {
        return $this->hasMany(Article::className(), ['g_id' => 'id']);
    }
}
