<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\QuestionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Post', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'title',
            'body:ntext',
            'created_at',
            'author_id',
            // 'updated_at',
            // 'modified_by',
            // 'modified_at',
            // 'question_id',
            // 'accept_answer_id',
            // 'count_comment',
            // 'count_answer',
            // 'count_view',
            // 'count_vote_up',
            // 'count_vote_down',
            // 'count_interest',
            // 'count_thank',
            // 'count_mark',
            // 'count_no_help',
            // 'is_lock',
            // 'is_anonymous',
            // 'last_active',
            // 'last_answer_id',
            // 'last_answer_by',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
