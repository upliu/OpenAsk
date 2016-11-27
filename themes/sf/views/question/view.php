<?php

/* @var $this yii\web\View */
use app\models\Comment;
use app\widgets\CommentWidget;
use app\widgets\VoteWidget;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use vova07\imperavi\Widget;
use yii\helpers\Url;
use yii\widgets\ListView;
use kartik\icons\Icon;

/* @var $question app\models\Question */
/* @var $answer app\models\Answer */
/* @var $viewAnswer app\models\Answer */

$this->title = $question->title;
?>

<?= $this->render('_question-header', ['question' => $question]) ?>

<div class="container mt30">
    <div class="row">
        <div class="col-xs-12 col-md-9 main">

            <?= $this->render('_question-detail', ['question' => $question]) ?>

            <h2 class="h4 question-answer">
                <?= Yii::t('app', '{count} 个回答', ['count' => $question->count_answer]) ?>
            </h2>

            <?= ListView::widget([
                'emptyText' => '',
                'itemOptions' => ['class' => 'answer-item'],
                'dataProvider' => $dataProvider,
                'itemView' => 'answer-item',
                'summary' => '',
            ]) ?>

            <?php if ($myAnswer) { ?>
                <div class="text-center">
                    <?= Yii::t('app', '这个问题您已经提交过答案, 您可以对<a href="{href}">现有答案</a>进行<a href="{href_edit}">修改</a>', ['href' => '#answer-' . $myAnswer->id, 'href_edit' => Url::to(['answer/update', 'question_id' => $question->id, 'answer_id' => $myAnswer->id])]) ?>
                </div>
            <?php } else { ?>
                <?php $form = ActiveForm::begin(['action' => ['answer/create', 'question_id' => $question->id]]) ?>
                <?= $form->field($answer, 'body')->widget(Widget::className(), [
                    'options' => [
                        'style' => 'display:none',
                    ],
                    'settings' => [
                        'lang' => 'zh_cn',
                        'formatting' => ['blockquote', 'pre'],
                        'minHeight' => 200,
                        'imageUpload' => Url::to(['/site/image-upload']),
                        'fileUpload' => Url::to(['/site/file-upload']),
                        'plugins' => [
                            'table',
                            'video',
                            'fullscreen',
                        ],
                    ],
                ])->label(false) ?>
                <?= $form->field($answer, 'is_anonymous')->checkbox() ?>
                <div class="form-group">
                    <?= Html::submitButton(Yii::t('app', '发布回答'), ['class' => 'btn btn-primary']) ?>
                </div>
                <?php ActiveForm::end() ?>
            <?php } ?>
        </div>


        <div class="col-xs-12 col-md-3 side">
            <?= \app\widgets\SideBarWidget::widget() ?>
        </div>

    </div>
</div> <!-- /container -->
