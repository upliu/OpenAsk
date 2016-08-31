<?php


namespace app\models;

/**
 * Class Question
 * @package app\models
 *
 * @property Topic[] $topics
 * @property string[] $tagValues
 * @property User $lastAnswerAuthor
 */
class Question extends Post
{

    public function getTopics()
    {
        return $this->hasMany(Topic::className(), ['id' => 'topic_id'])
            ->viaTable(PostTopic::tableName(), ['post_id' => 'id']);
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
                $this->is_anonymous = intval($this->is_anonymous);
                $this->last_active = time();
            }
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
            PostTopic::deleteAll(['post_id' => $this->id]);
            // 添加话题关联
            foreach ($this->tagValues as $tag) {
                PostTopic::add($tag, $this->id, \Yii::$app->user->id);
            }
        }
    }

    public function getLastAnswerAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'last_answer_by']);
    }

}
