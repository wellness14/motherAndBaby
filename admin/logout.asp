<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	'▒▒▒▒▒▒▒▒▒▒▒▒ 쿠키값 초기화 ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒

	'쿠키값 초기화 : 아이디	
	Call SetCookie ("userid", "")
	'쿠키값 초기화 : 회원명
	Call SetCookie ("username", "")
	'쿠키값 초기화 : 회원구분
	Call SetCookie ("mem_type", "")
	'쿠키값 초기화 : 난수
	Call SetCookie ("encval", "")
	'쿠키값 초기화 : 메일주소
	Call SetCookie ("useremail", "")
	'쿠키값 초기화 : 학년
	Call SetCookie ("usergrade", "")
	'쿠키값 초기화 : 자녀아이디
	Call SetCookie ("childid", "")
	'쿠키값 초기화 : 컴정보
	Call SetCookie ("com_info", "")

	Call SetCookie ("usergrpcd", "")

	Call SetCookie ("userlevel", "")

	Call SetCookie ("usergrpcd2", "")

	Response.Redirect "/admin/index.asp"
%>
