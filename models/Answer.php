<?php


namespace app\models;

/**
 * Class Answer
 * @package app\models
 *
 * @property Question $question
 */
class Answer extends Post
{

    public function scenarios()
    {
        return [
            'default' => ['body', 'is_anonymous', '!author_id', 'question_id', '!author_id_question_id'],
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

    public function beforeValidate()
    {
        if (parent::beforeValidate()) {
            if ($this->isNewRecord) {
                $this->author_id_question_id = implode('-', [$this->author_id, $this->question_id]);
            }

            return true;
        }
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if ($insert) {
            $question = $this->question;
            $question->last_active = time();
            $question->save(false);

            UserActionHistory::add(UserActionHistory::TYPE_ADD_ANSWER, $this->author_id, $this);
        }

    }
}
