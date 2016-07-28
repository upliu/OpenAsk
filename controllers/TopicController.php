<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 6:46 PM
 */

namespace app\controllers;


use yii\web\Controller;

class TopicController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}