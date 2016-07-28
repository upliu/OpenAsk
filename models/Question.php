<?php


namespace app\models;

/**
 * Class Question
 * @package app\models
 * @property Topic[] $topics
 * @property string[] $tagValues
 */
class Question extends Post
{

    public function getTopics()
    {
        return $this->hasMany(Topic::className(), ['id' => 'topic_id'])
            ->viaTable(MapPostTopic::tableName(), ['post_id' => 'id']);
    }

    public function init()
    {
        parent::init();
        $this->scenario = 'question';
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

    public function setTagValues($values)
    {
        $this->_tagValues = $this->filterTagValues($values);
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

    public function afterDelete()
    {
        parent::afterDelete();
        // 删除话题关联数据
        MapPostTopic::deleteAll(['post_id' => $this->id]);
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        // 处理 Feed 信息流
        if ($insert && !$this->is_anonymous) {
            Feed::add(Feed::TYPE_ADD_QUESTION, $this->author_id, $this);
        }

        // 删除话题关联数据
        MapPostTopic::deleteAll(['post_id' => $this->id]);
        // 添加话题关联
        foreach ($this->tagValues as $tag) {
            MapPostTopic::add($tag, $this->id, \Yii::$app->user->id);
        }
    }
}
