<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리
'파 일 명 : brd_list.asp
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
<!-- #include file = "./mobile_brd_inc.asp" -->
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
	startNum = (page-1) * page_size
	endNum = startNum + page_size

	strTable = " FROM "& brd_tbl &" A WITH(NOLOCK) "
	If brd_id = "notice" And grpcd <> "1" Then 
	strTable = strTable & " INNER JOIN MO_USER_LIST WITH(NOLOCK) ON UL_MEM_ID = BA_MEM_ID "	
	End If 

	strWhere = " WHERE BA_CNLKBN='N' AND BA_DPH='1' "
	If brd_id = "notice" And grpcd <> "1" Then 
	strWhere = strWhere & " AND UL_GRP_CD='"& grpcd &"' "
	ElseIf (brd_id="consult" Or brd_id="PRAISE") And grpcd <> "1" Then 
	strWhere = strWhere & " AND BA_LOCAL='"& grpcd &"' "
	End If 

	If sword <> "" Then 
		Select Case smode 
			Case "1" : strWhere = strWhere & " AND BA_TITLE LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND BA_CONTENT LIKE '%"& sword &"%' "
			Case "3" : strWhere = strWhere & " AND ( BA_TITLE LIKE '%"& sword &"%' OR BA_CONTENT LIKE '%"& sword &"%' ) "
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
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_SEQ "
	strSql = strSql & "			,BA_DPH "
	strSql = strSql & "			,BA_PIDX "
	strSql = strSql & "			,BA_MEM_ID "
	strSql = strSql & "			,BA_MEM_NM "
	strSql = strSql & "			,BA_TITLE "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT "
	strSql = strSql & "			,BA_CNT "
	strSql = strSql & "			,BA_FILE_NM "
	If brd_type = "1" Or brd_type ="5" Then 
	strSql = strSql & "			,BA_TYPE "
	End If 
	If brd_type = "2" Then 
	strSql = strSql & "			,RE_CNT = (SELECT COUNT(1) FROM MO_BRD_CONSULT B WHERE B.BA_PIDX=A.BA_IDX AND B.BA_DPH='2') "
	strSql = strSql & "			,BA_LOCAL "
	End If 
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
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
			<!--#include file ="./mobile_brd_top.asp"-->
			
			<table class="tb_style01">
			<colgroup>
			<col width="2%" />
			<col width="5%" />
			<% If brd_type="1" Or brd_type="5" Then%><col width="5%" /><%End If%>
			<col width="5%"/>
			<% If brd_sec<>"N" Then%><col width="10%" /><%End If%>
			<% If brd_type="2" Then%><col width="10%" /><%End If%>
			<!--col width="10%" /-->
			<!--col width="15%" /-->
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>작성자(ID)</th>
				<% If brd_type="2" Then%><th>지역</th><%End If%>
				<% If brd_type="1" Or brd_type="5" Then%><th>분류</th><%End If%>
				<th>제목</th>
				<% If brd_sec<>"N" Then%><th>상태</th><%End If%>
				<% If brd_type="2" Then%><th>현황</th><%End If%>
				<!--th>조회수</th-->
				<!--th>작성일</th-->
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			md_local = "" : local_nm	= "" 

			ba_idx		= arrList(0,num)
			ba_dph		= arrList(2,num)
			mem_id		= arrList(4,num)
			mem_nm		= arrList(5,num)
			title		= Trim(arrList(6,num))
			sec_flg		= arrList(7,num)
			reg_dt		= arrList(8,num)
			intCnt		= arrList(9,num)
			If brd_type = "2" Then 
			re_cnt		= arrList(11,num)
			md_local	= arrList(12,num)
			End If 
			If brd_type = "1" Or brd_type = "5" Then 
			ba_type		= arrList(11,num)
			End If 

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

			Select Case sec_flg
				Case "A","Y" : sec_nm="비밀글"
				Case "N" : sec_nm="일반글"
			End Select 

			If re_cnt > 0 Then 
				re_nm = "답변완료"
			Else 
				re_nm = "답변대기"
			End If 
%>
			<tr>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br>(<%=mem_id%>)</td>
				<% If brd_type="2" Then%><td><%=local_nm%></td><%End If%>
				<% If brd_type="1" Or brd_type="5" Then%><td><%=ba_type%></td><%End If%>
				<td>
				<%
				Dim strTest, intLength, strLeft

				strTest = title
				intLength = LEN (strTest)


				If  intLength >18 Then
				
				strLeft = LEFT (strTest, 18)
				%>

				<a href="<%=urlView%>?idx=<%=ba_idx%>&<%=strLnkUrl%>"><%=strLeft%>...</a> 
				<%else%>		

				 <a href="<%=urlView%>?idx=<%=ba_idx%>&<%=strLnkUrl%>"><%=title%></a>

				<%End if%>
				</td>	
				<% If brd_sec<>"N" Then%><td><%=sec_nm%></td><%End If%>
				<% If brd_type="2" Then%><td><%=re_nm%></td><%End If%>
				<!--td><%=intCnt%></td-->
				<!--td><%=reg_dt%></td-->
			  </tr>
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
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>