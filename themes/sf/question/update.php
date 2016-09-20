<?php

use vova07\imperavi\Widget;
use yii\helpers\Url;
use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $post app\models\Post */

$this->title = Yii::t('app', '编辑问题');
?>
<div class="container mt30">
    <div class="row">
        <div class="col-xs-12 col-md-9 main">

            <div class="post-update">

                <?= $this->render('_form', [
                    'post' => $post,
                ]) ?>

            </div>

        </div>
    </div>
</div>
