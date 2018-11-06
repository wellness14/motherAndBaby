<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<% 

response.charset = "utf-8"

CALL sChkSession()
sDbOpen("BABYAPP")


   Dim UploadForm, fso
   Dim strDate, FileUrl, SaveFileName, filepath

   Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
   Set fso			= CreateObject("Scripting.FileSystemObject")


	'------------------------------------------------------------------------
    '	기본 경로
	UploadForm.AutoMakeFolder = True
	UploadForm.DefaultPath = "/upload_application/push" 
	UploadForm.codepage = 65001
	'------------------------------------------------------------------------


    Dim sMode, sendType, title, contxt
	sMode			=	Request("sMode")

	'카테고리 변수 
	sendType		=	Request("sendType")
    title			=	replace(Request("title"), "'" ,"""")	
    contxt			=	replace(Request("contxt"), "'" ,"""")	

  
	
	If sMode = "" Then 

   	sMode			= uploadform("sMode")

	'카테고리 변수 
	sendType		= replace(uploadform("sendType"), "'" ,"""")	
	title		= replace(uploadform("title"), "'" ,"""")	
	contxt	= uploadform("contxt")

    End If 

    
	Dim filename, filesize, MimeType, m_width, m_height
    Dim filenameonly, fileext
	Dim FullPathForSave, fexist, count
   
    select case sMode
		
	case "noticeReg"

       
        strDate = Replace(Date(),"-","")
		FileUrl = UploadForm.DefaultPath & "\" & strDate

		If uploadform("imgFile") <> "" Then 

             filename = uploadform("imgFile").FileName
			 filesize = uploadform("imgFile").FileLen   
		     MimeType = UploadForm("imgFile").MimeType
			 m_width  = UploadForm("imgFile").ImageWidth
			 m_height = UploadForm("imgFile").ImageHeight


             'Response.write dir_strDirectory &"<br>"& filename &"<br>"& filesize &"<br>"& MimeType &"<br>"& m_width &"<br>"& m_height &"<br>"& maxCode &"<br>"
              
			 If filesize > 1024000 Then  
				call sChkMsg("전송이미지는 1메가 이상 용량이 등록이 될 수 없습니다.","1","")
				Response.End
			 End If

             If m_width <= m_height Then  
				call sChkMsg("이미지는 가로형가 큰 이미지로 적용해주세요.","1","")
				Response.End
			 End If

			 If Left(MimeType,5) <> "image" Then  
				call sChkMsg("이미지 타입의 파일만 등록이 가능합니다.","1","")
				Response.End
			 End If
             
			 filenameonly = Left(filename, InStrRev(filename, ".") - 1) 
			 fileext = LCase(Mid(filename,InstrRev(filename,".")+1))	
			
             SaveFileName	   = datetime() & "." & fileext
			 FullPathForSave   = FileUrl & "\" & SaveFileName			

			 fexist = true
			 count=0
			
				Do While fexist  '파일이 중복될 경우 이름을 다시 지정 -파일이름 뒤에 숫자를 붙여서 업
						if(fso.FileExists(FullPathForSave)) Then
							count=count+1
							SaveFileName = datetime() & "_" & count & "." & fileext
							FullPathForSave = FileURL & "\" & SaveFileName  
						Else
							fexist=false
						End If
				Loop
                                        
			    UploadForm("imgFile").SaveAs FullPathForSave, True 	'파일저장
				filepath	= "/upload_application/push/"&strDate

	    End If 


			'정보를 등록한다. 
			sQuery = "insert into tb_PushBadge_info " 
			sQuery = sQuery & " (sendType, sendFlag, title, conTxT, sendResult,filepath, imgfilename, regCID, sendCID) "
			sQuery = sQuery & " values ('"&sendType&"','P','"&title&"', '"&contxt&"','W','"&filepath&"','"&SaveFileName&"','"&CID&"','"&CID&"') "
			oDb.Execute(sQuery)

           call sChkMsg("알림 푸쉬 리스트 생성되었습니다..","2","notice_List.asp")

         
     case "categoryedit"
    
        
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