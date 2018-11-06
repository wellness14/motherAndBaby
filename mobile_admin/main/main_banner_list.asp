<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 메인 배너 관리
'파 일 명 : main_banner_list.asp
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
<!-- #include file = "./main_banner_inc.asp"-->
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

	strTable = " FROM MO_MAIN_MAS WITH(NOLOCK) "
	strWhere = " WHERE MM_NUM='"& intNum &"' "

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
	strSql = strSql & "			MM_IDX "
	strSql = strSql & "			,MM_NUM "
	strSql = strSql & "			,MM_ORD "
	strSql = strSql & "			,MM_URL "
	strSql = strSql & "			,MM_IMG "
	strSql = strSql & "			,MM_VIEW_FLG "
	strSql = strSql & "			,MM_REG_DT "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ORD ASC, MM_REG_DT DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 메인 관리 > <strong><%=strTitle%></strong></div>
		<form id="sFrm" name="sFrm" method="get" action="?">
		<input type="hidden" name="brd_id" value="<%=brd_id%>">
		<div class="selection">
			<span style="margin-left:20px;">
				<a onClick="location.href='<%=urlIns%>?<%=strLinkUrl%>'" style="cursor:pointer;" class="button">등록</a>
			</span>
		</div>
		</form>

		<div class="write">
			<table class="tb_style01">
			<colgroup>
			<col width="5%" />
			<col />
			<col width="10%" />
			<col width="10%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>노출여부</th>
				<th>보기</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			url			= arrList(3,num)
			image		= arrList(4,num)
			view_flg	= arrList(5,num)
			reg_dt		= Left(arrList(6,num),10)
%>
			<tr>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><a href="<%=urlIns%>?idx=<%=idx%>&<%=strLinkUrl%>"><img src="/upload_file/main/<%=image%>" width='<%=width%>' height='<%=height%>'/></a></td>
				<td><% If view_flg = "Y" Then%>노출<%Else%>비노출<%End If%></td>
				<td><a href="<%=url%>" target="_blank">보기</a></td>
				<td><%=reg_dt%></td>
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