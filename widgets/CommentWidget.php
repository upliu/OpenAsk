<?php


namespace app\widgets;


use app\models\Comment;
use yii\base\InvalidConfigException;
use yii\base\Widget;

/**
 * 新增评论通用组件
 * CommentWidget
 */
class CommentWidget extends Widget
{
    protected static $isJsRegistered = false;

    /** @var  Comment */
    public $comment;

    public function init()
    {
        parent::init();
        if (empty($this->comment)) {
            throw new InvalidConfigException('Property comment should be set.');
        }
    }

    public function run()
    {
        $this->registerJs();
        return $this->render('@app/views/_widgets/comment-widget', [
            'comment' => $this->comment,
        ]);
    }

    protected function registerJs()
    {
        if (static::$isJsRegistered) {
            return;
        }
        $view = $this->getView();
        $view->registerJs($this->render('@app/views/_widgets/comment-widget.js'));
    }
}
