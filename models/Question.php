<?php


namespace app\models;
use app\models\base\BaseQuestion;
use yii\data\ActiveDataProvider;
use yii\helpers\HtmlPurifier;

/**
 * Class Question
 * @package app\models
 *
 * @property Topic[] $topics
 * @property string[] $tagValues
 * @property User $lastAnswerAuthor
 */
class Question extends BaseQuestion
{

    use PostTrait;

    public static function tableName()
    {
        return '{{%question}}';
    }

    public function attributeLabels()
    {
        return [
            'title' => \Yii::t('app', '标题'),
            'tagValues' => \Yii::t('app', '话题'),
        ];
    }

    public function getTopics()
    {
        return $this->hasMany(Topic::className(), ['id' => 'topic_id'])
            ->viaTable(QuestionTopic::tableName(), ['post_id' => 'id']);
    }

    public function scenarios()
    {
        return [
            'default' => ['title', 'body', 'is_anonymous', 'tagValues', '!author_id'],
        ];
    }

    public function rules()
    {
        return array_merge(parent::rules(), [
            [['title', 'tagValues'], 'required']
        ]);
    }

    private $_tagValues;

    public function getTagValues()
    {
        if (!$this->isNewRecord && $this->_tagValues === null) {
            foreach ($this->topics as $topic) {
                $this->_tagValues[] = $topic->name;
            }
        }
        return $this->_tagValues;
    }

    private $_tabValuesSeted;
    public function setTagValues($values)
    {
        $this->_tagValues = $this->filterTagValues($values);
        $this->_tabValuesSeted = true;
    }

    public function filterTagValues($values)
    {
        return array_unique(preg_split(
            '/\s*,\s*/u',
            preg_replace('/\s+/u', ' ', is_array($values) ? implode(',', $values) : $values),
            -1,
            PREG_SPLIT_NO_EMPTY
        ));
    }

    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($insert) {
                $this->last_active = time();
            }
            $this->body_sanitized = HtmlPurifier::process($this->body);
            return true;
        }
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        if ($insert) {
            UserActionHistory::add(UserActionHistory::TYPE_ADD_QUESTION, $this->author_id, $this);
        }

        if ($this->_tabValuesSeted) {
            // 删除话题关联数据
            QuestionTopic::deleteAll(['post_id' => $this->id]);
            // 添加话题关联
            foreach ($this->tagValues as $tag) {
                QuestionTopic::add($tag, $this->id, \Yii::$app->user->id);
            }
        }
    }

    public function getLastAnswerAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'last_answer_by']);
    }

    public function answerSearch($sort = '')
    {
        $query = Answer::find();
        $query->andWhere(['question_id' => $this->id]);

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'count_vote_up' => SORT_DESC,
                ]
            ],
            'pagination' => [
                'pageSize' => '20'
            ],
        ]);

        switch ($sort) {
            case 'created':
                $query->orderBy('created_at desc');
                break;
        }

        return $dataProvider;
    }

    public function isAnswered($userId)
    {
        return Answer::find()->where(['question_id' => $this->id, 'author_id' => $userId])->exists();
    }

    public function answer($userId)
    {
        return Answer::findOne(['question_id' => $this->id, 'author_id' => $userId]);
    }

}
