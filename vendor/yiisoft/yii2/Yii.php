<?php
/**
 * Yii bootstrap file.
 *
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

use yii\helpers\Json;

require(__DIR__ . '/BaseYii.php');

/**
 * Yii is a helper class serving common framework functionalities.
 *
 * It extends from [[\yii\BaseYii]] which provides the actual implementation.
 * By writing your own Yii class, you can customize some functionalities of [[\yii\BaseYii]].
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class Yii extends \yii\BaseYii
{
}

spl_autoload_register(['Yii', 'autoload'], true, true);
Yii::$classMap = require(__DIR__ . '/classes.php');
Yii::$container = new yii\di\Container();


function upliu($message, $category = null)
{
    if (!is_scalar($message)) {
        $message = Json::encode($message);
    }
    if (!$category) {
        $trace = debug_backtrace(DEBUG_BACKTRACE_IGNORE_ARGS);
        $c = isset($trace[1]['class']) ? $trace[1]['class'] : $trace[0]['file'];
        $f = isset($trace[1]['function']) ? $trace[1]['function'] : '';
        $line = $trace[0]['line'];
        $category = "$c::$f:$line";
    }
    Yii::error($message, $category);
}
