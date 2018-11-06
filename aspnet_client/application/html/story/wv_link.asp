<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->

<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
   Dim UCode
   UCode = Request("UCode")
   
   If UCode <> "" Then 
   
   Response.Cookies("APP").Domain 					= "mothernbaby.co.kr"
   Response.Cookies("APP")("APPUCODE") 		    = UCode
   
   Else

   Response.Cookies("APP").Domain 					= "mothernbaby.co.kr"
   Response.Cookies("APP")("APPUCODE") 		    = ""
   
   End If 
							  	  
   Response.Write "<script language='JavaScript'> " &_
                		    "location.href='list.asp';" &_
					        "</script>"


%>

