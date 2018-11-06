 
<%
	url = Request.ServerVariables("HTTP_URL")
	urlArr = Split(url, "/")
	pageName = urlArr(UBound(urlArr))
	menuTitle = "마더앤베이비"
	
	Dim menuOn(3)

	If InStr(pageName, "login.asp") > 0 Then
		menuTitle = "로그인"
		menuBtn = "menu"
	ElseIf InStr(pageName, "service_work.asp") > 0 Then
		menuTitle = "상담업무"
		menuBtn = "menu"
	ElseIf InStr(pageName, "call_consult_list.asp") > 0 Then
		menuTitle = "예약전화상담 리스트"
		menuBtn = "back"
	ElseIf InStr(pageName, "customer_data_update.asp") > 0 Then
		menuTitle = "고객정보변경 확인"
		menuBtn = "back"
	ElseIf InStr(pageName, "customer_list.asp") > 0 Then
		menuTitle = "고객 리스트"
		menuBtn = "back"
'	ElseIf InStr(pageName, "emergency_talk.asp") > 0 Then
'		menuTitle = "긴급상담신청 리스트"
'		menuOn(2) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "service_consult_list.asp") > 0 Or InStr(pageName, "service_consult_ins.asp") > 0 Then
'		menuTitle = "1:1상담신청"
'		menuOn(2) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "notice_list.asp") > 0 Then
'		menuTitle = "공지사항"
'		menuOn(2) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "customer_data_update.asp") > 0 Then
'		menuTitle = "고객정보변경확인"
'		menuOn(3) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "service_info_list.asp") > 0 Then
'		menuTitle = "서비스안내"
'		menuOn(0) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "call_consult_list.asp") > 0 Then
'		menuTitle = "예약전화상담 리스트"
'		menuOn(0) = "border:1px solid #2185c5;"
'	ElseIf InStr(pageName, "customer_list.asp") > 0 Then
'		menuTitle = "고객 리스트"
'		menuOn(0) = "border:1px solid #2185c5;"
	End If
%>
<!-- <nav class="navbar navbar-inverse navbar-fixed-top" style="border:1px solid #2185c5;"> -->
<nav class="navbar navbar-inverse navbar-fixed-top" style="border:1px solid #2185c5;">
  <div class="container-fluid" style="background-color:#2185c5;">
    <div class="navbar-header">
 
			 <!-- <a id="menu-toggle" href="#"  class="navbar-brand" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5;"><img src="img/menu.png"/></a> -->
			<!-- <div id="menu-toggle" href="#" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5;"><img src="img/menu.png"/></div>  -->
<% If menuBtn = "menu" Then %>
			<div id="menu-toggle" href="#" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5;"><img src="img/menu.png"/></div>
<% Else %>
			<div  href="#" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5; float:left;position:fixed;"><a href="" onclick="history.go(-1);return false;"><img src="img/back_bt.png" height="23" width="20"/></a></div>
<% End If %>
			<div style="text-align:center; line-height:51px;color:#ffffff;font-weight:350;font-size:17pt;margin:0 auto;background-color:#2185c5;"><%=menuTitle%></div>
			<div id="sidebar-wrapper" style="background-color:#ffffff;">
				<ul class="sidebar-nav">
					<a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle" style="margin-top:9px;width:50px;height:40px;border:1px solid #ffffff;text-align:center;background-color:#2185c5;"><span style="margin-top:-13px;margin-left:-8px;text-align:center;color:#ffffff;">닫기</span></a>
						<li class="sidebar-brand" style="background-color:#2185c5; ">
							<a href="#" style="color:#ffffff;font-size:15pt;">마더앤베이비</a>
						</li>
						<!-- <li>
							<div style="<%=menuOn(0)%>"><a href="plan_list.asp"><img src="img/calendar.png" /><span style="color:#2185c5;"> 일정카드 </span></a></div>
						</li>
						<li>
							<div style="<%=menuOn(1)%>"><a href="my_list.asp"><img src="img/heart.png"/> 마이 마더앤베이비 </a></div>
						</li> -->
						<li>
							<div><a href="service_work.asp"><img src="img/call.png"/> 상담업무 </a></div>
						</li>

						<li>
							<div><a href="call_consult_list.asp"><!-- <img src="img/call.png"/> -->- 예약전화상담 리스트 </a></div>
						</li>

						<li>
							<div><a href="customer_data_update.asp"><!-- <img src="img/call.png"/> -->- 고객정보변경 확인 </a></div>
						</li>

						<li>
							<div><a href="customer_list.asp"><!-- <img src="img/call.png"/> -->- 고객 리스트 </a></div>
						</li>
						<!-- <li>
							<div style="<%=menuOn(3)%>"><a href="setting.asp"><img src="img/settong_rov.png"/><span style="color:#2185c5;"> 설정 </span></a></div>
						</li> -->
<% If uId <> "" Then %>
						<li style="float:right;">
							<a href="logout.asp" style="margin-top:200px;margin-right:10px;width:80px;height:50px;border:1px solid #2185c5;background-color:#ffffff;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px; "><span style="margin-left:-10px;margin-top:-10px;color:#2185c5;margin-right:5px;vertical-align:top;">로그아웃</span></a>
						</li>
<%Else %>
						<li style="float:right;">
							<a href="login.asp" style="margin-top:200px;margin-right:10px;width:80px;height:50px;border:1px solid #2185c5;background-color:#ffffff;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px; "><span style="margin-left:0px;margin-top:-10px;color:#2185c5;margin-right:5px;vertical-align:top;">로그인</span></a>
						</li>
<% End If %>

				</ul>
			</div>
		</div>
	</div>
</nav>