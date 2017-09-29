<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\searchs\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '用户列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('创建用户', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'username',
            'email:email',
            [
                'attribute' => 'status',
                'value' => function($model) {
                    return $model->status == 0 ? 'Inactive' : 'Active';
                },
                'filter' => [
                    0 => 'Inactive',
                    10 => 'Active'
                ]
            ],
            [
                'attribute' => 'created_at',
                'value' => function($model){
                    return date("Y-m-d H:i:s",$model->created_at);
                }
            ],
            [
                'attribute' => 'updated_at',
                'value' => function($model){
                    return date("Y-m-d H:i:s",$model->updated_at);
                }
            ],

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
