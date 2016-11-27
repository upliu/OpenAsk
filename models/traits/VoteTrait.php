<?php


namespace app\models\traits;

use app\models\VoteLog;
use yii\db\IntegrityException;

trait VoteTrait
{
    // 顶
    public function voteUp()
    {
        // 找到当前用户对记录的顶踩状态，如果已经顶过，则取消顶
        $attrs = ['uuid' => $this->uuid, 'type' => VoteLog::TYPE_UP, 'user_id' => \Yii::$app->user->id];
        $voteLog = VoteLog::findOne($attrs);
        if ($voteLog && $voteLog->delete()) { // 已经顶过，取消顶状态
            static::updateAllCounters(['count_vote_up' => -1], ['id' => $this->id]);
            return ['up' => -1, 'down' => 0];
        } else { // 未顶过，分两种情况，a 踩过 b 未踩过
            // 先删除踩的记录
            $ret = VoteLog::deleteAll(array_merge($attrs, ['type' => VoteLog::TYPE_DOWN]));
            if ($ret > 0) {
                static::updateAllCounters(['count_vote_down' => -$ret], ['id' => $this->id]);
            }
            // 增加顶的记录
            try {
                $voteLog = new VoteLog($attrs);
                if ($voteLog->save(false)) {
                    static::updateAllCounters(['count_vote_up' => 1], ['id' => $this->id]);
                    return ['up' => 1, 'down' => -$ret];
                }
            } catch (IntegrityException $e) { // 并发插入的话可能 MySQL 唯一索引报错导致抛出异常
                return ['up' => 0, 'down' => -$ret];
            }
        }
    }

    // 踩
    public function voteDown()
    {
        $attrs = ['uuid' => $this->uuid, 'type' => VoteLog::TYPE_DOWN, 'user_id' => \Yii::$app->user->id];
        $voteLog = VoteLog::findOne($attrs);
        if ($voteLog && $voteLog->delete()) {
            static::updateAllCounters(['count_vote_down' => -1], ['id' => $this->id]);
            return ['up' => 0, 'down' => -1];
        } else {
            $ret = VoteLog::deleteAll(array_merge($attrs, ['type' => VoteLog::TYPE_UP]));
            if ($ret > 0) {
                static::updateAllCounters(['count_vote_up' => -$ret], ['id' => $this->id]);
            }
            try {
                $voteLog = new VoteLog($attrs);
                if ($voteLog->save(false)) {
                    static::updateAllCounters(['count_vote_down' => 1], ['id' => $this->id]);
                    return ['up' => -$ret, 'down' => 1];
                }
            } catch (IntegrityException $e) { // 并发插入的话可能 MySQL 唯一索引报错导致抛出异常
                return ['up' => -$ret, 'down' => 0];
            }
        }
    }

    public function getVoteLog()
    {
        return $this->hasOne(VoteLog::className(), ['uuid' => 'uuid'])->andWhere(['user_id' => \Yii::$app->user->id]);
    }

    public function getIsVotedUp()
    {
        return !\Yii::$app->user->isGuest
            && $this->voteLog
            && $this->voteLog->type == VoteLog::TYPE_UP;
    }

    public function getIsVotedDown()
    {
        return !\Yii::$app->user->isGuest
            && $this->voteLog
            && $this->voteLog->type == VoteLog::TYPE_DOWN;
    }
}