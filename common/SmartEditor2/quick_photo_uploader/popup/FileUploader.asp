<!-- #include virtual = "/common/inc/VarDef.asp"-->
<!-- #include virtual = "/common/inc/FunDef.asp"-->
<!-- #include virtual = "/common/inc/RSexec.asp"-->
<%
	Set UploadForm=server.CreateObject("SiteGalaxyUpload.Form")
	Set FSO=server.CreateObject("Scripting.FileSystemObject")
	
	DefaultPath = "D:\FileServer\SmartUpload\2013\img\"		'���ε� ����
	
	Attach_File=UploadForm("uploadInputBox")
	
	if Attach_File="" then
	else
			   userfilepath = UploadForm("uploadInputBox").filepath
			   userfilename = mid(userfilepath,instrrev(userfilepath,"\")+1)
			   'userfilenameonly = mid(userfilename,1,instr(userfilename,".")-1)	
			   '�ѱ� ���ϸ� ���� ���� ������� �Ʒ�ó�� ���µ�, �̹� ������ ���� �����ø� �Ʒ� ��� �̰ɷ� ����Ͻø� ��.
			   userfilenameonly = "se2"&year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
			   userfilename = userfilenameonly&"."&mid(userfilename,instr(userfilename,".")+1)
			   userextnameonly = mid(userfilename,instr(userfilename,".")+1)
			   checkfilename = DefaultPath&userfilename
			
			   if(FSO.fileexists(checkfilename)) = true then
				   i = 2
					Do While (1)
					checkfilename = DefaultPath&userfilenameonly&"_"&i&"."&userextnameonly
					If(FSO.fileexists(checkfilename)) <> true Then Exit Do
					i = i + 1
					Loop 
					userfilename = userfilenameonly&"_"&i&"."&userextnameonly
			   end if
			   
			   if instr(UploadForm("uploadInputBox").mimetype,"image") = 0 then	'Ŭ���̾�Ʈ �ʿ��� üũ �ϰ��ֱ��ѵ� ������ ����ؼ� �ѹ��� üũ
				response.End()
			   end if
			   
			   upfilename = DefaultPath&userfilename
			   UploadForm("uploadInputBox").saveas upfilename
			   
			filesize = UploadForm("uploadInputBox").size	'���߿� �ʿ信 ���� ���
			filetype = UploadForm("uploadInputBox").mimetype '���߿� �ʿ信 ���� ���
			
			fileext = userextnameonly '���߿� �ʿ信 ���� ���
	end if
	
	f_url = "/upload/smarte/" & userfilename	'���߿� ����Ʈ ������ ����Ǵ� ��츦 ����ؼ� ���� ������ ������. �ʿ信 ���� http���� �־ ��.
	callback_func = UploadForm("callback_func")
	
	Set FSO = nothing
	
	response.Redirect("http://next.megastudy.net:8081/common/SmartEditor2/popup/quick_photo/callback.html?callback_func="&callback_func&"&bNewLine=true&sFileName="&Attach_File&"&sFileURL="&f_url)
%>
