<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\JavaSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Java反序列化漏洞';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="java-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加漏洞', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'type',
            'url:url',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
