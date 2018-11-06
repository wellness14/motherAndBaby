<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
'-------------------------------------------------------------------------------
'	사용자 정보
	uId		= LCASE(trim(Request.Cookies("userid")))
	uNm		= LCASE(trim(Request.Cookies("username")))
	user_ip	= fncRequestVariables("REMOTE_ADDR")
'-------------------------------------------------------------------------------

	urlList = "/admin/main/local_list.asp"
	urlIns = "/admin/main/local_ins.asp"
	urlSql = "/admin/main/local_sql.asp"

	Dim MegaAdminChk : MegaAdminChk = "N"
	Dim intTotalCnt : intTotalCnt = 0
	
	MegaAdminChk = getAdminAuth()

	Dim page_size : page_size = 10 

	page = fncRequest("page")
	If page = "" Then page = 1

	intNum = fncRequest("num")
	If intNum = "" Then intNum = 1

	strTitle = "지역" 
		
	strDftUrl = "num=" & intNum
	strLinkUrl = strDftUrl & "&page=" & page
%>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>