<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리 - 게시판 생성
'파 일 명 : brd_make_list.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include file = "./brd_make_inc.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
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
	startNum = (page-1) * page_size
	endNum = startNum + page_size

	strTable = " FROM MO_BRD_MAS WITH(NOLOCK) "
	strWhere = "WHERE BM_CNLKBN='N' "
	If intUse <> "" Then strWhere = strWhere & " AND BM_USE_FLG='"& intUse &"' "
	If sword <> "" Then strWhere = strWhere & " AND BM_BRD_NM LIKE '%"& sword &"%' "
	

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	strSql = ""
	strSql = strSql & " SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BM_IDX "
	strSql = strSql & "			,BM_BRD_TYPE "
	strSql = strSql & "			,BM_BRD_ID "
	strSql = strSql & "			,BM_BRD_NM "
	strSql = strSql & "			,BM_SEC_FLG "
	strSql = strSql & "			,BM_FILE_CNT "
	strSql = strSql & "			,BM_USE_FLG "
	strSql = strSql & "			,BM_SERVICE_URL "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BM_IDX DESC) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	Call RSClose(Rs)
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 게시판 관리 > <strong>게시판 생성</strong></div>
		<div class="write">		
			<form id="sfrm" name="sfrm" method="get" action="?">
			<div class="selection">
				사용여부 :
				<select name="intUse" onchange="jQuery('#sfrm').submit();" style="width:90px">
					<option value="">사용여부</option>
					<option value="Y" <%=fncSetSelectBox(intUse,"Y")%>>사용</option>
					<option value="N" <%=fncSetSelectBox(intUse,"N")%>>사용안함</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type="text" id="sword" name="sword" size="20" maxlength="40" value="<%=sword%>" />
				<span style="margin-left:20px;">
					<a onClick="jQuery('#sfrm').submit();" style="cursor:pointer;" class="button">검 색</a>
					<a onClick="location.href='<%=urlList%>';" style="cursor:pointer;" class="button">전체 리스트</a>
					<a onClick="location.href='<%=urlIns%>?<%=strLnkUrl%>'" style="cursor:pointer;" class="button">게시판 생성</a>
				</span>
			</div>
			</form>

			<table class="tb_style01">
			<colgroup>
			<col width="5%" />
			<col width="15%" />
			<col width="10%" />
			<col />
			<col width="10%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>타입</th>
				<th>게시판ID</th>
				<th>게시판명</th>
				<th>사용여부</th>
				<th>서비스페이지</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)
			idx			= arrList(0,num)
			brd_type	= Trim(arrList(1,num))
			brd_id		= Trim(arrList(2,num))
			brd_nm		= Trim(arrList(3,num))
			sec_flg		= arrList(4,num)
			file_cnt	= arrList(5,num)
			use_flg		= arrList(6,num)
			service_url	= Trim(arrList(7,num))

			type_nm = fncSetBrdNm(brd_type)
			use_nm = fncSetUseNm(use_flg)
%>
			<tr>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=type_nm%></td>
				<td><%=brd_id%></td>
				<td><a href="<%=urlIns%>?idx=<%=idx%>&<%=strLnkUrl%>"><%=brd_nm%></a></td>
				<td><%=use_nm%></td>
				<td><%If Trim(service_url) <> "" Then%><a href="<%=service_url%>" target="_blank">바로가기</a><%End If%></td>	
			  </tr>
			</tr>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10">등록된 정보가 없습니다.</td>
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
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>