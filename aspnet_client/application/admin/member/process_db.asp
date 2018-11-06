<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

CALL sChkSession()
sDbOpen("BABYAPP")

    
    Dim sMode, Useq, sponCode
	sMode			=		Request("sMode")
	Useq			=		Request("Useq")
	sponCode			=		Request("sponCode")
    
	Dim Sysop, UID, passwd, Uemail, Uname, Hphone
	Sysop			=		Request("Sysop")
	UID				=		Request("UID")
	passwd			=		Request("passwd")
	Uemail			=		Request("Uemail")
	Uname			=		Request("Uname")
	Hphone			=		Request("Hphone")
    
    
	Dim chkpasswd, newpasswd
    chkpasswd		=		Request("chkpasswd")
	newpasswd		=		Request("newpasswd")

    
	If sMode = "" Then

    sMode			=		Trim(uploadform("sMode"))
	
    '아이디 발급 변수	
	Useq			=		uploadform("Useq")
	Sysop			=		uploadform("Sysop")
	UID				=		uploadform("UID")
	passwd			=		uploadform("passwd")
	Uemail			=		uploadform("Uemail")
	Uname			=		uploadform("Uname")
	Hphone			=		uploadform("Hphone")

    '광고주 기본 정보 변수
    Dim SponsorType, ComName, CNumber, CNumber2, Ceo, Ckind, Cgoods, zip1, zip2, address1, address2, Cemail, Ctel, Cfax

    SponsorType		=		Trim(uploadform("SponsorType"))
	ComName			=		Trim(uploadform("CName"))
	CNumber			=		Trim(uploadform("CNumber"))
	CNumber2		=		Trim(uploadform("CNumber2"))
	Ceo				=		Trim(uploadform("Ceo"))
	Ckind			=		Trim(uploadform("Ckind"))
	Cgoods			=		Trim(uploadform("Cgoods"))
	zip1			=		Trim(uploadform("zip1"))
    zip2			=		Trim(uploadform("zip2"))
	address1		=		Trim(uploadform("address1"))
    address2		=		Trim(uploadform("address2"))
	Cemail			=		Trim(uploadform("Cemail"))
	Ctel			=		Trim(uploadform("Ctel"))
	Cfax			=		Trim(uploadform("Cfax"))
    
	sponCode			=		Trim(uploadform("sponCode"))

	End If 
    
	If sponCode = "" Then sponCode = "99999"
	

    'Response.write Sysop & "/" &  UID & "/" &  passwd & "/" &  Uemail & "/" &  Uname & "/" &  Hphone
	'Response.End 


	
    select case sMode

	    case "sponsor_default"

		  ' 광고주의 ShopCode를 생성한다 
		  Dim maxcode
		  sQuery = "SELECT Max(shopCode) + 1 as maxcode FROM tb_SponsorInfo"
		  Set oRS = oDb.Execute(sQuery)
        
		       If ISNULL(oRs("maxcode")) Then 
               maxcode = "10001" 
			   Else
			   maxcode = oRs("maxcode")			   
			   End If 

         oRs.close 
         
         '중복된 아이디 정보가 있는 지 확인 한다. 
         sQuery = "SELECT * FROM tb_Auth_Admininfo where Uid = '"&UID&"'"
		 Set oRS = oDb.Execute(sQuery)
		  
			   if Not(oRs.eof) Then
		       
			       call sChkMsg("등록된 마스터 계정 정보가 존재합니다. 다시 입력해주세요","1","")

               Else 
                   
                   '파일 정보가 있는 경우 업로드 한다. 

					If uploadform("filename") <> "" Then 
                   
						 filename = uploadform("filename").FileName
						 filesize = uploadform("filename").FileLen   
						 MimeType = UploadForm("filename").MimeType
						 width  = UploadForm("filename").ImageWidth
						 height = UploadForm("filename").ImageHeight


						 Response.write dir_strDirectory &"<br>"& filename &"<br>"& filesize &"<br>"& MimeType &"<br>"& width &"<br>"& height &"<br>"& maxCode &"<br>"
						  
						 If filesize > 1024000 Then  
							call sChkMsg("카테고리 썸네일은 1메가 이상 용량이 등록이 될 수 없습니다.","1","")
							Response.End
						 End If

						 If Left(MimeType,5) <> "image" And MimeType <> "application/pdf" Then  
						 	call sChkMsg("이미지 또는 PDF 파일만 등록이 가능합니다.","1","")
							Response.End
                         End If 
						 
						 
							filenameonly = Left(filename, InStrRev(filename, ".") - 1) 
							fileext = Mid(filename, InStrRev(filename, ".")) 
							
							filepath = dir_strDirectory & maxCode & fileext
							filename = maxCode & fileext

							Response.write filepath

							uploadform("filename").SaveAs filepath  '파일 저장

					End If

              
				   '광고주 정보를 등록한다. 
				   sQuery = "insert into tb_SponsorInfo " 
				   sQuery = sQuery & " (shopCode, shopType, CName, CNumber, CNumber2, Ceo, Ckind, Cgoods, Zip1, Zip2, address1, address2, Cemail, Ctel, Cfax, filename, RegDate, ModifyDate, useYN,regUseq) "
				   sQuery = sQuery & " values ('"&maxcode&"','"&SponsorType&"','"&ComName&"','"&CNumber&"','"&CNumber2&"','"&Ceo&"','"&Ckind&"','"&Cgoods&"','"&Zip1&"','"&Zip2&"','"&address1&"','"&address2&"','"&Cemail&"','"&Ctel&"','"&Cfax&"','"&filename&"',getdate(),getdate(),'Y','"&CID&"') "
				   'Response.write squery
				   oDb.Execute(sQuery)

				   '마스터 아이디를 등록한다. 
			       sQuery = "insert into tb_auth_admininfo " 
				   sQuery = sQuery & " (Uid, Uemail,Upasswd, Uname, Uhphone, RegDate, VisitDate, UseYN,AuthFlag, ShopCode) "
				   sQuery = sQuery & " values ('"&UID&"','"&Uemail&"', pwdencrypt('"&passwd&"'),'"&Uname&"','"&Hphone&"',getdate(), getdate(), 'Y', '"&Sysop&"', '"&maxcode&"') "
				   'Response.write squery 
				   oDb.Execute(sQuery)

				   call sChkMsg("광고주 정보 및 마스터 계정 정보가 등록되었습니다","2","sponsor_list.asp")
			
					
			   End If 

               oRs.close

               Set uploadform = Nothing 
		
		case "sponsor_edit"

              If uploadform("filename") <> "" Then 
                   
						 filename = uploadform("filename").FileName
						 filesize = uploadform("filename").FileLen   
						 MimeType = UploadForm("filename").MimeType
						 width  = UploadForm("filename").ImageWidth
						 height = UploadForm("filename").ImageHeight


						 Response.write dir_strDirectory &"<br>"& filename &"<br>"& filesize &"<br>"& MimeType &"<br>"& width &"<br>"& height &"<br>"& maxCode &"<br>"
						  
						 If filesize > 1024000 Then  
							call sChkMsg("카테고리 썸네일은 1메가 이상 용량이 등록이 될 수 없습니다.","1","")
							Response.End
						 End If

						 If Left(MimeType,5) <> "image" And MimeType <> "application/pdf" Then  
						 	call sChkMsg("이미지 또는 PDF 파일만 등록이 가능합니다.","1","")
							Response.End
                         End If 
						 
						 
							filenameonly = Left(filename, InStrRev(filename, ".") - 1) 
							fileext = Mid(filename, InStrRev(filename, ".")) 
							
							filepath = dir_strDirectory & sponCode & fileext
							filename = sponCode & fileext

							Response.write filepath

							uploadform("filename").SaveAs filepath  '파일 저장

				End If

		          
					sQuery = "update tb_SponsorInfo set"
					sQuery = sQuery & " shopType = '"&SponsorType&"', " 
					sQuery = sQuery & " CName = '"&ComName&"', " 				
                    sQuery = sQuery & " CNumber = '"&CNumber&"', " 	
					sQuery = sQuery & " CNumber2 = '"&CNumber2&"', " 
					sQuery = sQuery & " Ceo = '"&Ceo&"', " 				
                    sQuery = sQuery & " Ckind = '"&Ckind&"', " 			
					sQuery = sQuery & " Cgoods = '"&Cgoods&"', " 
					sQuery = sQuery & " Zip1 = '"&Zip1&"', " 		
					sQuery = sQuery & " Zip2 = '"&Zip2&"', " 		
					sQuery = sQuery & " address1 = '"&address1&"', " 		
					sQuery = sQuery & " address2 = '"&address2&"', " 		
					sQuery = sQuery & " Cemail = '"&Cemail&"', " 		
                    sQuery = sQuery & " Ctel = '"&Ctel&"', " 		
					sQuery = sQuery & " Cfax = '"&Cfax&"', " 		
					sQuery = sQuery & " ModifyDate = getdate(), " 				
                    sQuery = sQuery & " regUseq = '"&CID&"', " 	
					If filename <> "" Then sQuery = sQuery & " filename = '"&filename&"' " 	
					sQuery = sQuery & " Where shopCode = '"&sponCode&"'"
                    oDb.Execute(sQuery)

					call sChkMsg("광고주 정보가 수정이 되었습니다.","2","sponsor_view.asp?sponCode="&sponCode&"")     


		      


		case "sysop_input"
         
		 '중복된 아이디 정보가 있는 지 확인 한다. 
          sQuery = "SELECT * FROM tb_Auth_Admininfo where Uid = '"&UID&"'"
		  Set oRS = oDb.Execute(sQuery)
        
		       if Not(oRs.eof) Then
		       
			       call sChkMsg("등록된 계정 정보가 존재합니다. 다시 입력해주세요","1","")

               Else 
					
					'마스터 계정 정보를 입력한다. 
             
					sQuery = "insert into tb_auth_admininfo " 
					sQuery = sQuery & " (Uid, Uemail,Upasswd, Uname, Uhphone, RegDate, VisitDate, UseYN,AuthFlag, ShopCode) "
					sQuery = sQuery & " values ('"&UID&"','"&Uemail&"', pwdencrypt('"&passwd&"'),'"&Uname&"','"&Hphone&"',getdate(), getdate(), 'Y', '"&Sysop&"', '"&sponCode&"') "
					'Response.write squery 

					oDb.Execute(sQuery)

					If  sponCode = "99999" Then 
						call sChkMsg("계정 정보가 등록되었습니다","2","sysop_list.asp")
                    Else
                        call sChkMsg("계정 정보가 등록되었습니다","2","sponsor_view.asp?sponCode="&sponCode&"")
					End If 
			   
			   End If 

               oRs.close


		case "sysop_edit"
         
		    sQuery = "select top 1 npwd=pwdcompare('"&passwd&"',Upasswd) from tb_auth_admininfo where Useq = '"&Useq&"'"
           Set oRS = oDb.Execute(sQuery)
 
			   if oRs("npwd") = 0 then 
					call sChkMsg("패스워드가 틀립니다. 다시 입력해주세요","1","")			  
			   elseif oRs("npwd") = 1 then
							  
					sQuery = "update tb_auth_admininfo set"
					sQuery = sQuery & " Uemail = '"&Uemail&"', " 
					sQuery = sQuery & " Uname = '"&Uname&"', " 				
                    sQuery = sQuery & " Uhphone = '"&Hphone&"', " 				
					sQuery = sQuery & " AuthFlag = '"&Sysop&"'" 		
					sQuery = sQuery & " Where Useq = '"&Useq&"'"
                    oDb.Execute(sQuery)
                    
					If  sponCode = "99999" Then 
					   call sChkMsg("계정 정보가 수정되었습니다","2","sysop_list.asp")
                     Else
                       call sChkMsg("계정 정보가 수정되었습니다","2","sponsor_view.asp?sponCode="&sponCode&"")
					End If 

			   end If		

           oRs.close
        
        case "sysop_passwd"
           
		   sQuery = "select top 1 npwd=pwdcompare('"&chkpasswd&"',Upasswd) from tb_auth_admininfo where Useq = '"&Useq&"'"
           Set oRS = oDb.Execute(sQuery)
 
			   if oRs("npwd") = 0 then 
					call sChkMsg("패스워드가 틀립니다. 다시 입력해주세요","1","")			  
			   elseif oRs("npwd") = 1 then
							  
					sQuery = "update tb_auth_admininfo set"
					sQuery = sQuery & " Upasswd = pwdencrypt('"&newpasswd&"') " 
					sQuery = sQuery & " ,RegDate = getdate()" 				
					sQuery = sQuery & " Where Useq = '"&Useq&"'"
                    oDb.Execute(sQuery)

                    If  sponCode = "99999" Then 
					   call sChkMsg("계정 패스워드가 수정되었습니다","2","sysop_list.asp")
                     Else
                        call sChkMsg("계정 패스워드가 수정되었습니다","2","sponsor_view.asp?sponCode="&sponCode&"")
					End If 

			   end if	
        
          case "sysop_del"

					sQuery = "update tb_auth_admininfo set"
					sQuery = sQuery & " useYN = 'D'" 
					sQuery = sQuery & " ,RegDate = getdate()" 				
					sQuery = sQuery & " Where Useq = '"&Useq&"'"
                    oDb.Execute(sQuery)


					If  sponCode = "99999" Then 
					   call sChkMsg("계정 삭제되었습니다","2","sysop_list.asp")
                     Else
                        call sChkMsg("계정 삭제되었습니다","2","sponsor_view.asp?sponCode="&sponCode&"")
					End If 



	end select


	
	call sDbClose()

%>