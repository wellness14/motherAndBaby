<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->

<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
Dim MegaAdminChk : MegaAdminChk = "N"

MegaAdminChk = getAdminAuth()
%>

<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>
<%
	page = Trim(fncrequest("page"))
	If page = "" Then page = 1

	page_list = 10		' 페이지 개수
	page_size = 10		' 게시물 수

	brd_tbl = "dbo.MOMTALK_EVENT"
	brd_nm = "맘톡 이벤트"

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	strTable = " FROM "& brd_tbl &" A WITH(NOLOCK) "

	strWhere = " "

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		intTotalCnt = Rs1(0)
	End If

	

	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			ME_IDX "
	strSql = strSql & "			,ME_TEL "
	strSql = strSql & "			,ME_NAME "
	strSql = strSql & "			,ME_DUE_DATE "
	strSql = strSql & "			,ME_POST "
	strSql = strSql & "			,ME_ADDR1 "
	strSql = strSql & "			,ME_ADDR2 "
	strSql = strSql & "			,ME_GUIDE_WANT "
	strSql = strSql & "			,ME_REGDATE "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY ME_IDX DESC) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs = DBExec(strSql,"main")

	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If

	Call DBClose(Rs) : DBClose(Rs1)
%>
 
 
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 게시판 관리 > <strong><%=brd_nm%></strong></div>
		<div class="write">
			
			<table class="tb_style01" style="margin-top:30px;">
			<colgroup>
			<col width="5%" />
			<col width="15%" />
			<col width="15%" />
			<col width="20%" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>출산예정일</th>
				<th>산우도우미 희망형태</th>
				<th>신청일</th>
			</tr>
			</thead>
			<tbody>

<%
	If IsArray(arrList) Then 
		For num = 0 To UBound(arrList,2)
			me_idx			= arrList(0,num)
			me_tel			= arrList(1,num)
			me_name			= arrList(2,num)
			me_due_date		= arrList(3,num)
			me_post			= arrList(4,num)
			me_addr1		= arrList(5,num)
			me_addr2		= arrList(6,num)
			me_guide_want	= arrList(7,num)
			me_regdate		= Left(arrList(8,num), 10)
%>
			<tr>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=me_name%></td>
				<td><%=me_tel%></td>
				<td>[<%=me_post%>] <%=me_addr1%> <%=me_addr2%></td>
				<td><%=me_due_date%></td>
				<td><%=me_guide_want%></td>
				<td><%=me_regdate%></td>
			  </tr>
			</tr>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="7" style="text-align:center;">등록된 정보가 없습니다.</td>
			</tr>
<%
	End If
%>
			</tbody>
			</table>
			<div id="paging_wrap"></div>
		</div>
	</div>
</body>

<%
	strPathInfo = "momtalk_event.asp"
	strDftUrl = "brd_id=momtalk"
%>

<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>