<?php

Yii::setAlias('@tests', dirname(__DIR__) . '/tests/codeception');

$config = [
    'id' => 'app-console',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'app\commands',
    'components' => [
        'log' => [
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => YII_DEBUG
                        ? ['error', 'warning', 'info', 'trace', 'profile']
                        : ['error', 'warning'],
                ],
            ],
        ],
    ],
    'controllerMap' => [
        'stubs' => [
            'class' => 'bazilio\stubsgenerator\StubsController',
        ],
    ],
    /*
    'controllerMap' => [
        'fixture' => [ // Fixture generation command line.
            'class' => 'yii\faker\FixtureController',
        ],
    ],
    */
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'gii';
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
    ];
}

return $config;
