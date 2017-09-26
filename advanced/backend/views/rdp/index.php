<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\search\RdpSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '远程桌面';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rdp-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('添加远程桌面', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'ip',
            'port',
            'username',
            'password',
            // 'all_user_info:ntext',
            // 'notice:ntext',
            // 'type',
            [
                'attribute' => 'type',
                'value' => function($model) {
                    switch ($model->type){
                        case 1:
                            return '外网';
                        case 2:
                            return '内网';
                        case 3:
                            return '高配置';
                        case 4:
                            return '低配置';
                        default :
                            return '未分类';
                    }
                },
                'filter' => [
                    1 => '外网',
                    2 => '内网',
                    3 => '高配置',
                    4 => '低配置'
                ]
            ],
            // 'add_time',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
