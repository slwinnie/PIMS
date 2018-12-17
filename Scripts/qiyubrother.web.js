// 扩展jquery

$.extend({
    // 删除url中某些参数
    // var paramUrl = $("#form1").serialize();
    // var invalidParams = ['__VIEWSTATE', '__VIEWSTATEGENERATOR', '__EVENTVALIDATION'];
    removeUrlParameter: function (paramUrl, invalidParams) {
        for (var j = 0; j < invalidParams.length; j++) {
            var param = invalidParams[j];
            if (paramUrl.indexOf(param) > -1) {
                var obj = {}
                var arr = paramUrl.split("&");
                for (var i = 0; i < arr.length; i++) {
                    arr[i] = arr[i].split("=");
                    obj[arr[i][0]] = arr[i][1];
                };
                delete obj[param];
                paramUrl = JSON.stringify(obj).replace(/[\"\{\}]/g, "").replace(/\:/g, "=").replace(/\,/g, "&");
            };
        }
        return paramUrl;
    },
    // 从window.location.href删除参数并返回新地址
    removeLocationUrlParameter: function (paramName) {
        var loca = window.location;
        var baseUrl = loca.origin + loca.pathname + "?";
        var query = loca.search.substr(1);
        if (query.indexOf(paramName) > -1) {
            var obj = {}
            var arr = query.split("&");
            for (var i = 0; i < arr.length; i++) {
                arr[i] = arr[i].split("=");
                obj[arr[i][0]] = arr[i][1];
            };
            delete obj[paramName];
            var url = baseUrl + JSON.stringify(obj).replace(/[\"\{\}]/g, "").replace(/\:/g, "=").replace(/\,/g, "&");
            return url;
        };
        return window.location.href;
    },

    // 格式化货币
    fmtCurrency: function(currency) {
        return currency.replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
    },

    // 修改Url参数
    getNewUrl: function(oldurl, paramname, pvalue) {
        var reg = new RegExp("(//?|&)" + paramname + "=([^&]*)(&|$)", "gi");
        var t = oldurl.match(reg)[0];
        var retxt = t.substring(0, t.indexOf("=") + 1) + pvalue;
        if (t.charAt(t.length - 1) === '&') retxt += "&";
        return oldurl.replace(reg, retxt);
    },

    // 读取Url参数
    getUrlParam: function (url, name) {
        var pattern = new RegExp("[?&]" + name + "\=([^&]+)", "g");
        var matcher = pattern.exec(url);
        var items = null;
        if (null != matcher) {
            try {
                items = decodeURIComponent(decodeURIComponent(matcher[1]));
            } catch (e) {
                try {
                    items = decodeURIComponent(matcher[1]);
                } catch (e) {
                    items = matcher[1];
                }
            }
        }
        return items;
    },

    getQueryString : function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        var q = window.location.pathname.substr(1).match(reg_rewrite);
        if (r != null)
        {
            return unescape(r[2]);
        }
        else if (q != null)
        {
            return unescape(q[2]);
        }
        else
        {
            return null;
        }
    },

    // 读取Url参数
    getLocationHrefParam: function (name) {
        var pattern = new RegExp("[?&]" + name + "\=([^&]+)", "g");
        var matcher = pattern.exec(window.location.href);
        var items = null;
        if (null != matcher) {
            try {
                items = decodeURIComponent(decodeURIComponent(matcher[1]));
            } catch (e) {
                try {
                    items = decodeURIComponent(matcher[1]);
                } catch (e) {
                    items = matcher[1];
                }
            }
        }
        return items;
    }

});
