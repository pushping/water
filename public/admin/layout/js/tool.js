/**
 * [Tool 二次封装工具类 echarts图表,ajax]   注意：使用时注意引入其他的第三方插件
 * @type {Object}
 * myecharts  基于jquery.min.js||echarts.min.js
 * ajax 使用了layer弹窗      
 */
var Tool = {
    myecharts:function(obj,config){
        var myecharts = {};
        var myechart = echarts.init(document.getElementById(obj));

        //颜色模板,根据情况拓展
        var colors = [
            {color:'#000',alabel:'#000',line_style:'#000',text_style:'#000'},
            {color:'#e5e4e4',alabel:'#000',line_style:'#2b55a2',text_style:'#e5e4e4'},
        ];
        config['tem'] = config['tem']?config['tem']:0;

        //基础图形配置项
        myecharts.option = {
            title: {text:config['title'], x: 'center', textStyle: {color:colors[config['tem']]['color'], fontSize: 16 }},   
            tooltip: {trigger: 'axis'}, 
            xAxis: {
                type: 'category',
                boundaryGap: true,
                data: config.xAxis?config.xAxis:[],
                //坐标颜色
                axisLabel: {show: true, textStyle: {color: colors[config['tem']]['alabel'] }}, 
                //左边线的颜色 width: '1' //坐标线的宽度
                axisLine: {lineStyle: {type: 'solid', color: colors[config['tem']]['line_style']} } 
            },
            yAxis: {
                type: 'value',
                axisLabel: {formatter: '{value}',textStyle: {color: colors[config['tem']]['alabel']}},
                //左边线的颜色 width: '1' //坐标线的宽度 
                splitLine: {
                    show: true, lineStyle: {color: [colors[config['tem']]['line_style']] } }, 
                    axisLine: {lineStyle: {type: 'solid', color:colors[config['tem']]['line_style'] }} 
                },
            grid: config['grid']?{top:config['grid'][0], left:config['grid'][1], right:config['grid'][2], bottom:config['grid'][3], containLabel: true }:{top:'5%', left:'5%', right:'5%', bottom:'5%', containLabel: true }, 
            series:config.series,
        },
        myecharts.bar = function(obj){
            //图例
            myecharts.option.legend =  obj.legend;
            myechart.setOption(myecharts.option);
        },
        myecharts.line = function(){
            myechart.setOption(myecharts.option);
        },   
        myecharts.pie = function(obj){
            myecharts.option.xAxis = '';
            myecharts.option.yAxis = '';
            //图例浮动
            myecharts.option.tooltip = {trigger: 'item', formatter: "{a} <br/>{b} : {c} ({d}%)"};
            //图例
            myecharts.option.legend =  {orient: 'vertical', left: 'left', data: obj.data}
            myechart.setOption(myecharts.option);
        },
        myecharts.liquidFill=function(){

        }                
        return myecharts;
    },
    http:function(){
        var http = {};
        http.request = function(url, data, success, cache, alone, async, type, dataType, error){
            var type = type || 'post';//请求类型
            var dataType = dataType || 'json';//接收数据类型
            var async = async || true;//异步请求
            var alone = alone || false;//独立提交（一次有效的提交）
            var cache = cache || false;//浏览器历史缓存
            var success = success || function (data) {
                    /*console.log('请求成功');*/
                    setTimeout(function () {
                        layer.msg(data.msg);//通过layer插件来进行提示信息
                    },500);
                    if(data.status){//服务器处理成功
                        setTimeout(function () {
                            if(data.url){
                                location.replace(data.url);
                            }else{
                                location.reload(true);
                            }
                        },1500);
                    }else{//服务器处理失败
                        if(alone){//改变ajax提交状态
                            ajaxStatus = true;
                        }
                    }
                };
            var error = error || function (data) {
                layer.closeAll('loading');
                setTimeout(function () {
                    if(data.status == 404){
                        layer.msg('请求失败，请求未找到');
                    }else if(data.status == 503){
                        layer.msg('请求失败，服务器内部错误');
                    }else {
                        layer.msg('请求失败,网络连接超时');
                    }
                    ajaxStatus = true;
                },500);
            };
            /*判断是否可以发送请求*/
            if(!ajaxStatus){
                return false;
            }
            ajaxStatus = false;//禁用ajax请求
            /*正常情况下1秒后可以再次多个异步请求，为true时只可以有一次有效请求（例如添加数据）*/
            if(!alone){
                setTimeout(function () {
                    ajaxStatus = true;
                },1000);
            }
            $.ajax({
                'url': url,
                'data': data,
                'type': type,
                'dataType': dataType,
                'async': async,
                'success': success,
                'error': error,
                'jsonpCallback': 'jsonp' + (new Date()).valueOf().toString().substr(-4),
                'beforeSend': function () {
                    layer.msg('加载中', {
                        icon: 16,
                        shade: 0.01
                    });
                },
            });
        },
        http.post = function(url, data, success, cache, alone){
            var ajax = Tool.http();
            ajax.request(url, data, success, cache, alone, false, 'post','json')
        },
        http.get = function(url, success, cache, alone){
            var ajax = Tool.http();
            ajax.request(ajax(url, {}, success, alone, false, 'get','json'))
        },
        http.form = function(){
            var ajax = Tool.http();
            cache = cache || true;
            var form = $(form);
            var url = form.attr('action');
            var data = form.serialize();
            ajax.request(url, data, success, cache, alone, false, 'post','json');
        }
        return http;
    },
    //obj对象标签 intPoint:经纬坐标
    map(obj,intPoint,inithtml){
        var map = {};
       // 创建地址解析器实例
        var _map = new BMap.Map(obj);
        //初始化
        map.init = function(data,i){
            var cmap = Tool.map();
            var markers = [];
            //存在
            if (!intPoint) {
                var point = [data[i][0],data[i][1]];
                _map.centerAndZoom(new BMap.Point(point[0],point[1]), 15); 
                _map.enableScrollWheelZoom();
                var MAX = 10;
                var markers = [];
                var myIcon = new BMap.Icon("./smoke_normal.png",new BMap.Size(50,50));
                for(var i=0;i<MAX;i++){
                    var marker = new BMap.Marker(new BMap.Point(Math.random() * 40 + 85, Math.random() * 30 + 21),{icon:myIcon});  // 创建标注
                    markers.push(marker);                    
                    marker.enableDragging();
                    var content = data[i];
                    _map.addOverlay(marker);   
                    cmap.setPoint(content,marker,false,cmap,markers,_map);
                }
            }else{
                var myGeo= new BMap.Geocoder(); 
                myGeo.getPoint(intPoint, function(point){
                    if (point) {
                        cmap.getmapPoint(point,_map,myGeo,inithtml);
                    }else{
                        alert("您选择地址没有解析到结果!");
                    }
                }, "福州市");
            }
        },
         //绑定事件
        map.setPoint = function(content,marker,intPoint,cmap,markers,_map){
            var infoWindow = new BMap.InfoWindow(content);  // 创建信息窗口对象 
            if (!intPoint) {
                     marker.addEventListener("click",function(e){
                    // 将标注添加到地图中
                    this.openInfoWindow(infoWindow);
                   
                    //图片加载完毕重绘infowindow
                    document.getElementById('imgDemo').onload = function (){
                        infoWindow.redraw();   //防止在网速较慢，图片未加载时，生成的信息框高度比图片的总高度小，导致图片部分被隐藏
                    }
                });
                var markerClusterer = new BMapLib.MarkerClusterer(_map, {markers:markers})
             }
             if (intPoint) {                
                cmap.getmapPoint(marker,intPoint,markers);
             }
        },
        //获取地址信息
        map.getmapPoint = function(point,_map,inithtml,markers){
            var dragend_location = {};
            var myGeo= new BMap.Geocoder(); 
            _map.centerAndZoom(point, 16);
           
            var marker = new BMap.Marker(point);
            var markerClusterer = new BMapLib.MarkerClusterer(_map, {markers:markers})
            marker.enableDragging();
            _map.addOverlay(marker);
            marker.addEventListener("dragend", function (e) {
                myGeo.getLocation(marker.point,function(rs){
                    dragend_location.province = rs.addressComponents.province;
                    dragend_location.latitude_longitude =[e.point.lng,e.point.lat].toString();
                    console.log(dragend_location);
                    // console.log(rs.address); //地址描述(string)
                    // console.log(rs.addressComponents);//结构化的地址描述(object)
                    // console.log(rs.addressComponents.province); //省
                    // console.log(rs.addressComponents.city); //城市
                    // console.log(rs.addressComponents.district); //区县
                    // console.log(rs.addressComponents.street); //街道
                    // console.log(rs.addressComponents.streetNumber); //门牌号
                    // console.log(rs.surroundingPois); //附近的POI点(array)
                    // console.log(rs.business); //商圈字段，代表此点所属的商圈(string)
                 });
           });
         
        }   
        return map;
    },
    paging(){
        var page = {};
        page.init = function(obj,page,totalpage,totalSize,funcname) {
            $("#"+obj).paging({
                pageNo:page,
                totalPage:totalpage ,
                totalSize: totalSize,
                callback: function(num) {   
                    funcname(num);
                }
            })
        }
    }
};


