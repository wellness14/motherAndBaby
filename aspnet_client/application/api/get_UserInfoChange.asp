<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_UserInfoChange.asp?sMode=pass&Ucode=1000000001&sVariable=1111&chpasswd=1234


   Dim ReqItem(2), item, i  
   ReqItem(0)	= request("sMode") 
   ReqItem(1)	= request("Ucode") 
   ReqItem(2)	= request("sVariable") 
  
   Dim chpasswd 
   chpasswd     = request("chpasswd")


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
			    errmsg = "default parameter info error(sMode)"
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(Ucode)"
				End If
			Case "2" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(sVariable)"
				End If
           end Select
		
	   i = i + 1
    Next 


    
	If errcode = "0" Then 
	
       sQuery = "select top 1 * from tb_UserInfo where Useq = '"&ReqItem(1)&"' "
	   Set oRS = oDb.Execute(sQuery)

       if oRs.eof Then
       
				errcode = "200"
				errmsg = "일치하는 사용자 정보가 존재하지 않습니다."

	   Else 

           select case ReqItem(0)
			case "NickName"
			
                    sQuery = "update tb_UserInfo set" 
					sQuery = sQuery & " nickName = '"&ReqItem(2)&"'"
					sQuery = sQuery & " ,modifyDate = getdate()" 
					sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
					oDb.Execute(sQuery)

            Case "birth"
                   
				    sQuery = "update tb_UserInfo set" 
					sQuery = sQuery & " birth = '"&ReqItem(2)&"'"
					sQuery = sQuery & " ,modifyDate = getdate()" 
					sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
					oDb.Execute(sQuery)


			Case "localCD"
                   
				    sQuery = "update tb_UserInfo set" 
					sQuery = sQuery & " localCD = '"&ReqItem(2)&"'"
					sQuery = sQuery & " ,modifyDate = getdate()" 
					sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
					oDb.Execute(sQuery)


			Case "sex"

                    sQuery = "update tb_UserInfo set" 
					sQuery = sQuery & " sex = '"&ReqItem(2)&"'"
					sQuery = sQuery & " ,modifyDate = getdate()" 
					sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
					oDb.Execute(sQuery)

            Case "phone"

                    sQuery = "update tb_UserInfo set" 
					sQuery = sQuery & " userPhone = '"&ReqItem(2)&"'"
					sQuery = sQuery & " ,modifyDate = getdate()" 
					sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
					oDb.Execute(sQuery)

             Case "pass"
                   
				   If chpasswd = "" Then 
						errcode = "103"
						errmsg = "default parameter info error(chpasswd)"
				   Else 

						'기존 패스워드와  값이 동일한지 비교한다. 

						sQuery = "select top 1 npwd=pwdcompare('"&ReqItem(2)&"',passWD), * from tb_UserInfo where Useq = '"&ReqItem(1)&"' "
                        Set RS = oDb.Execute(sQuery)
                         
							   if Rs("npwd") = 0 then 
							   
							   errcode = "201"
						       errmsg = "기존패스워드 동일하지 않습니다."
							  							   
							  elseif Rs("npwd") = 1 then
							  
						        sQuery = "update tb_UserInfo set" 
								sQuery = sQuery & " passWD = pwdencrypt('"&chpasswd&"') "
								sQuery = sQuery & " ,modifyDate = getdate()" 
								sQuery = sQuery & " where Useq = '"&ReqItem(1)&"' " 
								oDb.Execute(sQuery)

							  end If
							  

				   End If 

                   
				   


		   
		   end Select

	   End If 
    
	End If 

    

	
	call sDbClose()


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
            Response.write """sMode"": """&ReqItem(0)&""","
            Response.write """Ucode"": """&ReqItem(1)&""","
			Response.write """sVariable"": """&ReqItem(2)&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


%>
