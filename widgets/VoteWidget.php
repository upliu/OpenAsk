<?php


namespace app\widgets;


use yii\base\Widget;

class VoteWidget extends Widget
{
    public $count;

    public function run()
    {
        return $this->render('@app/views/_widgets/vote-widget', ['count' => $this->count]);
    }
}
