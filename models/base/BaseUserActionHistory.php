<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "{{%user_action_history}}".
 *
 * @property integer $id
 * @property integer $type
 * @property integer $uid
 * @property integer $time
 * @property integer $question_id
 * @property integer $answer_id
 * @property integer $is_anonymous
 */
class BaseUserActionHistory extends \yii\db\ActiveRecord
{
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
            [['type', 'uid', 'time'], 'required'],
            [['type', 'uid', 'time', 'question_id', 'answer_id', 'is_anonymous'], 'integer'],
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
            'uid' => 'Uid',
            'time' => 'Time',
            'question_id' => 'Question ID',
            'answer_id' => 'Answer ID',
            'is_anonymous' => 'Is Anonymous',
        ];
    }
}
