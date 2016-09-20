<?php
use app\models\Answer;
use app\models\Question;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var Answer $model */
/* @var string $key */

?>

<div class="body">
    <?= $model->body_sanitized ?>
</div>

<div class="meta">
    <span><?= Yii::$app->formatter->asRelativeTime($model->created_at) ?><?= Yii::t('app', '回答') ?></span>
    <span><?= $model->count_comment > 0 ? $model->count_comment . ' ' : '' ?><?= Yii::t('app', '评论') ?></span>
</div>
