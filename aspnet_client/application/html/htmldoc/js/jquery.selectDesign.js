/***********************************************
* selectbox radio : 셀렉트박스 디자인개선(접근성개선용)
************************************************/
; (function($) {

	$.fn.selectDesign = function(options){
		return this.each(function(){
			var opts = $.extend({}, $.fn.selectDesign.defaults, options || {});
			options = options || {};

			var $cont = $(this);									//셀렉트박스 영역객체
			var $cont_select = $(this).find("select");			//셀렉트박스
			var $headline;										//셀렉트박스 선택출력영역
			var $list												//셀렉트박스 펼침목록
			var $list_option;										//셀렉트박스 펼침목록 리스트개별객체

			if($cont_select.length<1) opts.selectEl = "a";

			if(opts.selectEl!="a"){
				$headline = $('<span>').addClass(opts.classHeadline).text("선택값");
				$list = $("<div>").addClass(opts.classList);
				$cont_select.find("option").each(function(){
					$list.append($("<div>").text($(this).text()));
				});
				$cont.append($headline);
				$cont.append($list);
			}else{
				$headline = $('<a>').addClass(opts.classHeadline).text("선택값");
				$list = $cont.find(">ul").addClass(opts.classList);
				$list.before($headline);
			}

			$list_option = $list.find(opts.selectEl);

			//가로길이설정(옵션설정시 옵션값으로 고정, 미설정시 가장긴 텍스트 기준)
			var listWidth = 0;
			var headWidth = 0;

			if(opts.listWidth!=null){
				listWidth = opts.listWidth;
				headWidth = opts.listWidth - ($headline.outerWidth()-$headline.width());
			}else{
				$list_option.each(function(){
					headWidth = Math.max(headWidth,$(this).outerWidth());
				});
				listWidth = ($headline.outerWidth()-$headline.width())+headWidth;
			}

			$cont.css("width", listWidth);
			$headline.css("width", headWidth);
			$list.css("width",listWidth-2+"px");

			//데이터초기화
			var $selected_index = null;

			if($list.find("."+opts.classSelected).length){
				$selected_index = $list_option.index($list.find(opts.selectEl+"."+opts.classSelected));
			}else{
				var default_text = $headline.html();
			}
			var default_text = $list_option.eq($selected_index).html();
			if(opts.selectEl=="a") $list.addClass("hidden-obj");

			if(opts.headlineDefault && $selected_index==null) $headline.empty().append(opts.headlineDefault);
			else $headline.empty().append(default_text);

			//옵션리스트 열기/닫기
			$headline.unbind();
			$headline
				.bind("click",function(){
					if(typeof opts.callBackBefore === 'function') {
						if(opts.callBackBefore.call(this)){
							if($cont.hasClass(opts.classOn)){ selectClose(); }
							else{ selectOpen();}
						}else{

						}
					}else{
						if($cont.hasClass(opts.classOn)){ selectClose(); }
						else{ selectOpen();}
					}
					//selectOpen();
				})
				.bind("focus",function(){$cont.addClass(opts.classFocus);})
				.bind("blur",function(){$cont.removeClass(opts.classFocus);});

			$(document).bind('click', function() {
				//if($cont.hasClass(opts.classOn)){ selectClose(); }
			});

			//옵션선택이벤트
			$list_option.unbind();
			$list_option
				.bind("click",function(event){
					$list_option.removeClass(opts.classSelected);
					$(this).addClass(opts.classSelected);
					if(opts.selectEl=="a"){
						$headline.empty().append($(this).html());
						if(this.href.indexOf('#') != -1) event.preventDefault();
					}else{
						$headline.empty().append($(this).html());
						$cont_select.val($cont_select.find("option").eq($list_option.index($(this))).attr("value"));
					}
					selectClose();
					if(typeof opts.callBackAfter === 'function') {
						if(opts.selectEl=="a"){
							return opts.callBackAfter.call(this);
						}else{
							opts.callBackAfter.call($cont_select);
						}
					}
				})
				.bind("focus mouseover",function(){
					$cont.addClass(opts.classFocus);
					$(this).parent().addClass("focus");
				})
				.bind("blur mouseout",function(){
					$cont.removeClass(opts.classFocus);
					$(this).parent().removeClass("focus");
				});

			$cont_select.on({ 
				"change" : function(){
					$list_option.removeClass(opts.classSelected);
					$cont.addClass(opts.classSelected);
					
					$headline.empty().append($(this).find(":selected").text());
					if(typeof opts.callBackAfter === 'function') {
						opts.callBackAfter.call(this);
					}
				},
				"focus" : function(){
					$cont.addClass(opts.classFocus);
				},
				"blur" : function(){
					$cont.removeClass(opts.classFocus);
				}
			});

			//셀렉트오픈
			function selectOpen(){
				$("."+opts.classOn).removeClass(opts.classOn);
				$cont.addClass(opts.classOn);
				if(opts.selectEl=="a") $list.removeClass("hidden-obj");
				selectUlPos();
			}

			//셀렉트close
			function selectClose(){
				$cont.removeClass(opts.classOn);
				if(opts.selectEl=="a") $list.addClass("hidden-obj");
			}

			//셀렉트옵션 포지션
			function selectUlPos(){
				var containerPosY = $cont.offset().top,
				docHeight = jQuery(window).height(),
				scrollTop = jQuery(window).scrollTop();
				newUIHeight = $list.outerHeight();
				containerPosY = containerPosY - scrollTop + newUIHeight + $cont.outerHeight();
				if (containerPosY >= docHeight){
					$list.css({
						top : (-1)*newUIHeight
					});
				}
			}

		});
	}

	$.fn.selectDesign.defaults = {
		classContainer : "select-design",
		classOn : "on",
		classFocus : "focus",
		classSelected : "selected",
		classHeadline : "headline",
		classList : "list-option",
		headlineDefault : false,
		listWidth : null,
		selectEl : "div",
		callBackBefore : null,
		callBackAfter : null
	};

})(jQuery);