$(window).on("load resize", function () {
    var h = window.innerHeight || document.body.clientHeight || document.documentElement.clientHeight;
    $("#allmap").css("height", h);
});
$('.easy-pie-chart').each(function () {
    $(this).easyPieChart({
        barColor: $(this).data('color'),
        trackColor: '#EEEEEE',
        scaleColor: false,
        lineWidth: 8,
        lineCap:'circle',
        animate: 1000,
        size: 60
    }).css({'color': $(this).data('color'), 'font-size': 14});
})
//地图设备是否全选 
var lemp = 0;
var length = $('.group_checkbox .checkbox').length;
var ids = ['1', '2', '3', '5'];
var data_list;

var ajax = Tool.http();
/**
 * 总控设备地址地图位置
 */
var map_dev_list = new Vue({
    delimiters: ['${', '}'],
    el: '#map_dev_search',
    data: {
        data_list: [],
        data_status: [],
        status: '',
        device_server_id: '',
        ids: ['1', '2', '3', '5'],

        map : null,
        device_type: '',
        device_id: '',
        area_id:'',
        deviceData:'',
        area_html:'',
    },
    created:function() {
    },
    mounted:function() {
        //地图右侧导航
        $('.devices').on('click','li',function(){
            $(this).addClass('active').siblings().removeClass('active');
        })

        this.inited();
    },  
    methods: {
        //地图初始化方法
        inited:function()
        {   
            var _this = this;

            this.get_area(function ( o ) {
                _this.init = o.name || 0;
                _this.area_id = o.id ;
                _this.get_DeviceData();
                _this.get_OrderData();
                _this.get_AlaramData();
                //_this.get_all_map();
                // ajax.get("index.php?_url=admin/area/buildingImg&area_id="+ _this.area_id,function(res){
                
                //     if(res.status=="ok"){
                //         var e =res.message[0].split(','); 
                //         _this.init =[parseFloat(e[0]),parseFloat(e[1])] ;
                //     }
                // })

            })
        },
        //根据id查询所有的点
        get_deviceid_map:function(device_id) {
            var status = [];
            if (this.status == '') {
                status = ids
            } else {
                status = [this.status]
            }
            if (!device_id) {
                ajax.post("index.php?_url=admin/index/get_dev_mappoint", {
                    status: status,
                    device_type: device_type
                }, function (res) {
                    if (res.status == 'ok') {
                        map_dev_list.data_list = res.data;
                        map_dev_list.data_status = res.dictionary;
                    }
                })
            } else {
                this.device_id = device_id;
                this.get_all_map();
            }
        },
        get_all_map:function() {
            var status =[];
            this.init = this.init || 0;
            var device_id = this.device_id
            
            if(this.status==''){status = ids}else{status = [this.status]}
            ajax.post("index.php?_url=admin/index/get_dev_mappoint",{
                status:status,
                device_type:this.device_type,
                device_server_id:this.device_server_id,
                area_id:this.area_id
            },function(res){ 
                    if(res.status=='ok'){
                        //当区域类型和设备id不存在时
                        map_dev_list.type_map_list = res.type_map_list                            
                    }
                    map_dev_list.data_list = res.data;
                    map_dev_list.data_status = res.dictionary;

                   
                    if(res.data.length>0){
                        var state = res.state;
                        var data = [];

                        //建筑数据集合
                        var building_array =[];
                        var building_ids =[];
                        var building_image = [];

                        //遍历组合坐标点
                        $.each(res.data,function(i,o){  
                            if(!o.building_area_id){
                                var  html = '<div class="col-sm-12 map_content space0">\
                                <input type="hidden" name="device_id" value="'+o.did+'">\
                                <div class="map_content_left">\
                                    <div class="label map_label">资产编号:</div><div class="map_title">'+o.device_server_id+'</div>\
                                    <div class="map_addr"><i class="fa fa-map-marker"></i>'+o.device_install_address+'</div>\
                                </div>\
                                <div class="map_content_right map_'+state[o.status][0]['css']+'">'+state[o.status][0]['title']+'</div></div>';
                                var image = '';
                                if(o.status==2){
                                    image = './admin/img/'+state['2'][0]['image'];
                                }else{
                                    image = './admin/img/'+o.map_img;
                                }
                                var latitude_longitude = o.latitude_longitude.split(",");
                                data.push([latitude_longitude[0],latitude_longitude[1],html,image,o.did]); 
                            }else{
                                var  image = './admin/img/map_hose.png';
                                var  i= $.inArray(o.building_area_id,building_ids); 

                                if(i==-1){
                                    building_ids.push(o.building_area_id);
                                }

                                i = $.inArray(o.building_area_id,building_ids);
                                var latitude_longitude = o.building_point.split(",");
                                
                                building_image[i]= [];
                                var building_device_type = [];
                                
                                
                                if($.inArray(o.device_type,building_device_type)==-1){
                                    building_image[i].push([o.device_type,o.image,o.building_area_id,o.device_type_name]);
                                    building_device_type.push(o.device_type);
                                }
                                
                                building_array[i] = [latitude_longitude[0],latitude_longitude[1],'',image,o.building_area_id,[o.device_type,o.building_area_id]];
                            }

                            //遍历建筑物下的设备
                            $.each(building_image,function(i,o){
                                var html = "<div class='infowindows'>";
                                $.each(o,function(k,v){
                                    html += "<a  href=index.php?_url=admin/floordesign/indoor&id="+v[2]+"&device_type="+v[0]+"'><div class='block'><img src='./admin/img/"+v[1]+"' /><div class='label map_label'>"+v[3]+"</div></div></a>";
                                })
                                html += "</div>";
                                building_array[i][2] = html;
                            }) 
                        })
                       
                        this.data_info  = building_array.length>0?data.concat(building_array):data;

                        $.each(this.data_info,function(i,o){
                            if(o[4]==map_dev_list.building_area_id || o[4]==device_id){
                                map_dev_list.init = i;
                            }else{
                                map_dev_list.init = 0;
                            }
                        })

                        map = Tool.map('allmap',false,'click');
                        map.init(this.data_info,map_dev_list.init);
                    }else{
                        if(map_dev_list.init){
                            map  = Tool.map('allmap',[[map_dev_list.init]],'click');
                            map.init();
                        }else{
                            var map = new BMap.Map("allmap");    // 创建Map实例
                            map.centerAndZoom(new BMap.Point(116.333752,40.008645), 15);  // 初始化地图
                        }
                    }
            })
        },

         get_area:function( callback ) {
            var listData = {};
            var str = '<option value="">请选择区域</option>';
            var _this = this;
            var url = "index.php?_url=admin/area/getData";
            ajax.get(url, function (res) {
                var area_html = _this.lists(res);
                _this.area_id = res[0]['id'];
                //选择区域
                $("#input-group-addon").html(str+area_html).change(function () {
                    var area_id = $(this).val();
                    if(area_id){
                        $("#center_box").css("display","block")
                    }else{
                        $("#center_box").css("display","none")
                    }
                    _this.area_id = area_id;
                    ajax.get("index.php?_url=admin/area/buildingImg&area_id="+area_id,function(res){
                        var uhtml = "";
                       
                        if(res.status=="ok"){
                            var arr = Object.keys(res.message);
                            if(arr.length>0){
                                $.each(res.message,function(i,o){
                                    var $image = o.image==null?"admin/img/nophoto.png":"uploads/"+o.image;
                                    uhtml += '<li><a href="'+o.url+'"><div class="floor-box-inner" style="background-image: url('+ $image+ ')"><img style="display: none;" src="'+$image+'" alt=""><div class="floor-box-bar">'+o.title+'</div></div></a></li>';
                                 })                                
                            }
                        }
                        $("#center_box ul").html(uhtml)
                    })
                //    ajax.get("index.php?_url=admin/device/getlatitude_longitude&area_id="+area_id,function(res){
                //        if(res.status=="ok"){
                 //           var e =res.message[0].split(','); 
                 //           _this.init =[parseFloat(e[0]),parseFloat(e[1])] ;
                 //       }
                 //   })
                 //   _this.get_all_map();
                    _this.get_DeviceData();
                    _this.get_OrderData();
                    _this.get_AlaramData();
                })

                //未选择区域
                callback && callback(res[0]);
            })
        },
        lists:function($lists){
            var _this = this;
            $html = '';
            $.each($lists,function($i,$o){
                var num = parseInt($o['deepth']);
                var space = new Array(num).join("&nbsp;&nbsp;&nbsp;&nbsp;");
                $pre =$o['deepth'] != "1"?"|—":" ";
                $html += "<option value=\""+$o['id']+"\">"+space+$pre+$o['name']+"</option>";
                if($o['childs']!==undefined && ($o['deepth']<3)){
                    $html += _this.lists($o['childs']);
                }
            })
           return $html;
        },
        //获取左侧设备数据
        get_DeviceData:function()
        {
            var url = "index.php?_url=api/deviceapi2/getDeviceDataByArea_id";
            ajax.post(url,{area_id:this.area_id,},function(res){
                if(res.status=="ok")
                {
                   var normal = res.data.count.normal||0;
                    var alarm = res.data.count.alarm||0;
                    var outline = res.data.count.outline||0;
                    var init = res.data.count.init||0;
                    var count = res.data.count.count||0;

                   $("#normal").html(normal);
                   $("#alarm").html(alarm);
                   $("#outline").html(outline);
                   $("#init").html(init);
                   $("#deviceCount").html(count);
                    $.each(res.data.kindType,function(i,o){
                        $("#"+i).html(o);
                    })
                }
            })
        },
        //工单数据
        get_OrderData:function(){
            var url = "index.php?_url=api/deviceapi2/getOrderDataByArea_id";
            ajax.post(url,{area_id:this.area_id,},function(res){
                if(res.status=="ok")
                {
                    $.each(res.message,function(i,o){
                        $("#"+i).html(o[0]['count']);
                        var countall = res.message.countall[0]['count'];
                        var progress = Math.round(o[0]['count'] / countall * 10000) / 100.00 + "%";
                        if(o[0]['count'] ==0){
                            progress = 0+"%";
                        }
                    
                        $("#"+i+"_progress").css("width",progress);
                    })
                }
            })
        },
        //获取告警数据接口
        get_AlaramData:function()
        {
            var url = "index.php?_url=api/deviceapi2/getAlarmDataByArea_id";
            ajax.post(url,{area_id:this.area_id},function(res){
                if(res.status=="ok")
                {   
                    var allcount = res.message.alarmchat['allalarm']['count'];
                   $("#smokeTotal_val").html(allcount);


                    $.each(res.message.alarmchat,function(i,o){
                        var piechat = Math.round(o['count'] / allcount * 100)/ 1;
                        piechat = piechat ||0;
                        $("#"+i+"_pie_val").html(piechat)
                        var $pie = $("#"+i+"_pie").attr('data-percent',piechat).data('easyPieChart')
                        if($pie) $pie.update(piechat);
                    })



                    if(res.message.alarmtop3.length>0){
                        for (let index = 0; index < 3; index++) {
                            var item = res.message.alarmtop3[index];
                            if(res.message.alarmtop3[index]){
                                var piechat1 = Math.round(item['count'] / allcount * 10000)/ 100.00 + "%";
                                $("#top"+index+"_title").html(res.message.alarmtop3[index].device_name)
                                $("#top"+index+"_progress").css("width",piechat1);
                                $("#top"+index+"_value").html(item['count']);
                            }else{
                                $("#top"+index+"_title").closest("li").remove();
                            }
                        }
                    }else{
                        var htmle = '<li class="clearfix ">\
                            <div class="pull-left text-ellipsis"><i class="icon icon-block">1</i><span id="top0_title" ></span>  </div>\
                            <div class="pull-right clearfix" > <div class="pull-left" id="top0_value">0</div><div class="progress"><div id="top0_progress" class="progress-bar-danger progress-bar" style="width: 0%"></div></div></div>\
                        </li>\
                        <li class="clearfix ">\
                            <div class="pull-left text-ellipsis"> <i class="icon icon-block">2</i><span id="top1_title" ></span> </div>\
                            <div class="pull-right clearfix" > <div class="pull-left" id="top1_value">0</div><div class="progress"><div id="top1_progress" class="progress-bar-warning progress-bar" style="width: 0%"></div></div></div></li>\
                        <li class="clearfix">\
                            <div class="pull-left text-ellipsis"><i class="icon icon-block">3</i><span id="top2_title"  ></span></div>\
                            <div class="pull-right clearfix" > <div class="pull-left" id="top2_value">0</div><div class="progress"><div id="top2_progress" class="progress-bar-yellow      progress-bar" style="width: 0%"></div></div></div>\
                        </li>';
                        $(".rae-list").html(htmle);
                    }   
                    

                }
            })


        }
    },
})


$(".wraper_ul li").click(function () {
    var area_id = $('#input-group-addon').val();
    var device_type = $(this).attr('type');
    map_dev_list.ids = ['1', '2', '3', '5'];
    map_dev_list.area_id = area_id;
    ajax.get("index.php?_url=admin/device/getlatitude_longitude&area_id="+ area_id,function(res){
        if(res.status=="ok"){
            var e =res.message[0].split(','); 
            map_dev_list.init =[parseFloat(e[0]),parseFloat(e[1])] ;
        }
    })
    map_dev_list.device_id = '';
    map_dev_list.device_type = device_type;
    map_dev_list.get_all_map();
})
//监测对象 根据设备类型在图上查找设备
var deviceType = $(".devices-count .col-md-6");
deviceType.click(function () {
    deviceType.each(function(i,o){
        $(o).find(".clearfix").removeClass("deviceTypeSelect");
    })
    $(this).find(".clearfix").addClass("deviceTypeSelect");
    var device_type = $(this).find('.font-lg').attr('id');
    var menuid = $(this).find('.font-lg').attr('menuid');
    window.location.href="index.php?_url=admin/device/list&type="+device_type+"&menuid="+menuid;
})







