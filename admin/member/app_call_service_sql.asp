<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
 	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then  
 
	call_service	= fncRequest("call_service")				
	hp1				= Trim(fncRequest("hp1"))			' 
	hp2				= Trim(fncRequest("hp2"))			' 
	hp3				= Trim(fncRequest("hp3"))			'    
	datepicker		= fncRequest("datepicker")		'  
	con_time		= fncRequest("con_time")		'  
	con_minute		= fncRequest("con_minute")		'   
	content			= fncRequest("content")					'   content_memo
 	content_memo	= fncRequest("content_memo")				'   content_memo
	finish_flg		= fncRequest("finish_flg")				'   content_memo
 End If 

 hp = hp1 & "-" & hp2 & "-" & hp3

 '	1 �и�������
	If child_birth <> "" Then 
		birth_j_arr=split(child_birth,"-") 
		birth_y = birth_j_arr(0)
		birth_m = birth_j_arr(1)
		birth_d = birth_j_arr(2)
		birth = birth_y &  birth_m  &  birth_d 
	End If 

'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��

	Select Case mode 
		Case "ins" :
 
  
		Case "upd" : 

 
				strSql = ""	 
				strSql = strSql & " UPDATE MO_APP_CALL_SERVICE SET " 
			    strSql = strSql & "       CALL_SERVICE_TYPE		='"& call_service &"' "
				strSql = strSql & ",      CALL_WANT_DATE		='"& datepicker &"' "
		        strSql = strSql & ",      CALL_WANT_TIME		='"& con_time &"' "
				strSql = strSql & ",      CALL_WANT_MINUTE		='"& con_minute &"' " 
				strSql = strSql & ",      CALL_HP				='"& hp &"' " 
				strSql = strSql & ",      CALL_CONTENT			='"& content &"' " 
				strSql = strSql & ",      CALL_FINISH_FLG		='"& finish_flg &"' " 
				strSql = strSql & ",      CALL_MEMO				='"& content_memo &"' " 
 
				strSql = strSql & "	WHERE CALL_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "del" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_APP_CALL_SERVICE SET "
					strSql = strSql & " CALL_CNLKBN ='Y'	WHERE CALL_SEQ='"& idx &"' "
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
				parent.location.href = "./app_call_service_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./app_call_service_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./app_call_service_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
