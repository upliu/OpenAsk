<?php
use yii\bootstrap\Alert;
use yii\helpers\Html;
use yii\helpers\Url;

$this->title = Yii::t('app', '首页');
?>

<div class="i-home-list-title i-section">
    <span class="glyphicon glyphicon-list"></span>
    <?= Yii::t('app', '最新动态') ?>
    <span class="pull-right">
        <a href="<?= Url::to(['/settings/filter']) ?>" class="zg-link-gray">
            <span class="glyphicon glyphicon-cog"></span>
            <?= Yii::t('app', '设置') ?>
        </a>
    </span>
</div>


<div class="i-tl-wrap">

    <div class="alert alert-info i-tl-alert">
        <?= Yii::t('app', '{count} 条新动态', ['count' => 49]) ?>
    </div>

</div>
