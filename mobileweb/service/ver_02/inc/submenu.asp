<%
	url = Request.ServerVariables("HTTP_URL")
	urlArr = Split(url, "/")
	pageName = urlArr(UBound(urlArr))

	Dim subMenuOn(8)
	Dim subMenuOn2(8)
	
	If InStr(pageName, "comp") > 0 Or InStr(pageName, "map_info") > 0 Or InStr(pageName, "app_info") > 0 Then
		If InStr(pageName, "comp") > 0 Then
			If menuCode2 = "B" Then
				subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
				subMenuOn2(0) = "text-decoration:underline;"
			ElseIf menuCode2 = "C" Then
				subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
				subMenuOn2(1) = "text-decoration:underline;"
			ElseIf menuCode2 = "D" Then
				subMenuOn(2) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
				subMenuOn2(2) = "text-decoration:underline;"
			End If
		ElseIf InStr(pageName, "map_info") > 0 Then
			subMenuOn(3) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "app_info") > 0 Then
			subMenuOn(4) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=B">트리니티케어 시스템</a> <%=subMenuOn(0)%></li>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=C">전담간호사의 역할</a> <%=subMenuOn(1)%></li>
			<li><a href="comp.asp?menuCode1=20000&menuCode2=D">산후관리사가 하는 일</a> <%=subMenuOn(2)%></li>
			<li><a href="map_info_v02.asp">지역별 지사안내</a> <%=subMenuOn(3)%></li>
			<li><a href="app_info.asp">어플리케이션 안내</a> <%=subMenuOn(4)%></li>
			<li>&nbsp;</li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
	<% If InStr(pageName, "comp") > 0 Then %>
		<div class="sub-drop-menu2">
			<ul>
				<li style="width:40%; <%=subMenuOn2(0)%>"><a href="comp.asp?menuCode1=20000&menuCode2=B">트리니티케어</a></li>
				<li style="width:30%; <%=subMenuOn2(1)%>"><a href="comp.asp?menuCode1=20000&menuCode2=C">전담간호사</a></li>
				<li style="width:30%; <%=subMenuOn2(2)%>"><a href="comp.asp?menuCode1=20000&menuCode2=D">산후관리사</a></li>
			</ul>
		</div>
	<% End If %>
<%
	ElseIf InStr(pageName, "care_service") > 0 Or InStr(pageName, "service_01") > 0 Or InStr(pageName, "service_03") > 0 Then
		If InStr(pageName, "care_service") > 0 Then
			subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "service_01") > 0 Then
			If menuCode2 = "C" Then
				subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "D" Then
				subMenuOn(2) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "E" Then
				subMenuOn(3) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			End If
		ElseIf InStr(pageName, "service_03") > 0 Then
			If menuCode2 = "B" Then
				subMenuOn(4) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			End If
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="care_service.asp">산후케어서비스</a> <%=subMenuOn(0)%></li>
			<li><a href="service_01.asp?menuCode1=30000&menuCode2=C">바디케어프로그램</a> <%=subMenuOn(1)%></li>
			<li><a href="service_01.asp?menuCode1=30000&menuCode2=D">수유관리프로그램</a> <%=subMenuOn(2)%></li>
			<li><a href="service_01.asp?menuCode1=30000&menuCode2=E">영양관리프로그램</a> <%=subMenuOn(3)%></li>
			<li><a href="service_03.asp?menuCode1=30000&menuCode2=B">내게맞는프로그램</a> <%=subMenuOn(4)%></li>
			<li>&nbsp;</li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
<%
	ElseIf InStr(pageName, "board_02") > 0 Or InStr(pageName, "board_03") > 0 Or InStr(pageName, "info_01") > 0 Or InStr(pageName, "info_02") > 0 Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "C") Or (InStr(pageName, "board_write") > 0 And menuCode2 = "C") Then
		If InStr(pageName, "board_02") > 0 Then
			subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "board_03") > 0 Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "C") Or (InStr(pageName, "board_write") > 0 And menuCode2 = "C") Then
			subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "info_01") > 0 Then
			subMenuOn(2) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "info_02") > 0 Then
			If menuCode2 = "B" Then
				subMenuOn(3) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "C" Then
				subMenuOn(4) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "E" Then
				subMenuOn(5) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "F" Then
				subMenuOn(6) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "D" Then
				subMenuOn(7) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			ElseIf menuCode2 = "G" Then
				subMenuOn(8) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
			End If
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="board_02.asp">FAQ</a> <%=subMenuOn(0)%></li>
			<li><a href="board_03.asp">1:1문의하기</a> <%=subMenuOn(1)%></li>
			<li><a href="info_01.asp">상담신청</a> <%=subMenuOn(2)%></li>
			<li><a href="info_02.asp?menuCode1=40000&menuCode2=B">예약/결제안내</a> <%=subMenuOn(3)%></li>
			<li><a href="info_02.asp?menuCode1=40000&menuCode2=D">정부지원사업안내</a> <%=subMenuOn(7)%></li>
<!-- 			<li><a href="info_02.asp?menuCode1=40000&menuCode2=G" style="font-size:10px;">국내유료 직업소개요금 등 고시</a> <%=subMenuOn(8)%></li> -->
			<li><a href="info_02.asp?menuCode1=40000&menuCode2=C">예약취소/환불규정</a> <%=subMenuOn(4)%></li>
			<li><a href="info_02.asp?menuCode1=40000&menuCode2=E">서비스용품안내</a> <%=subMenuOn(5)%></li>
			<li><a href="info_02.asp?menuCode1=40000&menuCode2=F">출산선물안내</a> <%=subMenuOn(6)%></li>
<!-- 			<li>&nbsp;</li> -->
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
<%
	ElseIf InStr(pageName, "board_04") > 0 Or InStr(pageName, "board_05") > 0 Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "D") Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "E") Or (InStr(pageName, "board_write") > 0 And menuCode2 = "D") Then
		If InStr(pageName, "board_04") > 0 Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "D") Or (InStr(pageName, "board_write") > 0 And menuCode2 = "D") Then
			subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "board_05") > 0 Or (InStr(pageName, "board_01_view") > 0 And menuCode2 = "E") Then
			subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="board_04.asp">칭찬하기</a> <%=subMenuOn(0)%></li>
			<li><a href="board_05.asp">이벤트</a> <%=subMenuOn(1)%></li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
<%
	ElseIf InStr(pageName, "login.asp") > 0 Or InStr(pageName, "member.asp") > 0 Or InStr(pageName, "member_find_info.asp") > 0 Then
		If InStr(pageName, "login.asp") > 0 Then
			subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "member.asp") > 0 Or InStr(pageName, "member_find_info.asp") > 0Then
			subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="login.asp">로그인</a> <%=subMenuOn(0)%></li>
			<li><a href="member.asp">회원가입</a> <%=subMenuOn(1)%></li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
<%
	ElseIf InStr(pageName, "member_change.asp") > 0 Or InStr(pageName, "member_reser.asp") > 0 Then
		If InStr(pageName, "member_change.asp") > 0 Then
			subMenuOn(0) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		ElseIf InStr(pageName, "member_reser.asp") > 0 Then
			subMenuOn(1) = "<span class=""sub-drop-menu-check""><img src=""/mobileweb/html/images/check.png"" border=""0"" /></span>"
		End If
%>
	<div class="sub-drop-menu">
		<ul>
			<li><a href="member_change.asp">회원정보수정</a> <%=subMenuOn(0)%></li>
			<li><a href="member_reser.asp">예약확인</a> <%=subMenuOn(1)%></li>
			<li class="sub-drop-menu-close"><img src="/mobileweb/html/images/x_bt.png" border="0" /></li>
		</ul>
	</div>
<%
	End If
%>