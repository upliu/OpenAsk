<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 8/20/16
 * Time: 16:30
 */

namespace app\controllers;


use yii\web\Controller;

class TestController extends Controller
{
    public function actionIndex()
    {
        \Yii::$app->response->headers['X-k'] = 'v';
        \Yii::$app->response->charset = 'GBK';
        echo mb_convert_encoding('你好', 'gbk', 'utf-8');
        print_r($_SERVER);
        print_r($_POST);
        print_r($_GET);
    }
}