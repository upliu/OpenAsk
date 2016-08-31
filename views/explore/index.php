<?php

use yii\helpers\Html;
use yii\widgets\ListView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="post-index">
    <?= ListView::widget([
        'dataProvider' => $dataProvider,
        'itemView' => 'question-item',
        'summary' => '',
    ]) ?>
</div>
