<?php
use yii\helpers\Html;
use app\models\Comment;
use yii\widgets\ActiveForm;

/** @var Comment $comment */
?>

<?php /* @var $commentForm yii\widgets\ActiveForm */ ?>
<?php $commentForm = ActiveForm::begin(['options' => ['class' => 'clearfix form-comment']]) ?>
<?= $commentForm->field($comment, 'question_id')->hiddenInput()->label(false) ?>
<?= $commentForm->field($comment, 'answer_id')->hiddenInput()->label(false) ?>
<?= $commentForm->field($comment, 'body')->textarea(['rows' => 1])->label(false) ?>
<?= Html::submitButton(\Yii::t('app', '提交评论'), ['class' => 'btn btn-default pull-right']) ?>
<?php ActiveForm::end(); ?>
