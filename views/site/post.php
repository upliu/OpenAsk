<?php

use vova07\imperavi\Widget;
use yii\helpers\Html;
use yii\helpers\Url;
use kartik\select2\Select2;
use yii\web\JsExpression;

$url = ['/site/search-tag'];

?>
<pre>
<?php print_r(Yii::$app->request->post()); ?>
</pre>
<?=Html::beginForm()?>
<?=Select2::widget([
    'showToggleAll' => false,
    'options' => [
        'multiple' => true,
    ],
    'name' => 'select2-test',
    'pluginOptions' => [
//        'tags' => true,
        'ajax' => [
            'url' => $url,
            'dataType' => 'json',
//            'data' => new JsExpression('function(params) { return {q:params.term}; }')
        ],
//        'templateResult' => new JsExpression('function(item) { return item.name; }'),
//        'templateSelection' => new JsExpression('function (item) { return item.name; }'),
    ],
])?>

    <div><button class="btn btn-primary" type="submit">提交</button></div>
<?=Html::endForm()?>

<div class="redactor-editor i-view">
    <?=Yii::$app->request->post('content')?>
</div>