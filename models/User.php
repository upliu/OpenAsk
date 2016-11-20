<?php
namespace app\models;
use yii\base\UnknownPropertyException;

/**
 * User
 * @property UserMeta $meta
 */
class User extends \dektrium\user\models\User
{
    public function getMeta()
    {
        return $this->hasOne(UserMeta::className(), ['user_id' => 'id'])->inverseOf('user');
    }

    public function __get($name)
    {
        try {
            return parent::__get($name);
        } catch (UnknownPropertyException $e) {
            return $this->meta->{$name};
        }
    }

    public static function findBySlug($slug)
    {
        return UserMeta::findOne(['slug' => $slug])->user;
    }

    public function getIsMan()
    {
        return $this->meta->gender == 1;
    }

    public function getIsWoman()
    {
        return $this->meta->gender == 2;
    }

    public function afterSave($insert, $changedAttributes)
    {
        parent::afterSave($insert, $changedAttributes);
        if ($insert) {
            $meta = new UserMeta();
            $meta->setAttribute('display_name', $this->username);
            $meta->setAttribute('slug', $this->username);
            $meta->link('user', $this);
        }
    }
}
