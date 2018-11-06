<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "50000" 
If menuCode2 = "" Then menuCode2 = "B"

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
<%
	idx = fncRequest("idx")
	intType = fncRequest("type")

	Select Case intType
		Case "예약및결제" : intNum = 0
		Case "서비스" : intNum = 1
		Case "정부지원 바우처" : intNum = 2
		Case "기타" : intNum = 3
	End Select 

	If intNum = "" Then intNum = 0
%>
        <div id="mcontainer">
        	<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub04_subtitle02.jpg" width="360" /></td>
			</tr>
			<tr>
				<td><img src="/mobileweb/html/images/text_0034.jpg" width="360" border="0" usemap="#faq" /></td>
			</tr>
			</table>
			<p style="margin-top:10px;">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="90"><img src="/mobileweb/html/images/bt_0007_on.jpg" class="main_tab"  style="cursor:pointer; cursor:hand; width:90px; " /></td>
				<td width="90"><img src="/mobileweb/html/images/bt_0008_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; width:90px; border:0;" /></td>
				<td width="90"><img src="/mobileweb/html/images/bt_0009_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; width:90px; border:0;" /></td>
				<td width="90"><img src="/mobileweb/html/images/bt_0010_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; width:90px; border:0;" /></td>
			</tr>
			<tr>
				<td height="4" colspan="4" bgcolor="#a3cb36"><spacer type="block"></td>
			</tr>
			</table>
			
			<div id="Area"></div>
			<p style="margin-top:50px;">
		</td>
	</tr>
	</table>
        </div>
		<!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
	</div> 
<map name="faq" id="faq">
<area shape="rect" coords="11,67,167,98" href="/mobileweb/board/board_03.asp" /></map>
</body>
<script type="text/javascript">
	var main_tab = jQuery('.main_tab');

	function fncSetImg(num){
		jQuery.get("./board_02_ax.asp",{"type":num, "idx":"<%=idx%>"},function(data,testStatus){
			if (data != ""){
				jQuery("#Area").html(data);
			}
		});
	}

	jQuery(document).ready(function(){
		main_tab.click(function(){
			num = main_tab.index(this);
			fncSetTab(main_tab,num)
		});

		main_tab.eq("<%=intNum%>").click();
	});
</script>
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