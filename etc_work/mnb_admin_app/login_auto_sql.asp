<%@Language="VBScript" CODEPAGE="65001" %>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8" 
	Session.codepage="65001" 
	Response.codepage="65001" 
	Response.ContentType="text/html;charset=utf-8" 

	mem_id		=	fncRequest("mem_id") 
	uname		=	fncRequest("uname") 

	If mem_id <> "" And uname <> "" Then 
		Response.Cookies ("uid").expires = Date +365 
		Response.Cookies ("uname").expires = Date +365 
		Response.Cookies ("auto_login_ck").expires = Date +365  
		Response.Cookies ("auto_login_ck")("Flag") = "on"
	End if

%>
<script type="text/javascript">
 <!--
   alert("자동로그인 설정되었습니다.");
//   parent.location.href="/etc_work/mnb_app/login.asp";
//-->
</script>