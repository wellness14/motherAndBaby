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
	<script type="text/javascript">
		$(document).ready(function() {
//			$("#map_info_01 .detail_btn").each(function(i) {
//				$(this).click(function() {
//					$("#map_info_01 .detail_tr1:eq(" + i + ")").toggle();
//					$("#map_info_01 .detail_tr2:eq(" + i + ")").toggle();
//				}).css("cursor", "pointer");
//			});
			$("#map_info_01 .detail_btn").each(function(i) {
				$(this).click(function() {
					$("#map_info_01 .map_tb:eq(" + i + ") .detail_tr1").toggle();
					$("#map_info_01 .map_tb:eq(" + i + ") .detail_tr2").toggle();
				}).css("cursor", "pointer");
			});
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">경기지사</span><span style="color:#919194;">안내</span>
				<img src="/mobileweb/html/images/menu_bar_02.png"  class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;background-color: #3498db;"><a href="/mobileweb/ver_02/info_01.asp">
				상담
			</a></span>
		</div>
	</header>
	
	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">

		<div id="map_info_01">
			<div id="main_txt_03">
				<p class="main_txt_03_01">마더앤베이비의</p>
				<p class="main_txt_03_02">한눈에보는 지사안내 입니다</p>
			</div>
<%
				Dim cnt
				cnt = 24
				ReDim area(cnt), area_addr(cnt), area_tel(cnt), area_time(cnt), area_detail_img(cnt), area_detail1(cnt), area_detail2(cnt), area_detail3(cnt), area_detail4(cnt)				

				area(0) = "고양·일산지사"
				area_addr(0) = "경기도 고양시 일산동구 백석로 11번길 7-12 1층 101호"
				area_tel(0) = "031-903-3578 "
				area_time(0) = "AM 09:00 ~ PM 06:00"
				area_detail2(0) = " 031-908-3578"
				area_detail3(0) = "국민은행 469901-04-215774<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"
				area_detail4(0) = "국민은행 194601-04-243316<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"

				area(1) = "과천지사"
				area_addr(1) = "경기도 안양시 만안구 경수대로 1203번길 동보빌딩 202호 (석수동)"
				area_tel(1) = "031-471-3590 "
				area_time(1) = "AM 09:00 ~ PM 06:00"
				area_detail2(1) = " 031-471-3590"
				area_detail3(1) = "하나은행 484-910330-68307 송병임"
				area_detail4(1) = "하나은행 484-910011-74904 송병임(마더앤베이비)"

				area(2) = "광명지역"
				area_addr(2) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(2) = "02-557-3579"
				area_time(2) = "AM 09:00 ~ PM 06:00"
				area_detail2(2) = " 02-557-3576"
				area_detail3(2) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(2) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(3) = "광주지역"
				area_addr(3) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(3) = "02-557-3579"
				area_time(3) = "AM 09:00 ~ PM 06:00"
				area_detail2(3) = " 02-557-3576"
				area_detail3(3) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(3) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(4) = "구리지사"
				area_addr(4) = "경기도 남양주시 별내면 청학리 418 청학스파빌 4층 429호 마더앤베이비 구리 남양주"
				area_tel(4) = "031-844-3579"
				area_time(4) = "AM 09:00 ~ PM 06:00"
				area_detail2(4) = " 031-843-3579"
				area_detail3(4) = "우리은행 1005-603-174176<br/>예금주 김용원 (마더앤베이비 구리·남양주)"
				area_detail4(4) = "농협 351-0992-8904-73<br/>예금주 김용원 (마더앤베이비 구리·남양주)"

				area(5) = "군포지사"
				area_addr(5) = "경기도 안양시 만안구 경수대로 1203번길 동보빌딩 202호 (석수동)"
				area_tel(5) = "031-471-3590 "
				area_time(5) = "AM 09:00 ~ PM 06:00"
				area_detail2(5) = " 031-471-3590"
				area_detail3(5) = "하나은행 484-910330-68307 송병임"
				area_detail4(5) = "하나은행 484-910011-74904 송병임(마더앤베이비)"

				area(6) = "김포지사"
				area_addr(6) = "경기도 고양시 일산동구 백석로 11번길 7-12 1층 101호"
				area_tel(6) = "031-903-3578 "
				area_time(6) = "AM 09:00 ~ PM 06:00"
				area_detail2(6) = " 031-908-3578"
				area_detail3(6) = "국민은행 469901-04-215774<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"
				area_detail4(6) = "국민은행 194601-04-243316<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"

				area(7) = "남양주지사"
				area_addr(7) = "경기도 남양주시 별내면 청학리 418 청학스파빌 4층 429호 마더앤베이비 구리 남양주"
				area_tel(7) = "031-844-3579"
				area_time(7) = "AM 09:00 ~ PM 06:00"
				area_detail2(7) = " 031-843-3579"
				area_detail3(7) = "우리은행 1005-603-174176<br/>예금주 김용원 (마더앤베이비 구리·남양주)"
				area_detail4(7) = "농협 351-0992-8904-73<br/>예금주 김용원 (마더앤베이비 구리·남양주)"

				area(8) = "동두천지사"
				area_addr(8) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(8) = "02-557-3579 "
				area_time(8) = "AM 09:00 ~ PM 06:00"
				area_detail2(8) = "031-851-3511"
				area_detail3(8) = "국민은행 378802-01-338658<br/>예금주 서동필(마더앤베이비의정부·양주·동두천·포천·연천)"
				area_detail4(8) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(9) = "부천지역"
				area_addr(9) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(9) = "02-557-3579"
				area_time(9) = "AM 09:00 ~ PM 06:00"
				area_detail2(9) = " 02-851-3576"
				area_detail3(9) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(9) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(10) = "성남지역"
				area_addr(10) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(10) = "02-557-3579"
				area_time(10) = "AM 09:00 ~ PM 06:00"
				area_detail2(10) = " 02-557-3576"
				area_detail3(10) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(10) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(11) = "수원지사"
				area_addr(11) = "경기도 수원시 영통구 영통동 963-2 신나무실 신안아파트 지하상가 마더앤베이비"
				area_tel(11) = "031-206-3578  "
				area_time(11) = "AM 09:00 ~ PM 06:00"
				area_detail2(11) = " 031-206-3577"
				area_detail3(11) = "신한은행 110-250-834-034<br/>예금주 이인선(마더앤베이비 수원지사)"
				area_detail4(11) = "신한은행 110-487-539479<br/>예금주 이인선(마더앤베이비 수원지사)"

				area(12) = "시흥지역"
				area_addr(12) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(12) = "02-557-3579"
				area_time(12) = "AM 09:00 ~ PM 06:00"
				area_detail2(12) = " 02-557-3576"
				area_detail3(12) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(12) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(13) = "안산지역"
				area_addr(13) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(13) = "02-557-3579"
				area_time(13) = "AM 09:00 ~ PM 06:00"
				area_detail2(13) = " 02-557-3576"
				area_detail3(13) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(13) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(14) = "안양지사"
				area_addr(14) = "경기도 안양시 만안구 경수대로 1203번길 동보빌딩 202호 (석수동)"
				area_tel(14) = "031-471-3590 "
				area_time(14) = "AM 09:00 ~ PM 06:00"
				area_detail2(14) = " 031-471-3590"
				area_detail3(14) = "하나은행 484-910330-68307 송병임"
				area_detail4(14) = "하나은행 484-910011-74904 송병임(마더앤베이비)"

				area(15) = "양주지역"
				area_addr(15) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(15) = "02-557-3579 "
				area_time(15) = "AM 09:00 ~ PM 06:00"
				area_detail2(15) = " 031-851-3511"
				area_detail3(15) = "국민은행 378802-01-338658<br/>예금주 서동필(마더앤베이비의정부·양주·동두천·포천·연천)"
				area_detail4(15) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(16) = "양평지역"
				area_addr(16) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(16) = "02-557-3579"
				area_time(16) = "AM 09:00 ~ PM 06:00"
				area_detail2(16) = " 02-557-3576"
				area_detail3(16) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(16) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(17) = "용인지역"
				area_addr(17) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(17) = "02-557-3579"
				area_time(17) = "AM 09:00 ~ PM 06:00"
				area_detail2(17) = " 02-557-3576"
				area_detail3(17) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(17) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"


				area(18) = "의왕지사"
				area_addr(18) = "경기도 안양시 만안구 경수대로 1203번길 동보빌딩 202호 (석수동)"
				area_tel(18) = "031-471-3590 "
				area_time(18) = "AM 09:00 ~ PM 06:00"
				area_detail2(18) = " 031-471-3590"
				area_detail3(18) = "하나은행 484-910330-68307 송병임"
				area_detail4(18) = "하나은행 484-910011-74904 송병임(마더앤베이비)"

				area(19) = "의정부지점"
				area_addr(19) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(19) = "02-557-3579 "
				area_time(19) = "AM 09:00 ~ PM 06:00"
				area_detail2(19) = " 031-851-3511"
				area_detail3(19) = "국민은행 378802-01-338658<br/>예금주 서동필(마더앤베이비의정부·양주·동두천·포천·연천)"
				area_detail4(19) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(20) = "연천지점"
				area_addr(20) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(20) = "02-557-3579 "
				area_time(20) = "AM 09:00 ~ PM 06:00"
				area_detail2(20) = " 031-851-3511"
				area_detail3(20) = "국민은행 378802-01-338658<br/>예금주 서동필(마더앤베이비의정부·양주·동두천·포천·연천)"
				area_detail4(20) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(21) = "파주지사"
				area_addr(21) = "경기도 고양시 일산동구 백석로 11번길 7-12 1층 101호"
				area_tel(21) = "031-903-3578 "
				area_time(21) = "AM 09:00 ~ PM 06:00"
				area_detail2(21) = " 031-908-3578"
				area_detail3(21) = "국민은행 469901-04-215774<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"
				area_detail4(21) = "국민은행 194601-04-243316<br/>예금주 김나현(마더앤베이비고양·일산·파주·김포)"

				area(22) = "포천지점"
				area_addr(22) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(22) = "02-557-3579 "
				area_time(22) = "AM 09:00 ~ PM 06:00"
				area_detail2(22) = " 031-851-3511"
				area_detail3(22) = "국민은행 378802-01-338658<br/>예금주 서동필(마더앤베이비의정부·양주·동두천·포천·연천)"
				area_detail4(22) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(23) = "하남지역"
				area_addr(23) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(23) = "02-557-3579"
				area_time(23) = "AM 09:00 ~ PM 06:00"
				area_detail2(23) = " 02-557-3576"
				area_detail3(23) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(23) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(24) = "화성지역"
				area_addr(24) = "서울특별시 강남구 선릉로120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(24) = "02-557-3579"
				area_time(24) = "AM 09:00 ~ PM 06:00"
				area_detail2(24) = " 02-557-3576"
				area_detail3(24) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(24) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"







				For i = 0 To cnt
			%>
				<table class="map_tb">
					<colgroup>
						<col width="25%" />
						<col width="75%" />
					</colgroup>
					<tr id="map_01" >
						<th class="map_area"><%=area(i)%></th>
						<td class="big"><span class="detail_btn">자세히 보기</span></td>
					</tr>
					<tr>
						<td class="adress_info">주소</td>
						<td class="adress"><%=area_addr(i)%></td>
					</tr>
					<tr>
						<td class="call_info">전화번호</td>
						<td class="call">
							<img src="/mobileweb/html/images/small_call.png" class="call_number_icon"><%=area_tel(i)%> 
							<a href="javascript:;" onclick="callClick('<%=area_tel(i)%>');">전화걸기</a>
						</td>
					</tr>
					<tr>
						<td class="time_info">상담시간</td>
						<td class="time"><%=area_time(i)%></td>
					</tr>
					<tr class="detail_tr1">
						<td class="detail2_info">FAX</td>
						<td class="detail2"><%=area_detail2(i)%></td>
					</tr>
					<%
						trCls="detail_tr2"
						tdCls1="detail3_info"
						tdCls2="detail3"

						If Not area_detail4(i) = "" Then
							cls="detail_tr1"
							tdCls1="detail2_info"
							tdCls2="detail2"
						End If
					%>

					<tr class="<%=trCls%>">
						<td class="<%=tdCls1%>">계좌번호</td>
						<td class="<%=tdCls2%>"><%=area_detail3(i)%></td>
					</tr>
					<% If Not area_detail4(i) = "" Then %>
						<tr class="detail_tr2">
							<td class="detail3_info">정부지원(바우처)계좌번호</td>
							<td class="detail3"><%=area_detail4(i)%></td>
						</tr>	
					<%  End if %>
				</table>
			<%
				Next
			%>
		</div>
		
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>
