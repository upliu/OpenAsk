<?php


namespace app\models;


use yii\db\IntegrityException;

class MapUserFollow extends Map
{
    /**
     * 获取关注的人
     * @param $uid
     * @return array
     */
    public static function getFollows($uid)
    {
        return static::getBsByA($uid);
    }

    public static function getFollowsQuery($uid)
    {
        return static::getBsByAQuery($uid);
    }

    public static function hasFollowed($a, $b)
    {
        return static::exists($a, $b);
    }

    public static function follow($a, $b)
    {
        try {
            return static::addOne($a, $b);
        } catch (IntegrityException $e) {
            return null;
        }
    }
}