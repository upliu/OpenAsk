<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <?= $form->field($model, 'author_id')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'pid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'count_comment')->textInput() ?>

    <?= $form->field($model, 'count_answer')->textInput() ?>

    <?= $form->field($model, 'count_view')->textInput() ?>

    <?= $form->field($model, 'count_vote_up')->textInput() ?>

    <?= $form->field($model, 'count_vote_down')->textInput() ?>

    <?= $form->field($model, 'count_interest')->textInput() ?>

    <?= $form->field($model, 'count_thank')->textInput() ?>

    <?= $form->field($model, 'count_mark')->textInput() ?>

    <?= $form->field($model, 'count_no_help')->textInput() ?>

    <?= $form->field($model, 'is_lock')->textInput() ?>

    <?= $form->field($model, 'is_anonymous')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
