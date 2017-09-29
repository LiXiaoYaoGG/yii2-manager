<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\ArticleGroup */

$this->title = '新增文章分类';
$this->params['breadcrumbs'][] = ['label' => 'Article Groups', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-group-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
