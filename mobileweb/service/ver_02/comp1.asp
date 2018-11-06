<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "20000" 
	If menuCode2 = "" Then menuCode2 = "A"

	If menuCode2 = "A" Then 
	   bodyimg = "sub11.jpg"
	   tit = ""
	ElseIf menuCode2 = "B" Then 
	   bodyimg = "sub12_01.jpg"
	   bodyimg2 = "sub12_02.jpg"
	   bodyimg3 = "sub12_03.jpg"
	   tit = "<span style=""color:#ed587a;"">트리니티케어</span><span style=""color:#919194;"">시스템</span>"
	ElseIf menuCode2 = "C" Then 
	   bodyimg = "sub13_01.jpg" 
	   tit = "<span style=""color:#ed587a;"">전담간호사의</span><span style=""color:#919194;"">역할</span>"
	ElseIf menuCode2 = "D" Then 
	   bodyimg = "sub14_01.jpg" 
	   tit = "<span style=""color:#ed587a;"">산후관리사가</span><span style=""color:#919194;"">하는일</span>"
	ElseIf menuCode2 = "E" Then 
	   bodyimg = "sub15_01.jpg" 
	   tit = ""
	ElseIf menuCode2 = "F" Then 
	   bodyimg = "sub16_01.jpg" 
	   tit = ""
	ElseIf menuCode2 = "H" Then 
	   bodyimg = "sub18_01.jpg" 
	   tit = ""
	End If
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".sub-drop-menu").toggle();
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<div class="sub-drop-menu">
		<ul>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=B">트리니티케어 시스템</a><span class="sub-drop-menu-check"><img src="/mobileweb/html/images/check.png" border="0" /></span></li>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=C">전담간호사의 역할</a></li>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=D">산후관리사가 하는 일</a></li>
			<li><a href="map_info_v02.asp">지역별 지사 안내</a></li>
			<li><a href="app_info.asp">어플리케이션 안내</a></li>
			<li>&nbsp;</li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>

	<div id="container" class="p10">
		<% If menuCode2 = "B" Then %>
			<img src="/mobileweb/html/images/<%=bodyimg%>" border="0" />

			<div style="position:relative; width:100%; margin-top:30px;">
				<div style="position:absolute; right:30%;"><a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/info_01.asp"><img src="/mobileweb/html/images/1vs1.png" style="width:90%" border="0" /></a></div>
				<div style="position:absolute; right:15%;"><a href="tel:025573579"><img src="/mobileweb/html/images/R_call.png"style="width:90%" border="0" /></a></div>
				<img src="/mobileweb/html/images/<%=bodyimg2%>" border="0" />
			</div>

			<div style="position:relative; width:100%; margin-top:30px;">
				<div style="position:absolute; right:30%;"><a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/info_01.asp"><img src="/mobileweb/html/images/1vs1.png" style="width:90%"border="0" /></a></div>
				<div style="position:absolute; right:15%;"><a href="tel:025573579"><img src="/mobileweb/html/images/R_call.png"style="width:90%" border="0" /></a></div>
				<img src="/mobileweb/html/images/<%=bodyimg3%>" border="0" />
			</div>
		<% Else %>
			<img src="/mobileweb/html/images/<%=bodyimg%>" border="0" />
		<% End If %>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>