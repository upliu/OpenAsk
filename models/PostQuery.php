<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Post]].
 *
 * @see Post
 */
class PostQuery extends \yii\db\ActiveQuery
{
    public function question()
    {
        return $this->andWhere('question_id = 0');
    }

    public function answer()
    {
        return $this->andWhere('question_id != 0');
    }

    public function topic($name)
    {
        $topic = Topic::findOne($name);
        if ($topic) {
            return $this->topicId($topic->id);
        } else {
            return $this->andWhere('0=1');
        }
    }

    public function topicId($topic_id)
    {
        return $this->andWhere(['in', 'id',
            PostTopic::find()->select('post_id')->where(['topic_id' => $topic_id])
        ]);
    }

    public function noAnswer()
    {
        return $this->andWhere(['count_answer' => 0]);
    }

    public function noAccept()
    {
        return $this->andWhere(['accept_answer_id' => 0]);
    }
}
