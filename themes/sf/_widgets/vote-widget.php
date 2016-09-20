<?php
use kartik\icons\Icon;

/** @var $data [] */
?>

<div class="widget widget-vote">
    <span class="asc"><?= Icon::show('sort-asc') ?></span>
    <span class="count"><?= $count ?></span>
    <span class="desc"><?= Icon::show('sort-desc') ?></span>
</div>
