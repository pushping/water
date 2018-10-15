//引用tip.js
new_element=document.createElement("script");
new_element.setAttribute("type","text/javascript");
new_element.setAttribute("src","tip.js");// 在这里引入了a.js
// document.body.appendChild(new_element);

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

function showDialog(title, options) {
    if (!options.area) {
        options.area = ['700px', '450px'];
    }
    var _opt = options;
    if (title) _opt.title = title;
    if (options.iframe) {
        options.type = 2;
        options.content = options.iframe.url;
    }

    return layer.open({
      type: 2,
      area: options.area,
      fixed: false, //不固定
      maxmin: true,
      content: options.iframe.url
    });
    // if (location.href != top.location.href) {
    //     return top.layer.open(_opt);
    // } else {
    //     return layer.open(_opt);
    // }
}

function showBottomTip(message, type, topic) {
    if (location.href != top.location.href) {
        top.showBottomTip(message);
        return;
    }
    if (!topic) topic = '';
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "progressBar": false,
        "positionClass": "toast-bottom-right",
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    switch (type) {
        case 'error':
            toastr.error(message, topic);
            break;
        case 'warning':
            toastr.warning(message, topic);
            break;
        default :
            toastr.success(message, topic);
            break;
    }
}

function ajaxDeleteData(url, params, succCall) {
    var cindex = top.layer.confirm('数据删除将无法恢复，您确认要删除？', {
        btn: ['确认', '取消'], //按钮
        area: '500px'
    }, function () {
        top.layer.close(cindex);
        if (params == undefined || params == null){
            params = {};
            type="Delete"; 
        }else{
            type="POST"; 
        } 
        var index = layer.load(0, {shade: [0.3, '#000']});
        $.ajax(url, {
            type: type,
            data: params,
            complete: function (data) {
                layer.close(index);
                var resp=jQuery.parseJSON(data.responseText);
                //console.log(data);
                if(resp) {
                    //console.log(resp);
                    //console.log(resp.status);
                    if (resp.status == 'ok') {
                        // top.showBottomTip('数据已删除');
                        messageTip('数据已删除');
                        if(succCall){
                            succCall(resp);
                        }else{
                            setTimeout("window.location.reload()",1000);
                        }
                    }
                    else if(resp.status == 'error')
                    {
                        layer.msg("删除失败，原因："+resp.message);
                    }
                    return;
                }
                layer.msg('网络错误或服务器无响应,请重试');
            }
        });
    }, function () {

    });
}

function repUrl(url, params) {
    if (typeof(params) != 'object') return url;
    for (var k in params) {
        url = url.replace('#' + k + '#', encodeURI(params[k]));
    }
    return url;
}

/**
 * 时间戳格式化函数
 * @param  {string} format    格式
 * @param  {int}    timestamp 要格式化的时间 默认为当前时间
 * @return {string}           格式化的时间字符串
 */
function date(format, timestamp) {
    var a, jsdate = ((timestamp) ? new Date(timestamp * 1000) : new Date());
    var pad = function (n, c) {
        if ((n = n + "").length < c) {
            return new Array(++c - n.length).join("0") + n;
        } else {
            return n;
        }
    };
    var txt_weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var txt_ordin = {1: "st", 2: "nd", 3: "rd", 21: "st", 22: "nd", 23: "rd", 31: "st"};
    var txt_months = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var f = {
        // Day
        d: function () {
            return pad(f.j(), 2)
        },
        D: function () {
            return f.l().substr(0, 3)
        },
        j: function () {
            return jsdate.getDate()
        },
        l: function () {
            return txt_weekdays[f.w()]
        },
        N: function () {
            return f.w() + 1
        },
        S: function () {
            return txt_ordin[f.j()] ? txt_ordin[f.j()] : 'th'
        },
        w: function () {
            return jsdate.getDay()
        },
        z: function () {
            return (jsdate - new Date(jsdate.getFullYear() + "/1/1")) / 864e5 >> 0
        },

        // Week
        W: function () {
            var a = f.z(), b = 364 + f.L() - a;
            var nd2, nd = (new Date(jsdate.getFullYear() + "/1/1").getDay() || 7) - 1;
            if (b <= 2 && ((jsdate.getDay() || 7) - 1) <= 2 - b) {
                return 1;
            } else {
                if (a <= 2 && nd >= 4 && a >= (6 - nd)) {
                    nd2 = new Date(jsdate.getFullYear() - 1 + "/12/31");
                    return date("W", Math.round(nd2.getTime() / 1000));
                } else {
                    return (1 + (nd <= 3 ? ((a + nd) / 7) : (a - (7 - nd)) / 7) >> 0);
                }
            }
        },

        // Month
        F: function () {
            return txt_months[f.n()]
        },
        m: function () {
            return pad(f.n(), 2)
        },
        M: function () {
            return f.F().substr(0, 3)
        },
        n: function () {
            return jsdate.getMonth() + 1
        },
        t: function () {
            var n;
            if ((n = jsdate.getMonth() + 1) == 2) {
                return 28 + f.L();
            } else {
                if (n & 1 && n < 8 || !(n & 1) && n > 7) {
                    return 31;
                } else {
                    return 30;
                }
            }
        },

        // Year
        L: function () {
            var y = f.Y();
            return (!(y & 3) && (y % 1e2 || !(y % 4e2))) ? 1 : 0
        },
        //o not supported yet
        Y: function () {
            return jsdate.getFullYear()
        },
        y: function () {
            return (jsdate.getFullYear() + "").slice(2)
        },

        // Time
        a: function () {
            return jsdate.getHours() > 11 ? "pm" : "am"
        },
        A: function () {
            return f.a().toUpperCase()
        },
        B: function () {
            // peter paul koch:
            var off = (jsdate.getTimezoneOffset() + 60) * 60;
            var theSeconds = (jsdate.getHours() * 3600) + (jsdate.getMinutes() * 60) + jsdate.getSeconds() + off;
            var beat = Math.floor(theSeconds / 86.4);
            if (beat > 1000) beat -= 1000;
            if (beat < 0) beat += 1000;
            if ((String(beat)).length == 1) beat = "00" + beat;
            if ((String(beat)).length == 2) beat = "0" + beat;
            return beat;
        },
        g: function () {
            return jsdate.getHours() % 12 || 12
        },
        G: function () {
            return jsdate.getHours()
        },
        h: function () {
            return pad(f.g(), 2)
        },
        H: function () {
            return pad(jsdate.getHours(), 2)
        },
        i: function () {
            return pad(jsdate.getMinutes(), 2)
        },
        s: function () {
            return pad(jsdate.getSeconds(), 2)
        },
        //u not supported yet

        // Timezone
        //e not supported yet
        //I not supported yet
        O: function () {
            var t = pad(Math.abs(jsdate.getTimezoneOffset() / 60 * 100), 4);
            if (jsdate.getTimezoneOffset() > 0) t = "-" + t; else t = "+" + t;
            return t;
        },
        P: function () {
            var O = f.O();
            return (O.substr(0, 3) + ":" + O.substr(3, 2))
        },
        //T not supported yet
        //Z not supported yet

        // Full Date/Time
        c: function () {
            return f.Y() + "-" + f.m() + "-" + f.d() + "T" + f.h() + ":" + f.i() + ":" + f.s() + f.P()
        },
        //r not supported yet
        U: function () {
            return Math.round(jsdate.getTime() / 1000)
        }
    };

    return format.replace(/[\\]?([a-zA-Z])/g, function (t, s) {
        if (t != s) {
            // escaped
            ret = s;
        } else if (f[s]) {
            // a date function exists
            ret = f[s]();
        } else {
            // nothing special
            ret = s;
        }
        return ret;
    });
}

$(document).ready(function () {
    var $search = window.location.search;
    var $arr = $search.split('/');
    var $addr = $arr[1];
    $(".nav-list>li").each(function (i, o) {
        var ul = $(o).find("ul");
        var tarleng = ul.length;
        if (tarleng >= 1) {
            ul.find('li').each(function (li, lo) {
                var $local = $(lo).find('a').attr('href');
                var $href = $local.split('/');
                var $local = $href[1];
                if ($local == $addr) {
                    $(o).attr('class', 'active open').siblings().removeAttr('class');
                    $(lo).attr('class', 'active').siblings().removeAttr('class');
                }
            })
        } else {
            var $local = $(o).find('a').attr('href');
            if ($local == $addr) {
                $(o).attr('class', 'active').siblings().removeAttr('class');
            }
        }
    })

});