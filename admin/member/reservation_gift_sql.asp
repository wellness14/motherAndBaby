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
	P_name		= Trim(fncRequest("P_name"))   ' ��𵵿�� ������
	cate		= Trim(fncRequest("cate"))  '��𵵿�� �̸�
	use_yn	= Trim(fncRequest("use_yn"))   '��𵵿�� ���� ���

	local		= Trim(fncRequest("local"))   ' ��𵵿�� ������
	part	= Trim(fncRequest("part"))  '��𵵿�� �̸�
	filePath	= Trim(fncRequest("filePath")) '���� ����

 End if
 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	������ Ȯ��
	Select Case mode 
			Case "ins" :
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_RESERVATION_GIFT ( "
				strSql = strSql & "       MD_GIFT_SEQ "
				strSql = strSql & ",      MD_GIFT_NAME "
			    strSql = strSql & ",      MD_GIFT_CATEGORY "
		        strSql = strSql & ",      MD_GIFT_USE_YN "
				strSql = strSql & ",      MD_GIFT_LOCAL "
				strSql = strSql & ",      MD_GIFT_LOCAL_DETAIL "
				strSql = strSql & ",      MD_GIFT_PICTURE "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MD_GIFT_SEQ), 0) + 1 FROM MO_RESERVATION_GIFT) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& use_yn &"' "
				strSql = strSql & "	,		'"& local &"'  "
				strSql = strSql & "	,		'"& part &"'   "
				strSql = strSql & "	,		'"& filePath &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_RESERVATION_GIFT SET "
				strSql = strSql & "		MD_GIFT_NAME ='"& P_name &"' "
				strSql = strSql & "		,MD_GIFT_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MD_GIFT_USE_YN ='"& use_yn &"' "
				strSql = strSql & "		,MD_GIFT_LOCAL ='"& local &"' "
				strSql = strSql & "		,MD_GIFT_LOCAL_DETAIL ='"& part &"' "
				strSql = strSql & "		,MD_GIFT_PICTURE ='"& filePath &"' "
 
				strSql = strSql & "	WHERE MD_GIFT_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_RESERVATION_GIFT  "
					strSql = strSql & "	WHERE MD_GIFT_SEQ='"& idx &"' "
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
				parent.location.href = "./reservation_gift_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./reservation_gift_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./reservation_gift_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
