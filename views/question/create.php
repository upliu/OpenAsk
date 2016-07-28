<?php

use vova07\imperavi\Widget;
use yii\helpers\Url;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $post app\models\Post */

$this->title = Yii::t('app', '提问');
?>

<div class="post-create">

    <?= $this->render('_form', [
        'post' => $post,
    ]) ?>

</div>
<?php
/*

<form method="post">
    <input type="hidden" name="<?=Yii::$app->request->csrfParam?>" value="<?=Yii::$app->request->csrfToken?>">
    <?=Widget::widget([
        'options' => [
            'style' => 'display:none',
        ],
        'name' => 'content',
        'value' => Yii::$app->request->post('content'),
        'settings' => [
            'formatting' => ['blockquote', 'pre'],
            'minHeight' => 200,
            'imageUpload' => Url::to(['/site/image-upload']),
            'fileUpload' => Url::to(['/site/file-upload']),
            'plugins' => [
                'table',
                'video',
                'fullscreen',
            ],
        ],
    ])?>
    <div><button class="btn btn-primary" type="submit">提交</button></div>
</form>

//*/?>