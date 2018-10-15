$(window).on("load resize",function(){
    var h=window.innerHeight||document.body.clientHeight||document.documentElement.clientHeight;
    $("#allmap").css("height",h-60);
});
//地图设备是否全选 
var lemp = 0;
var length = $('.group_checkbox .checkbox').length;
var ids = ['1','2','3','5'];
var data_list;
var ajax = Tool.http();

/**
 * 总控设备地址地图位置
 */
var map_dev_list = new Vue({
    delimiters: ['${', '}'],
    el: '#map_dev_search',
    data: {
        data_list:[],
        data_status:[],
        status:'',
        device_server_id:'',
        ids:['1','2','3','5'],
        init:0,
        device_type:[],
        device_id:'',
        type_map_list:[],
        area_id:'',
        selected:[],
        building_area_id:'',
    },
    created(){
        this.get_all_map();
    },
    methods:{
        get_deviceid_map(device_id,building_area_id){
            var status =[];
            if(this.status==''){status = ids}else{status = [this.status]}
            if(!device_id){
                ajax.post("index.php?_url=admin/index/get_dev_mappoint",{status:status,device_type:this.device_type},function(res){ 
                    if(res.status=='ok'){   
                        map_dev_list.data_list = res.data;
                        map_dev_list.data_status = res.dictionary;
                    }
                })
            }else{
                this.device_id = device_id;
                this.building_area_id =building_area_id;
                
                this.get_all_map('type');
            }
        },
        get_server_map(){
            var status =[];
            if(this.status==''){status = ids}else{status = [this.status]}
            ajax.post("index.php?_url=admin/index/get_dev_mappoint",{
                status:status,
                device_type:this.device_type,
                device_server_id:this.device_server_id
            },function(res){ 
                if(res.status=='ok'){   
                    map_dev_list.data_list = res.data;
                    map_dev_list.data_status = res.dictionary;
                }
            })
        },
        showdetail(device_type){
            if(device_type!=='undefined'){
                var len = $.inArray(device_type,map_dev_list.device_type); 
                if(len!=-1){
                    map_dev_list.device_type.splice(len,1);
                }else{
                    map_dev_list.device_type.push(device_type);
                }
            }
            map_dev_list.get_all_map("type");

        },
        get_all_map(type){
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
                    if(!device_id){
                        if(!type){
                            map_dev_list.type_map_list = res.type_map_list
                        }
                    }else{
                        if(!type){
                            map_dev_list.type_map_list = res.type_map_list                            
                        }
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
                            if( o[4]==map_dev_list.building_area_id || o[4]==device_id){
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
                            map.centerAndZoom(new BMap.Point(116.333752,40.008645), 20);  // 初始化地图
                        }
                    }
                }
            })
        }
    },
    mounted(){
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
        $("#dev_list_content li").each(function(i,o){
            $(o).click(function(e){
                $(e.target).parents('ul').find(".dev_map_point").removeClass('dev_map_point');
                $(this).addClass("dev_map_point");
            })
        })
    },
    filters:{
　　　　　　substr:function(val){
　　　　　　　　return val.length>20?val.substring(0,20)+'...':val;
　　　　　　}
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
            $(".map_dev_search").css("left","513px");
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

    //展开设备搜索窗口
    function map_dev_search(){
        var _this = $('.map_dev_search');
        if(_this.attr('class').indexOf('dpnone')>-1){
            _this.removeClass('dpnone');
        }else{
            _this.addClass('dpnone');
        }
    }


        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });

        $('#all').on('ifClicked' , function(event){
            if(event.target.checked){
                $(this).closest('.group_checkbox').find('.ids').each(function(i,o){
                    $(o).iCheck('uncheck');
                    var id = $(o).find('input').val();
                    var index = ids.indexOf(id);
                    ids.splice(index,1);
                    lemp = 0;
                });
               
            }else {
                $(this).closest('.group_checkbox').find('.ids').each(function (i,o) {
                        var id = $(o).find('input').val();
                        $(o).iCheck('check');
                        ids.push(id)
                        lemp = length
                });
            }
            map_dev_list.ids = ids;
            map_dev_list.init = '';
            
            map_dev_list.get_all_map();
            //getMappoint(ids,'','','');
        });
    
        $('.group_checkbox .ids').on('ifClicked',function(event){
            event.target.checked ? lemp-- : lemp++;
            if(lemp == length){
                $('#all').iCheck('check');

            }else {
                $('#all').iCheck('uncheck');
            }
        });
    

        var listData = {};
        var url = "index.php?_url=admin/area/getData";
        ajax.get(url,function(res){
            var html = "<ul>"+lists(res)+"</ul>";
            $("#jstree1").html(html)
            $("#jstree1").jstree()
    
            $('#jstree1').on('select_node.jstree', function (e, data) {
                var Tree =$("#jstree1");
                var click =$(Tree).find(".jstree-clicked");
                var area_text = $(click).text();
                var area_id = $(click).closest(".jstree-node").attr("data-id");
                var parentid = $(click).closest(".jstree-node").attr("data-parentid");
                fulltext = '';
                getFullName($(Tree),parentid);
                if(fulltext == ''){
                    fulltext = area_text;
                }else{
                    fulltext = fulltext + area_text;
                }
                ajax.get("index.php?_url=admin/device/getlatitude_longitude&area_id="+area_id,function(res){
                    if(res.status=="ok"){
                        var e =res.message[0].split(','); 
                        map_dev_list.init =[parseFloat(e[0]),parseFloat(e[1])] ;
                    }
                })
                map_dev_list.ids =ids;
                
                map_dev_list.area_id = area_id;
                map_dev_list.device_id = '';
                map_dev_list.device_type = [];
                // $(".map_dev_list ul li").each(function(i,o){
                //     $(o).click(function(e){
                //         $(e.target).parents('ul').find(".select").removeClass('select').find(".select_right").remove();
                //         var _this = $(o);
                //         map_dev_list.device_type = _msg.find("input[name=device_type]").val();
                //     })
                // })
                map_dev_list.get_all_map();
                //getMappoint(ids,fulltext,'','');
            });
        })





        function lists($lists){
            $html = '';
            $.each($lists,function($i,$o){
                if($o['childs']!==undefined){
                    $html += "<li data-id="+$o['id']+" data-parentid="+$o['parentid']+">"+$o['name']+"<ul>";
                    $html +=lists($o['childs']);
                    $html +=  "</ul></li>"; 
                }else{
                    $html +="<li data-id="+$o['id']+" data-parentid="+$o['parentid']+" data-jstree='{\"type\":\""+$o['name']+"\"}'>"+$o['name']+"</li>";
                }
               
            })
            return $html;
        }


        //ids
        $('.group_checkbox .ids').on('ifClicked',function(event){
            var _this =event.target; 
            var id = $(_this).val();
            if(_this.checked){
                //取消
                var index = ids.indexOf(id)
                ids.splice(index,1);
            }else{
                //勾选
                ids.push(id);
            }
            //getMappoint(ids,0,'','');
            map_dev_list.ids =ids;
            map_dev_list.init = 0
            map_dev_list.get_all_map();
        });
        var ajax = Tool.http();




