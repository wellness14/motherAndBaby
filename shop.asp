<!--#include virtual="/common/asp/md5.asp"-->
<%
	Set dbCon = Server.CreateObject("ADODB.Connection")
	strConnect = "DSN=wellness;uid=wellnessdb;pwd=dnpfsltm14;"
	dbCon.Open strConnect

	sql = "SELECT * FROM gd_member"
	Set rs = dbCon.Execute(sql)

	Do Until rs.Eof
		Response.Write rs("password") & "<br>"
	rs.MoveNext
	Loop

'	sql = "insert into gd_member set"
'	sql = sql & " m_id = 'funnydog0121',"
'	sql = sql & " level = '1',"
'	sql = sql & " name = 'Å×½ºÆ®83',"
'	sql = sql & " password	= password('whh5213466'),"
'	sql = sql & " password_moddt = now(),"
'	sql = sql & " status = '1',"
'	sql = sql & " email = 'funnydog0121@gmail.com',"
'	sql = sql & " phone = '010-9061-1486',"
'	sql = sql & " mobile = '010-9061-1486',"
'	sql = sql & " mailling = 'y',"
'	sql = sql & " sms = 'n',"
'	sql = sql & " regdt = now()"
'	dbCon.Execute(sql)

	
	rs.Close
	Set rs = Nothing

	sql = "SELECT * FROM gd_member WHERE m_id = 'funnydog'"
	Set rs = dbCon.Execute(sql)
	
	Do Until rs.Eof
		m_no = rs("m_no")
		Response.Write m_no & "<br>"
	rs.MoveNext
	Loop

	rs.Close
	Set rs = Nothing

	sql = "SELECT * FROM gd_order WHERE m_no = '" & m_no & "' ORDER BY orddt DESC"
	Set rs = dbCon.Execute(sql)

	Do Until rs.Eof
		ordno = rs("ordno")

		sql = "SELECT oi.goodsnm, g.todaygoods, tg.goodstype FROM gd_order_item AS oi JOIN gd_goods AS g ON oi.goodsno=g.goodsno LEFT JOIN gd_todayshop_goods AS tg ON g.goodsno=tg.goodsno WHERE oi.ordno=" & ordno & " LIMIT 1"
		Set rs2 = dbCon.Execute(sql)
		Do Until rs2.Eof
			goodsnm = rs2("goodsnm")
			Response.Write goodsnm & "<br>"
		rs2.MoveNext
		Loop
		
		rs2.Close
		Set rs2 = Nothing
	rs.MoveNext
	Loop

	rs.Close
	Set rs = Nothing
	
	


	'*2B091D60D95FF384B3383FDCD97065B054AC54DF
	'2a32423039314436304439354646333834423333383346444344393730363542303534414335344446

	'SELECT m.m_no, m.m_id, m.name, m.nickname, m.email, m.status, m.level, m.password_moddt, g.dc, g.sno gsno
	'FROM gd_member AS m
	'LEFT JOIN gd_member_grp AS g ON m.level = g.level
	'WHERE m.m_id = 'funnydog'
	'AND m.password
	'IN (password( 'whh5213466' ) , old_password( 'whh5213466' ) , 'c8a430af58dd958bda543a09df63f4ec')

	'5f4dcc3b5aa765d61d8327deb882cf99

	'password = "password"
	'Response.Write md5(password)


	'SELECT m.m_no, m.m_id, m.name, m.nickname, m.email, m.status, m.level, m.password_moddt, g.dc, g.sno gsno
	'FROM gd_member AS m
	'LEFT JOIN gd_member_grp AS g ON m.level = g.level
	'WHERE m.m_id = 'funnydog'
	'AND m.password
	'IN (password( 'whh5213466' ) , old_password( 'whh5213466' ) , '5f4dcc3b5aa765d61d8327deb882cf99')
%>