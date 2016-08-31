<?php
use app\models\Question;
use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var Question $model */
/* @var string $key */

$question = $model;
error_get_last()
?>

<div class="question-item">

    <?= $question->count_answer ?> <?= Yii::t('app', '回答') ?>
    <?= $question->count_view ?> <?= Yii::t('app', '浏览') ?>

    <?= $question->lastAnswerAuthor ?
        $question->lastAnswerAuthor->username :
        $question->author->username ?>
    <?= Yii::$app->formatter->asRelativeTime($question->last_active) ?>
    <?= Yii::t('app', $question->lastAnswerAuthor ? '回答' : '提问') ?>

    <?= Html::a($question->title,
        $question->lastAnswerAuthor ? ['question/answer', 'question_id' => $question->id, 'answer_id' => $question->last_answer_id] : ['question/view', 'id' => $question->id],
        ['class' => 'title']) ?>

    <ul class="tag-list">
        <?php foreach ($question->topics as $topic) : ?>
            <li><?= $topic->name ?></li>
        <?php endforeach; ?>
    </ul>

</div>