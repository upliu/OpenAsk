<?php
use app\widgets\AskWidget;
use app\widgets\LoginWidget;
use app\widgets\SideNavWidget;
use yii\bootstrap\Alert;
use yii\bootstrap\Nav;
use yii\bootstrap\Tabs;
use yii\helpers\Html;
use yii\helpers\Url;
use app\widgets\SideBarWidget;
use yii\widgets\ListView;

/* @var $this \yii\web\View */


?>
<div class="container">
<div class="row">
    <div class="col-xs-12 col-md-9 main">
        <?= Tabs::widget([
            'options' => ['class' => 'nav-tabs-q'],
            'items' => [
                ['label' => Yii::t('app', '最新的'), 'url' => ['index/index']],
                ['label' => Yii::t('app', '未回答的'), 'url' => ['question/index', 'filter' => 'unanswered']],
            ],
        ]) ?>

        <div class="index-index">
            <?= ListView::widget([
                'itemOptions' => ['class' => 'question-item'],
                'dataProvider' => $dataProvider,
                'itemView' => '../question/question-item',
                'summary' => '',
            ]) ?>
        </div>
    </div>

    <div class="col-xs-12 col-md-3 side pt30">

        <?= SideBarWidget::widget() ?>

    </div>
</div>
</div>
