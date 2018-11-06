<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
session.CodePage = 65001
Response.ChaRset = "UTF-8"

Response.buffer=True
Response.Expires=-1


%>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<!--#include virtual="/mobileweb/common/inc/sms_func.asp"-->
<%
'-------------------------------------------------------------------------------------------
'	Request
	Dim sms_url		: sms_url = "http://sslsms.cafe24.com/sms_sender.php"	' SMS 요청 URL
	Dim user_id	    : user_id	= "wellness1414"							' SMS 아이디
	Dim secure	    : secure	= "1b811eb41bb2f6f0f246392b3d164579"		' 인증키 
	Dim encoderurl  : encoderurl = "Y"										' 리턴 URL을 encode 해서 받을지를 결정합니다. (사용:Y, 사용안함:N, Y가 아닐 경우 변수를 여러개 넘겨받을 없습니다.)
	Dim msg	        : msg			= request.Form("msg")
	Dim rphone	    : rphone		= request.Form("rphone")
	Dim sphone1	    : sphone1		= request.Form("sphone1")
	Dim sphone2	    : sphone2		= request.Form("sphone2")
	Dim sphone3	    : sphone3		= request.Form("sphone3")
	Dim rdate	    : rdate			= request.Form("rdate")
	Dim reserveTime	: reserveTime	= request.Form("rtime")
	Dim mode	    : mode			= "1"									' base64 사용시 반드시 모드값을 1로 주셔야 합니다.
	Dim rtime	    : rtime			= request.Form("rtime")
	Dim returnurl	: returnurl		= request.Form("returnurl")
	Dim testflag	: testflag		= request.Form("testflag")
	Dim destination	: destination	= request.Form("destination")
	Dim repeatFlag	: repeatFlag	= request.Form("repeatFlag")
	Dim repeatNum	: repeatNum		= request.Form("repeatNum")
	Dim repeatTime	: repeatTime	= request.Form("repeatTime")
	Dim actionFlag  : actionFlag	= fncRequest("action")
	Dim nointeractive  : nointeractive = fncRequest("nointeractive")		' 성공시 대화 상자를 사용 하지 않게 합니다.
'-------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------
'	SMS 발송 메시지 생성
	sphone1 = "02"
	sphone2 = "557"
	sphone3 = "3579"

	If actionFlag="go" Then 
		If rphone = "" Then 
			response.Write "<script type='text/javascript'>alert('인증받을 핸드폰 번호를 입력해 주세요');</script>"
			response.End 
		Else 
			strSql = " EXEC MSP_MIX_MEM_CERT '','"& rphone &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				CERT_NUM = Rs(0)
			End If 
			Call RSClose(Rs)

			If CERT_NUM = "-1" Then 
				response.Write "<script type='text/javascript'>alert('이미 인증번호를 발송되었습니다.3분후에 다시 신청 가능합니다.'); </script>"
				response.End 
			Else 
				
				'msg = "[마더앤베이비] 본인인증번호는 " & CERT_NUM & " 입니다. 정확히 입력해주세요"
				msg = "[mother&baby] SMS Number (" & CERT_NUM & "). Please input Number"
				
			End If 
		End If 
	End If 
'-------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------
'	데이터 암호화
	user_id		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(user_id)))
	secure		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(secure)))
	msg			= strAnsi2Unicode(Base64encode(strUnicode2Ansi(msg)))
	rphone		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(rphone)))
	sphone1		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(sphone1)))
	sphone2		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(sphone2)))
	sphone3		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(sphone3)))
	rdate		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(rdate)))
	reserveTime = strAnsi2Unicode(Base64encode(strUnicode2Ansi(reserveTime)))
	mode		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(mode)))
	rtime		= strAnsi2Unicode(Base64encode(strUnicode2Ansi(rtime)))
	returnurl	= strAnsi2Unicode(Base64encode(strUnicode2Ansi(returnurl)))
	testflag	= strAnsi2Unicode(Base64encode(strUnicode2Ansi(testflag)))
	destination = strAnsi2Unicode(Base64encode(strUnicode2Ansi(destination)))
	repeatFlag  = strAnsi2Unicode(Base64encode(strUnicode2Ansi(repeatFlag)))
	repeatNum	= strAnsi2Unicode(Base64encode(strUnicode2Ansi(repeatNum)))
	repeatTime  = strAnsi2Unicode(Base64encode(strUnicode2Ansi(repeatTime)))

	Dim sendurl : sendurl = "http://" & Request.ServerVariables("server_name") & request.ServerVariables("PATH_INFO")
'-------------------------------------------------------------------------------------------
%>
<form id='frmSendsms' name='frmSendsms' method='post' action="<%=sms_url%>">
<input type="hidden" name="lang" id="lang" value="asp">
<input type="hidden" name="sendurl" id="sendurl" value="<%=sendurl%>">
<input type="hidden" name="user_id" id="user_id" value="<%=user_id%>">
<input type="hidden" name="secure" id="secure" value="<%=secure%>">
<input type="hidden" name="msg" id="msg" value="<%=msg%>">
<input type="hidden" name="rphone" id="rphone" value="<%=rphone%>">
<input type="hidden" name="sphone1" id="sphone1" value="<%=sphone1%>">
<input type="hidden" name="sphone2" id="sphone2" value="<%=sphone2%>">
<input type="hidden" name="sphone3" id="sphone3" value="<%=sphone3%>">
<input type="hidden" name="rdate" id="rdate" value="<%=rdate%>">
<input type="hidden" name="rtime" id="rtime" value="<%=rtime%>">
<input type="hidden" name="reserveTime" id="reserveTime" value="<%=reserveTime%>">
<input type="hidden" name="mode" id="mode" value="<%=mode%>">
<input type="hidden" name="returnurl" id="returnurl" value="<%=returnurl%>">
<input type="hidden" name="testflag" id="testflag" value="<%=testflag%>">
<input type="hidden" name="destination" id="destination" value="<%=destination%>">
<input type="hidden" name="repeatFlag" id="repeatFlag" value="<%=repeatFlag%>">
<input type="hidden" name="repeatNum" id="repeatNum" value="<%=repeatNum%>">
<input type="hidden" name="repeatTime" id="repeatTime" value="<%=repeatTime%>">
<input type="hidden" name="nointeractive" id="nointeractive" value="<%=nointeractive%>">
<input type="hidden" name="encoderurl" id="encoderurl" value="<%=encoderurl%>">
</form>
<%
	' SMS 발송하기
	If actionFlag="go" Then
		response.write "<script type='text/javascript'>var frm = document.getElementById('frmSendsms');frm.submit();</script>"
		Response.End

	' SMS 발송결과
	ElseIf actionFlag="result" Then
		Dim tmpResult   : tmpResult = request("result")
		Dim rMsg		: rMsg		=  split(tmpResult , ",")
		Dim Result		: Result	=  rMsg (0)
		Dim Count		: Count		=  rMsg (1)
		Dim alert		: alert		= ""
		SELECT CASE Result
			CASE "Test Success!"
				alert = "테스트성공"
				alert = alert & " 잔여건수는 "+ Count+"건 입니다."
			CASE "success"
				alert = "인증번호가 정상적으로 전송되었습니다."
			CASE "3205"
				alert = "잘못된 번호형식입니다."
		END Select
		Response.Write("<script>alert('" + alert + "'); </script>")
	End if
%>