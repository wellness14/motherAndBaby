<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
 
	idx				= fncRequest("idx")   
	mode			= fncRequest("mode")	
 
	as_reply_content	= Trim(fncRequest("as_reply_content"))			'	
   
 
 

'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인

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
				alert('회원정보를 확인해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./service_consult_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_consult_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_consult_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
