<?php
/**
 * Created by IntelliJ IDEA.
 * User: liu
 * Date: 6/28/16
 * Time: 10:53 PM
 */

namespace app\controllers;


use app\models\User;
use yii\helpers\FileHelper;
use yii\imagine\Image;
use yii\web\Controller;
use yii\filters\AccessControl;
use yii\web\UploadedFile;

class PeopleController extends Controller
{
    use AjaxValidationTrait;
    
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['edit'],
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ]
                ],
            ],
        ];
    }

    public function actionView($slug)
    {
        /** @var User $user */
        $user = User::findOne(['slug' => $slug]);
        return $this->render('view', [
            'user' => $user,
        ]);
    }

    public function actionEdit()
    {
        /** @var User $user */
        $user = \Yii::$app->user->identity;
        if (\Yii::$app->request->isPost) {
            \Yii::$app->response->format = 'json';
            $user->scenario = 'edit';
            
            // 上传头像 {{{
            if ($img = UploadedFile::getInstanceByName('avatar-image')) {
                $errors = [];
                if ($img->size > 1.5 * 1024 * 1024) {
                    $errors[] = \Yii::t('app', '上传头像图片大小不能超过 1.5MB');
                }
                $mimeType = FileHelper::getMimeType($img->tempName);
                if (!in_array($mimeType, ['image/png', 'image/jpeg'], true)) {
                    $errors[] = \Yii::t('app', '上传头像图片格式必须为 png 或 jpeg');
                }
                if (!empty($errors)) {
                    return ['errors' => ['avatar-image' => $errors]];
                }
                $head = Image::thumbnail($img->tempName, 250, 250);
                $saveName = md5(time().\Yii::$app->user->id) . '.' . ($mimeType == 'image/png' ? 'png' : 'jpg');
                $subDir = substr($saveName, 0, 2);
                FileHelper::createDirectory(\Yii::getAlias("@webroot/uploads/avatar/$subDir"));
                $head->save(\Yii::getAlias("@webroot/uploads/avatar/$subDir/$saveName"));
                $avatarImage = \Yii::getAlias("@web/uploads/avatar/$subDir/$saveName");
                $user->avatar = $avatarImage;
                $user->save(false);
                return [
                    'avatar-image' => $avatarImage
                ];
            } // }}}
            else {
                $user->load(\Yii::$app->request->post());
            }
            if ($user->save()) {
                return [];
            } else {
                return ['errors' => $user->errors];
            }
        }

        return $this->render('edit', [
            'user' => $user
        ]);
    }
}