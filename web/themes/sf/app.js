var OpenAsk = {
    post: function (url, data) {
        if (typeof url !== 'string') {
            data = url;
            url = window.location.href;
        }
        var csrfParam = $('meta[name="csrf-param"]').attr("content");
        var csrfToken = $('meta[name="csrf-token"]').attr("content");
        data[csrfParam] = csrfToken;
        return $.post(url, data);
    }
}

function commentBox()
{
    console.log('commentBox...')
}
