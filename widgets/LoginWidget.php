<?php


namespace app\widgets;


use yii\base\Widget;

class LoginWidget extends Widget
{
    public function run()
    {
        return $this->render('@app/views/_widgets/login-widget');
    }
}