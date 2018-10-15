var tpl = {};
var dataForm = {picList: []};
$filePicker = $('.picPicker'); // 上传按钮

var picuploader, fileuploader;// Web Uploader实例
var ajax = Tool.http();
bindPicUploader();

//解决tab不显示时无法计算按钮大小问题
function bindPicUploader() {

    var inputname;
    ratio = window.devicePixelRatio || 1,// 优化retina, 在retina下这个值是2
        thumbnailWidth = 150 * ratio,// 缩略图大小
        thumbnailHeight = 150 * ratio;
    if ($filePicker.data['picuploader'] != null) return;

    $('.uploader-list').each(function () {
        var $settings = $(this).closest('.uploader-setting');
        var idInputName = $settings.data('idInputName') || 'imgs' ;

        $(this).find(':hidden').attr('name', idInputName + '[]');
    })

    $filePicker.each(function () {
        var images = [];

        var $settings = $(this).closest('.uploader-setting');
        var $upimgmax = $settings.data('upimgmax') || window.$upimgmax || 4 ;
        var hashInputName = $settings.data('hashInputName') || 'productimage' ;
        var idInputName = $settings.data('idInputName') || 'imgs' ;
        var picuploader = WebUploader.create({
            auto: true,// 选完文件后，是否自动上传。
            swf: '/public/plugins/webuploader/Uploader.swf',
            server: "index.php?_url=admin/gallery/upload&_format=json",// 文件接收服务端。
            pick: {id: $(this)[0], multiple: false},
            ileNumLimit: $upimgmax, //最大上传数
            resize: false, // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            accept: {
                title: 'Images',
                extensions: 'gif,jpg,jpeg,bmp,png',
                mimeTypes: 'image/*'
            }
        });
        $(this).data('picuploader',picuploader)
        var $list = $( $(this).next() );
        images = $list.data('images') || [];
        // 当有文件添加进来的时候
        picuploader.on('fileQueued', function (file) {
            var $li = $(
                '<div id="' + file.id + '"  class="file-item thumbnail">\
                    <img src="' + file.src + '"><a href="javascript:void(0)" class="delbtn">\
                    <i class="fa fa-trash-o"></i></a>\
                    <div class="info">' + file.name + '</div>\
                    <input name="'+ hashInputName +'[]" value="' + file.hash + '" type="hidden" >\
                    </div>'
                ),
                $img = $li.find('img');
            $list.append($li);

            // 创建缩略图
            picuploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr('src', src);
            }, thumbnailWidth, thumbnailHeight);


            if ($.inArray(file.name, images) != -1 && $('.file-item',$list).length < ($upimgmax + 1)) {
                parent.layer.alert("已经存在同名文件!", function (index) {
                    picuploader.removeFile(file, true);
                    $('.file-item' ,$list).last().remove();
                    parent.layer.close(index);
                });
                images.push(file.name);
                images.splice($.inArray(file.name, images), 1);
            } else {

                images.push(file.name);
            }
            $list.data('images' , images );
            //限制图片上传
            var uploadfilesNum = picuploader.getStats().queueNum; //  共选中几个图片
            if ($('.file-item' , $list).length >= $upimgmax) {
                if ($('.file-item' , $list).length >= ($upimgmax + 1)) {
                    // 中断 取消 大于  5张图片的对象
                    picuploader.removeFile(file, true);
                    $('.file-item' , $list).last().remove();
                    parent.layer.alert("图片最多不可超过" + $upimgmax + "张");
                    images.splice($.inArray(file.name, images), 1);
                }
            } else {
                $filePicker.show();
            }


        });
        // 文件上传过程中创建进度条实时显示。
        picuploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress span');
            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<p class="progress"><span></span></p>' , $list ).appendTo($li).find('span');
            }
            $percent.css('width', percentage * 100 + '%');
        });
        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        picuploader.on('uploadSuccess', function (file, response) {
            $('#' + file.id).addClass('upload-state-done');

            if (response.status == 'ok') {
                $list.append('<input type="hidden" value="">');
                $('#' + file.id).find(".delbtn").attr("onclick", "deleteItem(this,'" + file.id + "','" + response.data.file.imgid + "',event)");
                $('#' + file.id).append('<input type="hidden" value="' + response.data.file.imgid + '" name="'+ idInputName +'[]">')
                // var $li = $('#' + file.id),
                // $img = $li.find('img'),
                // $fileUrl = response.data[0].url, // 图片上传地址
                // $filename = file.name, // 上传文件名称
                // $filesize = (file.size / 1024).toFixed(2); // 上传文件尺寸大小 保留2位
                // $li.addClass('upload-state-done');

                // console.log(response);
                // console.log('图片地址:' + $fileUrl);
                // $img.attr('src', $fileUrl);

            } else {
                var $li = $('#' + file.id),
                    $error = $li.find('div.error');

                // 避免重复创建
                if (!$error.length) {
                    $error = $('<div class="error"></div>' , $list).appendTo($li);

                }
                $error.text('上传失败');
            }
        });


        // 文件上传失败，显示上传出错。
        picuploader.on('uploadError', function (file, response) {
            var $li = $('#' + file.id),
                $error = $li.find('div.error');

            // 避免重复创建
            if (!$error.length) {
                $error = $('<div class="error"></div>' , $list).appendTo($li);
            }
            $('#' + file.id).find(".delbtn").attr("onclick", "deleteItem(this, '" + file.id + "',false,event)");
            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        picuploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress').remove();
        });
        picuploader.on('error', function (handler) {
            if (handler == "Q_EXCEED_NUM_LIMIT") {
                layer.msg("最多只能上传 " + $upimgmax + "张图片");
            }
        });
        // 所有文件上传成功后调用
        picuploader.on('uploadFinished', function () {
            //清空队列
            picuploader.reset();
        });

    })
}

function deleteItem( _this , v, id, event) {
    var $list = $(_this).closest('.uploader-list') ;
    var $imgbox = $list.find("#" + v);
    $imgbox.remove();
    var images =  $list.data('images') ;
    images = images || [];
    images.splice($.inArray($imgbox.find(".info").html(), images), 1);
    $list.data('images' , images );
    ajax.post("index.php?_url=admin/gallery/delimg", {id: id}, function (res) {
        if (res.status == "ok") {
            layer.alert("该图片删除成功");
        }
    })
}
