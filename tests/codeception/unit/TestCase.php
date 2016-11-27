<?php


namespace tests\codeception\unit;


use app\models\User;
use Codeception\Test\Unit;

class TestCase extends Unit
{
    protected $user;

    protected function _before()
    {
        $this->user = $user = User::findOne(1);
        \Yii::$app->user->login($user);
    }
}
