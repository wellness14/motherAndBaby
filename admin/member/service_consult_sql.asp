<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
 
	idx				= fncRequest("idx")   
	mode			= fncRequest("mode")	
 
	as_reply_content	= Trim(fncRequest("as_reply_content"))			'	
   
 
 

'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��

	Select Case mode 
		Case "ins" :
 

	
		Case "upd" : 

				strSql = ""	 
				strSql = strSql & " UPDATE MO_APP_SERVICE_CONSULT SET " 
			    strSql = strSql & "       AS_REPLY_CONTENT			  ='"& as_reply_content &"' " 

				strSql = strSql & "	WHERE AS_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
 

			Case "del" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_APP_SERVICE_CONSULT SET "
					strSql = strSql & " AS_CNLKBN ='Y'	WHERE AS_SEQ='"& idx &"' "
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
				parent.location.href = "./service_consult_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./service_consult_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./service_consult_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
