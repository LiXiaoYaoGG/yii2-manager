<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\searchs\ArticleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '文章列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('新增文章', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'first_img',
            'title',
            'content:ntext',
            'g_id',
            [
                'attribute' => 'create_at',
                'value' => function($model){
                    return date("Y-m-d H:i:s",$model->create_at);
                }
            ],
            // 'updated_at',
            // 'visite_num',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
