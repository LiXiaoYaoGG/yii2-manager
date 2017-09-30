<?php
namespace backend\controllers;

use Yii;
use yii\web\UploadedFile;
use yii\web\Controller;
use common\models\form\Upload;

class ToolsController extends Controller
{
    public function actionUploadEditor()
    {
        $file = $_FILES;
        $file_name = $file['wangEditorH5File']['name'];
        $file_tmp_path =$file['wangEditorH5File']['tmp_name'];
        $dir = "../../uploads/".date("Ymd");
        if (!is_dir($dir)){
            mkdir($dir);
        }
        $file_save_name = date("YmdHis",time()) . mt_rand(1000, 9999) . '.' . substr(strrchr($file_name, '.'), 1);
        move_uploaded_file($file_tmp_path, $dir.'/'.$file_save_name);
        echo 'http://resources.mana.com/'.date('Ymd').'/'.$file_save_name;
    }
    public function actionUploadSys(){
        $model = new Upload();
        $upload_success_path = "";
        if (Yii::$app->request->isPost) {
            $model->file = UploadedFile::getInstance($model, "file");
            $dir = "../../uploads/".date("Ymd");
            if (!is_dir($dir)){
                mkdir($dir);
            }
            if ($model->validate()) {
                $file_name = date("YmdHis",time()) . mt_rand(1000, 9999) . "." . $model->file->extension;
                $dir = $dir."/". $file_name;
                $model->file->saveAs($dir);
                $upload_success_path = 'http://resources.mana.com/'.date('Ymd').'/'.$file_name;
            }
        }
        echo json_encode(array($upload_success_path));
    }
}
