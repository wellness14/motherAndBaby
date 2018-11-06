<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

   'http://mothernbaby.co.kr/application/api/get_PhoneAuthCheck.asp?userPhone=010-8756-6683&authCode=12345

    


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
			    errmsg = "default parameter info error(userPhone)"
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(authCode)"
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
            Response.write """authCode"": """&ReqItem(1)&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


%>
