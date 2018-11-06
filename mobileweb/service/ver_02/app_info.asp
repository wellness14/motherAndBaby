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
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$(".dwn-grp li:eq(1)").click(function() {
				alert("준비 중 입니다.");
				return false;
			}).css("cursor", "pointer");
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">어플리케이션</span><span style="color:#919194;">안내</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="">
		<div id="app_info">
		    <p style="margin-top:40px;"><img src="/mobileweb/html/images/simbol.png"></p>
			<p style="font-size:20px; margin-top:40px;"><strong>최초의 스마트 산후조리관리서비스</strong> </p>
			<p style="font-size:15px;">마더앤베이비의새로운 산후조리서비스를<br>경험해보세요 </p>
			<p style="margin-top:50px; color:#2c2c2c;"><strong>사람이 곧 서비스 입니다.</strong></p>
		</div>

		<ul class="dwn-grp">
			<li><a href="https://play.google.com/store/apps/details?id=kr.co.mothernbaby.m.mothernbaby"><img src="/mobileweb/html/images/google.png"/></a></li>
			<li><img src="/mobileweb/html/images/apple.png"/></li>
		</ul>

		<div id="app_info">
			<p style="font-size:50px; margin-top:100px; color:#ef4e6f;"><strong>Application</strong> </p>
			<p style="font-size:30px; margin-top:50px;">주요기능소개 </p>
			<p style="font-size:20px;color:#2c2c2c;margin-top:15px;">고객님의 주요 서비스일정 안내를<br>한눈에알아볼 수 있도록<br>일정카드 의 형태로 알려드립니다. </p>
			<p style="margin-top:10px;"><img src="/mobileweb/html/images/app_ex_01.png"style="width:70%;" /></p>
		</div>

		<div id="app_info">
			<p style="font-size:30px; margin-top:100px;color:#ef4e6f;"><strong>언제든 문의주세요.</strong> </p>
			<p style="font-size:20px; margin-top:15px; color:#2c2c2c;">긴급상담, 1:1상담 을 제공합니다. </p>
			<p style="margin-top:10px;"><img src="/mobileweb/html/images/app_ex_02.png" style="width:70%;" /><img src="/mobileweb/html/images/app_ex_03.png" style="width:70%;margin-top:10%"/></p>
		</div>

		<div id="app_info">
			<p style="font-size:30px; margin-top:100px;color:#ef4e6f;"><strong>보증합니다.</strong> </p>
			<p style="font-size:20px; margin-top:15px; color:#2c2c2c;">마더앤베이비가 보증하는<br> 산후도우미가 고객님을 찾아갑니다. </p>
			<p style="margin-top:10px;"><img src="/mobileweb/html/images/app_ex_04.png" style="width:70%;"/></p>
		</div>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>
