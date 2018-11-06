 
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
		menuTitle = "마이마더앤베이비"
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
	ElseIf InStr(pageName, "setting.asp") > 0 Or InStr(pageName, "setting_new.asp") > 0 Then
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

	uId	= Trim(fncRequestCookie("uid"))
	uName	= Trim(fncRequestCookie("uname"))
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
			<div id="sidebar-wrapper">
				<!-- <ul class="sidebar-nav">
					<a id="menu-close" href="#" class="btn btn-default btn-lg pull-right toggle" style="margin-top:9px;width:50px;height:40px;border:1px solid #ffffff;text-align:center;background-color:#2185c5;"><span style="margin-top:-13px;margin-left:-8px;text-align:center;color:#ffffff;">닫기</span></a>
				</ul> -->
				<ul class="sidebar-nav">
					<div style="position:relative; background:#455364; width:100%; height:55px; line-height:55px; color:#ffffff; font-size:15pt; text-align:left; padding-left:20px;">
						마더앤베이비 <span style="position:absolute; right:10px;" id="menu-close"><img src="img/X_bt.png" /></span>
					</div>

					<a href="plan_list.asp">
						<div style="position:relative; background-image:url('img/nav_img.jpg') no-repeat;">
							<img src="img/nav_img.jpg" style="width:100%;" />
							<% If uId <> "" Then %>
								<span style="position:absolute; bottom:60px; right:20px; color:#ffffff; font-weight:bold; font-size:10pt;"><%=uName%> 고객님</span>
							<% End If %>
							<span style="position:absolute; bottom:30px; right:10px; color:#ffffff; font-weight:bold; font-size:15pt;">서비스 알림</span>
						</div>
					</a>

					<li><a href="my_list.asp"><img src="img/nav_heart.png" />&nbsp;&nbsp;&nbsp;마이마더앤베이비<span style="position:absolute; right:10px;"><img src="img/nav_gray_bt.png" /></span></a></li>
					<li style="background:#ffffff; height:1px; width:100%;"></li>
					<li style="background:#d7d7d7; height:1px; width:100%;"></li>
					<li><a href="service_n_info.asp"><img src="img/nav_call.png" />&nbsp;&nbsp;&nbsp;상담신청/안내 <span style="position:absolute; right:10px;"><img src="img/nav_gray_bt.png" /></li></span>
					<li style="background:#ffffff; height:1px; width:100%;"></li>
					<li style="background:#d7d7d7; height:1px; width:100%;"></li>
					<li><a href="setting.asp"><img src="img/st_bt.png" />&nbsp;&nbsp;&nbsp;설정 <span style="position:absolute; right:10px;"><img src="img/nav_gray_bt.png" /></span></a></li>
					<li style="background:#ffffff; height:1px; width:100%;"></li>
					<li style="background:#d7d7d7; height:1px; width:100%;"></li>
				</ul>

				<div style="position:absolute; right:20px; bottom:20px;">
					<% If uId <> "" Then %>
						<a href="logout.asp"><img src="img/log_out_bt.png" /></a>
					<% Else %>
						<a href="login.asp"><img src="img/nav_login_120.png" /></a>
					<% End If %>
				</div>
			</div>
		</div>
	</div>
</nav>