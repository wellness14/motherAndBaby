<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
				<span style="color:#ed587a;">산후케어</span><span style="color:#919194;">서비스</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right"><a href="tel:025573579"><img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/></a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<img src="/mobileweb/html/images/program_07.jpg"usemap="#program_07" border="0" />

		<map name="program_07" id="program_07">
		  <area shape="rect" coords="350,3584,458,3629" href="http://www.mothernbaby.co.kr/mobileweb/ver_02/info_01.asp" />
		  <area shape="rect" coords="469,3584,579,3629" href="tel:025573579" />
		</map>

		<!-- <ul class="care-service-btn">
			<a href="board_03.asp"><li class="mr30">1:1상담</li></a>
			<a href="tel:025573579"><li>전화하기</li></a>
		</ul> -->
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>