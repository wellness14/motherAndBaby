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
	   bodyimg2 = "sub12_02.jpg?ver=0"
	   bodyimg3 = "sub12_03.jpg?ver=0"
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
			<!-- <span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span> -->
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10" style="margin-top:41px;">
		<% If menuCode2 = "B" Then %>
			<img src="/mobileweb/html/images/<%=bodyimg%>" border="0" />

			<div style="position:relative; width:100%; margin-top:30px;">
				<div style="position:absolute; right:30%;"><a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/info_01.asp"><img src="/mobileweb/html/images/1vs1.png" style="width:90%" border="0" /></a></div>
				<div style="position:absolute; right:15%;"><a href="javacript:;" onclick="callClick('02-557-3579');"><img src="/mobileweb/html/images/R_call.png"style="width:90%" border="0" /></a></div>
				<img src="/mobileweb/html/images/<%=bodyimg2%>" border="0" />
			</div>

			<div style="position:relative; width:100%; margin-top:30px;">
				<div style="position:absolute; right:30%;"><a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/info_01.asp"><img src="/mobileweb/html/images/1vs1.png" style="width:90%"border="0" /></a></div>
				<div style="position:absolute; right:15%;"><a href="javacript:;" onclick="callClick('02-557-3579');"><img src="/mobileweb/html/images/R_call.png"style="width:90%" border="0" /></a></div>
				<img src="/mobileweb/html/images/<%=bodyimg3%>" border="0" />
			</div>
		<% Else %>
			<img src="/mobileweb/html/images/<%=bodyimg%>" border="0" />
		<% End If %>

		<% If menuCode2 = "B" Then %>
			<div id="nextBtn" onclick="window.location.href = 'comp.asp?menuCode1=20000&menuCode2=C'" style="cursor:pointer;">
				전담간호사의역할 보러가기 &gt;
			</div>
		<% ElseIf menuCode2 = "C" Then %>
			<div id="nextBtn" onclick="window.location.href = 'comp.asp?menuCode1=20000&menuCode2=D'" style="cursor:pointer;">
				산후관리사가하는일 보러가기 &gt;
			</div>
		<% ElseIf menuCode2 = "D" Then %>
			<div id="nextBtn" onclick="window.location.href = 'comp.asp?menuCode1=20000&menuCode2=B'" style="cursor:pointer;">
				트리니티케어시스템 보러가기 &gt;
			</div>
		<% End If %>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>