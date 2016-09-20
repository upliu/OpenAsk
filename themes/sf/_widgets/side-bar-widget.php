<?php

use yii\helpers\Html;
use app\widgets\LoginWidget;
use app\widgets\AskWidget;
use app\widgets\SideNavWidget;

?>

<?php if (Yii::$app->user->isGuest) { ?>
    <?= LoginWidget::widget() ?>
<?php } else { ?>
    <?= AskWidget::widget() ?>
    <?= SideNavWidget::widget() ?>
<?php } ?>