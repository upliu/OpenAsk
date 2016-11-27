<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 8/25/16
 * Time: 10:14
 */

namespace app\models;

use yii\db\ActiveRecord;


/**
 * This is the model class for table "{{%user_action_history}}".
 *
 * @property integer $id
 * @property integer $type
 * @property integer $user_id
 * @property integer $time
 * @property integer $question_id
 * @property integer $answer_id
 * @property integer $is_anonymous
 */
class UserActionHistory extends ActiveRecord
{
    const TYPE_FOLLOW_QUESTION = 1; // 关注该问题
    const TYPE_CREATE_QUESTION = 2; // 创建该问题
    const TYPE_VOTE_ANSWER = 3; // 赞同该回答
    const TYPE_CREATE_ANSWER = 4; // 回答了该问题

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%user_action_history}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'user_id', 'time'], 'required'],
            [['type', 'user_id', 'time', 'question_id', 'answer_id', 'is_anonymous'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'type' => 'Type',
            'user_id' => 'User_id',
            'time' => 'Time',
            'question_id' => 'Question ID',
            'answer_id' => 'Answer ID',
            'is_anonymous' => 'Is Anonymous',
        ];
    }

    public function getTypeDesc()
    {
        switch ($this->type) {
            case self::TYPE_FOLLOW_QUESTION:
                return \Yii::t('app', '关注该问题');
            case self::TYPE_CREATE_QUESTION:
                return \Yii::t('app', '添加该问题');
            case self::TYPE_VOTE_ANSWER:
                return \Yii::t('app', '赞同该回答');
            case self::TYPE_CREATE_ANSWER:
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
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    protected static function add($type, $user_id, $post)
    {
        $model = new static([
            'type' => $type,
            'user_id' => $user_id,
            'time' => time(),
            'is_anonymous' => $post->is_anonymous
        ]);
        if ($post instanceof Question) {
            $model->question_id = $post->id;
        } else {
            $model->answer_id = $post->id;
            $model->question_id = $post->question_id;
        }
        $model->save(false);
    }


    /**
     * 回答问题
     * @param int $user
     * @param Answer $answer
     */
    public static function createAnswer($user, Answer $answer)
    {
        self::add(self::TYPE_CREATE_ANSWER, $user, $answer);
    }


    /**
     * 创建问题
     * @param int $user
     * @param Question $question
     */
    public static function createQuestion($user, Question $question)
    {
        self::add(self::TYPE_CREATE_QUESTION, $user, $question);
    }

    /**
     * 关注问题
     * 如果已关注，则取消关注
     * @param int $user
     * @param Question $question
     * @return string
     */
    public static function followQuestion($user, Question $question)
    {
        $follow = $question->follow;
        // 已关注
        if ($follow && $follow->delete()) {
            $question->updateCountFollow();
            return 'unfollow';
        } else {
            $follow = new QuestionFollow([
                'user_id' => $user,
                'question_id' => $question->id,
                'add_time' => time(),
            ]);
            $follow->save(false);
            $question->updateCountFollow();
            return 'followed';
        }
    }

    /**
     * 收藏问题
     * 如果已收藏，则取消收藏
     * @param int $user
     * @param Question $question
     * @return string
     */
    public static function markQuestion($user, Question $question)
    {
        $mark = $question->mark;
        // 已关注
        if ($mark && $mark->delete()) {
            $question->updateCountMark();
            return 'unmark';
        } else {
            $mark = new QuestionMark([
                'user_id' => $user,
                'question_id' => $question->id,
                'add_time' => time(),
            ]);
            $mark->save(false);
            $question->updateCountMark();
            return 'marked';
        }
    }
}
