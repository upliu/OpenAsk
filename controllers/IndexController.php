<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 7:03 PM
 */

namespace app\controllers;


use yii\web\Controller;
use app\models\QuestionSearch;

class IndexController extends Controller
{
    public function actionIndex()
    {
        $search = new QuestionSearch();
        $dataProvider = $search->index();
        return $this->render('index', ['dataProvider' => $dataProvider]);
    }
}
