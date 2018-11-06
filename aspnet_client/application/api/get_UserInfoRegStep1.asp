<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_UserInfoRegStep1.asp?DID=1234567890&EID=1@1.co.kr&PW=12345&UPHONE=010-1234-5678


   Dim ReqItem(3), item, i 
   ReqItem(0)	= request("DID") 
   ReqItem(1)	= request("EID") 
   ReqItem(2)	= request("PW") 
   ReqItem(3)	= request("UPHONE") 

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
			    errmsg = "단말기 모델정보가 존재하지 않습니다."
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "이메일 정보를 입력해주세요."
				End If
			Case "2" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "비밀번호를 입력해주세요."
				End If
            Case "3" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "휴대폰 번호를 입력해주세요."
				End If
		    end Select
		
	   i = i + 1
    Next 
    
	If errcode = "0" Then 
	
		Dim totalCount
		sQuery = "select count(-1) as Count from tb_UserInfo where emailID = '"& ReqItem(1) &"' " 
		Set oRS = oDb.Execute(sQuery)

		totalCount = oRs("Count")

		oRs.close 

		If totalCount <> "0" Then 

			errcode = "200" 
			errmsg = "중복된 이메일 아이디 정보가 존재합니다."

		Else 

		   ' 사용자 아이디 코드를 생성한다 
			  Dim maxcode
			  sQuery = "SELECT Max(Useq) + 1 as maxcode FROM tb_UserInfo"
			  Set oRS = oDb.Execute(sQuery)
			
				   If ISNULL(oRs("maxcode")) Then 
				   maxcode = "1000000001" 
				   Else
				   maxcode = oRs("maxcode")			   
				   End If 

			   oRs.close

	 
			' 아이디 정보를 입력한다. 
			   sQuery = "insert into tb_UserInfo " 
			   sQuery = sQuery & " (Useq, emailID,passWD,userPhone,useYN, regDate, modifyDate, DeviceID) "
			   sQuery = sQuery & " values ('"&maxcode&"', '"&ReqItem(1)&"', pwdencrypt('"&ReqItem(2)&"'), '"&ReqItem(3)&"', 'Y', getdate(), getdate(),'"&ReqItem(0)&"') "
			   ' Response.write sQuery
			   oDb.Execute(sQuery)

			' push 전송 동기화를 위해서 로그를 저장한다.  

			   sQuery = "insert into tb_UserInfo_log " 
			   sQuery = sQuery & " (Useq, DeviceID, regDate) "
			   sQuery = sQuery & " values ('"&maxcode&"', '"&ReqItem(0)&"', getdate()) "
			   ' Response.write sQuery
			   oDb.Execute(sQuery) 

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
            If errcode = "0" Then 
			Response.write """UCode"": """&maxcode&""","
			Else
			Response.write """UCode"": """","
			End If 
            Response.write """DID"": """&ReqItem(0)&""","
            Response.write """EID"": """&ReqItem(1)&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"

	
	call sDbClose()
%>
