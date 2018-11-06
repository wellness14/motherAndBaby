<% @Language="VBScript" CODEPAGE="949" %>
<%
Response.CharSet="euc-kr"
Session.codepage="949"
Response.codepage="949"
Response.ContentType="text/html;charset=euc-kr"
%>
<%
Response.write "접속시도<br/><br/>"

Set dbConGodo = Server.CreateObject("ADODB.Connection")
strConnectGodo = "DSN=wellness;UID=wellnessdb;PWD=dnpfsltm14;"
dbConGodo.Open strConnectGodo

Response.write "<br/>성공"
%>