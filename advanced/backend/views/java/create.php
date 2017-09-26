<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Java */

$this->title = 'Create Java';
$this->params['breadcrumbs'][] = ['label' => 'Javas', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="java-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
