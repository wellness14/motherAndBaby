<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_sql.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
idx = fncRequest("idx")  

mode			= fncRequest("mode")	
If mode = "ins" Or mode = "upd" Then 

	   mode			= fncRequest("mode")	
	P_name		= Trim(fncRequest("ser_program"))   ' ���� ���α׎c
	cate		= Trim(fncRequest("cate"))  '���� Ÿ��
	term	= Trim(fncRequest("term"))   ' ���� �Ⱓ 
	price	= Trim(fncRequest("price"))   ' ���� price 
	code	= Trim(fncRequest("code"))   ' ���� price 

	local		= Trim(fncRequest("local"))   ' ��𵵿�� ������
	part	= Trim(fncRequest("part"))  '��𵵿�� �̸�
	filePath	= Trim(fncRequest("filePath")) '���� ����

 End if
 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	������ Ȯ��
	Select Case mode 
			Case "ins" :


	strTable = " from	MO_DATA   "
	 
	strWhere = " WHERE MO_DATA_SEQ = '"& idx &"' "

 
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_DATA ( "
				strSql = strSql & "       MO_DATA_SEQ "
				strSql = strSql & ",      MO_DATA_NAME "
			    strSql = strSql & ",      MO_DATA_CATEGORY "
		        strSql = strSql & ",      MO_DATA_TERM "
				strSql = strSql & ",      MO_DATA_PRICE "
				strSql = strSql & ",      MO_DATA_CODE "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MO_DATA_SEQ), 0) + 1 FROM MO_DATA) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& term &"' "
				strSql = strSql & "	,		'"& price &"' "
				strSql = strSql & "	,		'"& code &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 


%>

<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_DATA SET "
				strSql = strSql & "		MO_DATA_NAME ='"& P_name &"' "
				strSql = strSql & "		,MO_DATA_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MO_DATA_TERM ='"& term &"' "
				strSql = strSql & "		,MO_DATA_PRICE ='"& price &"' "
				strSql = strSql & "		,MO_DATA_CODE ='"& code &"' "
 
				strSql = strSql & "	WHERE MO_DATA_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_DATA  "
					strSql = strSql & "	WHERE MO_DATA_SEQ='"& idx &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		
	End Select 
 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('ȸ�������� Ȯ���� �ּ���');
				history.go(-1);
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "./data_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./data_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./data_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
