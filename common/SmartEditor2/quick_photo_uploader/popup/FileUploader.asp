<!-- #include virtual = "/common/inc/VarDef.asp"-->
<!-- #include virtual = "/common/inc/FunDef.asp"-->
<!-- #include virtual = "/common/inc/RSexec.asp"-->
<%
	Set UploadForm=server.CreateObject("SiteGalaxyUpload.Form")
	Set FSO=server.CreateObject("Scripting.FileSystemObject")
	
	DefaultPath = "D:\FileServer\SmartUpload\2013\img\"		'업로드 폴더
	
	Attach_File=UploadForm("uploadInputBox")
	
	if Attach_File="" then
	else
			   userfilepath = UploadForm("uploadInputBox").filepath
			   userfilename = mid(userfilepath,instrrev(userfilepath,"\")+1)
			   'userfilenameonly = mid(userfilename,1,instr(userfilename,".")-1)	
			   '한글 파일명 관련 오류 있을까봐 아래처럼 쓰는데, 이번 버전에 문제 없으시면 아래 대신 이걸로 사용하시면 됨.
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
			   
			   if instr(UploadForm("uploadInputBox").mimetype,"image") = 0 then	'클라이언트 쪽에서 체크 하고있긴한데 만약을 대비해서 한번더 체크
				response.End()
			   end if
			   
			   upfilename = DefaultPath&userfilename
			   UploadForm("uploadInputBox").saveas upfilename
			   
			filesize = UploadForm("uploadInputBox").size	'나중에 필요에 따라 사용
			filetype = UploadForm("uploadInputBox").mimetype '나중에 필요에 따라 사용
			
			fileext = userextnameonly '나중에 필요에 따라 사용
	end if
	
	f_url = "/upload/smarte/" & userfilename	'나중에 사이트 도메인 변경되는 경우를 대비해서 앞쪽 도메인 빼버림. 필요에 따라 http부터 넣어도 됨.
	callback_func = UploadForm("callback_func")
	
	Set FSO = nothing
	
	response.Redirect("http://next.megastudy.net:8081/common/SmartEditor2/popup/quick_photo/callback.html?callback_func="&callback_func&"&bNewLine=true&sFileName="&Attach_File&"&sFileURL="&f_url)
%>
