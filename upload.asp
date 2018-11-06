<%@Language="VBScript" CODEPAGE="65001" %>
<%
Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
%>
<% 
	Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 

	UploadForm.CodePage = 65001

	UploadForm.DefaultPath = "/upload_file/test/"

	attachFile = UploadForm("attachFile").FilePath

	strFileName = UploadForm.SaveAs (attachFile, False)
	
	strFileName = Mid(strFileName, InstrRev(strFileName, "\") + 1)
	
	fileSize = UploadForm("attachFile").FileLen
	
	Response.Write strFileName & "////" & fileSize
%>