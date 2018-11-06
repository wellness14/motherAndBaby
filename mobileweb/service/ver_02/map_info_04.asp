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
					$("#map_info_01 .detail_tr1:eq(" + i + ")").toggle();
					$("#map_info_01 .detail_tr2:eq(" + i + ")").toggle();
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
				<span style="color:#ed587a;">대전지사</span><span style="color:#919194;">안내</span>
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
				cnt = 4
				ReDim area(cnt), area_addr(cnt), area_tel(cnt), area_time(cnt), area_detail_img(cnt), area_detail1(cnt), area_detail2(cnt), area_detail3(cnt)
				
				area(0) = "대덕구지사"
				area_addr(0) = "대전광역시 서구 둔산동 1015번지 대원빌딩 4층"
				area_tel(0) = "042-471-3579 "
				area_time(0) = "AM 09:00 ~ PM 06:00"
				area_detail2(0) = " 042-718-9433"
				area_detail3(0) = "국민은행 478102-04-337215<br/>예금주 최정근(마더앤베이비대전지사)"

				area(1) = "대덕구지사"
				area_addr(1) = "대전광역시 서구 둔산동 1015번지 대원빌딩 4층"
				area_tel(1) = "042-471-3579 "
				area_time(1) = "AM 09:00 ~ PM 06:00"
				area_detail2(1) = " 042-718-9433"
				area_detail3(1) = "국민은행 478102-04-337215<br/>예금주 최정근(마더앤베이비대전지사)"

				area(2) = "대덕구지사"
				area_addr(2) = "대전광역시 서구 둔산동 1015번지 대원빌딩 4층"
				area_tel(2) = "042-471-3579 "
				area_time(2) = "AM 09:00 ~ PM 06:00"
				area_detail2(2) = " 042-718-9433"
				area_detail3(2) = "국민은행 478102-04-337215<br/>예금주 최정근(마더앤베이비대전지사)"

				area(3) = "대덕구지사"
				area_addr(3) = "대전광역시 서구 둔산동 1015번지 대원빌딩 4층"
				area_tel(3) = "042-471-3579 "
				area_time(3) = "AM 09:00 ~ PM 06:00"
				area_detail2(3) = " 042-718-9433"
				area_detail3(3) = "국민은행 478102-04-337215<br/>예금주 최정근(마더앤베이비대전지사)"

				area(4) = "대덕구지사"
				area_addr(4) = "대전광역시 서구 둔산동 1015번지 대원빌딩 4층"
				area_tel(4) = "042-471-3579 "
				area_time(4) = "AM 09:00 ~ PM 06:00"
				area_detail2(4) = " 042-718-9433"
				area_detail3(4) = "국민은행 478102-04-337215<br/>예금주 최정근(마더앤베이비대전지사)"

			

				
				







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
						<td class="call"><img src="/mobileweb/html/images/small_call.png" class="call_number_icon"><%=area_tel(i)%> <a href="javascript:;" onclick="callClick('<%=area_tel(i)%>');">전화걸기</a></td>
					</tr>
					<tr>
						<td class="time_info">상담시간</td>
						<td class="time"><%=area_time(i)%></td>
					</tr>
					<tr class="detail_tr1">
						<td class="detail2_info">FAX</td>
						<td class="detail2"><%=area_detail2(i)%></td>
					</tr>
					<tr class="detail_tr2">
						<td class="detail3_info">계좌번호</td>
						<td class="detail3"><%=area_detail3(i)%></td>
					</tr>
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
