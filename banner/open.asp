<!-- #include virtual = "/common/asp/RSexec.asp" -->
<%
	Response.Expires = 0
	Response.Buffer = True
	Response.Clear

	Dim b, contents, banner
	b = request("b")
	
	If b = "3" Then
		contents = "dongyang_mnb_120"
		banner = "mb_event_pc.jpg"
	ElseIf b = "4" Then
		contents = "dongyang_mnb_525"
		banner = "mb_event_mw.jpg"
	ElseIf b = "5" Then
		contents = "dongyang_mns_120"
		banner = "ms_event_pc.jpg"
	ElseIf b = "6" Then
		contents = "dongyang_mns_350"
		banner = "ms_event_mw.jpg"
	ElseIf b = "7" Then
		contents = "dongyang_lp_300"
		banner = "late_event_pc.jpg"
	ElseIf b = "8" Then
		contents = "dongyang_mc_540"
		banner = "momcho_event_app.gif"
	End If
	
	'Response.write site & "<br>"
	'Response.write size & "<br>"
	'Response.write Server.MapPath("/banner/img") & "\" & banner

	strSql = "INSERT INTO BANNER_OPEN(BANNER, CONTENTS) VALUES('" & b & "', '" & contents & "');"
	Call DBExec(strSql, "main") : Call DBClose(DBCon)

	Dim	objStream
	Set objStream = Server.CreateObject("ADODB.Stream")

	objStream.Type = 1
	objStream.Open
	objStream.LoadFromFile Server.MapPath("/banner/img") & "\" & banner

	Response.ContentType = "image"
	Response.AddHeader "content-disposition", "inline;filename=" & banner
	Response.BinaryWrite objStream.Read

	objStream.Close
	Set objStream = Nothing
%>