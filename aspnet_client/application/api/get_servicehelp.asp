<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_servicehelp.asp


	Response.write "{"
     response.write """errcode"""
	   response.write ":"
	   response.write """0"""
	   response.write ","
	   response.write """errmsg"""
	   response.write ":"
	   response.write """success"""
       response.write ","
     Response.write """infolist"": ["
        Response.write "{"
            Response.write """cemail"": ""kujalm5@gmail.com"","
			Response.write """Tel"": ""070-5557-3573"""
        Response.write "}"
      Response.write "]"
    Response.write "}"


%>
