<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/Base64ende.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://www.mothernbaby.co.kr/application/api/get_userfile_db.asp
   Dim UploadForm, fso
   Dim strDate, FileUrl, SaveFileName, filepath

   Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
   Set fso			= CreateObject("Scripting.FileSystemObject")


	'------------------------------------------------------------------------
    '	기본 경로
	UploadForm.AutoMakeFolder = True
	UploadForm.DefaultPath = "/upload_application/userProfile" 
	UploadForm.codepage = 65001
	'------------------------------------------------------------------------
	
	Dim UCode, pFlag

	UCode				=	Trim(uploadform("UCode"))
    pFlag			    =	Trim(uploadform("pFlag"))

	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

	If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
   End If 

   If pFlag = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(pFlag)"
   End If

   
   
    If errcode = "0" Then 
				
		       FileUrl = UploadForm.DefaultPath & "\" & UCode

			   sQuery = "select * from tb_UserFileinfo where uSeq = '"&UCode&"' " 
               Set oRS = oDb.Execute(sQuery)

			   If oRs.eof Then 

				' 폴더 만들기
				IF NOT fso.FolderExists (FileUrl) THEN 
					fso.CreateFolder (FileUrl)
				END If

              End If 

             oRs.close 




				Dim i, Y, ArrayNum, nArrayFilename() 
				Dim FullPathForSave, fexist, count

				ArrayNum = UploadForm("pfilename").Count - 1

				ReDim Preserve nArrayFilename(ArrayNum)
				ReDim Preserve nArrayfilesize(ArrayNum)
				ReDim Preserve nArrayMimeType(ArrayNum)
				ReDim Preserve nArraymwidth(ArrayNum)
				ReDim Preserve nArraymheight(ArrayNum)
				ReDim Preserve nArrayfilenameonly(ArrayNum)
				ReDim Preserve nArrayfileext(ArrayNum)

				'Response.write UploadForm("pfilename").Count

				If 	UploadForm("pfilename")(0) = "" Then 
				
					errcode = "203"
				    errmsg = "file info No"

				Else 
				
				
						For i = 1 To UploadForm("pfilename").Count

						Y = i - 1
							 
									nArrayFilename(Y) = UploadForm("pfilename")(i).FileName
									nArrayfilesize(Y) = uploadform("pfilename")(i).FileLen   
									nArrayMimeType(Y)  = UploadForm("pfilename")(i).MimeType
									nArraymwidth(Y)  = UploadForm("pfilename")(i).ImageWidth
									nArraymheight(Y) = UploadForm("pfilename")(i).ImageHeight
									
									'Response.write nArrayFilename(Y) &"<br>"& nArrayfilesize(Y) &"<br>"& nArrayMimeType(Y) &"<br>"& nArraymwidth(Y) &"<br>"& nArraymheight(Y) &"<br>"& sNum &"<br>"
									
									If nArrayfilesize(Y) > 0 Then 

										nArrayfilenameonly(Y) = Left(nArrayFilename(Y), InStrRev(nArrayFilename(Y), ".") - 1) 
										nArrayfileext(Y) = LCase(Mid(nArrayFilename(Y),InstrRev(nArrayFilename(Y),".")+1))	
										
											Select Case nArrayfileext(Y)

											Case "jpg","gif","bmp","png","jpeg","JPG" : 
													If nArrayfilesize(Y) > 5120000  Then  ' 2메가
														errcode = "200"
													   errmsg = "이미지 파일은 5메가를 넘길수 없습니다."
													End If
											Case Else : 
													  errcode = "202"
													  errmsg = "이미지만 업로드 가능합니다."
											End Select 					
										 
													 
												If errcode = "0" Then 
													
													SaveFileName		= datetime() & "." & nArrayfileext(Y)
													FullPathForSave    = FileUrl & "\" & SaveFileName			

													fexist = true
													count=0
													Do While fexist  '파일이 중복될 경우 이름을 다시 지정 -파일이름 뒤에 숫자를 붙여서 업
														if(fso.FileExists(FullPathForSave)) Then
															count=count+1
															SaveFileName = datetime() & "_" & count & "." & nArrayfileext(Y)
															FullPathForSave = FileURL & "\" & SaveFileName  
														Else
															fexist=false
														End If
													Loop
												  
												  'Response.write FullPathForSave

												  UploadForm("pfilename")(i).SaveAs FullPathForSave, True 	'파일저장

												  filepath					= "/upload_application/userProfile/"&uCode
												  
												   '기존 등록된 정보는 업데이트 한다. 

												   sQuery = "update tb_UserFileinfo set useYN = 'U' where uSeq = '"&UCode&"' and fileZone = '"&pFlag&"' " 
												   oDb.Execute(sQuery)
												   
												   '파일 정보를 입력한다
												   sQuery = "insert into tb_UserFileinfo (uSeq, Filename, FilePath, FType, fwidth, fheight, fsize, filezone, regDate) " 
												   sQuery = sQuery & " values ("&UCode&", '"&SaveFileName&"', '"&filepath&"', '"&nArrayfileext(Y)&"', '"&nArraymwidth(Y)&"','"&nArraymheight(Y)&"',"&nArrayfilesize(Y)&",'"&pFlag&"', getdate()) " 
												   oDb.Execute(sQuery)
												  

												End If 
								   
								   End If 

						  
									

						Next
				
              End If 						
			    
                
  End If 

  
  Set UploadForm = Nothing '객체는 항상 사용되지않는 즉시 Nothing 처리해줘야 부하가 적습니다.
  Set fso = Nothing


    Response.write "{"
     response.write """errcode"""
	 response.write ":"
	 response.write """"&errcode&""""
	 response.write ","
	 response.write """errmsg"""
	 response.write ":"
	 response.write """"&errmsg&""""
     response.write ","
     Response.write """infoview"": ["
     Response.write "{"
       response.write """UCode"""
	   response.write ":"
	   response.write """"&UCode&""""
	   response.write ","
	   response.write """pFlag"""
	   response.write ":"
	   response.write """"&pFlag&""""
	 Response.write "}"
     Response.write "]"
     Response.write "}"




  call sDbClose()



'===========================================================================
'함수명		: datetime
'기능설명	: 날짜 함수 System date => yyyymmddhhmmss
'===========================================================================
Function datetime()
    Dim v_year, v_month, v_day, v_hour, v_minute, v_second, v_datetime
	v_year = year(date)
	v_month = month(date)
	if v_month < 10 then v_month = "0" & v_month
	v_day = day(date)
	if v_day < 10 then v_day = "0" & v_day
	v_hour = hour(time)
	if v_hour < 10 then v_hour = "0" & v_hour
	v_minute = minute(time)
	if v_minute < 10 then v_minute = "0" & v_minute
	v_second = second(time)
	if v_second < 10 then v_second = "0" & v_second
	v_datetime = v_year&v_month&v_day&v_hour&v_minute&v_second
	datetime = v_datetime
End Function


%>
