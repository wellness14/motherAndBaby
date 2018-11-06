<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_Deviceinfo.asp?DID=00000000-6bab-2718-3c7c-002b21736d51


   Dim DID
   DID	= request("DID") 

   Dim errcode,errmsg
      errcode = "0" 
	  errmsg = "success"
       
	  '입력값 정상유무 확인    

	     		If DID = "" Then 
				errcode = "100"
			    errmsg = "default parameter info error(DID)"
				End if
			
    If errcode = "0" Then 

    sQuery = "select * from tb_UserDeviceInfo where DeviceID = '"& DID &"' " 
    Set oRS = oDb.Execute(sQuery) 
   
		If oRs.eof Then 

			errcode = "200" 
			errmsg = "사용자의 단말기 기기번호가 존재하지 않습니다."


		Else 

           Dim pushYN, storyYN
		   pushYN = oRs("pushYN")
		   storyYN = oRs("storyYN")

		End If 

    oRs.close 

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
            Response.write """DID"": """&DID&""","
            Response.write """pushYN"": """&pushYN&""","
            Response.write """storyYN"": """&storyYN&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
