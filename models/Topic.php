<?php


namespace app\models;
use yii\db\ActiveRecord;


/**
 * This is the model class for table "{{%topic}}".
 *
 * @property string $id
 * @property string $name
 * @property string $icon
 * @property string $desc
 * @property integer $count
 * @property integer $count_best
 * @property integer $count_follower
 * @property integer $count_last_week
 * @property integer $count_last_month
 */
class Topic extends ActiveRecord
{

    public static function tableName()
    {
        return '{{%topic}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['desc'], 'string'],
            [['count', 'count_best', 'count_follower', 'count_last_week', 'count_last_month'], 'integer'],
            [['name'], 'string', 'max' => 128],
            [['icon'], 'string', 'max' => 256],
            [['name'], 'unique'],
        ];
    }

    public function statistics()
    {
        $this->count = PostTopic::find()->where(['topic_id' => $this->id])->count();
        $this->count_last_week = PostTopic::find()->where(['topic_id' => $this->id])->andWhere(['>=', 'add_time', time()-86400*7])->count();
        $this->count_last_month = PostTopic::find()->where(['topic_id' => $this->id])->andWhere(['>=', 'add_time', time()-86400*30])->count();
        return $this;
    }

    public static function getByName($name)
    {
        $model = static::findOne(['name' => $name]);
        if ($model === null) {
            $model = new static();
            $model->name = $name;
            $model->save(false);
        }
        return $model;
    }

    public static function findByName($name)
    {
        return static::findOne(['name' => $name]);
    }

}
