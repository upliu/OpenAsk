<?php


namespace app\controllers;


use app\models\Comment;
use yii\web\Controller;

class CommentController extends Controller
{
    public function actionCreate()
    {
        $comment = new Comment();
        if ($comment->load(\Yii::$app->request->post()) && $comment->save()) {
            return 'OK';
        }
    }
}
