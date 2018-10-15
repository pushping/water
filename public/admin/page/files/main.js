/*
 * @Author: Jiang xin
 * @Date:   2018-02-09 10:46:36
 * @Last Modified by:   Jiang xin
 * @Last Modified time: 2018-02-12 14:37:32
 */



var TabSwitch = function(className) {
    var oPar = $('.wraper');
    this.oLi = oPar.find('.wraper_ul').find('li');
    this.oDiv = oPar.children('.wraper_cont').find('.cont');
    this.warUl = $('.wraper_ul');
    this.warCot = $('.wraper_cont');
    this.turnLeft = this.warUl.find('.turn_left');
    this.turnRight = this.warUl.find('.turn_right');
    this.turnList = this.warUl.find('.turn_list');
    this.page = this.warUl.find('.page');
    this._index = 0;
    this.timer = null;
    this.init();
    //this.autoplay();
}
TabSwitch.prototype.init = function() {
    var _this = this;
    for (var i = 0; i < this.oLi.length; i++) {
        this.oLi.eq(i).on('click', function() {
            _this.fnClick(this);
        });
    }
    this.turnLeft.on('click', function() {
        _this.turnleft();
    });
    this.turnRight.on('click', function() {
        _this.turnright();
    });
    this.turnList.find('span').on('click',function(){
        _this.fnlist(this);
    });
    // this.warUl.on('mouseover',function(){
    //     clearInterval(timer);

    // });
    // this.warUl.on('mouseleave',function(){
    //     _this.autoplay();
    // });
}
TabSwitch.prototype.turnleft = function() {
    var _this = this;
    if (this._index > 0) {
        this._index--;
    } else {
        return
    }
    this.warCot.eq(this._index).css('display','block').siblings('.wraper_cont').css('display','none');
    this.warCot.eq(this._index).find('.cont').eq(0).css('display','block').siblings('.cont').css('display','none');
    this.page.eq(this._index).css('display', 'block').siblings('.page').css('display', 'none');
    this.page.eq(this._index).find('li').eq(0).addClass('active').siblings().removeClass('active');
    this.turnList.find('span').eq(this._index).addClass('active').siblings().removeClass('active');
    //echartRender();
}
TabSwitch.prototype.turnright = function() {
    if (this._index == this.page.length - 1) {
        this._index = 0;
    } else {
        this._index++;
    }
    this.warCot.eq(this._index).css('display','block').siblings('.wraper_cont').css('display','none');
    this.warCot.eq(this._index).find('.cont').eq(0).css('display','block').siblings('.cont').css('display','none');
    this.page.eq(this._index).css('display', 'block').siblings('.page').css('display', 'none');
    this.page.eq(this._index).find('li').eq(0).addClass('active').siblings().removeClass('active');
    this.turnList.find('span').eq(this._index).addClass('active').siblings().removeClass('active');
    //echartRender();
}
TabSwitch.prototype.fnlist = function(obj){
    var $obj = $(obj);
    var $index = $obj.index();
    this._index = $index;
    $obj.addClass('active').siblings().removeClass('active');
    this.page.eq($index).css('display', 'block').siblings('.page').css('display', 'none');
    this.page.eq($index).find('li').eq(0).addClass('active').siblings().removeClass('active');
    this.warCot.eq($index).css('display','block').siblings('.wraper_cont').css('display','none');
    this.warCot.eq($index).find('.cont').eq(0).css('display','block').siblings('.cont').css('display','none');
    //echartRender();
}
TabSwitch.prototype.autoplay = function() {
    var _this = this;
    timer = setInterval(function() {
        if (_this._index == _this.page.length - 1) {
            _this._index = 0;
        } else {
            _this._index++;
        }
        _this.page.eq(_this._index).css('display', 'block').siblings('.page').css('display', 'none');
        _this.page.eq(_this._index).find('li').eq(0).addClass('active').siblings().removeClass('active');
        _this.warCot.eq(_this._index).css('display','block').siblings('.wraper_cont').css('display','none');
        _this.warCot.eq(_this._index).find('.cont').eq(0).css('display','block').siblings('.cont').css('display','none');
        _this.turnList.find('span').eq(_this._index).addClass('active').siblings().removeClass('active');
        //echartRender();
    }, 2000)
}
TabSwitch.prototype.fnClick = function(obj) {
    var _index = $(obj).index();
    var $obj = $(obj);

    $obj.addClass('active').siblings().removeClass('active');
    this.oDiv.eq(_index).css('display', 'block');
    this.oDiv.eq(_index).siblings().css('display', 'none');

    $('.bj_item').removeClass('active');
    var id = $obj.data('target');
    if(id){
        $(`#bj_${id}`).addClass('active');
    }
    var device_type = $obj.attr('type');


    //getMappoint(['1','2','3','5'],0,device_type,'');
    map_dev_list.ids = ['1','2','3','5'];
    map_dev_list.init = 0;
    map_dev_list.device_type = device_type;
    map_dev_list.device_id = '';
    map_dev_list.get_all_map();

    var ajax = Tool.http();
    //根据设备状态获取坐标点 ids状态集合 初始中心点 设备类型 设备id
    function getMappoint(ids,init,device_type,device_id) {

        var init = init || 0;
        var data_info = [];
        ajax.post("index.php?_url=admin/index/get_dev_mappoint",{status:ids,device_type:device_type},function(res){
            if(res.status=='ok'){
                if(!device_id){
                    map_dev_list.data_list = res.data;
                    map_dev_list.data_status = res.dictionary;
                }

                if(res.data.length>0){
                    var state = res.state;
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

                        if(o.did == device_id){
                            init = i;
                        }

                        var latitude_longitude = o.latitude_longitude.split(",");
                        data_info.push([latitude_longitude[0],latitude_longitude[1],html,image]);
                    })

                    map = Tool.map('allmap',false,'click');
                    map.init(data_info,init);
                }else{
                    var _map = new BMap.Map("allmap");
                    _map.centerAndZoom(new BMap.Point(116.333752,40.008645), 20);
                }
            }
        })
    }
    //getMappoint( map_dev_list.ids,map_dev_list.init,  map_dev_list.device_type, map_dev_list.device_id)
    /*if (device_type) {
        if (id =='ly' ){
            $.ajax({
                type:"GET",
                url:"./index.php?_url=admin/building/buildingmappoint",
                dataType:"json",
                success:function(res){
                    if (res.status=='ok') {
                        var html = '';
                        $.each(res.data,function(i,o){
                            if(o['latitude_longitude']){
                                var lat = o['latitude_longitude'];
                                var latitude_longitude = lat.split(',');
                                if(latitude_longitude[0]){
                                    html += ' <img src="ice/images/overview/ico_'+id+'.png" title="" style="left:'+latitude_longitude[0]+'px;top:'+latitude_longitude[1]+'px;" onclick="showLy('+o.id+',event)">';
                                }
                            }
                        })
                        $(`#bj_${id}`).html(html);
                    }
                }
            })
        }else{
            $.ajax({
                type:"POST",
                data:{type:device_type},
                url:"./index.php?_url=admin/equipment/equipmappoint",
                dataType:"json",
                success:function(res){
                    if (res.status=='ok') {
                        var html = '';
                        $.each(res.data,function(i,o){
                            var lat = o['sitelatitude_sitelongitude'];
                            if (lat) {
                                var latitude_longitude = lat.split(',');
                                if(latitude_longitude[0]){
                                    html += ' <img src="ice/images/overview/ico_'+id+'.png" title="" style="left:'+latitude_longitude[0]+'px;top:'+latitude_longitude[1]+'px;" onclick="showEqu(\''+o.device_id+'\',event)">';
                                }
                            }
                        })
                        $(`#bj_${id}`).html(html);
                    }
                }
            })
        }
    } */
}


//echart_options
// var option3 = {
//     color: ['#398af9'],
//     title: {
//         text: '年龄分布',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: { // 坐标轴指示器，坐标轴触发有效
//             type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     grid: {
//         show: false,
//         left: '3%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: [{
//         type: 'category',
//         data: ['0', '10岁', '20岁', '30岁', '40岁', '50岁', '60岁', '70岁', '80岁'],
//         axisTick: {
//             alignWithLabel: true
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     }],
//     yAxis: [{
//         type: 'value',
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2',
//                 width: '1'
//             }
//         }
//     }],
//     series: [{
//         name: '直接访问',
//         type: 'bar',
//         barWidth: '40%',
//         data: [450, 350, 390, 470, 475, 320, 480, 480, 480]
//     }],
//     textStyle: {
//         fontSize: 15,
//         color: '#fff'
//     }
// };
// var option1 = {
//     color: ['#fd3942', '#337aea'],
//     title: {
//         text: '人口比例',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'item',
//         formatter: "{a} <br/>{b}: {c} ({d}%)"
//     },
//     series: [{
//         name: '男女',
//         type: 'pie',
//         radius: ['50%', '70%'],
//         avoidLabelOverlap: false,
//         label: {
//             normal: {
//                 show: false,
//                 position: 'center'
//             },
//             emphasis: {
//                 show: true,
//                 textStyle: {
//                     fontSize: '30',
//                     fontWeight: 'bold'
//                 }
//             }
//         },
//         labelLine: {
//             normal: {
//                 show: false
//             }
//         },
//         data: [
//             { value: 400, name: 'a' },
//             { value: 500, name: 'b' },
//         ]
//     }]
// };
// var option2 = {
//     color: ['#fd3942', '#fda729', '#337aea'],
//     title: {
//         text: '人口类型比例',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'item',
//         formatter: "{a} <br/>{b}: {c} ({d}%)"
//     },
//     series: [{
//         name: '男女',
//         type: 'pie',
//         radius: '70%',
//         startAngle:260,
//         avoidLabelOverlap: false,
//         label: {
//             normal: {
//                 show: false,
//                 position: 'center'
//             },
//             emphasis: {
//                 show: true,
//                 textStyle: {
//                     fontSize: '30',
//                     fontWeight: 'bold'
//                 }
//             }
//         },
//         labelLine: {
//             normal: {
//                 show: false
//             }
//         },
//         data: [
//             { value: 500, name: 'a' },
//             { value: 550, name: 'b' },
//             { value: 500, name: 'c' }
//         ]
//     }]
// };
// var option5 = {
//     title: {
//         text: '人员出入情况',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     legend: {
//         data: ['进门', '出门'],
//         right: 0,
//         textStyle: {
//             color: ['#fff']
//         }

//     },
//     tooltip: {
//         trigger: 'axis'
//     },
//     grid: {
//         left: '1%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: {
//         type: 'category',
//         boundaryGap: true,
//         data: ['2月04日', '2月05日', '2月06日', '2月07日', '2月08日', '2月09日', '2月10日'],
//         axisLabel: {
//             show: true,
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     yAxis: {
//         type: 'value',
//         axisLabel: {
//             formatter: '{value}',
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     grid: {
//         left: '0%',
//         right: '0%',
//         bottom: '3%',
//         containLabel: true
//     },
//     series: [{
//             name: '进门',
//             type: 'line',
//             stack: '总量',
//             data: [120, 132, 101, 134, 90, 230, 210]
//         },
//         {
//             name: '出门',
//             type: 'line',
//             stack: '总量',
//             data: [220, 182, 191, 234, 290, 330, 310]
//         },
//     ]
// };
// var option6 = {
//     color: ['#398af9'],
//     title: {
//         text: '人员出入情况(2018年2月10日)',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: { // 坐标轴指示器，坐标轴触发有效
//             type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     grid: {
//         show: false,
//         left: '3%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: [{
//         type: 'category',
//         data: ['0', '10岁', '20岁', '30岁', '40岁', '50岁', '60岁', '70岁', '80岁'],
//         axisTick: {
//             alignWithLabel: true
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     }],
//     yAxis: [{
//         type: 'value',
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2',
//                 width: '1'
//             }
//         }
//     }],
//     series: [{
//         name: '直接访问',
//         type: 'bar',
//         barWidth: '40%',
//         data: [450, 350, 390, 470, 475, 320, 480, 480, 480]
//     }],
//     textStyle: {
//         fontSize: 15,
//         color: '#fff'
//     }
// };
// var option7 = {
//     title: {
//         text: '车辆出入情况',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     legend: {
//         data: ['进门', '出门'],
//         right: 0,
//         textStyle: {
//             color: ['#fff']
//         }

//     },
//     tooltip: {
//         trigger: 'axis'
//     },
//     grid: {
//         left: '1%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: {
//         type: 'category',
//         boundaryGap: true,
//         data: ['2月04日', '2月05日', '2月06日', '2月07日', '2月08日', '2月09日', '2月10日'],
//         axisLabel: {
//             show: true,
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     yAxis: {
//         type: 'value',
//         axisLabel: {
//             formatter: '{value}',
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     grid: {
//         left: '0%',
//         right: '0%',
//         bottom: '3%',
//         containLabel: true
//     },
//     series: [{
//             name: '进门',
//             type: 'line',
//             stack: '总量',
//             data: [120, 132, 101, 134, 90, 230, 210]
//         },
//         {
//             name: '出门',
//             type: 'line',
//             stack: '总量',
//             data: [220, 182, 191, 234, 290, 330, 310]
//         },
//     ]
// };
// var option8 = {
//     color: ['#398af9'],
//     title: {
//         text: '车辆出入情况(2018年2月10日)',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: { // 坐标轴指示器，坐标轴触发有效
//             type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     grid: {
//         show: false,
//         left: '3%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: [{
//         type: 'category',
//         data: ['0', '10岁', '20岁', '30岁', '40岁', '50岁', '60岁', '70岁', '80岁'],
//         axisTick: {
//             alignWithLabel: true
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     }],
//     yAxis: [{
//         type: 'value',
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2',
//                 width: '1'
//             }
//         }
//     }],
//     series: [{
//         name: '直接访问',
//         type: 'bar',
//         barWidth: '40%',
//         data: [450, 350, 390, 470, 475, 320, 480, 480, 480]
//     }],
//     textStyle: {
//         fontSize: 15,
//         color: '#fff'
//     }
// };
// var option9 = {
//     title: {
//         text: '小区用水量统计',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     // legend: {
//     //     data:['进门','出门'],
//     //     right:0,
//     //     textStyle:{
//     //         color:['#fff']
//     //     }

//     // },
//     tooltip: {
//         trigger: 'axis'
//     },
//     grid: {
//         left: '1%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: {
//         type: 'category',
//         boundaryGap: true,
//         data: ['2月04日', '2月05日', '2月06日', '2月07日', '2月08日', '2月09日', '2月10日'],
//         axisLabel: {
//             show: true,
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     yAxis: {
//         type: 'value',
//         axisLabel: {
//             formatter: '{value}',
//             textStyle: {
//                 color: '#fff'
//             }
//         },
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     },
//     grid: {
//         left: '0%',
//         right: '0%',
//         bottom: '3%',
//         containLabel: true
//     },
//     series: [{
//             name: '进门',
//             type: 'line',
//             stack: '总量',
//             data: [120, 132, 101, 134, 90, 230, 210]
//         },
//         {
//             name: '出门',
//             type: 'line',
//             stack: '总量',
//             data: [220, 182, 191, 234, 290, 330, 310]
//         },
//     ]
// };
// var option10 = {
//     color: ['#398af9'],
//     title: {
//         text: '近半年小区楼宇用水量前三',
//         x: 'center',
//         textStyle: {
//             color: '#fff',
//             fontSize: 16
//         }
//     },
//     tooltip: {
//         trigger: 'axis',
//         axisPointer: { // 坐标轴指示器，坐标轴触发有效
//             type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
//         }
//     },
//     grid: {
//         show: false,
//         left: '3%',
//         right: '4%',
//         bottom: '3%',
//         containLabel: true
//     },
//     xAxis: [{
//         type: 'category',
//         data: ['0', '10岁', '20岁', '30岁', '40岁', '50岁', '60岁', '70岁', '80岁'],
//         axisTick: {
//             alignWithLabel: true
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2', //左边线的颜色
//                 width: '1' //坐标线的宽度
//             }
//         }
//     }],
//     yAxis: [{
//         type: 'value',
//         splitLine: {
//             show: true,
//             lineStyle: {
//                 color: ['#2b55a2']
//             }
//         },
//         axisLine: {
//             lineStyle: {
//                 type: 'solid',
//                 color: '#2b55a2',
//                 width: '1'
//             }
//         }
//     }],
//     series: [{
//         name: '直接访问',
//         type: 'bar',
//         barWidth: '40%',
//         data: [450, 350, 390, 470, 475, 320, 480, 480, 480]
//     }],
//     textStyle: {
//         fontSize: 15,
//         color: '#fff'
//     }
// };
// var option11 = {
//     series: [{
//         type: 'liquidFill',
//         data: [{
//             name: 'PM2.5',
//             value: 0.5,
//             itemStyle: {
//                 color: 'rgba(157, 234, 139, 1)'
//             }
//         }],
//         backgroundStyle: {
//             borderWidth: 5,
//             borderColor: '#1e3665',
//             color: '#1e3665'
//         },
//         label: {
//             normal: {
//                 formatter: '{b}',
//                 textStyle: {
//                     fontSize: 39
//                 }
//             }
//         },
//         outline: {
//             borderDistance: 0,
//             itemStyle: {
//                 borderWidth: 5,
//                 borderColor: 'rgba(157, 234, 139, 1)'
//             }
//         },
//         radius: '80%'
//     }]
// }
// var option12 = {
//     series: [{
//         type: 'liquidFill',
//         data: [{
//             name: '温度',
//             value: 0.3,
//             itemStyle: {
//                 color: 'rgba(102, 189, 255, 1)'
//             }
//         }],
//         backgroundStyle: {
//             borderWidth: 5,
//             borderColor: '#1e3665',
//             color: '#1e3665'
//         },
//         label: {
//             normal: {
//                 formatter: '{b}',
//                 textStyle: {
//                     fontSize: 39
//                 }
//             }
//         },
//         outline: {
//             borderDistance: 0,
//             itemStyle: {
//                 borderWidth: 5,
//                 borderColor: 'rgba(102, 189, 255, 1)'
//             }
//         },
//         radius: '80%'
//     }]
// }
// var option13 = {
//     series: [{
//         type: 'liquidFill',
//         data: [{
//             name: '湿度',
//             value: 0.7,
//             itemStyle: {
//                 color: 'rgba(255, 203, 102,1)'
//             }
//         }],
//         backgroundStyle: {
//             borderWidth: 5,
//             borderColor: '#1e3665',
//             color: '#1e3665'
//         },
//         label: {
//             normal: {
//                 formatter: '{b}',
//                 textStyle: {
//                     fontSize: 39
//                 }
//             }
//         },
//         outline: {
//             borderDistance: 0,
//             itemStyle: {
//                 borderWidth: 5,
//                 borderColor: 'rgba(255, 203, 102,1)'
//             }
//         },
//         radius: '80%'
//     }]
// }
// var option14 = {
//     series: [{
//         type: 'liquidFill',
//         data: [{
//             name: '噪音',
//             value: 0.4,
//             itemStyle: {
//                 color: 'rgba(255, 171, 171,1)'
//             }
//         }],
//         backgroundStyle: {
//             borderWidth: 5,
//             borderColor: '#1e3665',
//             color: '#1e3665'
//         },
//         label: {
//             normal: {
//                 formatter: '{b}',
//                 textStyle: {
//                     fontSize: 39
//                 }
//             }
//         },
//         outline: {
//             borderDistance: 0,
//             itemStyle: {
//                 borderWidth: 5,
//                 borderColor: 'rgba(255, 171, 171,1)'
//             }
//         },
//         radius: '80%'
//     }]
// }
// var options = [ option1, option2,option3, option5, option6, option7, option8, option9, option10, option11, option12, option13, option14];

// var echartRender = function() {
//     var charts = $('.wraper_cont').children('.cont').find('.myChart');
//     console.log(charts.length);
//     for (var i = 0; i < charts.length; i++) {
//         var _chart = charts.eq(i).get(0);
//         var myChart = echarts.init(_chart);
//         myChart.setOption(options[i], true);
//         window.onresize = myChart.resize();
//     }
// }

$(function() {
    //tab
    var t1 = new TabSwitch('wraper');
    //echart渲染
    //echartRender();
})