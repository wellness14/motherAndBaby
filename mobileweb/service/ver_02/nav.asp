<%
	url = Request.ServerVariables("HTTP_URL")
	urlArr = Split(url, "/")
	pageName = urlArr(UBound(urlArr))

	uid = Request.Cookies("uid")

	If uid <> "" Then
		If InStr(pageName, "login.asp") > 0 Or InStr(pageName, "member.asp") > 0 Then
			Response.Redirect "/mobileweb/ver_02/"
		End If
	End If
%>
<nav>
		<a id="menu-toggle" href="#" class="navbar-toggle toggle" style="padding-top:15px;"><img src="/mobileweb/html/images/menu_bar_01.png" style="width:19px;"/></a>
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
						<div id="menu-close">
							<span id="close_btn">닫기</span>
						</div>

						<li class="sidebar-brand">
							<a href="/mobileweb/ver_02/"><img src="/mobileweb/html/images/nv_logo.png" width="80%"/></a>
						</li>
						<li>
							<div><a href="comp.asp?menuCode1=20000&menuCode2=B">마더앤베이비 안내</a></div>
							<ul class="sidebar-nav-sub">
								<li><a href="comp.asp?menuCode1=20000&menuCode2=B">트리니티케어시스템</a></li>
								<li><a href="comp.asp?menuCode1=20000&menuCode2=C">전담간호사의 역할</a></li>
								<li><a href="comp.asp?menuCode1=20000&menuCode2=D">산후관리사가 하는 일</a></li>
								<li><a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/map_info_v02.asp">지사안내</a></li>
								<li><a href="app_info.asp">어플리케이션 안내</a></li>
							</ul>
						</li>

						<li>
							<div><a href="care_service.asp">산후케어서비스</a></div>
							<ul class="sidebar-nav-sub">
								<li><a href="care_service.asp">산후케어서비스</a></li>
								<li><a href="service_01.asp?menuCode1=30000&menuCode2=C">바디케어프로그램</a></li>
								<li><a href="service_01.asp?menuCode1=30000&menuCode2=D">수유관리프로그램</a></li>
								<li><a href="service_01.asp?menuCode1=30000&menuCode2=E">영양관리프로그램</a></li>
								<li><a href="service_03.asp?menuCode1=30000&menuCode2=B">내게맞는프로그램</a></li>
							</ul>
						</li>

						<li>
							<div><a href="board_02.asp">이용안내/예약</a></div>
							<ul class="sidebar-nav-sub">
								<li><a href="board_02.asp">FAQ</a></li>
								<li><a href="board_03.asp">1:1문의하기</a></li>
								<li><a href="info_01.asp">상담신청</a></li>
								<li><a href="info_02.asp?menuCode1=40000&menuCode2=B">예약/결제안내</a></li>
								<li><a href="info_02.asp?menuCode1=40000&menuCode2=D">정부지원사업안내</a></li>
<!-- 								<li><a href="info_02.asp?menuCode1=40000&menuCode2=G">국내유료 직업소개 요금 등 고시</a></li> -->
								<li><a href="info_02.asp?menuCode1=40000&menuCode2=C">예약취소/환불규정</a></li>
								<li><a href="info_02.asp?menuCode1=40000&menuCode2=E">서비스용품안내</a></li>
								<li><a href="info_02.asp?menuCode1=40000&menuCode2=F">출산선물안내</a></li>
							</ul>
						</li>
						<li>
							<div><a href="board_04.asp">커뮤니티</a></div>
							<ul class="sidebar-nav-sub">
								<li><a href="board_04.asp">칭찬하기</a></li>
								<li><a href="board_05.asp">이벤트</a></li>
							</ul>
						</li>
						<div class="nav-btn-grp">
							<% If uid = "" Then %>
								<span class="mr20"><a href="login.asp">로그인</a></span>
								<span><a href="member.asp">회원가입</a></span>
							<% Else %>
								<span class="mr20"><a href="logout.asp">로그아웃</a></span>
								<span><a href="member_change.asp">마이페이지</a></span>
							<% End If %>
						</div>
				</ul>
	</div>
</nav>