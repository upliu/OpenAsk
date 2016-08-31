<?php

namespace app\models;

use Yii;
use yii\data\SqlDataProvider;

/**
 * This is the model class for table "{{%map}}".
 *
 * @property string $a
 * @property string $b
 * @property integer $t
 */
abstract class Map extends \yii\db\ActiveRecord
{
    const A2B = 0b01; // A 关注 B
    const B2A = 0b10; // B 关注 A
    const AnoB = 0b00; // A B 互相没有关注
    const AeachB = 0b11; // A B 互相关注

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['a', 'b', 't'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'a' => 'A',
            'b' => 'B',
            't' => 'T',
        ];
    }



    /**
     * $a 关注的人中，同时关注 $b 的人
     * @param $a
     * @param $b
     * @return int
     */
    public static function AedBCount($a, $b)
    {
        $a = (int)$a;
        $b = (int)$b;
        $sql = "select count(distinct t.b) from ".static::tableName()." t join ".static::tableName()." t2
on t.b=t2.a
where t.a=$a and t2.b=$b";
        return (int) static::getDb()->createCommand($sql)->queryScalar();
    }

    /**
     * $a 关注的人中，同时关注 $b 的人
     * @param $a int
     * @param $b int
     * @param $offset
     * @param int $pageSize
     * @return array
     */
    public static function AedB($a, $b, $offset, $pageSize = 20)
    {
        $a = (int)$a;
        $b = (int)$b;
        $offset = (int)$offset;
        $pageSize = (int)$pageSize;
        $sql = "select distinct t.b from ".static::tableName()." t join ".static::tableName()." t2
on t.b=t2.a
where t.a=$a and t2.b=$b limit $offset, $pageSize";
        return static::getDb()->createCommand($sql)->queryColumn();
    }

    protected static function getBsByA($a)
    {
        return static::find()->select('b')->where(['a' => $a])->column(static::getDb());
    }

    protected static function getBsByAQuery($a)
    {
        return static::find()->select('b')->where(['a' => $a]);
    }
}
