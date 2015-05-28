$(function() {
    var time = "2015-03-19 13:00:00";
    var phone = 'IPHONE6-GRAY_GRAY';
    ~ function sched() {
        if (Date.now() > new Date(time)) {
            var src = $Qiang.AjaxUrl.authCode + "?tmp=" + new Date().getTime();
            var authCode = $('<img src="' + src + '">');
            var authInput = $('<input type="text">');
            $('body').append(authCode)
            $('body').append(authInput);
            authInput.focus().keyup(function(e) {
                if ($(this).val().length == 4) {
                    submit();
                }
            });

            function submit() {
                var code = authInput.val();
                var data = {
                    tmp: new Date().getTime(),
                    colorStr: phone,
                    authCodeStr: code
                };
                var url_para = "?" + T.url.jsonToQuery(data);
                T.ajax.request($Qiang.AjaxUrl.buy + url_para, {
                    async: true,
                    onsuccess: function(xhr, responseText) {
                        var parseString = T.json.parse(responseText);
                        alert(responseText)
                        if (parseString.status > 0) {} else {}
                    }
                })
            }
        } else {
            setTimeout(sched, 50);
        }
    }();
});
