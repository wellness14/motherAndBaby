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

 

	mode		= fncRequest("mode")	
	contents	= Trim(fncRequest("service_content"))		' 
	 
	mem_id		= fncRequest("mem_id")						'  
	mem_nm		= fncRequest("mem_nm")						'  
 
  
 End If 

 hp = hp1 & "-" & hp2 & "-" & hp3

 '	1 생년월일
	If birth_j <> "" Then 
		birth_j_arr=split(birth_j,"-") 
		birth_y = birth_j_arr(0)
		birth_m = birth_j_arr(1)
		birth_d = birth_j_arr(2)
		birth = birth_y &  birth_m  &  birth_d 
	End If 

'-----------------------------------------------------------------------------

'쿼리문 작성부터 작업시작해야함. 11/04
'-----------------------------------------------------------------------------
'	데이터 확인  

	Select Case mode 
			Case "ins" :
 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_APP_SERVICE_CONSULT ( "
				strSql = strSql & "       MR_MEM_ID		"
				strSql = strSql & ",      MR_MEM_NM		"
			    strSql = strSql & ",      AS_CONTENT    "
				strSql = strSql & ",      AS_REPLY		"   
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(    "
				strSql = strSql & "	 		'"& mem_id &"' "
				strSql = strSql & "	,		'"& mem_nm &"'   "
				strSql = strSql & "	,		'"& contents &"' "
				strSql = strSql & "	,		'N' " 
				strSql = strSql & "	 		) ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""	

				strSql = strSql & " UPDATE MO_APP_SERVICE_CONSULT SET "
 
			    strSql = strSql & "       AS_CONTENT	= '"& contents &"' " 
 
				strSql = strSql & "	WHERE AS_SEQ = '"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




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
				parent.location.href = "./service_consult.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_consult.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_consult.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
