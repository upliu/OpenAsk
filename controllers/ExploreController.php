<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 4:29 PM
 */

namespace app\controllers;


use yii\web\Controller;

class ExploreController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }
}
