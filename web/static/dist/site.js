/**
 * Created by liu on 6/28/16.
 */
$(function () {
    var $w = $(window);

    $('[data-toggle="tooltip"]').tooltip();

    $w.on('scroll resize lookup', function () {
        // 回到顶部
        if ($w.scrollTop() > 1500) {
            $('.i-back2top').show();
        } else {
            $('.i-back2top').hide();
        }
    });

    $('body').on('click', '.i-2top-btn', function () {
        $w.scrollTop(0);
    })
        .on('click', '.i-modal .i-close', function () {
            $(this).closest('.i-modal-wrap').remove();
        })
        .on('click', '.cmd-follow', function () {
            var $this = $(this);
            var data = {
                slug: $this.data('slug')
            };
            openask.addCsrfParam(data);
            $.post($this.data('api-url'), data, function (resp) {
                $this.closest('span').html(resp.btn);
            }, 'json')
        })
});

var openask = {
    addCsrfParam: function (data) {
        data[$('[name="csrf-param"]').attr('content')] = $('[name="csrf-token"]').attr('content');
    },
    ajaxHandler: function (data, successFunc, errorFunc) {
        if (!data.errors) {
            if (successFunc === undefined) {
                successFunc = function () {
                };
            }
            successFunc(data);
        } else {
            if (errorFunc === undefined) {
                errorFunc = function (errors) {
                    if (typeof errors === 'string') {
                        errors = [errors];
                    }
                    var content = [];
                    $.each(errors, function (k, error) {
                        content = content.concat(error);
                    });
                    openask.tip(content.join('<br>'));
                };
            }
            errorFunc(data.errors);
        }
    },
    tip: function (content) {
        return openask.modal({
            autoClose: 3000,
            title: '提示',
            content: content
        });
    },
    _modal_id: 0,
    modal: function (options) {
        openask._modal_id++;
        options = $.extend({
            autoClose: 0,
            title: '提示标题',
            content: '这是提示内容',
            hasBg: false
        }, options);
        var html = $('#tpl-modal').html();
        $.each(['title', 'content'], function (idx, k) {
            html = html.replace('{%' + k + '%}', options[k]);
        });
        var $modal = $('<div>').html(html)
            .addClass('i-modal-wrap')
            .attr('id', '_modal_id_' + openask._modal_id)
            .appendTo('body');
        var $_modal = $modal.find('.i-modal'),
            w = $_modal.outerWidth(),
            h = $_modal.outerHeight(),
            top = ($(window).height() - h) / 2,
            left = ($(window).outerWidth() - w) / 2;
        $_modal.css({
            top: top > 0 ? top : 0,
            left: left > 0 ? left : 0
        });
        if (options.autoClose > 0) {
            setTimeout(function () {
                $modal.remove();
            }, options.autoClose);
        }
        if (!options.hasBg) {
            $modal.find('.i-modal-bg').remove();
        }
        return $modal;
    },
    post: function (url, data) {
        if (typeof url === 'object') {
            data = url;
            url = window.location.href;
        }
        var csrfParam = $('meta[name="csrf-param"]').attr("content");
        var csrfToken = $('meta[name="csrf-token"]').attr("content");
        data[csrfParam] = csrfToken;
        return $.post(url, data);
    }
};
