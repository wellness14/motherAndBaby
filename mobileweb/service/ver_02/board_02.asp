<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "50000"
	If menuCode2 = "" Then menuCode2 = "B"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript" src="/mobileweb/common/js/common.js"></script>
	<script src="js/jquery.rwdImageMaps.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('img[usemap]').rwdImageMaps();
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">FAQ</span> <span style="color:#919194;"></span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div class="mt20"></div>

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
		<!-- <table border="0" align="left" cellpadding="0" cellspacing="0">
			<!-- <tr>
				<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub04_subtitle02.jpg" /></td>
			</tr> --
			<tr>
				<td>
				<img src="/mobileweb/html/images/text_0034.jpg" border="0" usemap="#faq_map" />
				<map name="faq_map">
					<area shape="rect" coords="26,148,357,206" href="board_03.asp" />
				</map>
				</td>
			</tr>
		</table> -->
		<div>
			<img src="/mobileweb/html/images/text_0034.jpg" border="0" usemap="#faq_map" />
			<map name="faq_map">
				<area shape="rect" coords="26,148,357,206" href="board_03.asp" />
			</map>
		</div>
		<p style="margin-top:10px;"></p>
		<!-- <div style="text-align:left;">
			<img src="/mobileweb/html/images/bt_0007_on.jpg" class="main_tab"  style="cursor:pointer; cursor:hand; border:0;" />
			<img src="/mobileweb/html/images/bt_0008_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" />
			<img src="/mobileweb/html/images/bt_0009_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" />
			<img src="/mobileweb/html/images/bt_0010_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" />
		</div>
		<div style="height:4px; background:#a3cb36">
			&nbsp;
		</div> -->
		
		<table border="0" align="left" cellpadding="0" cellspacing="0">
			<tr>
				<td><img src="/mobileweb/html/images/bt_0007_on.jpg" class="main_tab"  style="cursor:pointer; cursor:hand; border:0;" /></td>
				<td><img src="/mobileweb/html/images/bt_0008_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" /></td>
				<td><img src="/mobileweb/html/images/bt_0009_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" /></td>
				<td><img src="/mobileweb/html/images/bt_0010_off.jpg" class="main_tab" style="cursor:pointer; cursor:hand; border:0;" /></td>
			</tr>
			<tr>
				<td height="4" colspan="4" bgcolor="#a3cb36"></td>
			</tr>
		</table>
		<br/><br/><br/>
		<div id="Area"></div>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

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

</html>