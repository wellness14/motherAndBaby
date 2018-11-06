<%
	DBConStr = "Provider=SQLOLEDB;User Id=wellness14;PWD=wellness141414;Data Source=wellness14.cafe24.com;Initial Catalog=wellness14;"

	Set DBCon = Server.CreateObject("ADODB.Connection") 'DB¿¡ ¿¬°á
	
	DBCon.CursorLocation = 3 'client cursor
	DBCon.Open DBConStr

	sql = "SELECT * FROM dbo.MO_MEM_CERT"

	Set Result = DBCon.Execute(sql)

	Do Until Result.Eof
		Response.write Result("MC_CERT_NUM") & "<br>"

		Result.MoveNext
	Loop
%>