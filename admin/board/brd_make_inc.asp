<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
'-------------------------------------------------------------------------------
'	����� ����
	uId = LCASE(trim(Request.Cookies("userid")))
	uNm = LCASE(trim(Request.Cookies("username")))
'-------------------------------------------------------------------------------

	urlList = "/admin/board/brd_make_list.asp"
	urlIns = "/admin/board/brd_make_ins.asp"
	urlSql = "/admin/board/bar_make_sql.asp"

	page_size = 20		' �Խù� ��
	
	intUse		= fncRequest("intUse")
	sword		= fncRequest("sword")

	page = trim(fncrequest("page"))
	If page = "" Then page = 1

	'������ Default Query String
	strDftUrl	= "intUse=" & intUse
	strDftUrl	= strDftUrl & "&sword=" & sword

	'������ ���� ���� Query String
	strLnkUrl = strDftUrl & "&page=" & page
%>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>