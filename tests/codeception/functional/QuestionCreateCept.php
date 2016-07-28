<?php
$I = new FunctionalTester($scenario);
$I->wantTo('perform actions and see result');
$I->amOnPage('/question/create');
$I->see('登录');
$I->submitForm('.i-main-content form', [
    'user_id' => 4,
]);
$I->see('login success');
$I->amOnPage('/question/create');
$I->see('发布');
$I->submitForm('.post-form form', [
    'Post' => [
        'title' => '测试 QuestionCreate',
        'body' => '<p>测试 QuestionCreate，文章内容</p>',
        'tagValues' => 'php,js',
    ]
]);
$I->seeCurrentUrlMatches('#question/\d+#');