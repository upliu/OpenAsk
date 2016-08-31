<?php


namespace app\models;


use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use app\models\base\BasePost;
use yii\helpers\HtmlPurifier;
use yii\helpers\Json;

/**
 * Class Post
 * @package app\models
 *
 * @property User $author
 */
class Post extends BasePost
{

    /**
     * @inheritdoc
     * @return PostQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PostQuery(get_called_class());
    }


    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    public function attributeLabels()
    {
        return [
            'title' => \Yii::t('app', '标题'),
            'tagValues' => \Yii::t('app', '话题'),
        ];
    }

    public function getQuestionId()
    {
        return $this->question_id ?: $this->id;
    }

    public function getIsQuestion()
    {
        return !$this->question_id;
    }

    public function getIsAnswer()
    {
        return !$this->getIsQuestion();
    }

    public function getAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'author_id']);
    }

    /**
     * 用户在当前问题下是否匿名
     * @param $uid
     * @return bool
     */
    private $_userAnonymous = [];

    // @todo 这个方法如果没用到,请删除
    public function getIsAnonymousOfUser($uid)
    {
        if ($this->_userAnonymous[$uid] !== null) {
            return $this->_userAnonymous[$uid];
        }
        if (!$this->getIsQuestion()) {
            return false;
        }
        if ($this->author_id == $uid && $this->is_anonymous) {
            return $this->_userAnonymous[$uid] = true;
        }
        $exists = static::find()->where(['question_id' => $this->id, 'author_id' => $uid, 'is_anonymous' => 1])->exists();
        return $this->_userAnonymous[$uid] = $exists;
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->body) {
                $this->body_sanitized = HtmlPurifier::process($this->body);
            } else {
                $this->body_sanitized = $this->body;
            }
            return true;
        }
    }
}
