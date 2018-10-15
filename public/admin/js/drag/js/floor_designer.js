var DragDesign = /** @class */ (function () {
    function DragDesign() {
        this.$design = $();
        this.$activeLayers = $();
        this.layerSize = {
            width: 100,
            height: 100,
        };
        this.activePos = {
            pageX: 0,
            pageY: 0,
            x: 0,
            y: 0,
        };
        var _this = this;
        this.$design = $('.drag-design');
        var layers = JSON.parse(localStorage.getItem('designData') || '[]');
        this.create(layers);


        if( _this.$design.hasClass('design-view') ){
            return
        }

        $('.drag-elements').on('click', '.drag-layer', function (e) {
            var type = $(e.target).data('type');
            $("#chk_type_"+type).prop("checked",true);
            // _this.add({ x: 0, y: 0, image: $(e.target).html(), id: 0, type: $(e.target).data('type'), status: 0 });
        });
        this.$design.on('contextmenu', function (e) {
            window.event.returnValue = false;
            if (e.button == 2) {
                e.preventDefault();
                var $target = $(e.target);
                if ($(e.target).hasClass('drag-layer')) {
                    var $sp_1 = $target.find('.layer-content');
                    var $img_1 = $sp_1.find('img');
                    var src_1 = $img_1.attr('src');
                    var rotate_1 = $target.data('rotate') || 0;
                    var direction = void 0;
                    var getDirection = function () {
                        if (src_1.indexOf('h') != -1) {
                            if (rotate_1 == 0) {
                                return 'right';
                            }
                            else {
                                return 'left';
                            }
                        }
                        else {
                            if (rotate_1 == 0) {
                                return 'down';
                            }
                            else {
                                return 'up';
                            }
                        }
                    };
                    var setDirection = function (direction) {
                        var rotate = 0;
                        switch (direction) {
                            case 'down':
                                src_1 = src_1.replace('h', 'v');
                                rotate = 0;
                                break;
                            case 'up':
                                src_1 = src_1.replace('h', 'v');
                                rotate = 180;
                                break;
                            case 'left':
                                src_1 = src_1.replace('v', 'h');
                                rotate = src_1.indexOf("h")>-1 ? -180 : 90;
                                break;
                            case 'right':
                                src_1 = src_1.replace('v', 'h');
                                rotate = src_1.indexOf("h")>-1 ? 0 : -90;
                                break;
                        }
                        $img_1.attr('src', src_1);
                        $sp_1.css({
                            'transform': 'rotate(' + (rotate) + 'deg)',
                        });
                        rotate_1 = rotate ;
                    };
                    var changeDirection = function (direction) {
                        switch (direction) {
                            case 'down': return 'left';
                            case 'left': return 'up';
                            case 'up': return 'right';
                            case 'right': return 'down';
                        }
                    };
                    direction = $target.data('direction') || getDirection();
                    direction = changeDirection(direction);
                    setDirection(direction);
                    $target.data('direction', direction);
                    $target.data('rotate', rotate_1);
                    /*$target.css({
                     width : $sp.height(),
                     height : $sp.width(),
                     })*/
                }
            }
            return false;
        });
        this.selectArea();
        this.timeSave();
    }
    DragDesign.prototype.selectArea = function () {
        var _this_1 = this;
        var _this = this;
        function getInElement() {
            // let layers = [];
            _this.$design.find('.drag-layer').each(function (i, n) {
                var el = {
                    left: parseFloat($(n).css('left')),
                    top: parseFloat($(n).css('top')),
                    height: parseFloat($(n).css('height')),
                    width: parseFloat($(n).css('width')),
                };
                var areaBox = {
                    left: parseFloat($areaBox.css('left')),
                    top: parseFloat($areaBox.css('top')),
                    height: parseFloat($areaBox.css('height')),
                    width: parseFloat($areaBox.css('width')),
                };
                if (el.left + el.width > areaBox.left
                    &&
                    el.left < areaBox.left + areaBox.width
                    &&
                    el.top + el.height > areaBox.top
                    &&
                    el.top < areaBox.top + areaBox.height) {
                    $(n).addClass('active');
                }
                else {
                    $(n).removeClass('active');
                }
            });
        }
        var $areaBox = $('<div class="area-box"></div>');
        this.$design.on('mousedown', function (e) {
            var $target = $(e.target);
            _this_1.clearAllActive();
            if (!$target.hasClass('drag-layer')) {
                var left = e.pageX - _this_1.$design.offset().left;
                var top_1 = e.pageY - _this_1.$design.offset().top;
                $areaBox.data('mouseon', true).appendTo(_this_1.$design).css({
                    left: left,
                    top: top_1,
                }).data('position', {
                    x: e.pageX,
                    y: e.pageY,
                    left: left,
                    top: top_1,
                });
            }
            else {
            }
        }).on('mouseup', function (e) {
            $areaBox.data('mouseon', false);
            $areaBox.remove();
        }).on('mousemove', function (e) {
            var _this = _this_1;
            if ($areaBox.data('mouseon') == true) {
                var pos = $areaBox.data('position');
                if (e.pageX < pos.x || e.pageY < pos.y) {
                    if (e.pageX < pos.x) {
                        $areaBox.css({
                            left: pos.left + e.pageX - pos.x,
                            width: Math.abs(e.pageX - pos.x),
                        });
                    }
                    if (e.pageY < pos.y) {
                        $areaBox.css({
                            top: pos.top + e.pageY - pos.y,
                            height: Math.abs(e.pageY - pos.y),
                        });
                    }
                }
                else {
                    $areaBox.css({
                        width: e.pageX - pos.x,
                        height: e.pageY - pos.y,
                    });
                }
                getInElement();
            }
            if (_this_1.$activeLayers.hasClass('active')) {
                var offset_1 = {
                    x: (e.pageX - _this.activePos.pageX) || 0,
                    y: (e.pageY - _this.activePos.pageY) || 0,
                };
                _this_1.$activeLayers.each(function () {
                    var pos = $(this).data('activePosition') || 0;
                    $(this).css({
                        left: pos.x + offset_1.x,
                        top: pos.y + offset_1.y,
                    });
                });
            }
        });
        return this;
    };
    DragDesign.prototype.createL = function (row, col) {
        var layers = [{ "x": 154, "y": 50, "name": "房间 " }, { "x": 372, "y": 54, "name": "房间 " }, {
            "x": 262,
            "y": 52,
            "name": "房间 "
        }, { "x": 480, "y": 55, "name": "房间 " }];
        for (var i = 0; i < row; i++) {
            for (var j = 0; j < col; j++) {
                layers.push({
                    x: i * this.layerSize.width,
                    y: j * this.layerSize.height,
                    name: '房间',
                });
            }
        }
        this.create(layers);
        return this;
    };
    DragDesign.prototype.createR = function (row, col) {
        var layers = [];
        for (var i = 0; i < row; i++) {
            for (var j = 0; j < col; j++) {
                layers.push({
                    x: 50 + i * this.layerSize.width,
                    y: 50 + j * this.layerSize.height,
                    image:  "<img src='./admin/images/floordesign/fj-v.jpg' data-type='1'>",
                    name : "房间",
                    direction: "down",
                    rotate: 0,
                    height: 100,
                    width: 75,
                    type : 1,
                    status: 0,
                    id : 0,
                });
            }
        }
        this.create(layers);
        return this;
    };
    DragDesign.prototype.createU = function (row, col) {
        var layers = [];
        for (var i = 0; i < row; i++) {
            for (var j = 0; j < col; j++) {
                layers.push({
                    x: 50 + i * this.layerSize.width,
                    y: 50 + j * this.layerSize.height,
                    image:  "<img src='./admin/images/floordesign/lt-v.jpg' data-type='0'>",
                    name : "",
                    direction: "down",
                    rotate: 0,
                    height: 100,
                    width: 75,
                    type : 0,
                    status: 0,
                    id : 0,
                });
            }
        }
        this.create(layers);
        return this;
    };
    DragDesign.prototype.empty = function () {
        this.$design.empty();
        return this;
    };
    DragDesign.prototype.create = function (layers) {
        for (var _i = 0, layers_1 = layers; _i < layers_1.length; _i++) {
            var o = layers_1[_i];
            this.add(o);
        }
        return this;
    };
    DragDesign.prototype.timeSave = function () {
        var _this = this;
        setInterval(function () {
            _this.save();
        }, 10 * 1000 * 60);
        return this;
    };
    DragDesign.prototype.add = function (prop) {
        var _this_1 = this;
        var _this = this;
        var $el = new DragDesignElement(this.$design, {
            dragStart: function (x, y, e) {
                _this_1.activePos = {
                    pageX: e.pageX,
                    pageY: e.pageY,
                    x: x,
                    y: y,
                };
                var $target = $(e.target);
                if ($target.hasClass('active')) {
                    _this_1.$activeLayers = _this_1.$design.find('.active').not($target).each(function () {
                        $(this).data('activePosition', {
                            x: parseFloat($(this).css('left')),
                            y: parseFloat($(this).css('top')),
                        });
                    });
                }
            },
            dragEnd: function (x, y, e) {
                if ($(e.target).hasClass('active')) {
                    _this.clearAllActive();
                }
            }
        }).$;
        this.setLayer($el, prop);
        $el.appendTo(this.$design);
        return this;
    };
    DragDesign.prototype.clearAllActive = function () {
        this.$design.find('.drag-layer').removeData('activePosition').removeClass('active');
        return this;
    };
    DragDesign.prototype.remove = function (elem) {
        elem.remove();
        return this;
    };
    DragDesign.prototype.getDirection = function (rotate) {
        if (rotate % 360 == 0) {
            return '南';
        }
        else if (rotate % 270 == 0) {
            return '东';
        }
        else if (rotate % 180 == 0) {
            return '北';
        }
        else if (rotate % 90 == 0) {
            return '西';
        }

    };
    DragDesign.prototype.getDevicePath = function ( type ) {
        var url = './admin/images/indoor/';
        var name = '';
        switch ( parseInt(type) ) {
           case 10 :  name = 'i_electric.png' ; break ;
           case 6 : name = 'i_smoke.png' ;break;
           case 9 : name = 'i_water.png' ;break;
           case 8 : name = 'i_lock.png' ;break;
        }
        return url + name;
    };
    DragDesign.prototype.getLayer = function ($el) {
        return {
            x: parseFloat($el.css('left')),
            y: parseFloat($el.css('top')),
            image: $el.find('.layer-content').html(),
            type: $el.data('type'),
            id: $el.data('id'),
            direction: $el.data('direction'),
            rotate: $el.data('rotate'),
            width: $el.width(),
            height: $el.height(),
            name: $el.data('name'),
            device: $el.data('device'),
            status: $el.data('status')
        };
    };
    DragDesign.prototype.setLayer = function ($el, data) {
        $el.css({
            left: data.x,
            top: data.y,
            width: data.width,
            height: data.height
        }).data({
            id: data.id,
            type: data.type,  // { 1 : '房间' ， 2 : '楼梯' ， 5 : '摄像头' ， 6 : '烟感' ， 7 : '消防栓' }
            rotate: data.rotate,
            status: data.status,
            name : data.name,
            direction: data.direction,
            device : data.device  // [{ id : '5' , name : '摄像头' , status : 1 },{ id : '6' , name : '烟感' , status : 0 },{ id : '7' , name : '消防栓' },{ id : '8' , name : '门锁' },{ id : '9' , name : '水表' },{ id : '10' , name : '电表' }]
        }).find('.layer-content').html(
            data.status == 0 ? data.image :(data.type < 5 && data.status == 1 ?
                data.image.replace('.jpg', '-green.jpg') :  (data.type < 5 ? data.image.replace('.jpg', '-disabled.jpg') : data.image) ) ).css({
            transform: 'rotate(' + data.rotate + 'deg)'
        })

        var devices = typeof data.device == 'string' ? data.device.split(',') :  (data.device || []);
        for( var i = 0 ; i < devices.length ; i++ ){
            var url = this.getDevicePath( devices[i].id );
            if( devices[i].status == 1 ) url = url.replace('.png' , '_error.png');
            $el.find('.device').append('<img src="'+ url +'" >');
        }

        if( data.type == 5 ||  data.type == 6 ||  data.type == 7){
            var statusClass = data.status == 0 ? 'btn-primary' : 'btn-danger';
            $el.append('<div class="over-layout clearfix"><div class="pull-left">设备ID:'+ data.id +'</div><div class="pull-right"><div class="btn '+ statusClass +'" >'+ ( data.status == 0 ? '正常': '异常' ) +'</div></div></div>');
        }
        else{
            $el.find('.name').html(data.name);
        }
        return this;
    };
    DragDesign.prototype.getData = function () {
        var _this_1 = this;
        var layers = [];
        this.$design.find('.drag-layer').each(function (i, n) {
            var $el = $(n);
            layers.push(_this_1.getLayer($el));
        });
        return layers;
    };
    DragDesign.prototype.save = function () {
        var layers = this.getData();
        localStorage.setItem('designData', JSON.stringify(layers));
        return this;
    };
    return DragDesign;
}());
var DragDesignElement = /** @class */ (function () {
    function DragDesignElement($design, dragOptions) {
        var _this_1 = this;
        this.$ = $();
        this.$ = $('<div class="drag-layer" ><span class="layer-content"></span><i class="fa fa-times"></i><em class="fa fa-arrows-alt drop-size"></em><div class="device"></div><em class="name"></em></div>')
            .appendTo($design)

        if( $design.hasClass('design-view') ){
            this.$.on('click',  function (e) {
                $('.modal-design').modal('show');
            });
            return
        }

        this.$.myDrag(dragOptions);
        this.$.on('dblclick',function(){
            var $modal = $('.modal-design').modal({ show: true });
            $modal.find('input').val(_this_1.$.data('name'));
            $modal.off('click.md').on('click.md','.submit',function () {
                _this_1.setName($modal.find('input').val());
                $modal.modal('hide');
            })
        }).find('.drop-size').on('mousedown', function (e) {
            var $dragLayer = $(this).closest('.drag-layer');
            $dragLayer.addClass('resizing').data('resizePosition', {
                x: e.pageX,
                y: e.pageY,
                width: parseFloat($dragLayer.width()),
                height: parseFloat($dragLayer.height()),
            });
        });
        $(document).off('mouseup.resizing').on('mouseup.resizing', function (e) {
            $('.resizing').removeClass('resizing');
        })
            .off('mousemove.resizing').on('mousemove', function (e) {
            if ($('.resizing').length) {
                var $layer = $('.resizing');
                var pos = $layer.data('resizePosition');
                var width = pos.width + e.pageX - pos.x;
                var height = pos.height + e.pageY - pos.y;
                if ($layer.hasClass('resizing')) {
                    $layer.css({
                        width: width,
                        height: height,
                    });
                    var rotate = $layer.data('rotate') || 0;
                    if (rotate % 180 == 0) {
                    }
                    else {
                    }
                }
            }
        });
        this.$.find('i').click(function () {
            _this_1.$.remove();
        });
    }
    DragDesignElement.prototype.setName = function ( val ) {
        this.$.data('name' , val ).find('.name').html(val);
        return this;
    };
    return DragDesignElement;
}());