<?php
use kartik\icons\Icon;

/** @var $countVoteUp int */
?>

<div class="widget widget-vote">
    <div class="asc"><?= Icon::show('sort-asc') ?></div>
    <div class="desc"><?= Icon::show('sort-desc') ?></div>
    <div class="count"><?= $countVoteUp ?></div>
</div>
