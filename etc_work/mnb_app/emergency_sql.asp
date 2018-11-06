<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then  

	mode		= fncRequest("mode")	
	contents	= Trim(fncRequest("contents"))		' 
	hp1			= Trim(fncRequest("hp1"))			' 
	hp2			= Trim(fncRequest("hp2"))			' 
	hp3			= Trim(fncRequest("hp3"))			' 
	radio3		= Trim(fncRequest("radio3"))		' 조리원이용
	birth_j		= fncRequest("birth")				'  
	mem_id		= fncRequest("mem_id")				'  
	mem_nm		= fncRequest("mem_nm")				'  
	ch_type		= fncRequest("ch_type")				'  분만타입
	gender		= fncRequest("gender")				'  성별
 

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
				strSql = strSql & " INSERT INTO MO_EMERGENCY_SERVICE ( "
				strSql = strSql & "       MR_MEM_ID  "
				strSql = strSql & ",      MR_MEM_NM  "
			    strSql = strSql & ",      MR_HP   "
				strSql = strSql & ",      MR_CHILDBIRTH " 
		        strSql = strSql & ",      ME_TYPE " 
				strSql = strSql & ",      ME_CHILD_GENDER  " 
				strSql = strSql & ",      MR_CLINIC  " 
				strSql = strSql & ",      MR_CONTENT  "  
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(    "
				strSql = strSql & "	 		'"& mem_id &"' "
				strSql = strSql & "	,		'"& mem_nm &"'   "
				strSql = strSql & "	,		'"& hp &"' "
				strSql = strSql & "	,		'"& birth &"' "
				strSql = strSql & "	,		'"& ch_type &"'  "
				strSql = strSql & "	,		'"& gender &"'   "
				strSql = strSql & "	,		'"& radio3 &"'   "
				strSql = strSql & "	,		'"& contents &"'   "
				strSql = strSql & "	 		) ; "
	'			response.Write strSql
	'			response.End 

	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
		Case "upd" : 

				strSql = ""	

				strSql = strSql & " UPDATE MO_EMERGENCY_SERVICE SET "
 
			    strSql = strSql & "       MR_HP			  ='"& hp &"' "
				strSql = strSql & ",      MR_CHILDBIRTH	  ='"& birth &"' "
		        strSql = strSql & ",      ME_TYPE		  ='"& ch_type &"' "
				strSql = strSql & ",      ME_CHILD_GENDER ='"& gender &"' " 
				strSql = strSql & ",      MR_CLINIC		  ='"& radio3 &"' " 
				strSql = strSql & ",      MR_CONTENT	  ='"& contents &"' " 
 
 
				strSql = strSql & "	WHERE EM_SEQ='"& idx &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_EMERGENCY_SERVICE SET "
					strSql = strSql & " MS_CNLKBN ='Y'	WHERE EM_SEQ='"& idx &"' "
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
				parent.location.href = "./emergency_talk.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./emergency_talk.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./emergency_talk.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
