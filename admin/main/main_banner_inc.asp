<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
'-------------------------------------------------------------------------------
'	����� ����
	uId		= LCASE(trim(Request.Cookies("userid")))
	uNm		= LCASE(trim(Request.Cookies("username")))
	user_ip	= fncRequestVariables("REMOTE_ADDR")
'-------------------------------------------------------------------------------

	urlList = "/admin/main/main_banner_list.asp"
	urlIns = "/admin/main/main_banner_ins.asp"
	urlSql = "/admin/main/main_banner_sql.asp"

	Dim MegaAdminChk : MegaAdminChk = "N"
	Dim intTotalCnt : intTotalCnt = 0
	
	MegaAdminChk = getAdminAuth()

	Dim page_size : page_size = 10 

	page = fncRequest("page")
	If page = "" Then page = 1

	intNum = fncRequest("num")
	If intNum = "" Then intNum = 1

	Select Case intNum
		Case "1" : strTitle = "�����̽� ����" : width="434" : height = "176"
		Case "2" : strTitle = "���� ��� 01" : width="316" : height = "142"
		Case "3" : strTitle = "���� ��� 02" : width="156" : height = "142"
		Case "4" : strTitle = "���� ��� 03" : width="157" : height = "144"
		Case "5" : strTitle = "���� ��� 04" : width="157" : height = "144"
		Case "6" : strTitle = "���� ��� 05" : width="261" : height = "125"
		Case "7" : strTitle = "���� ��� 06" : width="261" : height = "116"
		Case "8" : strTitle = "�̺�Ʈ ���" : width="157" : height = "144"
	End Select 

	strDftUrl = "num=" & intNum
	strLinkUrl = strDftUrl & "&page=" & page
%>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>