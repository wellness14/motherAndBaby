<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/sms_func.asp"-->
<%
'-------------------------------------------------------------------------------------------
'	Request
	Dim sms_url		: sms_url = "http://sslsms.cafe24.com/sms_sender.php"	' SMS ��û URL
	Dim user_id	    : user_id	= "wellness1414"							' SMS ���̵�
	Dim secure	    : secure	= "1b811eb41bb2f6f0f246392b3d164579"		' ����Ű 
	Dim encoderurl  : encoderurl = "Y"										' ���� URL�� encode �ؼ� �������� �����մϴ�. (���:Y, ������:N, Y�� �ƴ� ��� ������ ������ �Ѱܹ��� �����ϴ�.)
	Dim msg	        : msg			= request.Form("msg")
	Dim rphone	    : rphone		= request.Form("rphone")
	Dim sphone1	    : sphone1		= request.Form("sphone1")
	Dim sphone2	    : sphone2		= request.Form("sphone2")
	Dim sphone3	    : sphone3		= request.Form("sphone3")
	Dim rdate	    : rdate			= request.Form("rdate")
	Dim reserveTime	: reserveTime	= request.Form("rtime")
	Dim mode	    : mode			= "1"									' base64 ���� �ݵ�� ��尪�� 1�� �ּž� �մϴ�.
	Dim rtime	    : rtime			= request.Form("rtime")
	Dim returnurl	: returnurl		= request.Form("returnurl")
	Dim testflag	: testflag		= request.Form("testflag")
	Dim destination	: destination	= request.Form("destination")
	Dim repeatFlag	: repeatFlag	= request.Form("repeatFlag")
	Dim repeatNum	: repeatNum		= request.Form("repeatNum")
	Dim repeatTime	: repeatTime	= request.Form("repeatTime")
	Dim actionFlag  : actionFlag	= fncRequest("action")
	Dim nointeractive  : nointeractive = fncRequest("nointeractive")		' ������ ��ȭ ���ڸ� ��� ���� �ʰ� �մϴ�.
'-------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------
'	SMS �߼� �޽��� ����
	sphone1 = "02"
	sphone2 = "557"
	sphone3 = "3579"

	If actionFlag="go" Then 
		If rphone = "" Then 
			response.Write "<script type='text/javascript'>alert('�������� �ڵ��� ��ȣ�� �Է��� �ּ���');</script>"
			response.End 
		Else 
			strSql = " EXEC MSP_MIX_MEM_CERT '','"& rphone &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				CERT_NUM = Rs(0)
			End If 
			Call RSClose(Rs)

			If CERT_NUM = "-1" Then 
				response.Write "<script type='text/javascript'>alert('�̹� ������ȣ�� �߼۵Ǿ����ϴ�.3���Ŀ� �ٽ� ��û �����մϴ�.');</script>"
				response.End 
			Else 
				msg = "[�����غ��̺�] ����������ȣ�� " & CERT_NUM & " �Դϴ�. ��Ȯ�� �Է����ּ���"
			End If 
		End If 
	End If 
'-------------------------------------------------------------------------------------------

'-------------------------------------------------------------------------------------------
'	������ ��ȣȭ
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
	' SMS �߼��ϱ�
	If actionFlag="go" Then
		response.write "<script type='text/javascript'>var frm = document.getElementById('frmSendsms');frm.submit();</script>"
		Response.End

	' SMS �߼۰��
	ElseIf actionFlag="result" Then
		Dim tmpResult   : tmpResult = request("result")
		Dim rMsg		: rMsg		=  split(tmpResult , ",")
		Dim Result		: Result	=  rMsg (0)
		Dim Count		: Count		=  rMsg (1)
		Dim alert		: alert		= ""
		SELECT CASE Result
			CASE "Test Success!"
				alert = "�׽�Ʈ����"
				alert = alert & " �ܿ��Ǽ��� "+ Count+"�� �Դϴ�."
			CASE "success"
				alert = "������ȣ�� ���������� ���۵Ǿ����ϴ�."
			CASE "3205"
				alert = "�߸��� ��ȣ�����Դϴ�."
		END Select
		Response.Write("<script>alert('" + alert + "')</script>")
	End if
%>