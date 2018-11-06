
<%'=====================================================================================================
'-  Define  : 로그아웃처리
'-  Dev_Day : GULLIVER-2003.04.16
'-  Cerrect : 
'-  Ref_Tab : 
'=====================================================================================================%>
<%
													
Response.Cookies("partner").Domain 			= "mothernbaby.co.kr"
Response.Cookies("partner")("CID") 			= ""
Response.Cookies("partner")("sCode") 		= ""
Response.Cookies("partner")("cName") 		= ""
Response.Cookies("partner")("authlevel")	= ""

Response.Write "<script language='JavaScript'> " &_
						 "location.href='/application/admin/login.asp';" &_
						 "</script>" 
%>
