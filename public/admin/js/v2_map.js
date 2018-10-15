 $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
    var images = {};
    function showphotos(){
        var photos = {
                "title": "", //相册标题
                "id": 123, //相册id
                "start": 0, //初始显示的图片序号，默认0
                "data": [   //相册包含的图片，数组格式
                ]
        };
        $.each(images,function(i,o){
            photos.data.push({               
                    "alt": o.title,
                    "pid": i, //图片id
                    "src": "./uploads/"+o.path, //原图地址
                    "thumb": "" //缩略图地址
            })
        })
        layer.photos({
            photos: photos
            ,anim: 5
        })
    }     
    function detailWarning(id){
        var area = ['700px', '488px'];
        var btn = ['关闭'];
        dialogSizeTip('{{u("admin/alarm/detail")}}&id='+id,'查看告警信息', area, btn);
    }
    function resultWarning(id){
        var area = ['700px', '522px'];
        var btn = ['关闭'];
        dialogSizeTip('{{u("admin/order/todo")}}&id='+id,'工单处理信息', area, btn);
    }

    function showhide(obj){
        var _this = $("."+obj);
        if(_this.hasClass('anchorBL')){
            _this.removeClass("anchorBL");
        }else{
             _this.addClass("anchorBL");
        }
    }