<?php
use app\models\Answer;
use app\models\Question;
use yii\helpers\Html;
use app\widgets\VoteWidget;

/* @var $this yii\web\View */
/* @var Answer $model */
/* @var string $key */

?>

<div class="vote-wrap">
    <?= VoteWidget::widget([
        'countVoteUp' => $model->count_vote_up
    ]) ?>
</div>

<div class="offset">
<div class="body">
    <?= $model->body_sanitized ?>
</div>

<div class="meta">
    <span><?= Yii::$app->formatter->asRelativeTime($model->created_at) ?><?= Yii::t('app', '回答') ?></span>
    <span><a href="javascript:;" onclick="commentBox();"><?= $model->count_comment > 0 ? $model->count_comment . ' ' : '' ?><?= Yii::t('app', '评论') ?></a></span>
</div>
</div>
