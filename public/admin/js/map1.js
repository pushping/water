
var ajax = Tool.http();
/**
 * 总控设备地址地图位置
 */
var map_dev_list = new Vue({
    delimiters: ['${', '}'],
    el: '#map_dev',
    data: {
        data_list:[],
        data_status:[],
        area_id:'',
        status:['1','2','3','5'],
        init:0,
        device_type:['100004','100003','100019'],
        data_info:[]
    },
    created: function(){
        //区域类型初始化
        this.inid();
        //设备坐标点初始化
        this.get_all_map();
    },
    methods:{
        inid:function(){
            ajax.get("index.php?_url=admin/area/getArea",function(res){
                var area_html = '<option value="0">请选择管理区域</option>'+map_dev_list.lists(res);
                $("#area_id").append(area_html);
            })
        },
        //获取全部坐标点
        get_all_map:function($device_type){
            this.init = this.init || 0;
            this.device_type = $device_type || this.device_type;
            ajax.post("index.php?_url=admin/index/get_dev_mappoint",{
                status:this.status,
                device_type:this.device_type,
                init:this.init
            },function(res){
                if(res.status=='ok'){   
                    this.data_list = res.data;
                    this.data_status = res.dictionary;
                    //有选择初始区域则换取全中文地址
                    this.init = res.init?res.init:0;
   
                    if(res.data.length>0){
                        var state = res.state;
                        var data = [];
                        $.each(res.data,function(i,o){
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
                            data.push([latitude_longitude[0],latitude_longitude[1],html,image]);
                        })
                        this.data_info =data;
                        map = Tool.map('allmap',false,'click');
                        map.init(this.data_info,this.init);
                    }else{
                        this.data_info =[[this.init]];
                        map  = Tool.map('allmap',this.data_info,'click');
                        map.init();
                    }
                }
            })
        },
        //区域变化
        choosearea:function(area_id){
            this.init = area_id;
            this.get_all_map();
        },
        //区域树状列表
        lists:function($lists){
            $html = '';
            $.each($lists,function($i,$o){
                var num = parseInt($o['deepth']);
                var space = new Array(num).join("&nbsp;&nbsp;&nbsp;&nbsp;");
                $html += "<option value=\""+$o['id']+"\">"+space +$o['name']+"</option>";
                if($o['childs']!==undefined){
                    $html += map_dev_list.lists($o['childs']);
                }
            })
            return $html;
        },
        //设备详情是否展示
        showhide:function(obj){
            var _this = $("."+obj);
            if(_this.hasClass('anchorBL')){
                _this.removeClass("anchorBL");
            }else{
                 _this.addClass("anchorBL");
            }
        }

    },
    mounted:function(){
        $("#dev_list_content").slimScroll({ height: '160px' });
        var _map_list =$(this.$el);
        _map_list.find("li").each(function(i,o){
            if(i>0){
                $(o).click(function(){
                    _map_list.find('.dev_map_point').removeClass('dev_map_point');
                    $(o).addClass("dev_map_point");
                })
            }
        })

    }
})

//展开详情页数
$(".map_dev_list .map_compoent_modal_head .pull-right").click(function(){
    var _this = $(this);
    var head = _this.parent(".map_compoent_modal_head");
    var content = _this.parents(".map_dev_list").find('.content');

    if(head.find(".title").nextAll(".text-overflow").length==0){

        _this.find('i').removeClass("fa-angle-double-right").addClass('fa-angle-double-left');
        content.find(".text-overflow").removeClass('dpnone');
        $(".map_dev_search").css("left","463px");
        head.find(".title").after('<div  class="inline-block text-overflow">\
            <span class="text normal">\
                <span class="text">●</span><span class="text">正常</span>\
            </span></div>\
            <div  class="inline-block text-overflow">\
            <span class="text alarm">\
                <span class="text">●</span><span class="text">告警</span>\
            </span></div>\
            <div  class="inline-block text-overflow">\
            <span class="text outline">\
                <span class="text">●</span><span class="text">失联</span>\
            </span></div>\
            <div  class="inline-block text-overflow">\
            <span class="text redefend">\
                <span class="text">●</span><span class="text">待布防</span>\
            </span></div>'); 
    }else{
        head.find(".text-overflow").remove();
        _this.find('i').removeClass("fa-angle-double-left").addClass('fa-angle-double-right');
        content.find(".text-overflow").addClass('dpnone');
        $(".map_dev_search").css("left","240px");
    }
})

        


