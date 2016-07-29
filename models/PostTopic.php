<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "{{%map_post_topic}}".
 *
 * @property string $post_id
 * @property string $topic_id
 * @property string $uid
 * @property integer $add_time
 */
class PostTopic extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%post_topic}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_id', 'topic_id', 'uid', 'add_time'], 'required'],
            [['post_id', 'topic_id', 'uid', 'add_time'], 'integer'],
        ];
    }

    public static function add($name, $post_id, $uid)
    {
        $topic = Topic::getByName($name);
        $rel = new static([
            'post_id' => $post_id,
            'topic_id' => $topic->id,
            'uid' => $uid,
        ]);
        $rel->save(false);
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            $this->add_time = time();
            return true;
        }
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        Topic::findOne($this->topic_id)->statistics()->save(false);
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'post_id' => 'Post ID',
            'topic_id' => 'Topic ID',
            'uid' => 'Uid',
            'add_time' => 'Add Time',
        ];
    }
}
