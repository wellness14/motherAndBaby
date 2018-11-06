<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "40000" 
	If menuCode2 = "" Then menuCode2 = "A"

	If menuCode2 = "B" Then 
		bodyimg = "sub32_01.jpg" 
		tit = "<span style=""color:#ed587a;"">예약/결제</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "C" Then 
		bodyimg = "sub34_01.jpg" 
		tit = "<span style=""color:#ed587a;"">예약취소/환불</span><span style=""color:#919194;"">규정</span>"
	ElseIf menuCode2 = "D" Then 
		bodyimg = "sub34.jpg" 
		tit = "<span style=""color:#ed587a;"">정부지원사업</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "E" Then 
		bodyimg = "sub35_01.jpg" 
		tit = "<span style=""color:#ed587a;"">서비스용품</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "F" Then 
		bodyimg = "sub36.jpg" 
		tit = "<span style=""color:#ed587a;"">출산선물</span><span style=""color:#919194;"">안내</span>"
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
	<script src="js/jquery.rwdImageMaps.min.js"></script>
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
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right"><a href="/mobileweb/ver_02/map_info_v02.asp"><img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/></a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<img src="/mobileweb/html/images/<%=bodyimg%>" border="0"  usemap="#gift_link"/>

		<map name="gift_link" id="gift_link">
		  <area shape="rect" coords="71,1689,545,1740" href="http://momnshop.com/shop/goods/goods_list.php?&category=005002" target="new"/>
		  <area shape="rect" coords="3,2935,622,3056" href="http://momnshop.com/shop/goods/goods_list.php?&category=005003" target="new"/>
		  <area shape="rect" coords="3,4234,622,4334" href="http://momnshop.com/shop/goods/goods_list.php?&category=005004" target="new"/>
		  <area shape="rect" coords="3,5270,622,5523" href="http://momnshop.com/shop/goods/goods_list.php?&category=005005" target="new"/>
		</map>

	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>
