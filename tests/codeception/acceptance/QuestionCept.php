<?php

require __DIR__.'/AskCept.php';

$I->seeElement('.cmd-follow-question');
$I->click('.cmd-follow-question');
//$I->waitForJS('return $.active == 0;'); // wait for ajax done
$I->wait(1); // wait for ajax done
$I->see('已关注', '.cmd-follow-question');
$I->click('.cmd-follow-question');
//$I->waitForJS('return $.active == 0;'); // wait for ajax done
$I->wait(1); // wait for ajax done
$I->see('关注', '.cmd-follow-question');

$I->click('.cmd-mark-question');
//$I->waitForJS('return $.active == 0;'); // wait for ajax done
$I->wait(1); // wait for ajax done
$I->see('已收藏', '.cmd-mark-question');
$I->click('.cmd-mark-question');
//$I->waitForJS('return $.active == 0;'); // wait for ajax done
$I->wait(1); // wait for ajax done
$I->see('收藏', '.cmd-mark-question');
