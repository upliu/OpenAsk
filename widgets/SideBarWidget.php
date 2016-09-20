<?php


namespace app\widgets;


use yii\base\Widget;

class SideBarWidget extends Widget
{
    public function run()
    {
        return $this->render('@app/views/_widgets/side-bar-widget');
    }
}