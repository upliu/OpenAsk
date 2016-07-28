$(function(){
    var $tip = $('.i-avatar-editor-tip');
    $('.i-avatar-editor').hover(function(){
        $tip.css('opacity', 1);
    }, function(){
        $tip.css('opacity', 0);
    });

    $('#avatar-image').on('change', function (e) {
        e.preventDefault();
        var $iframe = $('<iframe name="ajaxUploadFrame" class="i-hide"></iframe>')
            .attr("name", '_ajaxUploadFrame' + Date.now())
            .appendTo('body');
        var $form = $(this).closest('form');
        $form.attr({
            enctype: 'multipart/form-data',
            target: $iframe.attr('name')
        });
        $form.submit();
        $iframe.load(function () {
            try {
                var text = $iframe.contents().text();
                var json = $.parseJSON(text)
            } catch (e) {
                json = {
                    errors: text
                };
            }
            openask.ajaxHandler(json, function (data) {
                $('.js-avatar').attr('src', data['avatar-image']);
            });
            $iframe.remove();
        });
    });
   
    $('.i-edit-btn, .i-fill-btn, .cmd-save, .cmd-cancel').click(function (e) {
        e.preventDefault();
        var $elem = $(this),
            $wrap = $elem.closest('.i-content'),
            $static = $wrap.find('.i-static-content'),
            $editable = $wrap.find('.i-editable-content');

        if ($elem.is('.i-edit-btn') || $elem.is('.i-fill-btn')) {
            $static.hide();
            $editable.show();
        } else if ($elem.is('.cmd-cancel')) {
            $static.show();
            $editable.hide();
        } else if ($elem.is('.cmd-save')) {
            var $form = $elem.closest('form');
            var data = {};
            $editable.find('input[type="radio"]:checked, input[type="text"], textarea, select').each(function () {
                data[$(this).attr('name')] = $(this).val();
            });
            // data[$('[name="csrf-param"]').attr('content')] = $('[name="csrf-token"]').attr('content');
            openask.addCsrfParam(data);
            $.post($form.attr('action'), data, 'json')
                .done(function (data) {
                    openask.ajaxHandler(data, function () {
                        $static.find(".js-value").text(
                            $editable.find('input[type="text"], textarea, select').val() ||
                            $editable.find('input[type="radio"]:checked').closest('label').text().trim()
                        );
                        $static.show();
                        $editable.hide();
                    });
                });
        }
    });
});
