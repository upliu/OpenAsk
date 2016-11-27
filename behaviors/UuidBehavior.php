<?php


namespace app\behaviors;


use yii\behaviors\AttributeBehavior;
use yii\db\ActiveRecord;
use yii\db\Expression;

class UuidBehavior extends AttributeBehavior
{
    public $uuidAttribute = 'uuid';

    public function init()
    {
        if (empty($this->attributes)) {
            $this->attributes = [
                ActiveRecord::EVENT_BEFORE_INSERT => $this->uuidAttribute,
            ];
        }
    }

    public function getValue($event)
    {
        return new Expression('UUID()');
    }
}
