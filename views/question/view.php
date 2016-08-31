<?php

/* @var $this yii\web\View */
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use vova07\imperavi\Widget;
use yii\helpers\Url;

/* @var $question app\models\Question */
/* @var $answer app\models\Answer */

$this->title = $question->title;
?>

<h2><?=$question->title?></h2>
<div class="i-view"><?=$question->body?></div>

<?php $form = ActiveForm::begin() ?>
<?= $form->field($answer, 'body')->widget(Widget::className(), [
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
])->label(false) ?>
<div class="form-group">
    <?= Html::submitButton(Yii::t('app', '发布回答')) ?>
</div>
<?php ActiveForm::end() ?>
