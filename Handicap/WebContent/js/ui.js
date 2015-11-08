function gnbMenu(depth1,depth2){
	$("#gnb .menu li a").bind('focusin mouseenter',function() {
			$(this).parent().find("ul").css("display", "block");
			$(this).addClass('on');
			$(this).parent().siblings().find("ul").css("display", "none");
			$(this).parent().siblings().find("a").removeClass('on');
	});
	$("#gnb .menu").bind('mouseleave',function() {
		$(this).children('li').find('ul').css("display", "none");
		$(this).children('li').find("a").removeClass('on');
		$('#gnb .menu > li:eq('+depth1+') > a').addClass("on")
		$('#gnb .menu > li:eq('+depth1+') > a').parent().find("ul").css("display", "block");
		$('#gnb .menu > li:eq('+depth1+') ul li:eq('+depth2+') > a').addClass("on")
	});
	if ( $('#gnb .menu > li').size() > depth1){
		$('#gnb .menu > li:eq('+depth1+') > a').addClass("on")
		$('#gnb .menu > li:eq('+depth1+') > a').parent().find("ul").css("display", "block");
		$('#gnb .menu > li:eq('+depth1+') ul li:eq('+depth2+') > a').addClass("on")
	}
	$("#gnb .menu li:last-child ul li:last-child a").bind('focusout',function() {
		$(this).parents('.menu ul').css("display", "none");
		$(this).parents('#gnb .menu li').find("a").removeClass('on');
		$('#gnb .menu > li:eq('+depth1+') > a').addClass("on")
		$('#gnb .menu > li:eq('+depth1+') > a').parent().find("ul").css("display", "block");
		$('#gnb .menu > li:eq('+depth1+') ul li:eq('+depth2+') > a').addClass("on")
	});
}