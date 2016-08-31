<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/24/16
 * Time: 4:29 PM
 */

namespace app\controllers;


use app\models\PostSearch;
use app\models\Topic;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class ExploreController extends Controller
{
    public function actionIndex($topicName = '', $filter = '')
    {
        $topic = null;
        if ($topicName) {
            $topic = Topic::findByName($topicName);
            if (!$topic) {
                throw new NotFoundHttpException();
            }
        }
        $search = new PostSearch();
        $dataProvider = $search->question($topic, $filter);
        return $this->render('index', ['dataProvider' => $dataProvider, 'topic' => $topic]);
    }
}
