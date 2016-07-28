<?php

/* @var $this yii\web\View */
/* @var $feeds app\models\Feed */

?>

<?php foreach ($feeds as $feed): ?>
    <?= $this->render('feed-item', ['feed' => $feed]) ?>
<?php endforeach; ?>
