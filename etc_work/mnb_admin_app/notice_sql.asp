<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	idx		= fncRequest("idx")   
	mode	= fncRequest("mode")	


If mode = "ins" Or mode = "upd" Then   
 
	mem_id				=	fncRequest("mem_id")				'  
	mem_nm				=	fncRequest("uname")	
	notice_title		=	fncRequest("notice_title")			 
	notice_content		=	fncRequest("notice_content")	
	user_ip				=	fncRequestVariables("REMOTE_ADDR")
 
 End If 
  
'-----------------------------------------------------------------------------
  
'-----------------------------------------------------------------------------
'	데이터 확인
 
	Select Case mode 
			Case "ins" :
 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_BRD_NOTICE ( "
				strSql = strSql & "       BA_SEQ  "
				strSql = strSql & ",      BA_DPH  "
			    strSql = strSql & ",      BA_PIDX   "
				strSql = strSql & ",      BA_TYPE " 
		        strSql = strSql & ",      BA_MEM_ID " 
				strSql = strSql & ",      BA_MEM_NM  " 
				strSql = strSql & ",      BA_TITLE  " 
				strSql = strSql & ",      BA_CONTENT  "  
				strSql = strSql & ",      BA_IP  "    
				strSql = strSql & ",      BA_NOTICE_FLG  "   
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "		(														  "
				strSql = strSql & "	 		(SELECT ISNULL(MAX(BA_SEQ), 0) + 1 FROM MO_BRD_NOTICE)  "
				strSql = strSql & "	,		'1'  "
				strSql = strSql & "	,		(SELECT ISNULL(MAX(BA_PIDX), 0) + 1 FROM MO_BRD_NOTICE) "
				strSql = strSql & "	,		'공지'   "
				strSql = strSql & "	,		'"& mem_id &"' "
				strSql = strSql & "	,		'"& mem_nm &"' "
				strSql = strSql & "	,		'"& notice_title &"' "
				strSql = strSql & "	,		'"& notice_content &"' "
				strSql = strSql & "	,		'"& user_ip &"'  " 
				strSql = strSql & "	,		'M'  "
				strSql = strSql & "		) ; "
	'			response.Write strSql
	'			response.End 
   
	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2
 
 
 
%>
 
<%
			Case "upd" : 

 



			Case "del" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_BRD_NOTICE SET "
					strSql = strSql & " BA_CNLKBN =	'Y'	WHERE BA_IDX =	'"& idx &"' "
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
				parent.location.href = "./notice_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./notice_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./notice_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
