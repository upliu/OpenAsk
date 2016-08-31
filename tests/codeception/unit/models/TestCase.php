<?php


namespace tests\codeception\unit\models;


use app\models\User;

class TestCase extends \yii\codeception\TestCase
{
    public function getUser()
    {
        return User::findOne(4);
    }

    public function login()
    {
        $user = $this->getUser();
        \Yii::$app->user->login($user);
        return $user;
    }
}
