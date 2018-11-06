<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<%    
	Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
	Set fso			= CreateObject("Scripting.FileSystemObject")

'------------------------------------------------------------------------
'	저장 경로 생성
	UploadForm.DefaultPath = "/upload_file" 
	Dim tmpFilePath : tmpFilePath = "board"

	strDate = Replace(Date(),"-","")
	FileUrl = UploadForm.DefaultPath & "/" & tmpFilePath & "/" & strDate
	FilePath = "/upload_file" & "/" & tmpFilePath & "/" & strDate

	' 폴더 만들기
	IF NOT fso.FolderExists (FileURL) THEN 
		fso.CreateFolder (FileURL)
	END If
'------------------------------------------------------------------------

'------------------------------------------------------------------------
'	Request
	callHost	= UploadForm("callHost")
	Set UpForm	= UploadForm("uploadInputBox")
'------------------------------------------------------------------------

'------------------------------------------------------------------------
'	저장 파일 정보 생성
	UploadFile			= fso.GetFileName(UpForm)									' 파일명
	FileExt				= LCase(Mid(UploadFile,InstrRev(UploadFile,".")+1))			' 확장자
	SaveFileName		= datetime() & "." & FileExt
	FullPathForSave		= FileUrl & "/" & SaveFileName			  					' 파일 저장 풀페스
	FilePath			= FilePath & "/" & SaveFileName
'------------------------------------------------------------------------

'------------------------------------------------------------------------
'	파일 저장하기
	Select Case FileExt
		Case "jpg","gif","bmp" : 
			If len(UploadFile) >= 50 then
				Response.Write "<script type=""text/javascript"">alert('파일명이 길어 자료를 올리실 수 없습니다.\n파일명을 변경해주십시오.');history.go(-1);</script>"
				Response.End
			End If

			f_size = 2048000		'File Upload Size
			If UpForm.FileLen > f_size Then
				Response.Write "<script type=""text/javascript"">alert('2MB 이하로 등록 가능합니다.');history.go(-1);</script>"
				Response.End
			End If

			fexist = true
			count=0
			Do While fexist  '파일이 중복될 경우 이름을 다시 지정 -파일이름 뒤에 숫자를 붙여서 업
				if(fso.FileExists(FullPathForSave)) Then
					count=count+1
					SaveFileName = datetime() & "_" & count & "." & strext
					FullPathForSave = FileURL & "\" & SaveFileName  
				Else
					fexist=false
				End If
			Loop

			UpForm.SaveAs FullPathForSave, True 	'파일저장
			
			rtnSaveName = strDate &"/"& SaveFileName
		Case Else : 
			response.Write "<script type='text/javascript'>alert('JPG, GIF, BMP만 등록 가능합니다.');history.go(-1);</script>"
			response.End 
	End Select 
	
	f_url = "http://mothernbaby.co.kr/upload_file/board/" & rtnSaveName	'파일서버의 파일 주소입니다.
	callback_func = UploadForm("callback_func")

	Set UploadForm = Nothing '객체는 항상 사용되지않는 즉시 Nothing 처리해줘야 부하가 적습니다.
	Set fso = Nothing
'------------------------------------------------------------------------

	response.Redirect("http://"& callHost &"/common/SmartEditor2/quick_photo_uploader/popup/callback.html?callback_func="& callback_func &"&bNewLine=true&sFileName="&SaveFileName&"&sFileURL="&f_url)
%>
