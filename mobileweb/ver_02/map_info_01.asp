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
				<span style="color:#ed587a;">서울지사</span><span style="color:#919194;">안내</span>
				<img src="/mobileweb/html/images/menu_bar_02.png"  class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
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
				ReDim area(cnt), area_addr(cnt), area_tel(cnt), area_time(cnt), area_detail_img(cnt), area_detail1(cnt), area_detail2(cnt), area_detail3(cnt), area_detail4(cnt), area_fakephone(cnt)
				
				area(0) = "강남지역"
				area_addr(0) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(0) = "02-557-3579"
				area_time(0) = "AM 09:00 ~ PM 06:00"
				area_detail2(0) = "02-557-3576"
				area_detail3(0) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(0) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(1) = "강동지역"
				area_addr(1) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(1) = "02-557-3579"
				area_time(1) = "AM 09:00 ~ PM 06:00"
				area_detail2(1) = " 02-557-3576"
				area_detail3(1) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(1) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(2) = "강북지역"
				area_addr(2) = "서울특별시 노원구 공릉동 517-65"
				area_tel(2) = "02-978-3579"
				area_time(2) = "AM 09:00 ~ PM 06:00"
				area_detail2(2) = ""
				area_detail3(2) = "우리은행 1005-403-341323<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"
				area_detail4(2) = "우리은행 1005-103-341334<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"

				area(3) = "강서지사"
				area_addr(3) = "서울특별시 강서구 마곡중앙로 171, 5층 503호(마곡나루역 프라이빗타워 II)"
				area_tel(3) = "02-6203-3578 "
				area_time(3) = "AM 09:00 ~ PM 06:00"
				area_detail2(3) = " 02-557-3576"
				area_detail3(3) = "신한은행 110-468-139853<br/>예금주 한수경(마더앤베이비강서·양천지사)"
				area_detail4(3) = "국민은행 094701-04-313728<br/>예금주 한수경(마더앤베이비강서·양천지사)"

				area(4) = "관악지사"
				area_addr(4) = "서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호"
				area_tel(4) = "02-597-3579  "
				area_time(4) = "AM 09:00 ~ PM 06:00"
				area_detail2(4) = " 02-598-3580"
				area_detail3(4) = "우리은행 1002-855-672280<br/>예금주 조미경(마더앤베이비동작·관악·금천)"
				area_detail4(4) = "우리은행 1005-502-794877<br/>예금주 조미경(마더앤베이비 동작·관악·금천)"

				area(5) = "광진지사"
				area_addr(5) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(5) = "02-557-3579"
				area_time(5) = "AM 09:00 ~ PM 06:00"
				area_detail2(5) = " 02-557-3576"
				area_detail3(5) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(5) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(6) = "구로지사"
				area_addr(6) = "서울특별시 구로구 경인로 572, 619호 (구로구, 스타팰리스)"
				area_tel(6) = "02-2672-3578"
				area_time(6) = "AM 09:00 ~ PM 06:00"
				area_detail2(6) = " 02-2672-3580"
				area_detail3(6) = "국민은행 535501-04-123954<br/>예금주 이금희 (마더앤베이비 영등포·구로)"
				area_detail4(6) = "국민은행 804601-04-224922<br/>예금주 이금희 (마더앤베이비 영등포·구로)"

				area(7) = "금천지사"
				area_addr(7) = "서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호"
				area_tel(7) = "02-597-3579  "
				area_time(7) = "AM 09:00 ~ PM 06:00"
				area_detail2(7) = " 02-598-3580"
				area_detail3(7) = "우리은행 1002-855-672280<br/>예금주 조미경(마더앤베이비동작·관악·금천)"
				area_detail4(7) = "우리은행 1005-502-794877<br/>예금주 조미경(마더앤베이비 동작·관악·금천)"

				area(8) = "노원지역"
				area_addr(8) = "서울특별시 노원구 공릉동 517-65"
				area_tel(8) = "02-978-3579"
				area_time(8) = "AM 09:00 ~ PM 06:00"
				area_detail2(8) = ""
				area_detail3(8) = "우리은행 1005-403-341323<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"
				area_detail4(8) = "우리은행 1005-103-341334<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"

				area(9) = "도봉지역"
				area_addr(9) = "서울특별시 노원구 공릉동 517-65"
				area_tel(9) = "02-978-3579"
				area_time(9) = "AM 09:00 ~ PM 06:00"
				area_detail2(9) = ""
				area_detail3(9) = "우리은행 1005-403-341323<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"
				area_detail4(9) = "우리은행 1005-103-341334<br/>예금주 이채정(마더앤베이비 강북, 노원, 도봉)"

				area(10) = "동대문지역"
				area_addr(10) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(10) = "02-557-3579"
				area_time(10) = "AM 09:00 ~ PM 06:00"
				area_detail2(10) = " 02-557-3576"
				area_detail3(10) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(10) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(11) = "동작지사"
				area_addr(11) = "서울특별시 관악구 남현동 602-43 미래오피스텔 2층 202호"
				area_tel(11) = "02-597-3579  "
				area_time(11) = "AM 09:00 ~ PM 06:00"
				area_detail2(11) = " 02-598-3580"
				area_detail3(11) = "우리은행 1002-855-672280<br/>예금주 조미경(마더앤베이비동작·관악·금천)"
				area_detail4(11) = "우리은행 1005-502-794877<br/>예금주 조미경(마더앤베이비 동작·관악·금천)"

				area(12) = "서대문지역"
				area_addr(12) = "서울특별시 은평구 신사동 337-9 2층"
				area_tel(12) = "02-304-3577"
				area_time(12) = "AM 09:00 ~ PM 06:00"
				area_detail2(12) = " 02-304-3573"
				area_detail3(12) = "농협 301-3040-3577-51 신정임(마더앤베이비 서대문지사)"
				area_detail4(12) = "농협 301-3040-3573-11 신정임(마더앤베이비 서대문지사)"

				area(13) = "서초지역"
				area_addr(13) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(13) = "02-557-3579"
				area_time(13) = "AM 09:00 ~ PM 06:00"
				area_detail2(13) = " 02-557-3576"
				area_detail3(13) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(13) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(14) = "성동지사"
				area_addr(14) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(14) = "02-557-3579"
				area_time(14) = "AM 09:00 ~ PM 06:00"
				area_detail2(14) = " 02-557-3576"
				area_detail3(14) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(14) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(15) = "성북지역"
				area_addr(15) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(15) = "02-557-3579"
				area_time(15) = "AM 09:00 ~ PM 06:00"
				area_detail2(15) = " 02-557-3576"
				area_detail3(15) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(15) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(16) = "송파지역"
				area_addr(16) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(16) = "02-557-3579"
				area_time(16) = "AM 09:00 ~ PM 06:00"
				area_detail2(16) = " 02-557-3576"
				area_detail3(16) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(16) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(17) = "양천지사"
				area_addr(17) = "서울특별시 강서구 마곡중앙로 171, 5층 503호(마곡나루역 프라이빗타워 II)"
				area_tel(17) = "02-6203-3578 "
				area_time(17) = "AM 09:00 ~ PM 06:00"
				area_detail2(17) = " 02-557-3576"
				area_detail3(17) = "신한은행 110-468-139853<br/>예금주 한수경(마더앤베이비강서·양천지사)"
				area_detail4(17) = "국민은행 094701-04-313728<br/>예금주 한수경(마더앤베이비강서·양천지사)"

				area(18) = "영등포지사"
				area_addr(18) = "서울특별시 구로구 경인로 572, 619호 (구로구, 스타팰리스)"
				area_tel(18) = "02-2672-3578"
				area_time(18) = "AM 09:00 ~ PM 06:00"
				area_detail2(18) = " 02-2672-3578"
				area_detail3(18) = "국민은행 535501-04-123954<br/>예금주 이금희 (마더앤베이비 영등포·구로)"
				area_detail4(18) = "국민은행 804601-04-224922<br/>예금주 이금희 (마더앤베이비 영등포·구로)"

				area(19) = "용산지역"
				area_addr(19) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(19) = "02-557-3579"
				area_time(19) = "AM 09:00 ~ PM 06:00"
				area_detail2(19) = " 02-557-3576"
				area_detail3(19) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(19) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"


				area(20) = "은평지역"
				area_addr(20) = "서울특별시 은평구 신사동 337-9 2층"
				area_tel(20) = "02-304-3577"
				area_time(20) = "AM 09:00 ~ PM 06:00"
				area_detail2(20) = " 02-304-3573"
				area_detail3(20) = "농협 301-3040-3577-51 신정임(마더앤베이비 서대문지사)"
				area_detail4(20) = "농협 301-3040-3573-11 신정임(마더앤베이비 서대문지사)"

				area(21) = "종로지역"
				area_addr(21) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(21) = "02-557-3579"
				area_time(21) = "AM 09:00 ~ PM 06:00"
				area_detail2(21) = " 02-557-3576"
				area_detail3(21) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(21) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(22) = "중구지역"
				area_addr(22) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(22) = "02-557-3579"
				area_time(22) = "AM 09:00 ~ PM 06:00"
				area_detail2(22) = " 02-557-3576"
				area_detail3(22) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(22) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(23) = "중랑지사"
				area_addr(23) = "서울특별시 강남구 선릉로 120길 5 동곡빌딩 3층 마더앤베이비"
				area_tel(23) = "02-557-3579"
				area_time(23) = "AM 09:00 ~ PM 06:00"
				area_detail2(23) = " 02-557-3576"
				area_detail3(23) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(23) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

				area(24) = "마포지역"
				area_addr(24) = "서울특별시 은평구 신사동 337-9 2층"
				area_tel(24) = "02-304-3577"
				area_time(24) = "AM 09:00 ~ PM 06:00"
				area_detail2(24) = " 02-304-3573"
				area_detail3(24) = "농협 301-3040-3577-51 신정임(마더앤베이비 서대문지사)"
				area_detail4(24) = "농협 301-3040-3573-11 신정임(마더앤베이비 서대문지사)"

'				area(23) = "구리지사"
'				area_addr(23) = "경기도 구리시 건원대로 34번길 27 세신인창종합상가 716호"
'				area_tel(23) = "031-566-3579"
'				area_time(23) = "AM 09:00 ~ PM 06:00"
'				area_detail2(23) = " 02-551-3579"
'				area_detail3(23) = "우리은행 1005-603-174176<br/>예금주 김용원 (마더앤베이비 구리·남양주)"
'				area_detail4(23) = "국민은행 272701-04-269924<br/>예금주 박은영 (마더앤베이비 사회서비스)"

'				area(23) = "구리지사"
'				area_addr(23) = "경기도 구리시 건원대로 34번길 27 세신인창종합상가 716호"
'				area_tel(23) = "031-566-3579"
'				area_time(23) = "AM 09:00 ~ PM 06:00"
'				area_detail2(23) = " 02-551-3579"
'				area_detail3(23) = "우리은행 1005-603-174176<br/>예금주 김용원 (마더앤베이비 구리·남양주)"
'				area_detail4(23) = "국민은행 272701-04-269924<br/>예금주 박은영 (마더앤베이비 사회서비스)"




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
							<% 
								If area_tel(i) = "02-557-3579" Then
							%>
								<a href="javascript:;" onclick="callClick('050-7526-1842');">전화걸기</a>
							<%
								Else
							%>
								<a href="javascript:;" onclick="callClick('<%=area_tel(i)%>');">전화걸기</a>
							<%
								End If
							%>
						</td>
					</tr>
					<tr>
						<td class="time_info">상담시간</td>
						<td class="time"><%=area_time(i)%></td>
					</tr>
					<% 
						If area_detail2(i) <> "" Then
					%>
						<tr class="detail_tr1">
							<td class="detail2_info">FAX</td>
							<td class="detail2"><%=area_detail2(i)%></td>
						</tr>
					<%
						End If
					%>
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
