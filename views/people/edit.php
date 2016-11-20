<?php

use yii\helpers\Html;
use yii\helpers\Url;
use app\assets\AppAsset;

/* @var $this yii\web\View */
/* @var $user app\models\User */

$this->title = Yii::t('app', '编辑个人资料');

$this->registerJsFile('@web/static/dist/people-edit.js', ['depends' => AppAsset::className()]);
?>

<?= Html::beginForm() ?>
<div class="i-profile-card">
    <div class="i-item">
        <h3>
            <a href="<?=Url::to(['/people/view', 'slug' => $user->slug])?>"><?=$user->display_name?></a>
            <?=Yii::t('app', '» 编辑个人资料')?>
            <a class="i-backlink" href="<?= Url::to(['/people/view', 'slug' => $user->slug]) ?>"><?=Yii::t('app', '返回个人主页')?></a>
        </h3>
    </div>
    
    <div class="i-item">
        <h3 class="i-label"><?=Yii::t('app', '头像')?></h3>
        <div class="i-content">
            <div class="i-avatar-editor">
                <img src="<?= $user->avatar ?>" alt="" class="i-avatar i-avatar-l js-avatar">
                <span class="i-avatar-editor-tip"><?= Yii::t('app', '修改头像') ?></span>   
                <input type="file" class="i-input-avatar-image" id="avatar-image" name="avatar-image">
            </div>
        </div>
    </div>

    <div class="i-item <?= $user->gender ? '' : 'empty' ?>">
        <h3 class="i-label"><?= Yii::t('app', '性别') ?></h3>
        <div class="i-content">
            <div class="i-static-content">
                <span class="js-value"><?= $user->getIsMan() ? Yii::t('app', '男') : ($user->getIsWoman() ? Yii::t('app', '女') : '') ?></span>
                <button class="i-edit-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '修改') ?></button>
                <button class="i-fill-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '设置性别') ?></button>
            </div>
            <div class="i-editable-content">
                <?= Html::activeRadioList($user, 'gender', [1 => Yii::t('app', '男'), 2 => Yii::t('app', '女')]) ?>
                <div class="i-action" style="margin-top: 5px">
                    <button class="i-btn-primary i-btn-blue cmd-save"><?= Yii::t('app', '保存') ?></button>
                    <button class="i-btn-primary i-btn-link cmd-cancel"><?= Yii::t('app', '取消') ?></button>
                </div>
            </div>
        </div>
    </div>

    <div class="i-item <?= $user->headline ? '' : 'empty' ?>">
        <h3 class="i-label"><?= Yii::t('app', '一句话介绍') ?></h3>
        <div class="i-content">
            <div class="i-static-content">
                <span class="js-value"><?= $user->headline ?></span>
                <button class="i-edit-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '修改') ?></button>
                <button class="i-fill-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '填写') ?></button>
            </div>
            <div class="i-editable-content">
                <div class="i-input-wrap">
                <?= Html::activeInput('text', $user, 'headline', ['class' => 'form-control'])?>
                </div>
                <div class="i-tip"><?= Yii::t('app', '例如：汽车制造 / 产品设计师 / 登山爱好者') ?></div>
                <div class="i-action">
                    <button class="i-btn-primary i-btn-blue cmd-save"><?= Yii::t('app', '保存') ?></button>
                    <button class="i-btn-primary i-btn-link cmd-cancel"><?= Yii::t('app', '取消') ?></button>
                </div>
            </div>
        </div>
    </div>

    <div class="i-item <?= $user->bio ? '' : 'empty' ?>">
        <h3 class="i-label"><?= Yii::t('app', '个人简介') ?></h3>
        <div class="i-content">
            <div class="i-static-content">
                <span class="js-value"><?= $user->bio ?></span>
                <button class="i-edit-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '修改') ?></button>
                <button class="i-fill-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '填写') ?></button>
            </div>
            <div class="i-editable-content">
                <div class="i-input-wrap">
                    <?= Html::activeTextarea($user, 'bio', ['class' => 'form-control', 'rows' => 4])?>
                </div>
                <div class="i-tip"><?= Yii::t('app', '用一段话介绍你自己，会在你的个人页面显示') ?></div>
                <div class="i-action">
                    <button class="i-btn-primary i-btn-blue cmd-save"><?= Yii::t('app', '保存') ?></button>
                    <button class="i-btn-primary i-btn-link cmd-cancel"><?= Yii::t('app', '取消') ?></button>
                </div>
            </div>
        </div>
    </div>

    <div class="i-item <?= $user->business ? '' : 'empty' ?>">
        <h3 class="i-label"><?= Yii::t('app', '所在行业') ?></h3>
        <div class="i-content">
            <div class="i-static-content">
                <span class="js-value"><?= $user->business ?></span>
                <button class="i-edit-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '修改') ?></button>
                <button class="i-fill-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '填写') ?></button>
            </div>
            <div class="i-editable-content">
                <div class="i-input-wrap">
                    <?= Html::activeDropDownList($user, 'business', Yii::$app->params['businessItems'], ['encode' => false, 'class' =>'form-control'])?>
                </div>
                <div class="i-tip"><?= Yii::t('app', '行业信息会显示在你的个人页面') ?></div>
                <div class="i-action">
                    <button class="i-btn-primary i-btn-blue cmd-save"><?= Yii::t('app', '保存') ?></button>
                    <button class="i-btn-primary i-btn-link cmd-cancel"><?= Yii::t('app', '取消') ?></button>
                </div>
            </div>
        </div>
    </div>

    <div class="i-item <?= $user->location ? '' : 'empty' ?>">
        <h3 class="i-label"><?= Yii::t('app', '居住地') ?></h3>
        <div class="i-content">
            <div class="i-static-content">
                <span class="js-value"><?= $user->location ?></span>
                <button class="i-edit-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '修改') ?></button>
                <button class="i-fill-btn i-btn-text"><span class="glyphicon glyphicon-pencil"></span> <?= Yii::t('app', '填写') ?></button>
            </div>
            <div class="i-editable-content">
                <div class="i-input-wrap">
                    <?= Html::activeInput('text', $user, 'location', ['class' => 'form-control'])?>
                </div>
                <div class="i-action">
                    <button class="i-btn-primary i-btn-blue cmd-save"><?= Yii::t('app', '保存') ?></button>
                    <button class="i-btn-primary i-btn-link cmd-cancel"><?= Yii::t('app', '取消') ?></button>
                </div>
            </div>
        </div>
    </div>

</div>
<?= Html::endForm() ?>
