document.write('<script language=javascript src="plugins/layui/layui.all.js"></script>');
//document.write('<link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">');

//修改为点击后，需要确定的提示
//callback为字符串 传入reload或不传入->刷新  传入url->跳转
function operateTip(type, callback, time, area) {
    if (!time) {
        time = 3000;
    }
    var options = {
        btn: ['确定'],
        title: '提示信息',
        time: time,
    };
    if(!area){
        // options.area = area ;
        options.area = ['400px', '200px'];
    }

    if (type == 'success') {
        options.message = '操作成功！';
    } else if (type == 'failed') {
        options.message = '操作失败！';
    }

    var option = {
        btn: options.btn,
        area: options.area,
        title: options.title,
        btnAlign : 'c' ,//按钮居中

        //右上角关闭按钮的回调
        cancel: function(){
            if(callback == 'reload' || callback==''||callback== undefined){
                return setTimeout(function(){window.parent.location.reload()},100);
            }else{
                return setTimeout(function(){window.parent.location.href = callback},100);
            }
        }
    };
    layer.confirm('<div style="width:80%;position: absolute;top: 50%;left: 50%;\
            -webkit-transform: translate(-50%, -50%);\
            -moz-transform: translate(-50%, -50%);\
            -ms-transform: translate(-50%, -50%);\
            -o-transform: translate(-50%, -50%);\
            transform: translate(-50%, -50%);"><span style="font-size:16px;">' + options.message + '</span></div>', option, function () {
        layer.closeAll()
        if(callback == 'reload' || callback==''||callback== undefined){
            return setTimeout(function(){window.parent.location.reload()},100);
        }else{
            return setTimeout(function(){window.parent.location.href = callback},100);
        }
    }, options.fun2);
}

//原本的operateTip
function showTip(type, callback, time, area) {
    if (!time) {
        time = 3000;
    }
    if (!area) {
        area = ['300px', '150px'];
    }
    var options = {area: area, time: time};
    if (type == 'success') {
        layer.msg('<i class="icon-check" style="font-size:16px;color:#1E9FFF;"></i>&nbsp;&nbsp;<span style="font-size:16px;line-height:120px">操作成功！</span>', options, callback);
    } else if (type == 'failed') {
        layer.msg('<span class="" style="font-size:16px;color:#FF0000;">X</span>&nbsp;&nbsp;<span style="font-size:16px;line-height:120px">操作失败！</span>', options, callback);
    }
}


//修改为点击后，需要确定的提示
//callback为字符串 不传入->点击确定后无操作 传入reload->刷新  传入url->跳转
function messageTip(message, callback, time, area) {
    if (!time) {
        time = 3000;
    }
    var options = {
        btn: ['确定'],
        title: '提示信息',
        time: time,
        message:message
    };
    if(!area){
        // options.area = area ;
        options.area = ['400px', '200px'];
    }

    var option = {
        message:options.message,
        btn: options.btn,
        area: options.area,
        title: options.title,
        btnAlign : 'c' ,//按钮居中

        //右上角关闭按钮的回调
        cancel:function(){
            if(callback == ''|| callback== undefined){
                return;
            }else if(callback == 'reload' ){
                return setTimeout(function(){window.parent.location.reload()},100);
            }else{
                return setTimeout(function(){window.parent.location.href = callback},100);
            }
        }
    };
    layer.confirm('<div style="width:80%;position: absolute;top: 50%;left: 50%;\
            -webkit-transform: translate(-50%, -50%);\
            -moz-transform: translate(-50%, -50%);\
            -ms-transform: translate(-50%, -50%);\
            -o-transform: translate(-50%, -50%);\
            transform: translate(-50%, -50%);"><span style="font-size:16px;">' + options.message + '</span></div>', option, function () {
        layer.closeAll()
        if(callback == ''|| callback== undefined){
            return;
        }else if(callback == 'reload' ){
            return setTimeout(function(){window.parent.location.reload()},100);
        }else{
            return setTimeout(function(){window.parent.location.href = callback},100);
        }
    }, options.fun2);


}
//
// function messageTip(message, callback, time, area) {
//     if (!time) {
//         time = 3000;
//     }
//     if (!area) {
//         area = ['300px', '150px'];
//     }
//     var options = {area: area, time: time};
//     layer.msg('<div style="width:80%;position: absolute;top: 50%;left: 50%;\
//             -webkit-transform: translate(-50%, -50%);\
//             -moz-transform: translate(-50%, -50%);\
//             -ms-transform: translate(-50%, -50%);\
//             -o-transform: translate(-50%, -50%);\
//             transform: translate(-50%, -50%);"><span style="font-size:16px;">' + message + '</span></div>', options, callback);
// }

function confirmTip(options) {
    if (!options) {
        options = {};
    }
    if (!options.message) {
        options.message = '确认？';
    }
    if (!options.btn) {
        options.btn = ['确定', '取消'];
    }
    if (!options.title) {
        options.title = '信息';
    }
    if (!options.area) {
        options.area = ['400px', '200px'];
    }
    var option = {
        btn: options.btn,
        area: options.area,
        title: options.title,
        btnAlign : 'c' ,//按钮居中
    };
    layer.confirm('<div style="width:80%;position: absolute;top: 50%;left: 50%;\
            -webkit-transform: translate(-50%, -50%);\
            -moz-transform: translate(-50%, -50%);\
            -ms-transform: translate(-50%, -50%);\
            -o-transform: translate(-50%, -50%);\
            transform: translate(-50%, -50%);"><span style="font-size:16px;">' + options.message + '</span></div>', option, options.fun1, options.fun2);
}