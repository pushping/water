
$(function($){
//	社区管理
    $(document).on('click','.nav_tools_l', function(e){
        $('.tools_items').fadeIn(200);
        e.stopPropagation();
    });
    $(document).on('click','.tools_items li', function(e){
        $('.tools_items').fadeOut(200);
        e.stopPropagation();
    });
	$(document).on('click','body', function(){
		$('.tools_items').fadeOut(200);
	});
	
//	文字跑马灯
	var $mar = $('#j_marquee ul');
	var speed = 25, size = 0, $marW = $mar.outerWidth();

	function marquee(){
		if(size < $marW){ 
			size += 1;
		}else{
			$mar.css('left','0'); 
			size = 0;
		}
		$mar.css({'left': -size + 'px'});
	}
	
	var init = setInterval(marquee, speed);
	$('#j_marquee').hover(function(){
		clearInterval(init);
	}, function(){
		init = setInterval(marquee, speed);
	});
}(jQuery))








