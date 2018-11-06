<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/Base64ende.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

   'http://mothernbaby.co.kr/application/api/get_PhoneAuthSend.asp?userPhone=010-8756-6683&testFlag=Y

    Dim sms_url
    sms_url = "http://sslsms.cafe24.com/sms_sender.php" ' SMS 요청 URL

	Dim userPhone, testFlag
    userPhone     	= Replace(request("userPhone")," ", "") 
    testFlag     	    = request("testFlag") 

	If testFlag = "N" Or testFlag = "" Then testFlag = ""
    
	Dim user_id	    : user_id	= "wellness1414"							' SMS 아이디
	Dim secure	    : secure	= "1b811eb41bb2f6f0f246392b3d164579"		' 인증키 
	Dim encoderurl  : encoderurl = "Y" '리턴 URL을 encode 해서 받을지를 결정합니다. (사용:Y, 사용안함:N, Y가 아닐 경우 변수를 여러개 넘겨받을 없습니다.)
	Dim rdate	    : rdate	= ""
	Dim reserveTime	: reserveTime	= ""
	Dim mode	    : mode	= ""  '// base64 사용시 반드시 모드값을 1로 주셔야 합니다.
	Dim rtime	    : rtime	= ""
	Dim returnurl	: returnurl	= ""
	Dim destination	: destination	= ""
	Dim repeatFlag	: repeatFlag	= ""
	Dim repeatNum	: repeatNum	= ""
	Dim repeatTime	: repeatTime	= ""
	Dim actionFlag  : actionFlag = request("action")
	Dim nointeractive  : nointeractive = ""
	Dim smsType	: smsType	= "" 'LMS 사용시 L
    Dim sendurl : sendurl = "http://" & Request.ServerVariables("server_name") & request.ServerVariables("PATH_INFO")

	

	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"
       
	
	If actionFlag = "" Then 
	
	
     	'-------------------------------------------------------------------------------------------
 	    '	SMS 발송 메시지 셋팅
		Dim sphone1, sphone2, sphone3, rphone, msg
		sphone1 = "02"
		sphone2 = "557"
		sphone3 = "3579"
        
		rphone  = userPhone
         

        If Len(rPhone) < 12 Then 

            errcode = "-1" 
			errmsg = "휴대폰 번호가 없습니다."


		Else 

                'DB 테이블에 금일 전송한 SMS 횟수가 6개 이상인 경우, 발송하지 않고 안내한다. 
				Dim today, totalCount
				today = Date
				sQuery = "Select count(-1) as totalCount From tb_AuthSMS_history Where rPhone = '"&rphone&"' and left(regDate,10) = '"&today&"' "	  
				Set oRS = oDb.Execute(sQuery) 
				
				totalCount = oRs("totalCount")

				oRs.close 

				If totalCount >= 5 Then 
				
				errcode = "0" 
				errmsg = "금일 SMS 발송 횟수가 오버하였습니다. 관리자에게 문의해주세요."


				Else 


					Dim str,authcode,strlen,r,  i
					Dim rCnt
					str = "1234567890"
					strlen = 5  '자릿수

					Randomize  '랜덤초기화
					For i = 1 To strlen
					 r = Int((10-1+1) * Rnd + 1) '15는 str의 갯수
					'Response.Write Mid(str,r,1)   '랜덤으로 추출된 하나의 값 확인 최종적으로는 모두 덧붙여진 값이 확인됨
					authcode = authcode+Mid(str,r,1)
					
					Next
				 
					msg = "[맘초앱] 본인인증번호는 ["&authcode&"] 입니다. 정확히 입력해주세요"

					'DB에 전송 정보를 등록한다. 
					sQuery = "insert into  tb_AuthSMS_history ( rPhone, msg, AuthCode) "
					sQuery = sQuery & " values ('"&rPhone&"', '"&msg&"', '"&AuthCode&"')" 
					oDb.Execute(sQuery)

                   '발송하기
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
                    <script type='text/javascript'>var frm = document.getElementById('frmSendsms');frm.submit();</script>
<%


			   End If 

		 '--------------------------------------------------------------------------------------------    
	
        End If 



	
   ElseIf actionFlag = "result" Then 

			Dim tmpResult   : tmpResult  = request("result")
			Dim rMsg    : rMsg	=  split(tmpResult , ",")
			Dim Result    : Result	=  rMsg (0)
			Dim Count    : Count	=  rMsg (1)
			Dim alert      : alert  = ""
			SELECT CASE Result
				CASE "Test Success!"
					
					errcode = "0" 
			        errmsg = "Test success"

				CASE "success"
					errcode = "0" 
			        errmsg = " success"

				CASE "reserved"
					errcode = "0" 
			        errmsg = "reserved success"

				CASE "3205"
                  	errcode = "3205" 
			        errmsg = "Number error"

				CASE "0044"

					errcode = "0044" 
			        errmsg = "Spam Number"

				CASE Else
				    errcode = "100" 
			        errmsg = "[Error]"+Result

			END Select


 End If 

call sDbClose()


%>

<script type="text/javascript">
var errcode = '<%=errcode%>';
var errmsg = '<%=errmsg%>';

window.onload = function()
{
	app_sms(errcode,errmsg);
}

 function app_sms(errcode,errmsg){
	    window.android.sms(errcode,errmsg);
}
</script>

