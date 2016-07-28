<?php


namespace app\models;


class Answer extends Post
{
    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);

        // 处理 Feed 信息流
        if ($insert && !$this->is_anonymous) {
            Feed::add(Feed::TYPE_ADD_ANSWER, $this->author_id, $this);
        }
    }
}
