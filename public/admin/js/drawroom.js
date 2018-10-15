(function(){
    /**
     *
     * @param {*} type  组件类型
     * @param {*} across  横向房间数
     * @param {*} lengthways  纵向房间数
     * @param {*} storey  楼层数
     * @param {*} orientation 朝向
     * @param {*} num  房间开始编号
     * @param {*} number  房间编号
     * @param {*} shape  楼层形状
     * @param {*} rows  房间排数
     * @param {*} dev_type  设备类型
     */
    function Drawroom(type,across,lengthways,orientation,storey,num,number,shape,rows,dev_type){
        this.type = type || 'room';
        this.across = across || 1;
        this.lengthways=lengthways || 1;
        this.orientation = orientation || 'north';
        this.storey = storey || 1;
        this.number = number ;
        this.num = num || 1;
        this.shape = shape || 1;
        this.rows = rows || 2;
        this.dev_type = dev_type || 'lock';
        this.intX = 20;
        this.intY = 20;
        this.intervalX = 120;
        this.intervalY = 150;
       
        this.str='';
        this.init();
    }

    Drawroom.prototype.init = function(){
        switch (this.orientation) {
            // 判断横向还是纵向
            case 'north':case 'south':
                this.crosswise = true;
                this.other_orientation = this.orientation == 'north' ? 'south':'north';
                break;
            case 'east':case 'west':
                this.crosswise = false;
                this.other_orientation = this.orientation == 'east' ? 'west':'east';
                break;
            default:
                break;
        }
        switch (this.shape) {
            case '1':
                if(this.type == "room"){
                    this.slotted();
                }
                else{
                    this.stairs();
                }
                break;
            case '2':
                this.Ltype();
                break;
            case '3':
                this.Utype();
                break;
            default:
                break;
        }
    }

    Drawroom.prototype.slotted = function(){
        var x = 0;
        var y = 0;
        for(var n=1;n<=this.rows;n++){
            // 判断是横向排列还是纵向排列
            if(this.crosswise){
                y = this.intY+(this.intervalY + 30)*(n-1);
            }
            else{
                x = this.intX+ (this.intervalX + 30)*(n-1);
            }
            var m=0;
            // 判断是否为排，若为多排则第二排朝向相反
            var orientation = n % 2 != 0? this.orientation:this.other_orientation;
            var i = 1;
            for(i;i<=this.across;i++){
                // 有编号或房间名
                if(this.number){
                    var number =this.number;
                }
                else{
                    // 自动编号
                    if(this.num<10){
                        var number =this.storey+ '0'+this.num;
                    }
                    else{
                        var number =this.storey+''+ this.num;
                    }
                }
                if(this.crosswise){
                    x =this.intX+this.intervalX*m;
                }
                else{
                    y =this.intY+this.intervalY*m;
                }

                this.str+=`
                    <div class="room_box" style="top:${y}px;left:${x}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${number}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                this.num++;
                m++;
            }
        }
        if(this.rows == 2){
            if(this.crosswise){
                this.str+=`
                    <div class="corridor" onmousedown="drag(event)" style="width:${this.across*this.intervalX}px;top:${this.intY+this.intervalY}px;left:${this.intX}px;">
                        <span>楼道</span>
                        <div class="drag_dot"></div>
                    </div>
                `
            }
            else{
                this.str+=`
                <div class="corridor" onmousedown="drag(event)" style="height:${this.across*this.intervalY}px;width:30px;top:${this.intY}px;left:${this.intX+this.intervalX}px;">
                    <span>楼道</span>
                    <div class="drag_dot"></div>
                </div>
                `
            }
        }
        
    }

    Drawroom.prototype.Ltype = function(){
        var u = 0;
        var x = 0;
        var y = 0;
        var top = 0;
        var left = 0;
        

        for(var n=2;n>0;n--){
            // 判断是横向排列还是纵向排列
            left = this.intX+ (this.intervalX + 30)*(n-1);
            var m=0;
            var t=0;
            var orientation = n % 2 != 0? 'west':'east';
            var i = 1;
            for(i;i<=this.lengthways;i++){
                // 有编号或房间名
                // 自动编号
                if(this.num<10){
                    var number =this.storey+ '0'+this.num;
                }
                else{
                    var number =this.storey+''+ this.num;
                }
                top =this.intY+this.intervalY*m;

                this.str+=`
                    <div class="room_box" style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                m++;
            }
            
            if(n==1){
                top=this.intY+this.intervalY*m;
                this.str+=`
                    <div class="room_box" style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                top=top+this.intervalY;
                this.str+=`
                    <div class="room_box occupied" style="top:${top}px;left:${left}px;height:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
            }
            var orientation = n % 2 != 0? 'north':'south';
            if(n == 1){
                left+=this.intervalX;
                this.str+=`
                    <div class="room_box occupied" style="top:${top+30}px;left:${left}px;width:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
            }
            
            var v=1;
            var b=1;
            y = this.intY+this.intervalY*this.lengthways+(this.intervalY + 30)*u;
            u++;
            for(v;v<=this.across;v++){
                    // 自动编号
                if(this.num<10){
                    var number =this.storey+ '0'+this.num;
                }
                else{
                    var number =this.storey+''+ this.num;
                }
                x =this.intX+this.intervalX*b + 30;

                this.str+=`
                    <div class="room_box" style="top:${y}px;left:${x}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                b++;
            }

        }
        this.str+=`
            <div class="corridor" onmousedown="drag(event)" style="width:${this.across*this.intervalX+30}px;top:${this.intY+this.intervalY*(this.lengthways*1 +1)}px;left:${this.intX+this.intervalX}px;">
                <span>楼道</span>
                <div class="drag_dot"></div>
            </div>
        `
    }

    Drawroom.prototype.Utype = function(){
        var u = 0;
        var x = 0;
        var y = 0;
        var top = 0;
        var left = 0;
        

        for(var n=2;n>0;n--){
            left = this.intX+ (this.intervalX + 30)*(n-1);
            var m=0;
            var t=0;
            // 判断朝向
            var orientation = n % 2 != 0? 'west':'east';
            var i = 1;
            for(i;i<=this.across;i++){
                // 有编号或房间名
                // 自动编号
                if(this.num<10){
                    var number =this.storey+ '0'+this.num;
                }
                else{
                    var number =this.storey+''+ this.num;
                }
                top =this.intY+this.intervalY*m;

                this.str+=`
                    <div class="room_box" style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                m++;
            }
            
            if(n==1){
                top=this.intY+this.intervalY*m;
                this.str+=`
                    <div class="room_box" style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                top=top+this.intervalY;
                this.str+=`
                    <div class="room_box occupied" style="top:${top}px;left:${left}px;height:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
            }
            var orientation = n % 2 != 0? 'north':'south';
            if(n == 1){
                left+=this.intervalX;
                this.str+=`
                    <div class="room_box occupied" style="top:${top+30}px;left:${left}px;width:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
            }
            
            var v=1;
            var b=1;
            y = this.intY+this.intervalY*this.across+(this.intervalY + 30)*u;
            u++;
            for(v;v<=this.across;v++){
                    // 自动编号
                if(this.num<10){
                    var number =this.storey+ '0'+this.num;
                }
                else{
                    var number =this.storey+''+ this.num;
                }
                x =this.intX+this.intervalX*b + 30;

                this.str+=`
                    <div class="room_box" style="top:${y}px;left:${x}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                b++;
            }


            if(n == 1){
                left+=this.intervalX*(b-1)+30;
                this.str+=`
                    <div class="room_box occupied" style="top:${top+30}px;left:${left}px;width:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                left+=30;
            }
            var orientation = n % 2 != 0? 'east':'west';
            if(n==1){
                this.str+=`
                    <div class="room_box occupied" style="top:${top}px;left:${left}px;height:30px;" onmousedown="drag(event)">
                        <div class="room">
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                top-=this.intervalY;
                this.str+=`
                    <div class="room_box " style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
            }

            left+=this.intervalX*(b-2)*(n-1);
            for(i=1;i<=this.lengthways;i++){
                // 有编号或房间名
                // 自动编号
                if(this.num<10){
                    var number =this.storey+ '0'+this.num;
                }
                else{
                    var number =this.storey+''+ this.num;
                }
                top =this.intY+this.intervalY*(m-1);

                this.str+=`
                    <div class="room_box" style="top:${top}px;left:${left}px;" onmousedown="drag(event)">
                        <div class="door ${orientation}"></div>
                        <div class="room">
                            <span>${this.storey}${this.num>9? ''+this.num++:'0'+this.num++}</span>
                            <div class="a-t">
                                <i class="fa fa-${this.dev_type} red"></i>
                            </div>
                            <div class="a-l">
                                <i class="fa fa-battery-3 text-info"></i>
                            </div>
                            <div class="a-r">
                                <i class="fa fa-signal text-info"></i>
                            </div>
                        </div>
                        <div class="drag_dot"></div>
                    </div>
                `
                m--;
            }

        }
        this.str+=`
            <div class="corridor" onmousedown="drag(event)" style="width:${this.across*this.intervalX+60}px;top:${this.intY+this.intervalY*(this.lengthways*1+1)}px;left:${this.intX+this.intervalX}px;">
                <span>楼道</span>
                <div class="drag_dot"></div>
            </div>
        `
    }

    Drawroom.prototype.stairs = function(){
        this.str=`
            <div class="stairs ${this.orientation}"  style="top:${this.intY}px;left:${this.intX}px;" onmousedown="drag(event)">
                <div class="drag_dot"></div>
            </div>
        `
    }

    window.Drawroom=Drawroom;
})(window)