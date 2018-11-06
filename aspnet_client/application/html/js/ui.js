;(function($){
	$.fn.extend({
		allmenu:function() {
			var $h_wrap = $(".header_wrap");
			var $menu = $(".menu_area");
			var $title = $("#menu_view");
			var $close = $(".btn_close a");
			$menu.hide();
			$title.bind("click", function() {
				if($menu.is(":hidden")){
					$menu.show();
					$h_wrap.css({"background":"rgba(0, 0, 0, 0.6)","filter":"progid:DXImageTransform.Microsoft.gradient(startColorstr=#60000000,endColorstr=#60000000)","height":"100%"});
				}else{
					$menu.hide();
					$h_wrap.css({"background":"none","height":"auto"});
				}
			});
			$close.click(function(){
				$menu.hide();
				$h_wrap.css({"background":"none","height":"auto"});
			});
		},
		familySite:function() {
			var _this = $(this);
				control = _this.find('.familysite-defult > a');
				control.click(function() {
					if (!$(this).parent().is('.site-expose')) {
						$(this).parent().addClass('site-expose');
						$(this).parent().prev().show();
						//$(this).find('>img').attr('alt','�⑤�由ъ궗�댄듃 �リ린');
						$($(this).attr('href')).focus();
					} else {
						$(this).parent().removeClass('site-expose');
						$(this).parent().prev().hide();
						//$(this).find('>img').attr('alt','�⑤�由ъ궗�댄듃 �닿린');
					}
					return false;
			})
		}

	})
})(jQuery);