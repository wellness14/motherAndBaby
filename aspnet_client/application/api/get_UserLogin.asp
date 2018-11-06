<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_UserLogin.asp?DID=1234567890&EID=1@1.co.kr&PW=12345


   Dim ReqItem(2), item, i 
   ReqItem(0)	= request("DID") 
   ReqItem(1)	= request("EID") 
   ReqItem(2)	= request("PW")

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
			    errmsg = "이메일정보를 입력해주세요."
				End If
			Case "2" 
                If item = "" Then 
				errcode = "102"
			    errmsg = "비밀번호를 입력해주세요."
				End If
            end Select
		
	   i = i + 1
    Next 
    

	If errcode = "0" Then 

       sQuery = "select top 1 * from tb_UserInfo where emailID = '"&ReqItem(1)&"' "
	   Set oRS = oDb.Execute(sQuery)

						if oRs.eof then
							   
							  errcode = "200"
							  errmsg = "일치하는 이메일 정보가 존재하지 않습니다."
							
						else
							  
							  If oRs("useYN") <> "Y" Then 					

									errcode = "201"
									errmsg = "탈퇴한 아이디 입니다! 관리자에게 문의하세요."

							  Else 

							  
										  sQuery = "select top 1 npwd=pwdcompare('"&ReqItem(2)&"',passWD), * from tb_UserInfo where emailID = '"&ReqItem(1)&"' "
										  Set RS = oDb.Execute(sQuery)
										  
										  
										  if Rs("npwd") = 0 then 
										   
										    errcode = "202"
											errmsg = "비밀번호가 동일하지 않습니다."
										   
										  elseif Rs("npwd") = 1 then
										  
											Dim UserCode, NickName 
											UserCode = oRs("USeq")
                                            NickName = oRs("NickName")

											sQuery = "insert into tb_UserInfo_log " 
											sQuery = sQuery & " (Useq, DeviceID, regDate) "
											sQuery = sQuery & " values ('"&UserCode&"', '"&ReqItem(0)&"', getdate()) "
											' Response.write sQuery
											oDb.Execute(sQuery) 
											
											sQuery = "update tb_UserInfo set DeviceID = '"&ReqItem(0)&"' where Useq = '"&UserCode&"' " 
											oDb.Execute(sQuery) 

											
										  end If

										  Rs.close
							  End If 

							
						end if

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
            Response.write """DID"": """&ReqItem(0)&""","
            Response.write """EID"": """&ReqItem(1)&""","
			Response.write """UCode"": """&UserCode&""","
			Response.write """NickName"": """&NickName&""""


            

        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
