/**
 * Created by licl on 2018/3/15.
 */
// document.write('<script language=javascript src="../../public/js/plugins/layer/layer.js"></script>');


//弹出窗口
function layerDialog( content , callback , options ) {

    var ok  = function () { }, cancel = function () { };
    if( typeof callback == 'object'){
        ok = callback.ok ;
        cancel = callback.cancel;
    }

    var _options = $.extend( {} ,  {
        btn: ['保存','取消'],
        title: '提示信息',
        area: ['800px', '550px'],
        type: 2,
        shadeClose: true,
        maxmin: true,
        shade: 0.3,
        content: content, //iframe的url
        success: function (layero, index) {
            layer.iframeAuto(index);
        },
        yes: function (index, layero) {
            var $document = $($(layero).find("iframe")[0].contentWindow.document);
            ok && ok ( $document );
        },
        cancel:  function (index, layero) {
            var $document = $($(layero).find("iframe")[0].contentWindow.document);
            cancel && cancel ( $document );
        }
    } , options );

    return layer.open(_options);
}

//删除弹框 or 确认类型弹框
function confirmTip(content, title, callback, cancel, btn, area) {
    var options = {
        btn: ['确定','取消'],
        title: '提示信息',
        area: ['400px', '200px']
        //time: time,
        //message:message
    };
    //if(options){
    if (btn){
        options.btn = btn;
    }
    if(area){
        options.area = area;
    }
    if(title) {
        options.title = title
    }
    //}

    var option = {
        btn: options.btn,
        area: options.area,
        title: options.title
        //btnAlign : 'c' ,//按钮居中

        //右上角关闭按钮的回调
        //cancel: cancel?cancel:function(){
        //    layer.close();
        //    showTip('', false);
        //}
    };
    layer.confirm(content, option, callback, cancel);
    return false;
}

function dialogTip(content, title, area, btn, callback, cancel, minMax) {
    var options = {
        btn: ['保存','取消'],
        title: '提示信息',
        area: ['700px', '500px']
        //time: time,
        //message:message
    };
    var minMaxflag = true;
    if (btn){
        options.btn = btn;
    }
    if(area){
        options.area = area;
    }
    if(title) {
        options.title = title
    }
    if( minMax != null && !minMax ){
        minMaxflag = minMax;
    }
    layer.open({
        type: 2,
        title: options.title,
        shadeClose: true,
        btn: options.btn,
        maxmin: minMaxflag,
        shade: 0.3,
        area: options.area,
        content: content, //iframe的url
        yes:callback,
        cancel: cancel
    });
}

function dialogSizeTip(content, title, area, btn , callback, cancel) {
    // console.log(btn)
    if (!btn && typeof btn != "undefined" && btn != 0){
    }else{
        btn = ['保存','取消'];
    }
    // btn = btn || ['保存','取消'];
    // console.log(btn)
    var options = {
        btn: ['保存','取消'],
        title: '提示信息',
        area: ['700px', '500px']
        //time: time,
        //message:message
    };
    var minMaxflag = true;
    if (btn){
        options.btn = btn;
    }else{
        options.btn = null;
    }
    if(area){
        options.area = area;
    }
    if(title) {
        options.title = title
    }
    layer.open({
        type: 2,
        title: options.title,
        shadeClose: true,
        btn: options.btn,
        maxmin: false,
        shade: 0.3,
        area: options.area,
        content: content, //iframe的url
        yes:callback,
        cancel: cancel
    });
}

function showTip(msg, flag, callback, time, area) {
    if (!time) {
        time = 1500;
    }
    if (!area) {
        //area = ['300px', '50px'];
    }
    var skin = 'success-tip';
    var message = '<i class="fa fa-check-circle-o green"></i>  操作成功！';
    // console.log('flag',flag,message);
    if((flag != null) && !flag){
        skin = 'failure-tip';

        message = '<i class="fa fa-times-circle-o red"></i>  操作失败！';
        if(msg){
            message = '<i class="fa fa-times-circle-o red"></i>  ' + msg;
        }
        // console.log('flag',flag ,message);
    }else {
        if(msg){
            message = '<i class="fa fa-check-circle-o green"></i>  ' + msg;
        }
    }
    var options = {area: area, time: time, skin: skin};
        layer.msg(message, options, callback);
}

// 不带按钮的弹窗
function showDialog(url,title,area,cancel) {
    var options = {};
    if (!area) {
        options.area = ['600px', '400px'];
    }
    else{
        options.area =area;
    }
    
    if (url) {
        options.type = 2;
        options.content = url;
        options.skin ='layui-layer-demo',
        options.maxmin = true; //开启最大化最小化按钮
    }
    if (cancel){
        options.cancel=function(){
            layer.closeAll();
        };
    }
    
    if (title) options.title = title;
    return layer.open(options);
}

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
function closeIframe() {
    var index = parent.layer.getFrameIndex(window.name);//获取窗口索引
    parent.layer.close(index);
}
function myAjaxDeleteData(url, params,callback) {
    confirmTip("数据删除将无法恢复，您确认要删除！",'删除操作',function(){
        params['_format'] = 'json';
        $.ajax({
            url: url,
            type: 'post',
            dataType: 'JSON',
            data:params,
        })
        .always(function(res) {
            if (res.status == 'ok') {
                showTip(res.message[0],true,callback);
            }else{
                var error_info = "删除失败";
                if(res.status == 'error'){
                    error_info = res.message[0];
                }
                showTip(error_info,false);
            }
        });
        layer.closeAll();
    },function(){
        layer.closeAll();
    })
}