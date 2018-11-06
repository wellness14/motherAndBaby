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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#map_info_01 .area-name").each(function(i) {
				$(this).click(function() {
					$("#map_info_01 .area-content:eq(" + i + ")").toggle();
				}).css("cursor", "pointer");
			});
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar" style="background-color:#ffffff;position:fixed; z-index:1;">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/main/nav.asp"--></span>
			<h2 class="top_title"><span style="color:#ed587a;background-color:#ffffff;position:relatvie; z-index:0;">지사</span></span><span style="color:#919194;">안내<img src="/mobileweb/html/images/menu_bar_02.png"  class="mini_menu"alt=""/></span></h2>
			<span class="btn-right"><img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/></span>
		</div>
	</header>
	
	<!-- <hr id="p_hr1" /> -->

	<div id="container" class="">
		
		<div id="map_info_01">
			<div id="main_txt_03">
				<p class="main_txt_03_01">마더앤베이비의</p>
				<p class="main_txt_03_02">한눈에보는 지사안내 입니다</p>

				 <table style="width:100%;" height="auto;" style=" background-color:#ffffff; border-spacing:2px;border-collapse:separate;" class="area-name">
					<tr id="map_name">
						<th class="map_name_01" >서울&nbsp; ▼</th>
					</tr>
				</table>
			</div>

			<div id="map" class="area-content">
				<table height="auto;"  style=" width:640px; background-color:#fefefe; border-spacing:2px; border-collapse: collapse; border-top: 2px solid #ef4e6f;" >
					<tr id="map_01">
						<th id="map_area" colspan="3">강남지역</th>
						<td class="big" ><span class="detail">자세히 보기</span></td>
					</tr>
					<tr id="adr">
						<td class="adress_info" >주소</td>
						<td class="adress"colspan="2">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
						<td class="social" >
						<img src="/comp/mapnavi/img/social_link_facebook.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_twitter.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_kakao.png" class="social_icon" style="width:20px;">
						</td>
					</tr>

					<tr id="time">
						<td id="call_number" >전화번호</td>
						<td class="call_number"><img src="/mobileweb/html/images/small_call.png" class="call_number_icon"style="width:20px; margin-right:5px;">02-557-3579</td>
						<td class="time_info">상담시간</td>
						<td class="time">AM09:00-PM06:00</td>
					</tr>
				</table>

				<table width="100%" height="auto;"  style=" background-color:#fefefe; border-spacing:2px; border-collapse: collapse; border-top: 2px solid #ef4e6f;" >
					
					<tr id="map_01">
						<th id="map_area" colspan="3">강동지역</th>
						<td class="big" ><span class="detail">자세히 보기</span></td>
					</tr>
					

					<tr id="adr">
						<td class="adress_info" >주소</td>
						<td class="adress"colspan="2">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
						<td class="social" >
						<img src="/comp/mapnavi/img/social_link_facebook.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_twitter.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_kakao.png" class="social_icon" style="width:20px;">
						</td>
					</tr>

					<tr id="time">
						<td class="call_number" >전화번호</td>
						<td class="call_number"><img src="/mobileweb/html/images/small_call.png" class="call_number_icon"style="width:20px; margin-right:5px;">02-557-3579</td>
						<td class="time_info">상담시간</td>
						<td class="time">AM09:00-PM06:00</td>
						
						
					</tr>
					</table>
			</div>

			<div id="main_txt_03">
				 <table style="width:100%;" height="auto;" style=" background-color:#ffffff; border-spacing:2px;border-collapse:separate;" class="area-name">
					<tr id="map_name">
						<th class="map_name_01" >경기&nbsp; ▼</th>
					</tr>
				</table>
			</div>

			<div id="map" class="area-content">
				<table height="auto;"  style=" width:640px; background-color:#fefefe; border-spacing:2px; border-collapse: collapse; border-top: 2px solid #ef4e6f;" >
					<tr id="map_01">
						<th id="map_area" colspan="3">강남지역</th>
						<td class="big" ><span class="detail">자세히 보기</span></td>
					</tr>
					<tr id="adr">
						<td class="adress_info" >주소</td>
						<td class="adress"colspan="2">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
						<td class="social" >
						<img src="/comp/mapnavi/img/social_link_facebook.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_twitter.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_kakao.png" class="social_icon" style="width:20px;">
						</td>
					</tr>

					<tr id="time">
						<td id="call_number" >전화번호</td>
						<td class="call_number"><img src="/mobileweb/html/images/small_call.png" class="call_number_icon"style="width:20px; margin-right:5px;">02-557-3579</td>
						<td class="time_info">상담시간</td>
						<td class="time">AM09:00-PM06:00</td>
					</tr>
				</table>

				<table width="100%" height="auto;"  style=" background-color:#fefefe; border-spacing:2px; border-collapse: collapse; border-top: 2px solid #ef4e6f;" >
					
					<tr id="map_01">
						<th id="map_area" colspan="3">강동지역</th>
						<td class="big" ><span class="detail">자세히 보기</span></td>
					</tr>
					

					<tr id="adr">
						<td class="adress_info" >주소</td>
						<td class="adress"colspan="2">서울특별시 강남구 역삼동 736-38 혜림빌딩 3층 마더앤베이비</td>
						<td class="social" >
						<img src="/comp/mapnavi/img/social_link_facebook.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_twitter.png" class="social_icon" style="width:20px;">
						<img src="/comp/mapnavi/img/social_link_kakao.png" class="social_icon" style="width:20px;">
						</td>
					</tr>

					<tr id="time">
						<td class="call_number" >전화번호</td>
						<td class="call_number"><img src="/mobileweb/html/images/small_call.png" class="call_number_icon"style="width:20px; margin-right:5px;">02-557-3579</td>
						<td class="time_info">상담시간</td>
						<td class="time">AM09:00-PM06:00</td>
						
						
					</tr>
					</table>
			</div>
		</div>
		
	</div>

	<div id="footer" style="margin-top:80px;">
		<ul class="btn-grp">
			<li class="mr30">로그인</li>
			<li class="mr30">회원가입</li>
			<li>PC버전</li>
		</ul>

		<div class="posts-list">
			<p>서비스 이용약관 | <strong>개인정보취급방침</strong></p>
			<p>웰니스인텔리전스(주) | 사업자번호 220-88-73478</p>
		</div>
		<div class="Copyright">Copyright© 2015<span style="color:#ed587a;"> mother&baby.</span> All right reserved</div>
	</div>
</div>




</body>
<script src="css/leftmenu.js"></script>

</html>
