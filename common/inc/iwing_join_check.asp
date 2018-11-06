<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->

<%
' "proc_type":'insertUser',"user_id":id1,"pwd":pwd,"nickname":nickname,"birthday":"20150101","phone":hp_num,"pn_mem_id":"mBaby"

mem_id = fncRequest("user_id")
pwd = fncRequest("pwd")
nickname = fncRequest("nickname")
birthday = fncRequest("birthday")
phone = fncRequest("phone")


Ybirth			= fncRequest("Ybirth")				' 생년월일
Mbirth			= fncRequest("Mbirth")				' 생년월일
Dbirth			= fncRequest("Dbirth")				' 생년월일

If Ybirth <> "" And Mbirth <> "" And Dbirth <> "" Then 
birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
End If 



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

strTEMP = FnGET_INFO_URL("http://iwing.mflare.co.kr:8080/iwingEvent/controller?do=API_USER_ACTION&proc_type=insertUser&user_id="&mem_id&"&pwd="&pwd&"&nickname="&nickname&"&birthday="&birth&"&phone="&phone&"&pn_mem_id=mBaby")
Response.write strTEMP

%>

