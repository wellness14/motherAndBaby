 
<%
	url = Request.ServerVariables("HTTP_URL")
	urlArr = Split(url, "/")
	pageName = urlArr(UBound(urlArr))
	menuTitle = "마더앤베이비"
	
	Dim menuOn(3)

	If InStr(pageName, "login.asp") > 0 Then
		menuTitle = "로그인"
		btnType = "menu"
	ElseIf InStr(pageName, "plan_list.asp") > 0 Or InStr(pageName, "plan_info_list.asp") > 0 Then
		menuTitle = "서비스 알림"
		menuOn(0) = "border:1px solid #2185c5;"
		btnType = "menu"
	ElseIf InStr(pageName, "my_list.asp") > 0 Then
		menuTitle = "마이 마더앤베이비"
		menuOn(1) = "border:1px solid #2185c5;"
		btnType = "menu"
	ElseIf InStr(pageName, "service_n_info.asp") > 0 Then
		menuTitle = "상담/신청 안내"
		menuOn(2) = "border:1px solid #2185c5;"
		btnType = "menu"
	ElseIf InStr(pageName, "emergency_talk.asp") > 0 Then
		menuTitle = "긴급상담신청"
		menuOn(2) = "border:1px solid #2185c5;"
		btnType = "back"
	ElseIf InStr(pageName, "service_consult.asp") > 0 Or InStr(pageName, "service_consult_ins.asp") > 0 Then
		menuTitle = "1:1상담"
		menuOn(2) = "border:1px solid #2185c5;"
		btnType = "back"
	ElseIf InStr(pageName, "notice.asp") > 0 Then
		menuTitle = "공지사항"
		menuOn(2) = "border:1px solid #2185c5;"
		btnType = "back"
	ElseIf InStr(pageName, "setting.asp") > 0 Then
		menuTitle = "설정"
		menuOn(3) = "border:1px solid #2185c5;"
		btnType = "menu"
	ElseIf InStr(pageName, "service_info_list.asp") > 0 Or InStr(pageName, "care_service") > 0 Then
		menuTitle = "서비스안내"
		menuOn(0) = "border:1px solid #2185c5;"
		btnType = "back"
	ElseIf InStr(pageName, "ervice_res_consult.asp") > 0 Then
		menuTitle = "예약전화상담"
		menuOn(0) = "border:1px solid #2185c5;"
		btnType = "back"
	ElseIf InStr(pageName, "join.asp") > 0 Then
		menuTitle = "회원가입"
		menuOn(0) = "border:1px solid #2185c5;"
		btnType = "back"
	End If
%>
<!-- <nav class="navbar navbar-inverse navbar-fixed-top" style="border:1px solid #2185c5;"> -->
<nav class="navbar navbar-inverse navbar-fixed-top" style="border:1px solid #2185c5;">
  <div class="container-fluid" style="background-color:#2185c5;">
    <div class="navbar-header">
 
			 <!-- <a id="menu-toggle" href="#"  class="navbar-brand" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5;"><img src="img/menu.png"/></a> -->
			<% If btnType = "menu" Then %>	
				<div id="menu-toggle" href="#" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5;"><img src="img/menu.png"/></div> 
			<% ElseIf btnType = "back" Then %>
				<div id="" href="#" class="navbar-toggle toggle" style="border:1px solid #2185c5;background-color:#2185c5; float:left;position:fixed;cursor:pointer;"><a href="" onclick="history.go(-1); return false;"><img src="img/back_bt.png" height="23" width="20" /></a></div>
			<% End If %>
			<div style="text-align:center; line-height:51px;color:#ffffff;font-weight:bold;font-size:16pt;margin:0 auto;background-color:#2185c5;padding-bottom:4px;"><%=menuTitle%></div>
			<div id="sidebar-wrapper" style="background-color:#ffffff;border:1px solid #2185c5;overflow-x:hidden; overflow-y:auto;">
				<ul class="sidebar-nav">
					<a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle" style="margin-top:9px;width:50px;height:40px;border:1px solid #ffffff;text-align:center;background-color:#2185c5;"><span style="margin-top:-13px;margin-left:-8px;text-align:center;color:#ffffff;">닫기</span></a>
						<li class="sidebar-brand" style="background-color:#2185c5; ">
							<a href="#" style="color:#ffffff;font-size:15pt;">마더앤베이비</a>
						</li>
						<li>
							<div style="<%=menuOn(0)%>"><a href="plan_list.asp"><img src="img/calendar.png" style="width:20px;"/><span style="color:#2185c5;"> 일정카드 </span></a></div>
						</li>
						<li>
							<div style="<%=menuOn(1)%>"><a href="my_list.asp"><img src="img/heart.png"style="width:20px;"/> 마이 마더앤베이비 </a></div>
						</li>
						<li>
							<div style="<%=menuOn(2)%>"><a href="service_n_info.asp"><img src="img/call.png"style="width:15px;"/> 상담신청/안내 </a></div>
						</li>
						<li>
							<div style="<%=menuOn(3)%>"><a href="setting.asp"><img src="img/settong_rov.png"style="width:20px;"/><span > 설정 </span></a></div>
						</li>
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