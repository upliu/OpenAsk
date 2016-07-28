<?php


namespace app\commands;


use app\models\User;
use yii\console\Controller;

class ToolController extends Controller
{

    public function actionUserNew()
    {
        $user = new User([
            'username' => 'upliu',
            'password' => '123456',
            'email' => 'i@upliu.net',
            'status' => User::STATUS_ACTIVE,
        ]);
        $user->generateAuthKey();
        if (!$user->save()) {
            var_dump($user->errors);
        }
    }

}
