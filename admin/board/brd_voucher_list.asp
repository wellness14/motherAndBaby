<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_list.asp
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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
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


	
	
	
	
	

	strTable = " FROM MO_BRD_SERVICE A WITH(NOLOCK) "
	strWhere = " WHERE MS_CNLKBN='N' and ms_jumin1 is not NULL"
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
	strSql = strSql & "			* "
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
		<div class="linemap">마더앤베이비 > 게시판관리 > <strong>정부지원 예약확인</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				검색 : 
				<select name="smode">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option>
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검 색</a>
				<a onClick="location.href='./member_list.asp'" class="button">전체 리스트</a>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="7%" />
			<col width="7%" />
			<col width="7%" />
			<col width="20" />
			<col width="7%" />
			<col width="12%" />
			<col width="32%"/>
			<col width="5%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>작성자(ID)</th>
                <th>생년월일</th>
                <th>가입지역</th>
                <th>집주소</th>
				<th>핸드폰</th>
				<th>작성일</th>
				<th>상담내용</th>
				<th>상담완료여부</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			mem_id		= arrList(1,num)
			mem_nm		= arrList(2,num)
			birth		= arrList(3,num)
			hp			= Trim(arrList(5,num))
			addr1		= arrList(7,num)
			addr2		= arrList(8,num)
			reg_dt		= arrList(22,num)
			'md_local	= arrList(16,num)
            md_local	= arrList(23,num) 
			ms_end      = arrList(24,num)
			ms_content  = arrList(18,num)

			local_nm	= "" 
			
					'-----------------------------------------------------------------------------
		'	지점 정보 호출
			If md_local <> "" Then 
				strSql = "SELECT CC_KOR_NM2 "
				strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
				strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
				Set Rs = DBExec(strSql,"main")
				If Not Rs.EOf Then 
					local_nm = Rs(0)
				End If 
				Call RSClose(Rs)
			End If 
		'-----------------------------------------------------------------------------
%>
			<tr onClick="location.href='./brd_voucher_view.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<td><%=birth%></td>
                <td><%=local_nm%></td>
				<td><%=addr1%>&nbsp;<%=addr2%></td>
                <td><%=hp%></td>
				<td><%=reg_dt%></td>
				<td><%=ms_content%></td>
				<td><%=ms_end%></td>
			</tr>   
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">등록된 정보가 없습니다.</td>
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