<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_DevicePushReg.asp?DID=1234567890&UOS=4.0.4&DM=SM-915N&TI=abcdefghijklmn-1234567&YN=Y&storyYN=Y


   Dim ReqItem(5), item, i 
   ReqItem(0)	= request("DID") 
   ReqItem(1)	= request("UOS") 
   ReqItem(2)	= request("DM") 
   ReqItem(3)	= request("TI") 
   ReqItem(4)	= request("YN") 
   ReqItem(5)	= request("storyYN") 

   If ReqItem(5) = "" Then ReqItem(5) = "Y" 

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
			    errmsg = "default parameter info error(DID)"
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(UOS)"
				End If
			Case "2" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(DM)"
				End If
            Case "3" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(TI)"
				End If
            Case "4" 
               If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(YN)"
				End If
		    end Select
		
	   i = i + 1
    Next 

    Dim RegMethod 
    sQuery = "select * from tb_UserDeviceInfo where DeviceID = '"& ReqItem(0) &"' " 
    Set oRS = oDb.Execute(sQuery) 
   
    If oRs.eof Then 'UUID 값이 존재하지 않는 경우
		  
		RegMethod = "INSERT"

   Else
          
        RegMethod = "UPDATE"


   End If
   
   oRs.close 

   
   If RegMethod = "INSERT" Then 

	   sQuery = "insert into  tb_UserDeviceInfo ( DeviceID, UOS, DeviceModel, TokenInfo, PushYN, storyYN, RegDate) "
       sQuery = sQuery & " values ('"&ReqItem(0)&"', '"&ReqItem(1)&"', '"&ReqItem(2)&"', '"&ReqItem(3)&"', '"&ReqItem(4)&"', '"&ReqItem(5)&"', getdate())" 
	   oDb.Execute(sQuery)


  ElseIf RegMethod = "UPDATE" Then 
      
	   sQuery = "update tb_UserDeviceInfo set UOS = '"&ReqItem(1)&"', DeviceModel = '"&ReqItem(2)&"', TokenInfo = '"&ReqItem(3)&"', PushYN = '"&ReqItem(4)&"', storyYN = '"&ReqItem(5)&"', ModifyDate = getdate()" 
       sQuery = sQuery & " where DeviceID = '"&ReqItem(0)&"' " 
	   oDb.Execute(sQuery)


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
            Response.write """DID"": """&ReqItem(0)&""","
            Response.write """UOS"": """&ReqItem(1)&""","
            Response.write """DM"": """&ReqItem(2)&""","
			Response.write """TI"": """&ReqItem(3)&""","
            Response.write """YN"": """&ReqItem(4)&""","
			Response.write """storyYN"": """&ReqItem(5)&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
