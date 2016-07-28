<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 7:03 PM
 */

namespace app\controllers;


use yii\web\Controller;

class IndexController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}