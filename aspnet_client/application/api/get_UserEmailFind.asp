<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

   'http://mothernbaby.co.kr/application/api/get_UserEmailFind.asp?userPhone=010-8756-6683&authCode=12345

    


Dim ReqItem(1), item, i 
   ReqItem(0)	= request("userPhone") 
   ReqItem(1)	= request("authCode") 

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
			    errmsg = "휴대폰 번호가 없습니다."
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "휴대폰에 전송된 인증번호가 없습니다."
				End If
		  end Select
		
	   i = i + 1
    Next 

    Dim RegMethod 
    sQuery = "select top 1 * from tb_AuthSMS_history where rPhone = '"& ReqItem(0) &"' order by seq desc " 
    Set oRS = oDb.Execute(sQuery) 
   
    If oRs.eof Then 
		  
		errcode = "200"
		errmsg = "sms phone no!"

    Else
          
        If ReqItem(1)  = oRs("AuthCode")  Then 

          
		  errcode = "0"
		  errmsg = "success"


		Else 
          
		  errcode = "201"
		  errmsg = "auth miss match"


		End If 


    End If
   
    oRs.close 


			'인증이 확인 된 후에 이메일 정보를 확인하여 전달한다. 
   If errcode = "0"  Then 
		  
		 			
			sQuery = "select top 1 * from tb_UserInfo where userPhone = '"&ReqItem(0)&"' order by USeq desc"
			Set oRS = oDb.Execute(sQuery)
			
			If oRs.eof Then 

				errcode = "202"
				errmsg = "인증받은 휴대폰의 이메일정보가 없습니다."

			Else 
                
                Dim emailID 
				emailID = oRs("emailID")
                 
			End If 

   End If 
  
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
            Response.write """userPhone"": """&ReqItem(0)&""","
            Response.write """authCode"": """&ReqItem(1)&""","
			Response.write """emailID"": """&emailID&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


%>
