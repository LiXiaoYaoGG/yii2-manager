<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\searchs\ArticleGroupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '文章分类列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-group-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新增文章分类', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',
            [
                'attribute' => 'created_at',
                'value' => function($model){
                    return date("Y-m-d H:i:s",$model->created_at);
                }
            ],
//            'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
