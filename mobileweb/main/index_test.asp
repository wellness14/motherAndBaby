<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 
menuCode1 = "10000" 
menuCode2 = "A"

%> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<!--#include virtual="/mobileweb/common/menu/top_head_test.asp"-->
	 <style>
 
        /* Animation Canvas */
        .animation_canvas  {
            overflow:hidden;
            position:relative;           
            width:360px; height:226px;
        }
    
        /* Slider Panel */
        .slider_panel { width:1440px; position:relative; }/* 360 * 현재 팝업수 */
        .slider_image { float:left; width:360px; height:226px; }
    
        /* Slider Text Panel */
        .slider_text_panel { position:absolute; top:200px; left:50px; }
        .slider_text { position:absolute; width:250px; height:150px; }
    
        /* Control Panel */
        .control_panel  {
            position:absolute; top:200px; 
            left:155px; height:13px; 
            overflow:hidden; 
        }

        .control_button {
            width:12px; height:46px;
            position:relative; 
    
            float:left; cursor:pointer;  
            background:url('/mobileweb/html/images/point_button.png');
        }
        .control_button:hover { top:-16px; }
        .control_button.active { top:-31px; }
    </style>

</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
        <div id="mnav" class="menu">
			<!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
        </div>
	    <div class="animation_canvas">
        <div class="slider_panel">
			<ul class="bxslider">
				<li><a target="_blank" href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=A"><img src="/mobileweb/html/images/mslide2.jpg" class="slider_image" alt=""/></a></li>
				<li><a target="_blank" href="/mobileweb/service/service_03.asp?menuCode1=30000&menuCode2=B" class="slider_image" alt=""/><img src="/mobileweb/html/images/mslide1.jpg" class="slider_image" alt=""/></a></li>
				<li><a target="_blank" href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=C"><img src="/mobileweb/html/images/mslide3.jpg" class="slider_image" alt=""/></a></li>
				<li><a target="_blank" href="http://www.mflare.co.kr/iwing/"><img src="/mobileweb/html/images/iwing_640_398.jpg" alt="" class="slider_image"/></a></li>
			</ul>
			</div>
        <div class="slider_text_panel">

        </div>
        <div class="control_panel">
            <div class="control_button"></div>
            <div class="control_button"></div>
            <div class="control_button"></div>
            <div class="control_button"></div>
        </div>
    </div>


      <!--  /*#conmm1 img{width:180px; height:126px;} #conmm2 img{width:90px;height:126px;} #conmm3 img{width:90px;height:63px;} 
#conmm5 img{width:90px; height:126px;} #conmm6 img{width:90px; height:126px;} #conmm7 img{width:90px; height:126px;}   #conmm8 img{width:90px;height:63px;}
#conmm9{width:360px;position:relative;}*/-->



		<div id="mcontainer">
            <ul>
            	<li id="conmm1" class="mcon0"><a href="/mobileweb/service/service_03.asp?menuCode1=30000&menuCode2=B"><img src="/mobileweb/html/images/mm1.jpg" width="180px" height="118px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a>
                </li>
                <li id="conmm2" class="mcon1"><a href="/mobileweb/service/service_01.asp?menuCode1=30000&menuCode2=A"><img src="/mobileweb/html/images/mm2.jpg"  width="90px" height="118px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a>
                </li>
                <li id="conmm3" class="mcon1">
                	<ul>
                    	<li><a href="/mobileweb/board/board_01.asp"><img src="/mobileweb/html/images/mm3.jpg"  width="90px" height="59px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                        <li><a href="/mobileweb/board/board_02.asp"><img src="/mobileweb/html/images/mm4.jpg"  width="90px" height="59px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>	
                    </ul>
                </li>
            </ul> 
            <ul>
            	 <li id="conmm5" class="mcon2"><a href="/mobileweb/board/board_05.asp"><img src="/mobileweb/html/images/mm5.jpg"  width="90px" height="118px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm6" class="mcon2"><a href="/mobileweb/comp/comp.asp?menuCode1=20000&menuCode2=H"><img src="/mobileweb/html/images/mm6.jpg"  width="90px" height="118px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm7" class="mcon2"><a href="/mobileweb/info/info_02.asp?menuCode1=40000&menuCode2=B"><img src="/mobileweb/html/images/mm7.jpg"  width="90px" height="118px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm8" class="mcon2">
                 	<ul>
                    	<li><a href="http://mothernbaby.co.kr/mobileweb/comp/comp_1.asp"><img src="/mobileweb/html/images/mm8.jpg"  width="90px" height="59px" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                        <li><a href="/mobileweb/board/board_03.asp"><img src="/mobileweb/html/images/mm9.jpg" width="90px" height="59px"  style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>	
                    </ul>
            </ul>
            <ul>
            	<li id="conmm9"><img src="/mobileweb/html/images/mm10.jpg" width="360px"  /></a></li>
            </ul>
        </div>
		 <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->	 
     </div>
   </div> 
</body>    
<script>
	$('document').ready(function(){
    $('.menu').fixedMenu();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){			   
		$(".ani-bg").animate({
			marginTop:"73px"       
		}, 1350 );
	
	});
</script>


 
<script type="text/javascript">
			jQuery(document).ready(function($) {
				// Define any icon actions before calling the toolbar
				$('.toolbar-icons a').on('click', function( event ) {
					event.preventDefault();
				});
				$('#normal-button-bottom').toolbar({content: '#user-options', position: 'bottom'});
			});
</script>
 

<script>
        $(document).ready(function () {
            // 슬라이더를 움직여주는 함수
            function moveSlider(index) {
                // 슬라이더를 이동합니다.
                var willMoveLeft = -(index * 360);
                $('.slider_panel').animate({ left: willMoveLeft }, 'slow');

                // control_button에 active클래스를 부여/제거합니다.
                $('.control_button[data-index=' + index + ']').addClass('active');
                $('.control_button[data-index!=' + index + ']').removeClass('active');

                // 글자를 이동합니다.
                $('.slider_text[data-index=' + index + ']').show().animate({
                    left: 0
                }, 'slow');
                $('.slider_text[data-index!=' + index + ']').hide('slow', function () {
                    $(this).css('left', -300);
                });
            }

            // 초기 텍스트 위치 지정 및 data-index 할당
            $('.slider_text').css('left', -300).each(function (index) {
                $(this).attr('data-index', index);
            });

            // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
            $('.control_button').each(function (index) {
                $(this).attr('data-index', index);
            }).click(function () {
                var index = $(this).attr('data-index');
                moveSlider(index);
            });

            // 초기 슬라이더 위치 지정
            var randomNumber = Math.round(Math.random() * 3);
            moveSlider(randomNumber);
        });
</script>

<script type="text/javascript">
jQuery(document).ready(function(){
  jQuery ('.bxslider').bxSlider({



 
  mode:'horizontal',
  slideMargin: 0,
  pager:false,
  slideWidth: 360,
  minSlides: 4,
  maxSlides: 4,
  moveSlides: 1,
  auto: true,
  autoControls: true
  }
    );
});
</script>
<!--
<script type="text/javascript">
	jQuery(".slider .bd li").first().before( jQuery(".slider .bd li").last() );
	jQuery(".slider").hover(function(){
	 jQuery(this).find(".arw").stop(true,true).fadeIn(300) 
	 },function(){ 
	 	jQuery(this).find(".arw").fadeOut(300) });				
	 jQuery(".slider").slide(
	 	{ titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop",autoPlay:true, vis:3,autoPage:true, trigger:"click"}
	);
</script>
-->

</html>


