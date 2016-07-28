<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\PostSearch */
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
            'updated_at',
            // 'author_id',
            // 'pid',
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

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
