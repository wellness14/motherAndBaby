<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<%    
	Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
	Set fso			= CreateObject("Scripting.FileSystemObject")

'------------------------------------------------------------------------
'	���� ��� ����
	UploadForm.DefaultPath = "/upload_file" 
	Dim tmpFilePath : tmpFilePath = "board"

	strDate = Replace(Date(),"-","")
	FileUrl = UploadForm.DefaultPath & "/" & tmpFilePath & "/" & strDate
	FilePath = "/upload_file" & "/" & tmpFilePath & "/" & strDate

	' ���� �����
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
'	���� ���� ���� ����
	UploadFile			= fso.GetFileName(UpForm)									' ���ϸ�
	FileExt				= LCase(Mid(UploadFile,InstrRev(UploadFile,".")+1))			' Ȯ����
	SaveFileName		= datetime() & "." & FileExt
	FullPathForSave		= FileUrl & "/" & SaveFileName			  					' ���� ���� Ǯ�佺
	FilePath			= FilePath & "/" & SaveFileName
'------------------------------------------------------------------------

'------------------------------------------------------------------------
'	���� �����ϱ�
	Select Case FileExt
		Case "jpg","gif","bmp" : 
			If len(UploadFile) >= 50 then
				Response.Write "<script type=""text/javascript"">alert('���ϸ��� ��� �ڷḦ �ø��� �� �����ϴ�.\n���ϸ��� �������ֽʽÿ�.');history.go(-1);</script>"
				Response.End
			End If

			f_size = 2048000		'File Upload Size
			If UpForm.FileLen > f_size Then
				Response.Write "<script type=""text/javascript"">alert('2MB ���Ϸ� ��� �����մϴ�.');history.go(-1);</script>"
				Response.End
			End If

			fexist = true
			count=0
			Do While fexist  '������ �ߺ��� ��� �̸��� �ٽ� ���� -�����̸� �ڿ� ���ڸ� �ٿ��� ��
				if(fso.FileExists(FullPathForSave)) Then
					count=count+1
					SaveFileName = datetime() & "_" & count & "." & strext
					FullPathForSave = FileURL & "\" & SaveFileName  
				Else
					fexist=false
				End If
			Loop

			UpForm.SaveAs FullPathForSave, True 	'��������
			
			rtnSaveName = strDate &"/"& SaveFileName
		Case Else : 
			response.Write "<script type='text/javascript'>alert('JPG, GIF, BMP�� ��� �����մϴ�.');history.go(-1);</script>"
			response.End 
	End Select 
	
	f_url = "http://mothernbaby.co.kr/upload_file/board/" & rtnSaveName	'���ϼ����� ���� �ּ��Դϴ�.
	callback_func = UploadForm("callback_func")

	Set UploadForm = Nothing '��ü�� �׻� �������ʴ� ��� Nothing ó������� ���ϰ� �����ϴ�.
	Set fso = Nothing
'------------------------------------------------------------------------

	response.Redirect("http://"& callHost &"/common/SmartEditor2/quick_photo_uploader/popup/callback.html?callback_func="& callback_func &"&bNewLine=true&sFileName="&SaveFileName&"&sFileURL="&f_url)
%>