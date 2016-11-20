$(document).on('beforeSubmit', '.form-comment', function () {
    OpenAsk.post('/comment/create', $(this).serialize())
        .done(function () {
            // @todo 评论成功，更新 DOM 显示新评论内容
            console.trace('评论成功')
        })
    return false
})
