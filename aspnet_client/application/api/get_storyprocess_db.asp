<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/Base64ende.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_storyprocess_db.asp
   Dim UploadForm, fso
   Dim strDate, FileUrl, SaveFileName, filepath

   Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
   Set fso			= CreateObject("Scripting.FileSystemObject")


	'------------------------------------------------------------------------
    '	기본 경로
	UploadForm.AutoMakeFolder = True
	UploadForm.DefaultPath = "/upload_application" 
	UploadForm.codepage = 65001
	'------------------------------------------------------------------------
	
	Dim sMode, UCode
	Dim category, sText
	
    sMode				=	Trim(uploadform("sMode"))
	UCode				=	Trim(uploadform("UCode"))
    category			=	Trim(uploadform("category"))
    sText				=	Replace(Trim(uploadform("sText")), "'","''")
    'sText				=	uploadform("sText")
	

    response.write sText 
	response.End 

	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    'If sMode = "" Then 
	'	errcode = "-1"
	'	errmsg = "default parameter info error(sMode)"
   'End If 

   If UCode = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(UCode)"
   End If

   If category = "" Then 
		errcode = "-3"
		errmsg = "default parameter info error(category)"
   End If

   If sText = "" Then 
		errcode = "-4"
		errmsg = "default parameter info error(sText)"
   End If

   
    If errcode = "0" Then 
				
				' 컨텐츠 코드를 가져오고, 폴더를 생성한다
				Dim maxcode
				sQuery = "SELECT Max(sNumber) + 1 as maxcode FROM tb_StoryCommunityList"
				Set oRS = oDb.Execute(sQuery)
					
						   If ISNULL(oRs("maxcode")) Then 
						   maxcode = "1" 
						   Else
						   maxcode = oRs("maxcode")			   
						   End If 

				oRs.close

				strDate = Replace(Date(),"-","")
				FileUrl = UploadForm.DefaultPath & "\" & strDate
				
				' 폴더 만들기
				IF NOT fso.FolderExists (FileUrl) THEN 
					fso.CreateFolder (FileUrl)
				END If


				Dim i, Y, ArrayNum, nArrayFilename() 
				Dim FullPathForSave, fexist, count

				ArrayNum = UploadForm("mfilename").Count - 1

				ReDim Preserve nArrayFilename(ArrayNum)
				ReDim Preserve nArrayfilesize(ArrayNum)
				ReDim Preserve nArrayMimeType(ArrayNum)
				ReDim Preserve nArraymwidth(ArrayNum)
				ReDim Preserve nArraymheight(ArrayNum)
				ReDim Preserve nArrayfilenameonly(ArrayNum)
				ReDim Preserve nArrayfileext(ArrayNum)

				
				For i = 1 To UploadForm("mfilename").Count

				Y = i - 1
					 
							nArrayFilename(Y) = UploadForm("mfilename")(i).FileName
							nArrayfilesize(Y) = uploadform("mfilename")(i).FileLen   
							nArrayMimeType(Y)  = UploadForm("mfilename")(i).MimeType
							nArraymwidth(Y)  = UploadForm("mfilename")(i).ImageWidth
							nArraymheight(Y) = UploadForm("mfilename")(i).ImageHeight
							
							'Response.write nArrayFilename(Y) &"<br>"& nArrayfilesize(Y) &"<br>"& nArrayMimeType(Y) &"<br>"& nArraymwidth(Y) &"<br>"& nArraymheight(Y) &"<br>"& maxCode &"<br>"
							
							If nArrayfilesize(Y) > 0 Then 

								nArrayfilenameonly(Y) = Left(nArrayFilename(Y), InStrRev(nArrayFilename(Y), ".") - 1) 
								nArrayfileext(Y) = LCase(Mid(nArrayFilename(Y),InstrRev(nArrayFilename(Y),".")+1))	
								
									Select Case nArrayfileext(Y)

									Case "jpg","gif","bmp","png" : 
											If nArrayfilesize(Y) > 3072000  Then  ' 2메가
													
											   errcode = "200"
											   errmsg = "이미지 파일은 3메가를 넘길수 없습니다."
											End If
									Case "mp4" : 
							
											If nArrayfilesize(Y) > 10240000  Then '10메가
											   errcode = "201"
											   errmsg = "동영상 파일은 10메가를 넘길수 없습니다."
											End If
									Case Else : 
											  errcode = "202"
											  errmsg = "이미지 또는 동영상(mp4)만 업로드 가능합니다."
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
                                          
										   
										  UploadForm("mfilename")(i).SaveAs FullPathForSave, True 	'파일저장

										  filepath					= "/upload_application/"&strDate
										  
										  '파일 정보를 입력한다
										   sQuery = "insert into tb_StoryFileinfo (sNumber, Filename, FilePath, FType, fwidth, fheight, fsize, regDate) " 
									       sQuery = sQuery & " values ("&maxcode&", '"&SaveFileName&"', '"&filepath&"', '"&nArrayfileext(Y)&"', '"&nArraymwidth(Y)&"','"&nArraymheight(Y)&"',"&nArrayfilesize(Y)&",getdate()) " 
										   oDb.Execute(sQuery)
                                          
										Else 
										   
										   '파일 정보를 삭제한다.
										   sQuery = "delete from tb_StoryFileinfo where sNumber = '"&maxcode&"' " 
									       oDb.Execute(sQuery)

										   Exit For 

										End If 
						   
						   End If 

                  
							

				NEXT
			    
               
			   If errcode = "0" Then 

			    '커뮤니티 정보를 입력한다. 
			    sQuery = "insert into tb_StoryCommunityList (sNumber, Category, Useq, sTitle, sText, sSource, hit, useYN) " 
			    sQuery = sQuery & " values ("&maxcode&", '"&category&"', '"&UCode&"', '.', '"&sText&"', '', 0, 'Y') " 
			    oDb.Execute(sQuery)

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
       response.write """sMode"""
	   response.write ":"
	   response.write """"&sMode&""""
	   response.write ","
	   response.write """UCode"""
	   response.write ":"
	   response.write """"&UCode&""""
	   response.write ","
	   response.write """category"""
	   response.write ":"
	   response.write """"&category&""""
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
