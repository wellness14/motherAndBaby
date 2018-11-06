<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "40000" 
If menuCode2 = "" Then menuCode2 = "A"

%> 
<!DOCTYPE html>
<html>
<head>
	<!--#include virtual="/mobileweb/common/menu/top_head.asp"-->

</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
		</div>
        <!----------------------------------------- 본문 ----------------------------------------->
        <div id="mcontainer">
        	<ul>
				
				<% If menuCode2 = "B" Then %>
				<li><img src="/mobileweb/html/images/sub32.jpg" width="360px" border="0" ></li>
                <% ElseIf menuCode2 = "C" Then %>
				<li><img src="/mobileweb/html/images/sub34.jpg" width="360px" border="0" ></li>
                <% ElseIf menuCode2="D" Then %>
				<li><img src="/mobileweb/html/images/sub34.jpg" width="360px" border="0" ></li>
				<% ElseIf menuCode2="E" Then %>
				<li><img src="/mobileweb/html/images/sub35.jpg" width="360px" border="0" ></li>
				<% ElseIf menuCode2="F" Then %>
				<li><img src="/mobileweb/html/images/sub36.jpg" width="360px" border="0" ></li>
				<% End if%>
            </ul>
        </div>
      <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
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
			marginTop:"75px"       
		}, 0 );	
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
</html> 