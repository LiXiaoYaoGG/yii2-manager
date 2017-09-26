<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Rdp */

$this->title = 'Create Rdp';
$this->params['breadcrumbs'][] = ['label' => 'Rdps', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rdp-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
