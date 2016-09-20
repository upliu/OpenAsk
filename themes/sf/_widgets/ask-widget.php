<?php
use yii\helpers\Html;
?>

<div class="alert alert-warning widget widget-ask">
    <p><?= Yii::t('app', '今天，你遇到了什么问题呢？') ?></p>
    <?= Html::a(Yii::t('app', '提问'), ['question/create'], ['class' => 'btn btn-primary btn-block']) ?>
</div>
