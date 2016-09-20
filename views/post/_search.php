<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\QuestionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="post-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'body') ?>

    <?= $form->field($model, 'created_at') ?>

    <?= $form->field($model, 'updated_at') ?>

    <?php // echo $form->field($model, 'author_id') ?>

    <?php // echo $form->field($model, 'pid') ?>

    <?php // echo $form->field($model, 'count_comment') ?>

    <?php // echo $form->field($model, 'count_answer') ?>

    <?php // echo $form->field($model, 'count_view') ?>

    <?php // echo $form->field($model, 'count_vote_up') ?>

    <?php // echo $form->field($model, 'count_vote_down') ?>

    <?php // echo $form->field($model, 'count_interest') ?>

    <?php // echo $form->field($model, 'count_thank') ?>

    <?php // echo $form->field($model, 'count_mark') ?>

    <?php // echo $form->field($model, 'count_no_help') ?>

    <?php // echo $form->field($model, 'is_lock') ?>

    <?php // echo $form->field($model, 'is_anonymous') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
