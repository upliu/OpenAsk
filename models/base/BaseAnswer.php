<?php

namespace app\models\base;

use Yii;

/**
 * This is the model class for table "{{%answer}}".
 *
 * @property integer $id
 * @property string $body
 * @property string $body_sanitized
 * @property integer $created_at
 * @property integer $author_id
 * @property integer $updated_at
 * @property integer $modified_by
 * @property integer $modified_at
 * @property integer $question_id
 * @property integer $count_comment
 * @property integer $count_view
 * @property integer $count_vote_up
 * @property integer $count_vote_down
 * @property integer $count_interest
 * @property integer $count_thank
 * @property integer $count_mark
 * @property integer $count_no_help
 * @property integer $is_lock
 * @property integer $is_anonymous
 */
class BaseAnswer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%answer}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['body', 'body_sanitized'], 'string'],
            [['created_at', 'author_id', 'updated_at'], 'required'],
            [['created_at', 'author_id', 'updated_at', 'modified_by', 'modified_at', 'question_id', 'count_comment', 'count_view', 'count_vote_up', 'count_vote_down', 'count_interest', 'count_thank', 'count_mark', 'count_no_help', 'is_lock', 'is_anonymous'], 'integer'],
            [['author_id', 'question_id'], 'unique', 'targetAttribute' => ['author_id', 'question_id'], 'message' => 'The combination of Author ID and Question ID has already been taken.'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'body' => 'Body',
            'body_sanitized' => 'Body Sanitized',
            'created_at' => 'Created At',
            'author_id' => 'Author ID',
            'updated_at' => 'Updated At',
            'modified_by' => 'Modified By',
            'modified_at' => 'Modified At',
            'question_id' => 'Question ID',
            'count_comment' => 'Count Comment',
            'count_view' => 'Count View',
            'count_vote_up' => 'Count Vote Up',
            'count_vote_down' => 'Count Vote Down',
            'count_interest' => 'Count Interest',
            'count_thank' => 'Count Thank',
            'count_mark' => 'Count Mark',
            'count_no_help' => 'Count No Help',
            'is_lock' => 'Is Lock',
            'is_anonymous' => 'Is Anonymous',
        ];
    }
}
