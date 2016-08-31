<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 8/25/16
 * Time: 10:14
 */

namespace app\models;

use app\models\base\BaseUserActionHistory;


class UserActionHistory extends BaseUserActionHistory
{
    const TYPE_FOLLOW_QUESTION = 1; // 关注该问题
    const TYPE_ADD_QUESTION = 2; // 添加该问题
    const TYPE_VOTE_ANSWER = 3; // 赞同该回答
    const TYPE_ADD_ANSWER = 4; // 回答了该问题

    public function getTypeDesc()
    {
        switch ($this->type) {
            case self::TYPE_FOLLOW_QUESTION:
                return \Yii::t('app', '关注该问题');
            case self::TYPE_ADD_QUESTION:
                return \Yii::t('app', '添加该问题');
            case self::TYPE_VOTE_ANSWER:
                return \Yii::t('app', '赞同该回答');
            case self::TYPE_ADD_ANSWER:
                return \Yii::t('app', '回答了该问题');
        }
    }

    public function getAnswer()
    {
        return $this->hasOne(Answer::className(), ['id' => 'answer_id']);
    }

    public function getQuestion()
    {
        return $this->hasOne(Question::className(), ['id' => 'question_id']);
    }

    public function getAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'uid']);
    }

    public static function add($type, $uid, Post $post)
    {
        $model = new static([
            'type' => $type,
            'uid' => $uid,
            'time' => time(),
            'is_anonymous' => $post->is_anonymous
        ]);
        if ($post->getIsQuestion()) {
            $model->question_id = $post->id;
        } else {
            $model->answer_id = $post->id;
            $model->question_id = $post->question_id;
        }
        $model->save(false);
    }
}
