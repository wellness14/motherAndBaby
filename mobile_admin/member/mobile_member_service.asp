<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 나의 맞춤 서비스
'파 일 명 : member_service.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
	<link rel="stylesheet" type="text/css" href="/mobile_admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/mobile_admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:360px;}
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
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
'---------------------------------------------------------

	strTable = " FROM MO_SERVICE WITH(NOLOCK) "
	strTable = strTable & " INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
	strTable = strTable & " INNER JOIN MO_MEM_MAS WITH(NOLOCK) ON MS_MEM_ID = MM_MEM_ID "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MS_MEM_ID = MD_MEM_ID "
	strWhere = " WHERE MS_CNLKBN='N' "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MS_MEM_ID LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND MS_MEM_NM LIKE '%"& sword &"%' "
		End Select 
	End If 

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
	strSql = strSql & "			MS_IDX, MS_MEM_ID, MS_MEM_NM, MD_HP, MD_ADDR1, MD_ADDR2, MO_SERVICE, MS_TOTAL, MS_REG_DT "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MS_IDX DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>나의 맞춤 서비스</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				검색:
				<select name="smode">
					<option value="">조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option>
				</select>
				<input type="text" name="sword" size="10" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검색</a>
				<a onclick="location.href='./mobile_member_service.asp'" class="button">전체리스트</a>
				</form>
			</div>

			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<!--col width="10%" /-->
			<!--col width="20%" /-->
			<col />
			<col width="10%" />
			<!--col width="10%" /-->
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>작성자(ID)</th>
				<!--th>핸드폰</th-->
				<!--th>주소</th-->
				<th>추천서비스 및 기간</th>
				<th>예상금액</th>
				<!--th>작성일</th-->
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx		= arrList(0,num)
			mem_id	= arrList(1,num)
			mem_nm	= arrList(2,num)
			hp		= arrList(3,num)
			addr1	= arrList(4,num)
			addr2	= arrList(5,num)
			
			service	= Replace(Trim(arrList(6,num)),"||",", ")
			total	= FormatNumber(arrList(7,num),0)
			reg_dt	= Replace(Left(arrList(8,num),10),"-",".")
%>
			<tr onclick="location.href='./mobile_member_service_view.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br>(<%=mem_id%>)</td>
				<!--td><%=hp%></td-->
				<!--td><%=addr1%>&nbsp;<%=addr2%></td-->
				<td><%=service%></td>
				<td><%=total%></td>
				<!--td><%=reg_dt%></td-->
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
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>