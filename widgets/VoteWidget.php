<?php


namespace app\widgets;


use yii\base\Widget;

class VoteWidget extends Widget
{

    public $countVoteUp = 0;

    public function run()
    {
        return $this->render('@app/views/_widgets/vote-widget', [
            'countVoteUp' => $this->countVoteUp
        ]);
    }
}
