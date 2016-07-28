<?php

use vova07\imperavi\Widget;
use yii\helpers\Url;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $post app\models\Post */

$this->title = Yii::t('app', '编辑问题');
?>

<div class="post-create">

    <?= $this->render('_form', [
        'post' => $post,
    ]) ?>

</div>