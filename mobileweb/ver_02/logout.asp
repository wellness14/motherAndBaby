<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"
%>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<%
'--------------------------------------------------------------
'	쿠키값 초기화

	'쿠키값 초기화 : 아이디	
	Response.Cookies("uid").Path = "/"
	Response.Cookies("uid").Domain = "mothernbaby.co.kr"
	Call SetCookie ("uid", "")
	'쿠키값 초기화 : 회원명
	Response.Cookies("uname").Path = "/"
	Response.Cookies("uname").Domain = "mothernbaby.co.kr"
	Call SetCookie ("uname", "")
	'쿠키값 초기화 : 회원구분
	Response.Cookies("mem_type").Path = "/"
	Response.Cookies("mem_type").Domain = "mothernbaby.co.kr"
	Call SetCookie ("mem_type", "")

	Response.Redirect "/mobileweb/ver_02/"
'--------------------------------------------------------------
%>
