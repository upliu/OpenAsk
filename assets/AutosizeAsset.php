<?php


namespace app\assets;


class AutosizeAsset extends \yii\web\AssetBundle
{
    public $sourcePath = '@npm/autosize';

    public $js = [
        'dist/autosize.min.js',
    ];
}
