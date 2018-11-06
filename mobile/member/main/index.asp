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
	<!--#include virtual="/mobile/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobile/common/menu/top_all_menu.asp"-->	
        </div>
        <div id="mnav" class="menu">
			<!--#include virtual="/mobile/common/menu/sub_menu.asp"-->	
        </div>
	    <div id="mslide" class="slider">
  			<div class="bd">
   				<ul>
      				<li><a target="_blank" href="#"><img src="/mobile/html/images/mslide1.jpg" alt=""/></a></li>  
      				<li><a target="_blank" href="#"><img src="/mobile/html/images/mslide2.jpg" alt=""/></a></li>
      				<li><a target="_blank" href="#"><img src="/mobile/html/images/mslide3.jpg" alt=""/></a></li>
    			</ul>
  			</div>
  			<div class="hd">
            	<ul></ul>
  			</div>
  			<div class="pnBtn prev"> <span class="blackBg"></span> <a class="arw" href="javascript:void(0)"></a> </div>
  			<div class="pnBtn next"> <span class="blackBg"></span> <a class="arw" href="javascript:void(0)"></a> </div>
		</div>
      <!--  /*#conmm1 img{width:180px; height:126px;} #conmm2 img{width:90px;height:126px;} #conmm3 img{width:90px;height:63px;} 
#conmm5 img{width:90px; height:126px;} #conmm6 img{width:90px; height:126px;} #conmm7 img{width:90px; height:126px;}   #conmm8 img{width:90px;height:63px;}
#conmm9{width:360px;position:relative;}*/-->



		<div id="mcontainer">
            <ul>
            	<li id="conmm1" class="mcon0"><a href="/mobile/service/service_03.asp?menuCode1=30000&menuCode2=B"><img src="/mobile/html/images/mm1.jpg" width="180px" height="118px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a>
                </li>
                <li id="conmm2" class="mcon1"><a href="/mobile/service/service_01.asp?menuCode1=30000&menuCode2=A"><img src="/mobile/html/images/mm2.jpg"  width="90px" height="118px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a>
                </li>
                <li id="conmm3" class="mcon1">
                	<ul>
                    	<li><a href="/mobile/board/board_01.asp"><img src="/mobile/html/images/mm3.jpg"  width="90px" height="59px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                        <li><a href="/mobile/board/board_02.asp"><img src="/mobile/html/images/mm4.jpg"  width="90px" height="59px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>	
                    </ul>
                </li>
            </ul> 
            <ul>
            	 <li id="conmm5" class="mcon2"><a href="/mobile/board/board_05.asp"><img src="/mobile/html/images/mm5.jpg"  width="90px" height="118px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm6" class="mcon2"><a href="/mobile/comp/comp.asp?menuCode1=20000&menuCode2=H"><img src="/mobile/html/images/mm6.jpg"  width="90px" height="118px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm7" class="mcon2"><a href="/mobile/info/info_02.asp?menuCode1=40000&menuCode2=B"><img src="/mobile/html/images/mm7.jpg"  width="90px" height="118px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                 <li id="conmm8" class="mcon2">
                 	<ul>
                    	<li><a href="tel:025573579"><img src="/mobile/html/images/mm8.jpg"  width="90px" height="59px" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>
                        <li><a href="/mobile/board/board_03.asp"><img src="/mobile/html/images/mm9.jpg" width="90px" height="59px"  "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" alt=""/></a></li>	
                    </ul>
            </ul>
            <ul>
            	<li id="conmm9"><img src="/mobile/html/images/mm10.jpg" width="360px"  /></a></li>
            </ul>
        </div>
		 <!--#include virtual="/mobile/common/menu/foot_menu.asp"-->	 
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
	jQuery(".slider .bd li").first().before( jQuery(".slider .bd li").last() );
	jQuery(".slider").hover(function(){
	 jQuery(this).find(".arw").stop(true,true).fadeIn(300) 
	 },function(){ 
	 	jQuery(this).find(".arw").fadeOut(300) });				
	 jQuery(".slider").slide(
	 	{ titCell:".hd ul", mainCell:".bd ul", effect:"leftLoop",autoPlay:true, vis:3,autoPage:true, trigger:"click"}
	);
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
</html>


