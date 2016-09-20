<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 4:29 PM
 */

namespace app\controllers;


use app\models\QuestionSearch;
use app\models\Topic;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class ExploreController extends Controller
{
    public function actionIndex($topic = '', $filter = '')
    {
        if ($topic) {
            $topic = Topic::findByName($topic);
            if (!$topic) {
                throw new NotFoundHttpException();
            }
        } else {
            $topic = null;
        }
        $search = new QuestionSearch();
        $dataProvider = $search->question($topic, $filter);
        return $this->render('index', ['dataProvider' => $dataProvider, 'topic' => $topic]);
    }
}
