<?php
/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace app\commands;

use yii\console\Controller;

/**
 * This command echoes the first argument that you have entered.
 *
 * This command is provided as an example for you to learn how to create console commands.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class HelloController extends Controller
{
    /**
     * This command echoes what you have entered as the message.
     * @param string $message the message to be echoed.
     */
    public function actionIndex($message = 'hello world')
    {
        echo $message . "\n";
    }

    public function actionBsConfig()
    {
        $vars_file = \Yii::getAlias('@app/web/themes/sf/vars.less');
        $json_file = '/Users/liu/Downloads/bootstrap/config.json';
        $data = json_decode(file_get_contents($json_file), true);
        $vars = $data['vars'];
        $f = fopen($vars_file, 'a');
        foreach ($vars as $var => $value) {
            fwrite($f, "$var: $value;\n");
        }
    }
}
