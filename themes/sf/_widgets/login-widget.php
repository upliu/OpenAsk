<?php
use yii\helpers\Html;
?>

<div class="alert alert-warning widget widget-login">
    <p><?= Yii::t('app', 'OpenAsk 是一款基于 Yii2 框架开发的高性能的问答系统') ?></p>
    <?= Html::a(Yii::t('app', '登录'), '#', ['class' => 'btn btn-success btn-block']) ?>
</div>
