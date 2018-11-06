<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

   'http://mothernbaby.co.kr/application/api/get_UserPwFind.asp?emailID=1@1.co.kr&userPhone=010-8756-6683&authCode=12345

    


Dim ReqItem(2), item, i 
   ReqItem(0)	= request("emailID") 
   ReqItem(1)	= request("userPhone") 
   ReqItem(2)	= request("authCode") 


   Dim errcode,errmsg
      i = 0 
      errcode = "0" 
	  errmsg = "success"
       
	  '입력값 정상유무 확인    

	  For Each item In ReqItem
			
			select case i
			case "0"
				If item = "" Then 
				errcode = "100"
			    errmsg = "이메일정보가없습니다."
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "휴대폰번호가 없습니다."
				End If
            Case "2" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "인증번호가 없습니다."
				End If
		  end Select
		
	   i = i + 1
    Next 

    Dim RegMethod 
    sQuery = "select top 1 * from tb_AuthSMS_history where rPhone = '"& ReqItem(1) &"' order by seq desc " 
    Set oRS = oDb.Execute(sQuery) 
   
    If oRs.eof Then 
		  
		errcode = "200"
		errmsg = "전송된 SMS 정보가 존재하지 않습니다."

    Else
          
        If ReqItem(2)  = oRs("AuthCode")  Then 

          
		  	
          sQuery = "select top 1 * from tb_UserInfo where emailID = '"&ReqItem(0)&"' and userPhone = '"&ReqItem(1)&"' order by modifyDate desc " 
          Set RS = oDb.Execute(sQuery) 

          If Rs.eof Then 

		     errcode = "201"
		     errmsg = "이메일과 휴대폰 번호가 동일한 정보가 존재하지 않습니다."  

		  Else 
            
             
			 ' 사용자의 패스워드에게 임시 패스워드를 발급한다. 
			 Dim tempPW
			 Dim intSizeSN, StrKeyCode

			  intSizeSN = 6
		      strKeyCode = "ST01"

			  tempPW = fnGenSN(strKeyCode, intSizeSN)
             
			        sQuery = "update tb_UserInfo set"
					sQuery = sQuery & " passWD = pwdencrypt('"&tempPW&"') " 
					sQuery = sQuery & " ,modifyDate = getdate()" 				
					sQuery = sQuery & " Where Useq = '"&Rs("Useq")&"'"
                    oDb.Execute(sQuery)

			  
			  errcode = "0"
		      errmsg = "요청하신 아이디의 임시비밀번호가 발급되었습니다.로그인 후에, 변경해주세요."  

              


		  End If 

          Rs.close 


		Else 
          
		  errcode = "201"
		  errmsg = "휴대폰에 전송된 인증번호가 존재하지 않습니다."


		End If 


    End If
   
    oRs.close 


	
  
    Response.write "{"
     response.write """errcode"""
	   response.write ":"
	   response.write """"&errcode&""""
	   response.write ","
	   response.write """errmsg"""
	   response.write ":"
	   response.write """"&errmsg&""""
       response.write ","
     Response.write """infolist"": ["
        Response.write "{"
            Response.write """emailID"": """&ReqItem(0)&""","
            Response.write """userPhone"": """&ReqItem(1)&""","
			Response.write """authCode"": """&ReqItem(2)&""","
            Response.write """tempPw"": """&tempPW&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"

Function fnGenSN(keyCode, snSize)

Dim SN, i
Dim arrValue

'arrValue = Array("1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z") 
arrValue = Array("2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f", "g", "h", "j", "k", "m", "n", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "!", "@", "#", "$", "%") 

Randomize 

SN = ""

For i = 1 To snSize

	SN = SN & arrValue(Int((UBound(arrValue) * Rnd) + 1) -1) 
Next

SN = SN

fnGenSN = SN

End Function


%>
