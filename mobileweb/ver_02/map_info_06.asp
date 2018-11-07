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
				<span style="color:#ed587a;">해외지사</span><span style="color:#919194;">안내</span>
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
				cnt = 0
				ReDim area(cnt), area_addr(cnt), area_tel(cnt), area_time(cnt), area_detail_img(cnt), area_detail1(cnt), area_detail2(cnt), area_detail3(cnt), area_detail4(cnt)
				
				area(0) = "아랍에미리트 "
				area_addr(0) = "아랍에미리트"
				area_tel(0) = "02-557-3580"
				area_time(0) = "AM 09:00 ~ PM 06:00"
				area_detail2(0) = " 02-557-3576"
				area_detail3(0) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				area_detail4(0) = "우리은행 1005-103-220459<br/>예금주 정혜윤 (마더앤베이비산후도우미)"

'				area(1) = "김천지사"
'				area_addr(1) = "경북구미시 공단동 26번지 낙동상가 503호"
'				area_tel(1) = "02-557-3579  "
'				area_time(1) = "AM 09:00 ~ PM 06:00"
'				area_detail2(1) = " 02-557-3576"
'				area_detail3(1) = "국민은행 378801-01-072771<br/>예금주 서동필(마더앤베이비)"
				


			

				
				







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
