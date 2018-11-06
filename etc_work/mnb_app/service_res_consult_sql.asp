<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%


'11월5일 여기 인서트부터 작업해야함
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then  

 

	mode				= fncRequest("mode")	 
	 
	mem_nm				= fncRequest("mem_nm")						'  
	hp1					= fncRequest("hp1")		
	hp2					= fncRequest("hp2")'  
	hp3					= fncRequest("hp3")
	call_service		= fncRequest("call_service")
	psb_con_date		= fncRequest("psb_con_date")
	con_time			= fncRequest("con_time")
	con_minute			= fncRequest("con_minute")
	contents			= fncRequest("contents")
 

 
  
 End If 

 If hp1 <> "" Then 
	 hp = hp1 & "-" & hp2 & "-" & hp3
 End if
 '	1 생년월일
 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	데이터 확인  

 

	Select Case mode 
			Case "ins" :
 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_APP_CALL_SERVICE ( "
				strSql = strSql & "       CALL_NAME				"
				strSql = strSql & ",      CALL_SERVICE_TYPE		"
			    strSql = strSql & ",      CALL_WANT_DATE		"
				strSql = strSql & ",      CALL_WANT_TIME		"   
				strSql = strSql & ",      CALL_WANT_MINUTE		"   
				strSql = strSql & ",      CALL_HP				" 
				strSql = strSql & ",      CALL_CONTENT			" 
				strSql = strSql & ",      CALL_FINISH_FLG		"
				strSql = strSql & " )							"
				strSql = strSql & " VALUES "
				strSql = strSql & "			(					"
				strSql = strSql & "	 		'"& mem_nm &"'		"
				strSql = strSql & "	,		'"& call_service &"'"
				strSql = strSql & "	,		'"& psb_con_date &"'"
				strSql = strSql & "	, 		'"& con_time &"'	"
				strSql = strSql & "	,		'"& con_minute &"'	"
				strSql = strSql & "	,		'"& hp &"'			"
				strSql = strSql & "	,		'"& contents &"'	" 
				strSql = strSql & "	,		'N' " 
				strSql = strSql & "	 		); "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
  
		Case "upd" : 
 




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_APP_SERVICE_CONSULT SET "
					strSql = strSql & " AS_CNLKBN ='Y'	WHERE AS_SEQ = '"& idx &"' "
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
				parent.location.href = "./service_n_info.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_n_info.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_n_info.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
