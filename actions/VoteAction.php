<?php


namespace app\actions;


use app\models\traits\VoteTrait;
use yii\base\Action;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

class VoteAction extends Action
{

    public $modelClass;

    /** @var  string up|down 赞还是踩 */
    public $type;

    /**
     * @param $uuid string 实体唯一ID
     * @param $type string up|down 赞还是踩
     * @return array
     * @throws ForbiddenHttpException
     * @throws NotFoundHttpException
     */
    public function run($uuid, $type = '')
    {
        if ($this->type) {
            $type = $this->type;
        }
        \Yii::$app->response->format = 'json';
        $modelClass = $this->modelClass;
        /** @var VoteTrait $model */
        $model = $modelClass::findOne(['uuid' => $uuid]);
        if (!$model) {
            throw new NotFoundHttpException();
        }
        if ($model->author_id == \Yii::$app->user->id) {
            throw new ForbiddenHttpException();
        }
        \Yii::trace($model->count_vote_up, __METHOD__.__LINE__);
        // 如果是赞，要自动删除之前踩的记录，反之，踩的话要删除之前赞的记录
        if ($type == 'up') {
            $ret = $model->voteUp();
        } else if ($type == 'down') {
            $ret = $model->voteDown();
        }
        \Yii::trace($model->count_vote_up, __METHOD__.__LINE__);

        return [
            'success' => ($type == 'up' && $ret['up'] != 0) || ($type == 'down' && $ret['down'] != 0),
            'data' => $model->count_vote_up + $ret['up'],
        ];
    }
}