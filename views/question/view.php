<?php

/* @var $this yii\web\View */
/* @var $post app\models\Post */

$this->title = $post->title;
?>

<h2><?=$post->title?></h2>
<div class="i-view"><?=$post->body?></div>