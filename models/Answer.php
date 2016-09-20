<?php


namespace app\models;
use app\models\base\BaseAnswer;
use yii\helpers\HtmlPurifier;

/**
 * Class Answer
 * @package app\models
 *
 * @property Question $question
 */
class Answer extends BaseAnswer
{

    use PostTrait;

    public function scenarios()
    {
        return [
            'default' => ['body', 'is_anonymous', '!author_id', 'question_id'],
        ];
    }

    public function rules()
    {
        return array_merge(parent::rules(), [
            [['body', 'question_id'], 'required']
        ]);
    }

    public function getQuestion()
    {
        return $this->hasOne(Question::className(), ['id' => 'question_id']);
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            $this->body_sanitized = HtmlPurifier::process($this->body);
            return true;
        }
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if ($insert) {
            $question = $this->question;
            $question->last_active = time();
            $question->last_answer_id = $this->id;
            $question->last_answer_by = $this->author_id;
            $question->save(false);

            Question::updateAllCounters(['count_answer' => 1], ['id' => $this->question_id]);

            UserActionHistory::add(UserActionHistory::TYPE_ADD_ANSWER, $this->author_id, $this);
        }

    }

    public function attributeLabels()
    {
        return [
            'body' => \Yii::t('app', '内容'),
            'is_anonymous' => \Yii::t('app', '匿名'),
        ];
    }
}
