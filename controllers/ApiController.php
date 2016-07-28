<?php


namespace app\controllers;


use app\helpers\Helper;
use app\models\User;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;

class ApiController extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
//                'only' => ['follow-user', 'un-follow-user'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ]
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    '*' => ['post'],
                ],
            ],
        ];
    }

    public function actionFollowUser()
    {
        Helper::outputJson();
        $slug = \Yii::$app->request->post('slug');
        $userB = User::findBySlug($slug);
        \Yii::$app->user->identity->follow($userB);
        return ['btn' => Helper::renderFollowButton(\Yii::$app->user->id, $userB)];
    }

    public function actionUnFollowUser()
    {
        Helper::outputJson();
        $slug = \Yii::$app->request->post('slug');
        $userB = User::findBySlug($slug);
        \Yii::$app->user->identity->unFollow($userB);
        return ['btn' => Helper::renderFollowButton(\Yii::$app->user->id, $userB)];
    }
}