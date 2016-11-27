<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%question_mark}}".
 *
 * @property integer $id
 * @property integer $question_id
 * @property integer $user_id
 * @property integer $add_time
 */
class QuestionMark extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%question_mark}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question_id', 'user_id', 'add_time'], 'required'],
            [['question_id', 'user_id', 'add_time'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'question_id' => 'Question ID',
            'user_id' => 'user_id',
            'add_time' => 'Add Time',
        ];
    }
}
