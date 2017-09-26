<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Java */

$this->title = 'Update Java: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Javas', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="java-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
