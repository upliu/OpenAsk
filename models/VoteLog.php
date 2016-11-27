<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%vote_log}}".
 *
 * @property integer $id
 * @property string $uuid
 * @property integer $user_id
 * @property integer $type
 * @property integer $created_at
 */
class VoteLog extends \yii\db\ActiveRecord
{
    const TYPE_UP = 1; // 赞
    const TYPE_DOWN = 2; // 踩
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%vote_log}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['uuid', 'type'], 'required'],
            [['user_id', 'type', 'created_at'], 'integer'],
            [['uuid'], 'string', 'max' => 36],
            [['uuid', 'type'], 'unique', 'targetAttribute' => ['uuid', 'type'], 'message' => 'The combination of Uuid and Type has already been taken.'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'uuid' => 'Uuid',
            'user_id' => 'User ID',
            'type' => 'Type',
            'created_at' => 'Created At',
        ];
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            $this->user_id = \Yii::$app->user->id;
            $this->created_at = time();
            return true;
        }
    }
}
