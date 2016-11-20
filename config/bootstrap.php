<?php

// 加载事件
$events = require(__DIR__ . '/events.php');
foreach ($events as $class => $classEvents) {
    foreach ($classEvents as $name => $handler) {
        $data = null;
        $append = true;
        if (is_array($handler)) {
            $func = $handler[0];
            if (isset($handler[1])) {
                $data = $handler[1];
                if (isset($handler[2])) {
                    $append = $handler[2];
                }
            }
        } else {
            $func = $handler;
        }
        \yii\base\Event::on($class, $name, $func, $data, $append);
    }
}

