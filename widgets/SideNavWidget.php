<?php


namespace app\widgets;


use yii\base\Widget;

class SideNavWidget extends Widget
{
    public function run()
    {
        return $this->render('@app/views/_widgets/side-nav-widget');
    }
}