<?php


namespace tests\codeception\unit\models;


use app\models\Answer;
use yii\helpers\HtmlPurifier;

class AnswerTest extends TestCase
{
    public function testCreate()
    {
        $user = $this->login();
        $body = '<p>单元测试回答内容</p><script>alert(1)</script><a href="http://www.qq.com/">腾讯</a>';
        $answer = new Answer();
        $answer->load([
            'Answer' => [
                'author_id' => 1,
                'is_anonymous' => 1,
                'question_id' => 35,
            ]
        ]);
        $this->assertEquals(false, $answer->save());
        $this->assertEquals(null, $answer->author_id);
        $this->assertEquals(1, $answer->is_anonymous);

        $answer->body = $body;
        $answer->author_id = $user->id;

        $save = $answer->save();
        upliu($answer->errors);
        $this->assertEquals(true, $save);
        $this->assertEquals(HtmlPurifier::process($body), $answer->body_sanitized);
    }
}
