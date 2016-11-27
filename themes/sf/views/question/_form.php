<?php

use kartik\select2\Select2;
use yii\helpers\Html;
use yii\web\JsExpression;
use yii\widgets\ActiveForm;
use yii\helpers\Url;
use vova07\imperavi\Widget;

/* @var $this yii\web\View */
/* @var $post app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($post, 'title')->textInput(['maxlength' => true])->label(Yii::t('app', '标题')) ?>

    <?= $form->field($post, 'body')->widget(Widget::className(), [
        'options' => [
            'style' => 'display:none',
        ],
        'settings' => [
            'lang' => 'zh_cn',
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
    ])->label(Yii::t('app', '问题说明（可选）')) ?>

    <?=$form->field($post, 'tagValues')->widget(Select2::className(), [
        'showToggleAll' => false,
        'options' => [
            'multiple' => true,
        ],
        'pluginOptions' => [
            'tags' => true,
            'ajax' => [
                'url' => ['/site/search-topic'],
            ],
        ],
    ])->label(Yii::t('app', '话题'))?>

    <?= $form->field($post, 'is_anonymous')->checkbox([
        'label' => Yii::t('app', '匿名')
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($post->isNewRecord ? Yii::t('app', '发布') : Yii::t('app', '编辑'), ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
