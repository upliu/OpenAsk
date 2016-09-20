<?php
use app\assets\AppAsset;
use yii\bootstrap\Dropdown;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\helpers\Url;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);

$this->beginContent('@app/views/layouts/minimal.php');

$USERNAME = 'upliu';
$NICKNAME = '开飞机的小蜗牛';

?>

<?php $this->beginBlock('search-form'); ?>
    <form class="navbar-form navbar-left" role="search" method="get" action="<?= Url::to(['/search/index']) ?>">
        <input type="hidden" name="type" value="content">
        <div class="form-group">
            <div class="input-group">
                <input required type="text" id="q" name="q" class="form-control" placeholder="<?= Yii::t('app', '搜索你感兴趣的内容...') ?>">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </div>
    </form>
<?php $this->endBlock(); ?>


<?php $this->beginBlock('userinfo'); ?>
<li class="i-userinfo dropdown">
    <a class="i-username" href="<?= Url::to(['/people/view', 'slug' => $USERNAME]) ?>"><?= $NICKNAME ?></a>
    <?= Dropdown::widget([
        'encodeLabels' => false,
        'items' => [
            ['label' => '<span class="glyphicon glyphicon-user"></span> '.Yii::t('app', '我的主页'), 'url' => ['/people/view', 'slug' => $USERNAME]],
            ['label' => '<span class="glyphicon glyphicon-envelope"></span> '.Yii::t('app', '私信'), 'url' => ['/inbox/index']],
            ['label' => '<span class="glyphicon glyphicon-cog"></span> '.Yii::t('app', '设置'), 'url' => ['/settings/index']],
            ['label' => '<span class="glyphicon glyphicon-off"></span> '.Yii::t('app', '退出'), 'url' => ['/site/logout']],
        ],
    ]) ?>
</li>
<?php $this->endBlock() ?>



<?php
NavBar::begin([
    'brandLabel' => Yii::$app->name,
    'brandUrl' => Yii::$app->homeUrl,
    'options' => [
        'class' => 'navbar-fixed-top i-navbar-default navbar-default',
    ],
]);


echo Nav::widget([
    'options' => ['class' => 'navbar-nav pull-right'],
    'items' => [
        '<a class="btn btn-default pull-left cmd-ask i-ask" href="'.Url::to(['/question/create']).'">'.Yii::t('app', '提问').'</a>',
        $this->blocks['userinfo']
    ],
]);

echo Nav::widget([
    'encodeLabels' => false,
    'options' => ['class' => 'navbar-nav'],
    'items' => [
        $this->blocks['search-form'],
        ['label' => Yii::t('app', '首页'), 'url' => ['/index/index']],
        ['label' => Yii::t('app', '话题'), 'url' => ['/topic/index']],
        ['label' => Yii::t('app', '发现'), 'url' => ['/explore/index']],
        ['label' => Yii::t('app', '消息'), 'url' => 'javascript:;', 'options' => ['class' => 'cmd-message']],
    ],
]);
NavBar::end();
?>

<div class="container">
    <div class="i-main-content">
        <div class="i-main-content-inner">
            <?= $content ?>
        </div>
    </div>
    <div class="i-main-sidebar">
        sidebar
    </div>
</div>

<?php
$this->endContent();
