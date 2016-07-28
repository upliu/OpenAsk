/**
 * Created by liu on 6/28/16.
 */

$(function () {

    var $w = $(window);

    function fold_btn_status() {
        $('.i-visible-expanded.show').each(function () {
            var $item = $(this).closest('.i-feed-item'),
                $content = $item.find('.i-visible-expanded'),
                $meta = $item.find('.i-feed-meta'),
                $author = $item.find('.i-author-info'),
                $fold = $item.find('.i-fold');
            var h = $w.scrollTop() + $w.height();
            if (h > $content.offset().top + 30
                && h < $meta.offset().top + 27 /* 27 is $meta's height */
            ) {
                if (!$fold.is('.i-flying')) {
                    $fold.css('left', $fold.offset().left).addClass('i-flying');
                }
            } else {
                $fold.removeClass('i-flying');
            }

            var h = $w.scrollTop();
            if (h > $author.offset().top - 30
                && h < $meta.offset().top - 110
            ) {
                $item.find('.i-vote').addClass('i-flying').css('left', $item.offset().left);
            } else {
                $item.find('.i-vote').removeClass('i-flying').css('left', '-48px');
            }
        });
    }

    $('body').on('click', '.cmd-expand, .cmd-fold', function () {
        var $item = $(this).closest('.i-feed-item');
        var $summary = $item.find('.i-summary');
        var $expanded = $item.find('.i-visible-expanded');
        var $fold = $item.find('.cmd-fold');
        var $vote_btn = $item.find('.cmd-vote');
        var $vote_up_down = $item.find('.i-vote-up-down');
        if ($(this).is('.cmd-fold')) {
            $expanded.removeClass('show').hide();
            $fold.hide();
            $vote_up_down.hide();
            $summary.show();
            $vote_btn.show();
            $item.find(".i-vote").removeClass('i-flying');
            $fold.removeClass('i-flying');
        } else {
            $summary.hide();
            $vote_btn.hide();
            $expanded.addClass('show').show();
            $fold.show();
            $vote_up_down.show();
        }
        fold_btn_status();
    })
    ;

    $(window).on('scroll resize lookup', fold_btn_status);
});
