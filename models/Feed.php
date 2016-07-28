<?php


namespace app\models;


use app\helpers\Helper;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "{{%feed}}".
 *
 * @property string $id
 * @property integer $type
 * @property string $uid
 * @property integer $time
 * @property integer $question_id
 * @property integer $answer_id
 * @property User $author
 * @property Post $answer
 * @property Post $question
 */
class Feed extends ActiveRecord
{

    const TYPE_FOLLOW_QUESTION = 1; // 关注该问题
    const TYPE_ADD_QUESTION = 2; // 添加该问题
    const TYPE_VOTE_ANSWER = 3; // 赞同该回答
    const TYPE_ADD_ANSWER = 4; // 回答了该问题

    public static function tableName()
    {
        return '{{%feed}}';
    }

    public function rules()
    {
        return [
            [['type', 'uid', 'time'], 'required'],
            [['type', 'uid', 'time', 'question_id', 'answer_id'], 'integer'],
        ];
    }

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
        $feed = new static([
            'type' => $type,
            'uid' => $uid,
            'time' => time(),
        ]);
        if ($post->getIsQuestion()) {
            $feed->question_id = $post->id;
        } else {
            $feed->answer_id = $post->id;
            $feed->question_id = $post->question_id;
        }
        $feed->save(false);

        return $feed;
    }

    public static function deleteByUidAndQuestionId($uid, $question_id)
    {
        static::deleteAll(['uid' => $uid, 'question_id' => $question_id]);
    }
}
