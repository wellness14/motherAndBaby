<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

CALL sChkSession()
sDbOpen("BABYAPP")

   Dim UploadForm, fso
   Dim strDate, FileUrl, SaveFileName, filepath

   Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
   Set fso			= CreateObject("Scripting.FileSystemObject")


	'------------------------------------------------------------------------
    '	기본 경로
	UploadForm.AutoMakeFolder = True
	UploadForm.DefaultPath = "/upload_application/board" 
	UploadForm.codepage = 65001
	'------------------------------------------------------------------------
	
	Dim sMode, CFlag, bbscode, bSeq
	sMode				=	Trim(uploadform("sMode"))
	bbscode				=	Trim(uploadform("bbscode"))
	bSeq				=	Trim(uploadform("bSeq"))
	
	Dim bTitle, bText, AID, bSource, noticeNum, startDate, endDate
	bTitle			=	Replace(Trim(uploadform("bTitle")), "'","''")
	bText				=	Replace(Trim(uploadform("bText")), "'","''")
	AID					=	Trim(uploadform("AID"))
	bSource				=	Trim(uploadform("bSource"))
    noticeNum				=	Trim(uploadform("noticeNum")) 
	startDate				=	Trim(uploadform("startDate"))
    endDate				=	Trim(uploadform("endDate")) 
	
    If noticeNum = "" Then noticeNum = "99"

	Dim i, Y, ArrayNum, nArrayFilename() 
	Dim FullPathForSave, fexist, count


    	
    select case sMode

	    case "reg"

		' 컨텐츠 코드를 가져오고, 폴더를 생성한다
				Dim maxcode
				sQuery = "SELECT Max(bSeq) + 1 as maxcode FROM tb_boardList"
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
											If nArrayfilesize(Y) > 2048000  Then  ' 2메가
											   call sChkMsg("이미지 파일은 2메가를 넘길수 없습니다.","1","")
											   Exit For 
											End If
									Case "mp4" : 
											If nArrayfilesize(Y) > 10240000  Then '10메가
											   call sChkMsg("동영상 파일은 10메가를 넘길수 없습니다.","1","")
											   Exit For 
											End If
									Case Else : 
											  call sChkMsg("이미지 또는 동영상(mp4)만 업로드 가능합니다.","1","")
											  Exit For 
									End Select 					
                                 
											 
											 
                                            SaveFileName	   = datetime() & "." & nArrayfileext(Y)
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
										  filepath	= "/upload_application/board/"&strDate
										  
										  '파일 정보를 입력한다
										   sQuery = "insert into tb_boardFileinfo (bSeq, Filename, FilePath, FType, fwidth, fheight, fsize, regDate) " 
									       sQuery = sQuery & " values ("&maxcode&", '"&SaveFileName&"', '"&filepath&"', '"&nArrayfileext(Y)&"', '"&nArraymwidth(Y)&"','"&nArraymheight(Y)&"',"&nArrayfilesize(Y)&",getdate()) " 
										   oDb.Execute(sQuery)
										
						   
						   End If 


				NEXT
                
				'커뮤니티 정보를 입력한다. 
			    sQuery = "insert into tb_boardList (bSeq, bbscode, AID, bTitle, bText, bSource, noticeNum, hit, useYN,startDate,endDate) " 
			    sQuery = sQuery & " values ("&maxcode&", '"&bbscode&"', '"&AID&"', '"&bTitle&"', '"&bText&"', '"&bSource&"', '"&noticeNum&"', 0, 'Y', '"&startDate&"', '"&endDate&"') " 
			    oDb.Execute(sQuery)
		        
				call sChkMsg("등록되었습니다","2","list.asp?bbscode="&bbscode&"")

		case "edit"
		
               
				strDate = Replace(Date(),"-","")
				FileUrl = UploadForm.DefaultPath & "\" & strDate

				' 폴더 만들기
				IF NOT fso.FolderExists (FileUrl) THEN 
					fso.CreateFolder (FileUrl)
				END If


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
											If nArrayfilesize(Y) > 2048000  Then  ' 2메가
											   call sChkMsg("이미지 파일은 2메가를 넘길수 없습니다.","1","")
											   Exit For 
											End If
									Case "mp4" : 
											If nArrayfilesize(Y) > 10240000  Then '10메가
											   call sChkMsg("동영상 파일은 10메가를 넘길수 없습니다.","1","")
											   Exit For 
											End If
									Case Else : 
											  call sChkMsg("이미지 또는 동영상(mp4)만 업로드 가능합니다.","1","")
											  Exit For 
									End Select 					
                                 
											 
											 
                                            SaveFileName	   = datetime() & "." & nArrayfileext(Y)
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
										  filepath	= "/upload_application/board/"&strDate
										  
										  If UploadForm("fileNum")(i) <> "" Then 

                                            sQuery = "update tb_boardFileinfo set " 
											sQuery = sQuery & " Filename = '"&SaveFileName&"' " 
                                            sQuery = sQuery & " ,FilePath = '"&filepath&"' " 
                                            sQuery = sQuery & " ,FType =  '"&nArrayfileext(Y)&"' " 
											sQuery = sQuery & " ,fwidth =  '"&nArraymwidth(Y)&"' " 
											sQuery = sQuery & " ,fheight = '"&nArraymheight(Y)&"' "
                                            sQuery = sQuery & " ,fsize = '"&nArrayfilesize(Y)&"'" 
											'sQuery = sQuery & " ,regDate = getdate() " 
											sQuery = sQuery & " Where fSeq = '"&UploadForm("fileNum")(i)&"' "
											oDb.Execute(sQuery)

											'Response.write sQuery 

										  Else 
                                          
										  '파일 정보를 입력한다
										   sQuery = "insert into tb_boardFileinfo (bSeq, Filename, FilePath, FType, fwidth, fheight, fsize, regDate) " 
									       sQuery = sQuery & " values ("&bSeq&", '"&SaveFileName&"', '"&filepath&"', '"&nArrayfileext(Y)&"', '"&nArraymwidth(Y)&"','"&nArraymheight(Y)&"',"&nArrayfilesize(Y)&",getdate()) " 
										   oDb.Execute(sQuery)


										  End If 
										  
										  
										
						   
						   End If 


				NEXT
                
				'커뮤니티 정보를 수정한다
                 sQuery = "update tb_boardList set " 
				 sQuery = sQuery & " AID = '"&AID&"'" 
                sQuery = sQuery & " ,bTitle = '"&bTitle&"'" 
				sQuery = sQuery & " ,bText =  '"&bText&"'" 
				sQuery = sQuery & " ,bSource = '"&bSource&"'" 
				sQuery = sQuery & " ,noticeNum = '"&noticeNum&"'" 
				If bbscode = "003" Then sQuery = sQuery & " ,startDate = '"&startDate&"' ,endDate = '"&endDate&"'" 
				sQuery = sQuery & " where bSeq = '"&bSeq&"' "
				oDb.Execute(sQuery)

				call sChkMsg("수정 되었습니다. ","2","view.asp?bbscode="&bbscode&"&bSeq="&bSeq&"")

        case "del"
              
			  '파일 및 파일 정보 삭제 한다. 
			  sQuery = " select * from tb_boardFileinfo where bSeq = '"&bSeq&"' "
			  Set oRS = oDb.Execute(sQuery)

			  Do While Not ( oRs.eof or oRs.bof ) 
		




			  oRs.MoveNext
			  Loop
			  oRs.close

			  sQuery = "update tb_boardFileinfo set useYN = 'D' where bSeq = '"&bSeq&"' "
			  oDb.Execute(sQuery)

			  '기본정보도 삭제한다.
			  sQuery = "update tb_boardList set useYN = 'D' where bSeq = '"&bSeq&"' "
              oDb.Execute(sQuery)

			  call sChkMsg("삭제되었습니다","2","list.asp?bbscode="&bbscode&"")


	end select


	
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