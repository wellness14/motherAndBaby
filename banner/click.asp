<!-- #include virtual = "/common/asp/RSexec.asp" -->
<%
	b = request("b")

	If b = "1" Then
		contents = "pointrental_web"
		url = "http://www.pointrental.co.kr/mypage/promotion/promotionDetail03.do?utm_source=partner&utm_medium=display&utm_campaign=motherbaby"
	ElseIf b = "2" Then
		contents = "pointrental_mobile"
		url = "http://m.pointrental.co.kr/mobile/mypage/promotion/promotionDetail03.do?utm_source=partner&utm_medium=display&utm_campaign=motherbaby"
	ElseIf b = "3" Then
		contents = "dongyang_mnb_120"
		url = "https://online.myangel.co.kr/go.e1004?p=MAB003"
	ElseIf b = "4" Then
		contents = "dongyang_mnb_525"
		url = "https://online.myangel.co.kr/go.e1004?p=MAB004"
	ElseIf b = "5" Then
		contents = "dongyang_mns_120"
		url = "https://online.myangel.co.kr/go.e1004?p=MAS003"
	ElseIf b = "6" Then
		contents = "dongyang_mns_350"
		url = "https://online.myangel.co.kr/go.e1004?p=MAS003"
	ElseIf b = "7" Then
		contents = "dongyang_lp_300"
		url = "https://online.myangel.co.kr/go.e1004?p=MAS004"
	ElseIf b = "8" Then
		contents = "dongyang_mc_540"
		url = "https://online.myangel.co.kr/go.e1004?p=MAC002"
	End If

	strSql = "INSERT INTO BANNER_CLICK(BANNER, CONTENTS) VALUES('" & b & "', '" & contents & "');"
	Call DBExec(strSql, "main") : Call DBClose(DBCon)

	Response.redirect url
%>