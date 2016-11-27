<?php


namespace app\themes\sf;

use yii\web\AssetBundle;

class ThemeAsset extends AssetBundle
{

//    public $sourcePath = __DIR__ . '/ThemeAssetMedia';

    public $baseUrl = '@web/static/ThemeAssetMedia';

    public $css = [
        'app.css',
    ];

    public $js = [
        'app.js',
        'comment-widget.js',
        'vote-widget.js',
        'question.js',
    ];

    public $depends = [
        'app\assets\AppAsset',
        'app\assets\AutosizeAsset',
    ];
}
