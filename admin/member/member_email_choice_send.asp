<% 
'---------------------------------------------------------------------------------------
'	���� �߼� �Լ�
'	sFromName	: ������ ��� �̸�
'	sFromAddr	: ������ ��� EMAIL
'	sToAddr		: �޴� ��� EMAIL
'	sUserId		: �޴� ��� ID
'	sUserName	: �޴� ��� �̸�
'	sSubject	: ����
'	sType		: ���� �߼� ����( ID - ID ã��, PWD - ��й�ȣ ã��, ENT - ȸ������, Cert - ������ȣ)
%>

<!-- #include virtual = "/common/asp/FunDef.asp"-->

<%
		check_seq	=	fncRequest("check_seq")
		email		=	fncRequest("email")
		mem_nm		=	fncRequest("mem_nm")
	'	check_seq	=	Replace(check_seq,",","||")

	seq_size		= request("check_seq").count
	email_size		= request("email").count

	sMailTile		= "[�����غ��̺�] ȸ�� ���Ծȳ� �����Դϴ�."
	
	sContent		= ""
	sContent		=  sContent & "  "

	

	for i = 1 to Request("check_seq").count 
		'Response.Write Request("check_seq")(i) 
		check_seq = request("check_seq")(i)
		sContent	=  sContent & "		<input type='hidden' name='check_seq' id='check_seq' value='"
		sContent	=  sContent & check_seq & "' />" 

		for j = 1 to Request("email").count 
			check_email = request("email")(i)

			for k = 1 to Request("mem_nm").count 
				check_nm = request("mem_nm")(i)


%>
<!-- ���� ������ �� ������ ���ؼ� �̺κп��ٰ� ���� ���Ϻ�����-->
<%
	Next



	 Next
	 %>
<script>
//alert('���Ϲ�������� ��');
//alert("<%=seq_size%>");
//alert('�̸��Ϲ�������� ��');
//alert("<%=email_size%>");
//alert('seq');
alert("<%=check_seq%>");
//alert('email_seq');
alert("<%=check_email%>");
</script>
<%	

	
	 zRtn = FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", check_email, check_seq, check_nm, sMailTile, sContent, "ADMIN_JOIN") 

		 next
	
	sContent	=  sContent & "		"


'���Ϻ�������� �Ϸ� ���� �а� Ÿ�� ������ �����

'for i=0 to Ubound(visito) '0���� �迭ũ�����









'���
'for i=0 to request("check_seq").count
'  check_seq = request("check_seq")(i)
'next

'seq_size = request("check_seq").count

'request("check_seq").count : ��ü ����
'request("check_seq")(x) : x��° ��

%> 
<script>
//alert('seq ������');
//alert("<%=seq_size%>");
</script>
<% 
'	zRtn = FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", email, mem_id, mem_nm, sMailTile, sContent, "JOIN") 
 
 
 
	FUNCTION FNC_SEND_EMAIL(sFromName, sFromAddr, sToAddr, sUserId, sUserName, sSubject, sContent, sType)
		Const cdoSendUsingMethod = "http://schemas.microsoft.com/cdo/configuration/sendusing" 
		Const cdoSendUsingPort = 2 
		Const cdoSMTPServer = "http://schemas.microsoft.com/cdo/configuration/smtpserver" 
		Const cdoSMTPServerPort = "http://schemas.microsoft.com/cdo/configuration/smtpserverport"
		Const cdoSMTPConnectionTimeout = "http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout" 
		Const cdoSMTPAccountName = "http://schemas.microsoft.com/cdo/configuration/smtpaccountname" 
		Const cdoSMTPAuthenticate =	"http://schemas.microsoft.com/cdo/configuration/smtpauthenticate" 
		Const cdoBasic = 1 
		Const cdoSendUserName = "http://schemas.microsoft.com/cdo/configuration/sendusername" 
		Const cdoSendPassword = "http://schemas.microsoft.com/cdo/configuration/sendpassword" 

		Dim objConfig ' As CDO.Configuration 
		Dim objMessage ' As CDO.Message 
		Dim Fields ' As ADODB.Fields 

		' Get a handle on the config object and it's fields 
		Set objConfig = Server.CreateObject("CDO.Configuration") 
		Set Fields = objConfig.Fields 

		' Set config fields we care about 
		With Fields 
			.Item(cdoSendUsingMethod) = cdoSendUsingPort 
			.Item(cdoSMTPServer) = "mw-002.cafe24.com" 
			.Item(cdoSMTPServerPort) = 25 
			.Item(cdoSMTPAuthenticate) = cdoBasic 
			.Item(cdoSendUserName) = "mothernbaby@mothernbaby.co.kr"
			.Item(cdoSendPassword) = "wellness1414" 
			.Update 
		End With 

		Set objMessage = Server.CreateObject("CDO.Message") 
		Set objMessage.Configuration = objConfig 

	'--------------------------------------------------------------------------
	'	�̸��� ���� ����
		Select Case sType
			Case "ID" : 
				strFileName = "/html/member_id_email.html"
			Case "PWD" : 
				strFileName = "/html/member_pw_email.html"
			Case "JOIN" : 
				strFileName = "/html/member_join_email.html"
			Case "ADMIN_JOIN" : 
				strFileName = "/html/member_admin_join_email.html"
		End Select 

		Set UploadForm	= Server.CreateObject("DEXT.FileUpload") 
		UploadForm.DefaultPath = "/" 
		FileUrl = UploadForm.DefaultPath 
		
		szContent = ShowFolderList(FileUrl & "/member/"& strFileName)

		Select Case sType
			Case "ID" : 
				szContent = Replace(szContent, "!#INAME#!",	  sUserName)
				szContent = Replace(szContent, "!#IUSERID#!", sContent)
			Case "PWD" : 
				szContent = Replace(szContent, "!#INAME#!",	  sUserName)
				szContent = Replace(szContent, "!#IUSERPW#!", sContent)
			Case "JOIN" : 
				szContent = Replace(szContent, "!#INAME#!",	  sUserName)
				szContent = Replace(szContent, "!#IUSERID#!", sUserId)
				szContent = Replace(szContent, "!#IUSERPW#!", sContent)
			Case "ADMIN_JOIN" : 
				szContent = Replace(szContent, "!#INAME#!",	  sUserName)
				szContent = Replace(szContent, "!#IUSERID#!", sUserId)
		End Select
	'--------------------------------------------------------------------------

		With objMessage 
			.To = sToAddr
			.From = sFromAddr
			.Subject = sSubject
			.HTMLBody = szContent
			.Send 
		End With 

		FNC_SEND_EMAIL = "ok"

		Set Fields = Nothing 
		Set UploadForm = Nothing 
		Set objMessage = Nothing 
		Set objConfig = Nothing 
	End Function 
'---------------------------------------------------------------------------------------

'	Call FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", "findaday@naver.com", "findaday", "�̼���", "ȸ�� ���̵� ã�� �����Դϴ�.", "findad**", "ID")

'---------------------------------------------------------------------------------------
'	���� �߼� HTML ȣ�� �Լ�
	Function ShowFolderList(folderspec) 
		Dim fso, fs, strIp
		Set fso = server.CreateObject("Scripting.FileSystemObject") 
		Set fs = fso.OpenTextFile(folderspec) 
		strIp=""
		Do Until fs.atendofstream
			strIp = strIp + fs.readall
		Loop
		fs.Close
		Set fs = Nothing
		Set fso = Nothing
		ShowFolderList = strIp
	End Function
'---------------------------------------------------------------------------------------
 %>


<script>
		location.href="./no_member_list.asp";	
	</script>