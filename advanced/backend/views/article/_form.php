<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use common\models\ArticleGroup;
use yii\helpers\ArrayHelper;
use kartik\file\FileInput;
use yii\helpers\Url;
/* @var $this yii\web\View */
/* @var $model app\models\Article */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="article-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>
    
    <?= $form->field($model, 'first_img')->textInput(['maxlength' => true]) ?>
    
    <?php
    echo FileInput::widget([
    'name' => 'Upload[file]',
    
    'options'=>[
        'multiple'=>true
    ],
    'pluginOptions' => [
        'uploadUrl' => Url::to(['tools/upload-sys']),
        'uploadExtraData' => [
            'id' => 1,
        ],
        'minFileCount' => 1,
        'maxFileCount' => 1,
        'showRemove' => false,
        'autoReplace' => true,
        'dropZoneEnabled' => true,
        'initialPreview'=>[
             $model->first_img,
         ],
         'initialPreviewAsData'=>true,
         'overwriteInitial'=>true,
         'maxFileSize'=>2800,
        ],
    'pluginEvents' => [
        "fileuploaded" => "function (event, data, id, index) {
            $('#article-first_img').val(data.response[0]);
        }",
        ],
    ]);
    ?>
    
    <?= $form->field($model, 'content')->textarea(['rows' => 18]) ?>
    
    <?php
    $data = ArticleGroup::find()->asArray()->all();
    $data_list = ArrayHelper::map($data, 'id', 'name');
    ?>
    <?= $form->field($model, 'g_id')->dropDownList($data_list) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>

<!--在线编辑器初始化-->
<?php
$depends = ['depends' => 'backend\assets\AppAsset'];
$this->registerCssFile("@web/plugin/editor/css/wangEditor.min.css", $depends);
$this->registerJsFile("@web/plugin/editor/js/wangEditor.min.js",$depends);
?>
<?php $this->beginBlock('editor') ?>  
    $(function () {
        var editor = new wangEditor('article-content');
        editor.config.uploadImgUrl = '<?=Url::to(['tools/upload-editor'])?>';
        editor.config.uploadParams = {
            '_csrf-backend': '<?=Yii::$app->request->csrfToken?>'
        };
        editor.create();
    });
<?php $this->endBlock() ?>  
<?php
$this->registerJs($this->blocks['editor'],\yii\web\View::POS_END);
?>
