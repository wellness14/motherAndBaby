<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 지역 관리
'파 일 명 : local_list.asp
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
<!-- #include file = "./local_inc.asp"-->
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

	strTable = " FROM MO_COMM_CD WITH(NOLOCK) "
	strWhere = " WHERE CC_COMM_KIND = '88' "

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
	strSql = strSql & "			CC_COMM_CD"
	strSql = strSql & "			,CC_KOR_NM"
	strSql = strSql & "			,CC_USE_YN"
	strSql = strSql & "			,CC_REG_DT"
	strSql = strSql & "			,CC_KOR_NM2 "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CC_REG_DT Asc) ROWNUM "
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
			<col width="25%"/>
			<col width="25%" />
			<col width="25%" />
			<col width="20%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>도시</th>
				<th>지역</th>
				<th>사용여부</th>
				<th>작성일</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			cc_cd		= arrList(0,num)
			kor_nm		= arrList(1,num)
			use_yn		= arrList(2,num)
			kor_nm2		= arrList(4,num)
			reg_dt		= Left(arrList(3,num),10)

			arrLocal	= Split(kor_nm,"-")
%>
			<tr>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><a href="<%=urlIns%>?idx=<%=cc_cd%>&<%=strLinkUrl%>"><%=arrLocal(0)%></a></td>
				<td><a href="<%=urlIns%>?idx=<%=cc_cd%>&<%=strLinkUrl%>"><%=arrLocal(1)%></a></td>
				<td><% If use_yn = "Y" Then%>사용<%Else%>미사용<%End If%></td>
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