<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'body:ntext',
            'created_at',
            'author_id',
            'updated_at',
            'modified_by',
            'modified_at',
            'question_id',
            'accept_answer_id',
            'count_comment',
            'count_answer',
            'count_view',
            'count_vote_up',
            'count_vote_down',
            'count_interest',
            'count_thank',
            'count_mark',
            'count_no_help',
            'is_lock',
            'is_anonymous',
            'last_active',
            'last_answer_id',
            'last_answer_by',
        ],
    ]) ?>

</div>
