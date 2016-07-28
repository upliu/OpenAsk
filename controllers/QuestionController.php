<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/28/16
 * Time: 10:52 PM
 */

namespace app\controllers;


use app\models\Post;
use app\models\Question;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class QuestionController extends Controller
{

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['create', 'update'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ]
                ],
            ],
        ];
    }

    public function actionCreate()
    {
        $model = new Question();
        $model->author_id = \Yii::$app->user->id;

        if ($model->load(\Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'post' => $model,
            ]);
        }
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->scenario = 'question';

        if ($model->load(\Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'post' => $model,
            ]);
        }
    }

    public function actionView($id)
    {
        $model = $this->findModel($id);
        return $this->render('view', [
            'post' => $model
        ]);
    }

    public function actionAnswer($question_id, $answer_id)
    {
        var_dump($question_id, $answer_id);
    }

    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(\Yii::t('app', '页面不存在'));
        }
    }

}
