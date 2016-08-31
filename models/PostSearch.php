<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Post;

/**
 * PostSearch represents the model behind the search form about `app\models\Post`.
 */
class PostSearch extends Post
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'created_at', 'updated_at', 'author_id', 'pid', 'count_comment', 'count_answer', 'count_view', 'count_vote_up', 'count_vote_down', 'count_interest', 'count_thank', 'count_mark', 'count_no_help', 'is_lock', 'is_anonymous'], 'integer'],
            [['title', 'body'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Post::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'author_id' => $this->author_id,
            'pid' => $this->pid,
            'count_comment' => $this->count_comment,
            'count_answer' => $this->count_answer,
            'count_view' => $this->count_view,
            'count_vote_up' => $this->count_vote_up,
            'count_vote_down' => $this->count_vote_down,
            'count_interest' => $this->count_interest,
            'count_thank' => $this->count_thank,
            'count_mark' => $this->count_mark,
            'count_no_help' => $this->count_no_help,
            'is_lock' => $this->is_lock,
            'is_anonymous' => $this->is_anonymous,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'body', $this->body]);

        return $dataProvider;
    }

    public function question(Topic $topic = null, $filter = '')
    {
        $query = Question::find();
        $query->with('author', 'lastAnswerAuthor', 'topics');
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'sort' => [
                'defaultOrder' => [
                    'last_active' => SORT_DESC,
                ]
            ],
            'pagination' => [
                'pageSize' => '20'
            ],
        ]);

        if ($topic) {
            $query->topicId($topic->id);
        }

        switch ($filter) {
            case 'unanswered':
                $query->noAnswer();
                break;
            case 'unsolved':
                $query->noAccept();
                break;
        }

        return $dataProvider;
    }

    public function answer($question_id, $sort = '')
    {
        $query = Answer::find();
        $query->andWhere(['question_id' => $question_id]);

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
}
