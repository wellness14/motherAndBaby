<%
'======================================================================
'�� �� �� : mothernbaby - ������
'����� : ���� ��� ������ ����
'�� �� �� : Create RecordSet object
'			����� ������ ���� call
'			����� ������ ��ü ��ȯ call RSClose(RecordSet�̸�)
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>
<!-- #include virtual = "/mobileweb/common/asp/DBSrv.asp" -->
<%
'===========================================================================
'�Լ���		: DBexec
'INPUT 		: sSQL(������ Query ����),DBTarget(�� ����Ÿ���̽� ����̽� ���� ����)
'��ɼ���	: ���� ������ ���̽� ���� ��ü ����/����
'===========================================================================
Function DBexec(sSQL,DBTarget)
	Dim DBCon
	On Error Resume Next

	If  LEN(sSQL) = 0 Then
		Response.Write "<br><font size=2>�������� 1 : ������ SQL���� �Է��ϼ���.</font><br>"
		response.end
		Exit function
	End If

	Select Case DBTarget
		Case "main"			:	DBTgt = DBConMothernbaby
       	Case Else
			Response.Write "<br><font size=2>�������� 2 : ������ ����Ÿ���̽��� ��Ȯ�� ���ڿ��� �Է��Ͻÿ�!</font><br>"
			Response.End
	End Select

	Set DBCon=Server.CreateObject("ADODB.Connection") 'DB�� ����
	
	DBCon.CursorLocation = 3	'client cursor
	DBCon.Open DBTgt
	if Err.number <> 0 Then
		response.write "<br><font size=2>�������� 3 : DB Open Error!! �����ͺ��̽��� ���������� �������� ���Ͽ����ϴ�.</font><br>"
		v_to = "pico@megastudy.net;ysoh@megastudy.net;ymkim@megastudy.net;cheolung@megastudy.net;cellist@megastudy.net;"& _
			"momo3574@megastudy.net;choipd75@megastudy.net;bkstory@megastudy.net"
		v_from = "sysadmin@megastudy.net"
		v_subject = "�������� 3 : DB Open Error!! �����ͺ��̽��� ���������� �������� ���Ͽ����ϴ�."
		htmlstr = "�����߻������� : " & request.servervariables("LOCAL_ADDR") & "<br>"
		htmlstr = htmlstr & "�����߻��������� : " & request.servervariables("PATH_INFO") & "<br>"
		htmlstr = htmlstr & "�����߻������ͺ��̽������� : "& DBTarget
		call SendHtmlMail(v_to,v_from,v_subject,htmlstr)
		Response.End
		Exit Function
	End If

	Set DBexec = DBCon.Execute(sSQL)

	If Err.number <> 0 Then
		err_source = replace(Err.Source,"'","''")
		err_description = replace(Err.description,"'","''")
		err_number = replace(Err.Number,"'","''")
		err_page = replace(request.servervariables("URL"),"'","''")
		sErr = "<TABLE cellSpacing=1 cellPadding=1 width='80%' border=1 align=center>"
		sErr = sErr & "<TR><TD width='12%'><FONT SIZE=2>�������� 4</FONT></TD><TD><FONT SIZE=2>��ü���̳� �÷� Ȥ�� �μ����� �߸��Ǿ����ϴ�.</FONT></TD></TR>"
		sErr = sErr & "<TR><TD ><FONT SIZE=2>������ü��</FONT></TD><TD><FONT SIZE=2>"&Err.Source&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>��������</FONT></TD><TD><FONT SIZE=2>"&Err.description&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>������ȣ</FONT></TD><TD><FONT SIZE=2>"&Err.Number&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>QUERY</FONT></TD><TD><FONT SIZE=2>"&sSQL&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>����������</FONT></TD><TD><FONT SIZE=2>"&err_page&"</FONT></TD></TR>"
		sErr = sErr & "</TABLE>"
		Response.Write sErr

		call DBclose(DBcon)

		Set DBCon=Server.CreateObject("ADODB.Connection") 'DB�� ����
		DBCon.CursorLocation = 3	'client cursor
		DBCon.Open DBConManager
		SQL = "INSERT ERROR_WEB VALUES ('"&err_source&"','"&err_description&"','"&err_number&"','"&sSQL&"',GETDATE())"
		DBCon.Execute(SQL)
		call DBclose(DBcon)

		Response.End
		Exit Function
	End If

End function
'===========================================================================
'�Լ���		: DBClose
'INPUT 		:
'��ɼ���	: ���� ������ ���̽� ���� ��ü �Ҹ�
'===========================================================================
Function DBClose(DBCon)
	If IsObject(DBCon) = True Then
		DBCon.Close
		Set DBCon = Nothing
	end if
End Function
'===========================================================================
'�Լ���		: RSexec
'INPUT 		: rsName(RecordSet��ü������Instance �̸�),pSize(PageSize ����)
'		  cType : CursorType ����
'			0 : AdOpenForwardOnly(MoveNext�� ����)
'			1 : AdOpenKeyset(���� ����Ÿ�� �� �� ����)
'			2 : AdOpenDynamic(��� ����� Ŀ������)
'			3 : AdOpenStatic(����Ÿ �˻��̳� ����Ʈ �����ÿ� ���)
'		  sSQL(������ Query ����),DBTarget(�� ����Ÿ���̽� ����̽� ���� ����)
'��ɼ���	: ���ڵ�� ��ü ����/����
'===========================================================================
Function RSexec(rsName,pSize,cType,sSQL,DBTarget)
	Dim globalDBCon
	On Error Resume Next

	If  LEN(sSQL) = 0 Then
		Response.Write "<br><font size=2>�������� 1 : ������ SQL���� �Է��ϼ���.</font><br>"
		response.end
		Exit function
	End If

	Select Case DBTarget
		Case "main"			:	DBTgt = DBConMothernbaby
		Case "study"		:	DBTgt = DBConMegaStudy			'���� DB
		Case Else
			Response.Write "<br><font size=2>�������� 2 : ������ ����Ÿ���̽��� ��Ȯ�� ���ڿ��� �Է��Ͻÿ�!</font><br>"
			Response.End
	End Select

	If IsObject(globalDBCon) = False Then
		Set globalDBCon = Server.CreateObject("ADODB.Connection")
		globalDBCon.CursorLocation = 3
		globalDBCon.Open DBTgt
		if Err.number <> 0 Then
			response.write "<br><font size=2>�������� 3 : DB Open Error!! �����ͺ��̽��� ���������� �������� ���Ͽ����ϴ�.</font><br>"
			v_to = "pico@megastudy.net;ysoh@megastudy.net;ymkim@megastudy.net;cheolung@megastudy.net;cellist@megastudy.net;"& _
				"momo3574@megastudy.net;choipd75@megastudy.net;bkstory@megastudy.net"
			v_from = "sysadmin@megastudy.net"
			v_subject = "�������� 3 : DB Open Error!! �����ͺ��̽��� ���������� �������� ���Ͽ����ϴ�."
			htmlstr = "�����߻������� : " & request.servervariables("LOCAL_ADDR") & "<br>"
			htmlstr = htmlstr & "�����߻��������� : " & request.servervariables("PATH_INFO") & "<br>"
			htmlstr = htmlstr & "�����߻������ͺ��̽������� : "& DBTarget
			call SendHtmlMail(v_to,v_from,v_subject,htmlstr)
			Response.End
			Exit Function
		End If
	End If

	Set rsName = Server.CreateObject("ADODB.RecordSet")

	If Psize <> "0" Then		'Psize�� 0���� ���õǸ� Pagesize�� ���� ����.
		RSName.PageSize = Psize
	End If

	globalDBCon.CursorLocation = 3
	RSName.Open sSQL, globalDBCon, Ctype

	If Err.number <> 0 Then
		err_source = replace(Err.Source,"'","''")
		err_description = replace(Err.description,"'","''")
		err_number = replace(Err.Number,"'","''")
		err_page = replace(request.servervariables("URL"),"'","''")
		sErr = "<TABLE cellSpacing=1 cellPadding=1 width='80%' border=1 align=center>"
		sErr = sErr & "<TR><TD width='12%'><FONT SIZE=2>�������� 4</FONT></TD><TD><FONT SIZE=2>��ü���̳� �÷� Ȥ�� �μ����� �߸��Ǿ����ϴ�.</FONT></TD></TR>"
		sErr = sErr & "<TR><TD ><FONT SIZE=2>������ü��</FONT></TD><TD><FONT SIZE=2>"&Err.Source&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>��������</FONT></TD><TD><FONT SIZE=2>"&Err.description&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>������ȣ</FONT></TD><TD><FONT SIZE=2>"&Err.Number&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>QUERY</FONT></TD><TD><FONT SIZE=2>"&sSQL&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>����������</FONT></TD><TD><FONT SIZE=2>"&err_page&"</FONT></TD></TR>"
		sErr = sErr & "</TABLE>"
		Response.Write sErr
		call RSclose(rsName)

		Set DBCon=Server.CreateObject("ADODB.Connection") 'DB�� ����
		DBCon.CursorLocation = 3	'client cursor
		DBCon.Open DBConManager
		SQL = "INSERT ERROR_WEB VALUES ('"&err_source&"','"&err_description&"','"&err_number&"','"&sSQL&"','"&err_page&"',GETDATE())"
		DBCon.Execute(SQL)
		call DBclose(DBcon)

		Response.End
		Exit Function
	End If

End Function
'===========================================================================
'�Լ���		: RSClose
'INPUT 		: rsName
'��ɼ���	: ���ڵ�� ��ü �Ҹ�
'===========================================================================
Function RSClose(rsName)
	if IsObject(rsName) = True Then
		rsName.Close
		Set rsName = Nothing
	end if
	If IsObject(globalDBCon) = True Then
		globalDBCon.Close
		Set globalDBCon = Nothing
	End If
End Function
%>
