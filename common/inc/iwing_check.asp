<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->

<%

mem_id = fncRequest("user_id")

Function FnGET_INFO_URL(mem_id)
 Dim RStr, xmlHttp
 Set xmlHttp = Server.CreateObject("Microsoft.XMLHTTP")
 xmlHttp.open "GET", mem_id, False
 xmlHttp.setRequestHeader "Content-Type", "text/xml"
 xmlHttp.setRequestHeader "Accept-Language", "ko"
 xmlHttp.send
 If xmlHttp.status = 200 Then
  RStr = xmlHttp.ResponseText
 Else
  RStr = "get_fail"
 End If
 Set xmlHttp = Nothing
 FnGET_INFO_URL = RStr
End Function
 
Response.write request("mem_id")

strTEMP = FnGET_INFO_URL("http://iwing.mflare.co.kr:8080/iwingEvent/controller?do=API_USER_ACTION&proc_type=checkUserId&user_id="&mem_id)
Response.write strTEMP

%>

