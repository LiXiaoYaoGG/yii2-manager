<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\Rdp */

$this->title = 'Update Rdp: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Rdps', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="rdp-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
