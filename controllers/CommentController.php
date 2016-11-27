<?php


namespace app\controllers;


use app\models\Comment;
use app\models\Question;
use app\widgets\CommentWidget;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\web\NotFoundHttpException;

class CommentController extends Controller
{

    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'like' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'like' => [
                'class' => 'app\actions\VoteAction',
                'modelClass' => 'app\models\Comment',
                'type' => 'up',
            ],
        ];
    }

    // ajax 取出评论列表
    public function actionIndex($uuid)
    {
        return CommentWidget::widget(['puuid' => $uuid, 'onlyShowVoted' => false]);
    }

    public function actionCreate($puuid, $comment_type)
    {
        \Yii::$app->response->format = 'json';
        $comment = new Comment();
        $comment->setAttribute('puuid', $puuid);
        $comment->setAttribute('comment_type', $comment_type);
        if ($comment->load(\Yii::$app->request->post()) && $comment->save()) {
            return [
                'count_comment' => Comment::find()->where(['puuid' => $puuid])->count(),
                'html' => CommentWidget::widget(['puuid' => $puuid, 'onlyShowVoted' => false]),
            ];
        } else {
            return ['errors' => $comment->errors];
        }
    }

    // 删除评论
    public function actionDelete($uuid)
    {
        $comment = Comment::findOne(['uuid' => $uuid, 'author_id' => \Yii::$app->user->id]);
        if (!$comment) {
            throw new NotFoundHttpException();
        }
        if ($comment->delete()) {
            return 'OK';
        }
    }
}
