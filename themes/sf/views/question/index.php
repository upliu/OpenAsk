<?php

use app\widgets\SideBarWidget;
use yii\helpers\Html;
use yii\widgets\ListView;
use yii\bootstrap\Nav;
use yii\bootstrap\Tabs;
use app\widgets\LoginWidget;
use app\widgets\AskWidget;
use app\widgets\SideNavWidget;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="container">
<div class="row">
    <div class="col-xs-12 col-md-9">
        <?= Tabs::widget([
            'options' => ['class' => 'nav-tabs-q'],
            'items' => [
                ['label' => Yii::t('app', '最新的'), 'url' => $topic ? ['question/index', 'topic' => strtolower($topic->name)] : ['question/index']],
                ['label' => Yii::t('app', '未回答的'), 'url' => $topic ? ['question/index', 'filter' => 'unanswered', 'topic' => strtolower($topic->name)] : ['question/index', 'filter' => 'unanswered'], 'active' => 'unanswered' === $filter],
            ],
        ]) ?>

        <div class="question-index">
            <?= ListView::widget([
                'itemOptions' => ['class' => 'question-item'],
                'dataProvider' => $dataProvider,
                'itemView' => 'question-item',
                'summary' => '',
            ]) ?>
        </div>
    </div>

    <div class="col-xs-12 col-md-3 side pt30">

        <?= SideBarWidget::widget() ?>

    </div>
</div>
</div>


