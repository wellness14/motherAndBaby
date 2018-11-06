<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_UserInfo.asp?UCode=1000000001


   Dim UCode 
   UCode	= request("UCode") 

   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"
       
	  '입력값 정상유무 확인    

	 		  If UCode = "" Then 
				errcode = "100"
			    errmsg = "default parameter info error(UCode)"
				End if
			
    

	If errcode = "0" Then 

       sQuery = "select top 1 * from tb_UserInfo where Useq = '"&UCode&"' "
	   Set oRS = oDb.Execute(sQuery)

						if oRs.eof then
							   
							  errcode = "200"
							  errmsg = "일치하는 사용자 정보가 존재하지 않습니다."
							
						else
							  
							  If oRs("useYN") <> "Y" Then 					

									errcode = "201"
									errmsg = "탈퇴한 사용자 정보입니다! 관리자에게 문의하세요."

							  Else 

						
											Dim emailID, nickName, userPhone,localCD,sex, birth
											emailID = oRs("emailID")
                                            nickName = oRs("nickName")
											birth = oRs("birth")
                                            userPhone = oRs("userPhone")
											localCD = oRs("localCD")
                                            sex = oRs("sex")

											Dim LRocal, RLocal, localName
                                            LRocal = Left(localCD,3)
                                            RLocal = right(localCD,3)
											localCD = LRocal&"-"&RLocal
                                            
											Dim sexName
											If sex = "M" Then sexName = "남"
											If sex = "F" Then sexName = "여"

											sQuery = "select * from MO_ZIP_MAS where ZM_ZIP_CD = '"&localCD&"' "
											Set RS = oDb.Execute(sQuery)

											If Rs.eof Then 
                                                
												  localName  = "없음"
											Else 
                   								  localName  = Rs("ZM_DO") &" "& Rs("ZM_GU") &" "& Rs("ZM_DON")
											End If 

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
            Response.write """emailID"": """&emailID&""","
            Response.write """nickName"": """&nickName&""","
			Response.write """userPhone"": """&userPhone&""","
            Response.write """birth"": """&birth&""","
			Response.write """localName"": """&localName&""","
			Response.write """sex"": """&sex&""""

        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
