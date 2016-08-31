<?php


namespace tests\codeception\unit\models;


use app\models\Question;
use yii\helpers\Json;

class QuestionTest extends TestCase
{
    public function testCreate()
    {
        $user = $this->login();

        $question = new Question();
        $question->load([
            'Question' => [
                'title' => '测试标题 ' . __METHOD__,
                'body' => '<p>单元测试内容</p><script>alert(1)</script><a href="http://www.qq.com/">腾讯</a>',
                'is_anonymous' => 1,
                'tagValues' => ['PHP', 'js'],
                'author_id' => 1,
                'created_at' => time(),
            ]
        ]);

        $notEmptyAttrs = array_filter($question->toArray(array_keys($question->attributes)));

        \Yii::error(Json::encode($notEmptyAttrs), __METHOD__);

        $this->assertEquals(3, count($notEmptyAttrs));

        expect('author_id should be empty', $question->author_id)->isEmpty();
        expect('created_at should be empty', $question->created_at)->isEmpty();

        // 之所以保存失败是因为 author_id required
        expect('问题保存失败', $question->save())->isEmpty();
        expect('body_sanitized should be empty', $question->body_sanitized)->isEmpty();

        $question->author_id = $user->id;

        expect('问题保存成功', $question->save())->equals(true);
        $this->assertEquals('<p>单元测试内容</p><a href="http://www.qq.com/">腾讯</a>', $question->body_sanitized);
    }
}
