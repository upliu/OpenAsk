<?php


namespace app\models;


use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "{{%post}}".
 *
 * @property string $id
 * @property string $title
 * @property string $body
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $author_id
 * @property string $question_id
 * @property integer $count_comment
 * @property integer $count_answer
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
class Post extends ActiveRecord
{
    public static function tableName()
    {
        return '{{%post}}';
    }

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

    public function scenarios()
    {
        return [
            'question' => ['title', 'body', 'is_anonymous', 'tagValues', '!author_id'],
            'answer' => ['body', 'question_id', 'is_anonymous', '!author_id'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['body'], 'string'],
            [['author_id'], 'required'],
            [['created_at', 'updated_at', 'author_id', 'question_id', 'count_comment', 'count_answer', 'count_view', 'count_vote_up', 'count_vote_down', 'count_interest', 'count_thank', 'count_mark', 'count_no_help', 'is_lock', 'is_anonymous'], 'integer'],
            [['title'], 'string', 'max' => 512],
            ['tagValues', 'safe'],
            [['title', 'tagValues'], 'required', 'on' => ['question']],
        ];
    }

    public function transactions()
    {
        return [
            self::SCENARIO_DEFAULT => self::OP_ALL,
            'question' => self::OP_ALL,
        ];
    }

    public function attributeLabels()
    {
        return [
            'title' => \Yii::t('app', '标题'),
            'tagValues' => \Yii::t('app', '话题'),
        ];
    }

    public function afterSave($insert, $changedAttributes)
    {
        // 不匿名状态更改为匿名，删除之前添加的 feed
        if (isset($changedAttributes['is_anonymous']) && $this->is_anonymous) {
            Feed::deleteByUidAndQuestionId($this->author_id, $this->getQuestionId());
        }

        parent::afterSave($insert, $changedAttributes);
    }

    public function getQuestionId()
    {
        return $this->question_id ?: $this->id;
    }

    public function getIsQuestion()
    {
        return $this->question_id == 0;
    }

    public function getIsAnswer()
    {
        return !$this->getIsQuestion();
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
}
