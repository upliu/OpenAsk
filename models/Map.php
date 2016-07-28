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

    public static function addOne($a, $b, $t=null)
    {
        $o = new static([
            'a' => $a,
            'b' => $b,
        ]);
        if ($o->hasAttribute('t') || $o->hasProperty('t')) {
            if ($t === null) {
                $t = time();   
            }
            $o->t = $t;
        }
        $o->save(false);
        static::setCachedResults($a, $b);
        return $o;
    }



    public static function deleteOne($a, $b)
    {
        static::setCachedResults($a, $b, false);
        return static::deleteAll(['a' => $a, 'b' => $b]);
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
    
    protected static $cachedResults;
    
    public static function setCachedResults($a, $b, $exits = true)
    {
        $k = "$a-$b";
        static::$cachedResults[$k] = (bool)$exits;
    }

    /**
     * $a 是否关注了 $b
     * @param $a
     * @param $b
     * @return bool
     */
    public static function exists($a, $b)
    {
        $k = "$a-$b";
        if (!isset(static::$cachedResults[$k])) {
            static::$cachedResults[$k] = static::find()->where([
                'a' => $a,
                'b' => $b
            ])->exists(static::getDb());
        }
        
        return static::$cachedResults[$k];
    }

    /**
     * $a 和 $b 之间的关系
     * @param $a
     * @param $b
     * @return int
     */
    public static function relation($a, $b)
    {
        if ($a == 0 || $b == 0) {
            return 0b00;
        }
        $v1 = static::exists($a, $b) ? 0b01 : 0b00;
        $v2 = static::exists($b, $a) ? 0b10 : 0b00;

        return $v1 | $v2;
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
