<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
'-------------------------------------------------------------------------------
'	사용자 정보
	uId		= LCASE(trim(Request.Cookies("userid")))
	uNm		= LCASE(trim(Request.Cookies("username")))
	uLv		= LCASE(trim(Request.Cookies("userlevel")))
	user_ip	= fncRequestVariables("REMOTE_ADDR")
'-------------------------------------------------------------------------------

	urlList = "/admin/board/brd_list.asp"
	urlView = "/admin/board/brd_view.asp"
	urlIns = "/admin/board/brd_ins.asp"
	urlReply = "/admin/board/brd_reply.asp"
	urlSql = "/admin/board/brd_sql.asp"

	Dim MegaAdminChk : MegaAdminChk = "N"
	Dim intTotalCnt : intTotalCnt = 0
	Dim brd_type : brd_type = ""

	MegaAdminChk = getAdminAuth()

	page_list = 10		' 페이지 개수
	page_size = 10		' 게시물 수

	brd_id		= fncRequest("brd_id")			' 게시판ID
	brd_nm		= fncRequest("brd_nm")			' 게시판명
	brd_type	= fncRequest("brd_type")		' 게시판 타입
	brd_sec		= fncRequest("brd_sec")			' 비밀글 설정
	file_cnt	= fncRequest("file_cnt")		' 첨부파일 갯수
	service_url = fncRequest("service_url")		' 서비스URL
	smode		= fncrequest("smode")	
	sword		= fncrequest("sword")	

	page = trim(fncrequest("page"))
	If page = "" Then page = 1

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 기본 셋팅 정보 추출
	If brd_nm = "" Or brd_type = "" Then 
		strSql = "SELECT "
		strSql = strSql & "		BM_BRD_TYPE "
		strSql = strSql & "		,BM_BRD_ID "
		strSql = strSql & "		,BM_BRD_NM "
		strSql = strSql & "		,BM_SEC_FLG "
		strSql = strSql & "		,BM_FILE_CNT "
		strSql = strSql & "		,BM_SERVICE_URL "
		strSql = strSql & "	FROM MO_BRD_MAS WITN(NOLOCK) "
		strSql = strSql & "	WHERE BM_BRD_ID='"& brd_id &"' AND BM_CNLKBN='N' AND BM_USE_FLG='Y' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			brd_type	= Rs("BM_BRD_TYPE")
			brd_nm		= Rs("BM_BRD_NM")
			brd_sec		= Rs("BM_SEC_FLG")
			file_cnt	= Rs("BM_FILE_CNT")
			service_url = Rs("BM_SERVICE_URL")
		Else 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');</script>"
			response.End 
		End If 
		Call DBClose(RS)
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 생성여부 확인
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

	'페이지 Default Query String
	strDftUrl	= "brd_id=" & brd_id
	strDftUrl	= strDftUrl & "&brd_type=" & brd_type
	strDftUrl	= strDftUrl & "&brd_nm=" & brd_nm
	strDftUrl	= strDftUrl & "&brd_sec=" & brd_sec
	strDftUrl	= strDftUrl & "&file_cnt=" & file_cnt
	strDftUrl	= strDftUrl & "&smode=" & smode
	strDftUrl	= strDftUrl & "&sword=" & sword

	'페이지 값을 더한 Query String
	strLnkUrl = strDftUrl & "&page=" & page
%>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>