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

	   
	P_name		= Trim(fncRequest("P_name"))   ' �Ҹ�ǰ��
	cate		= Trim(fncRequest("cate"))  'ǰ��
	price		= Trim(fncRequest("price"))   '��뱸��
	somo_gubun	= Trim(fncRequest("somo_gubun"))   '��뱸��
	use_yn		= Trim(fncRequest("use_yn"))   '��뱸��
 
 

 End if
 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	������ Ȯ��
	Select Case mode 
			Case "ins" :
	 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_CONSUMABLES ( "
				strSql = strSql & "       MO_CONSUMABLES_SEQ "
				strSql = strSql & ",      MO_CONSUMABLES_NAME "
			    strSql = strSql & ",      MO_CONSUMABLES_CATEGORY "
		        strSql = strSql & ",      MO_CONSUMABLES_PRICE "
				strSql = strSql & ",      MO_CONSUMABLES_USE_YN "
				strSql = strSql & ",      MO_CONSUMABLES_GUBUN "
			 
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MO_CONSUMABLES_SEQ), 0) + 1 FROM MO_CONSUMABLES) "
				strSql = strSql & "	,		'"& P_name &"' "
				strSql = strSql & "	,		'"& cate &"'   "
				strSql = strSql & "	,		'"& price &"' "
				strSql = strSql & "	,		'"& use_yn &"'  "
				strSql = strSql & "	,		'"& somo_gubun &"') ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
%>
 
<%
		Case "upd" : 

				strSql = ""

				strSql = strSql & " UPDATE MO_CONSUMABLES SET "
				strSql = strSql & "		 MO_CONSUMABLES_NAME ='"& P_name &"' "
				strSql = strSql & "		,MO_CONSUMABLES_CATEGORY ='"& cate &"' "
				strSql = strSql & "		,MO_CONSUMABLES_PRICE ='"& price &"' "
				strSql = strSql & "		,MO_CONSUMABLES_USE_YN ='"& use_yn &"' "
				strSql = strSql & "		,MO_CONSUMABLES_GUBUN ='"& somo_gubun &"' "
 
				strSql = strSql & "	WHERE MO_CONSUMABLES_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_CONSUMABLES  "
					strSql = strSql & "	WHERE MO_CONSUMABLES_SEQ='"& idx &"' "
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
				parent.location.href = "./consumables_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./consumables_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./consumables_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
