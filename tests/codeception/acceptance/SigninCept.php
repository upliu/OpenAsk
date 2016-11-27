<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('登录');

$I->amOnPage('/');
$I->click('.widget-login .btn');
$I->waitForElement('#login-form');
$I->amGoingTo('try to login with empty credentials');
$I->submitForm('#login-form', []);
$I->seeElement('.field-login-form-login.has-error');
$I->seeElement('.field-login-form-password.has-error');
$I->submitForm('#login-form', [
    'login-form[login]' => 'admin@qq.com',
    'login-form[password]' => '123456',
]);
$I->waitForElement('.i-userinfo');
