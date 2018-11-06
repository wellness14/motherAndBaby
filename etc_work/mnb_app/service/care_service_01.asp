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
    <link href="../leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script src="js/leftmenu.js"></script>
	<script type="text/javascript">
	//	$(document).ready(function() {
	//		$('img[usemap]').rwdImageMaps();
	//	});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back">  <!-- #include virtual = "/etc_work/mnb_app/nav.asp"--> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">산후케어</span><span style="color:#919194;">서비스</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right"><a href="tel:025573579"><img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/></a></span>
		</div>
	</header>

 

	<div id="container" class="p10">
		<img src="/mobileweb/html/images/program_01.jpg" usemap="#care_service_01" border="0">
		
		<map name="care_service_01" id="care_service_01">
		  <area shape="rect" coords="333,2283,445,2324" href="../service_request.asp" />
		  <area shape="rect" coords="460,2286,567,2325" href="tel:025573579" />
		</map>

		<!-- <ul class="care-service-btn">
			<a href="board_03.asp"><li class="mr30">1:1상담</li></a>
			<a href="tel:025573579"><li>전화하기</li></a>
		</ul> -->
	</div>

 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
</div>

</body>

</html>