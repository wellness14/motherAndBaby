<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 콜상담관리
'파 일 명 : service_call_list.asp
'작성일자 : 2015/06/22
'작 성 자 : 홍성주
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
<script>
//alert("<%=uId%>");    아이디
//alert("<%=grpcd%>"); 그룹번호
</script>
<%
'---------------------------------------------------------
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&salign=" & salign
	strDftUrl = strDftUrl & "&smethod=" & smethod
'---------------------------------------------------------

	strTable = " FROM  MO_SERVICE_CALL  WITH(NOLOCK) "
	strWhere = " WHERE MO_CALL_SEQ IS NOT NULL "
 
	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MO_CALL_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MO_CALL_NM LIKE '%"& sword &"%' "
			Case "3" : strWhere = strWhere & " AND MO_CALL_LOCAL LIKE '%"& sword &"%' "
			Case "4" : strWhere = strWhere & " AND MO_CALL_HP LIKE '%"& sword &"%' "
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
	strSql = strSql & "			MO_CALL_SEQ "
	strSql = strSql & "			,MO_CALL_KNOW "
	strSql = strSql & "			,MO_CALL_NM "
	strSql = strSql & "			,MO_CALL_PHONE "
	strSql = strSql & "			,MO_CALL_HP "
	strSql = strSql & "			,MO_CALL_POST "
	strSql = strSql & "			,MO_CALL_ADDR1 "
	strSql = strSql & "			,MO_CALL_ADDR2 "
	strSql = strSql & "			,MO_CALL_CHILDBIRTH "
	strSql = strSql & "			,MO_CALL_SERVICESDT "
	strSql = strSql & "			,MO_CALL_EXP "
	strSql = strSql & "			,MO_CALL_EXP_PEOPLE "
	strSql = strSql & "			,MO_CALL_EXP_PEOPLE_AGE "
	strSql = strSql & "			,MO_CALL_EXP_TYPE "
	strSql = strSql & "			,MO_CALL_CLINIC "
	strSql = strSql & "			,MO_CALL_CLINIC_WEEK "
	strSql = strSql & "			,MO_CALL_SERVICE "
	strSql = strSql & "			,MO_CALL_SERVICE_WANT_TYPE "
	strSql = strSql & "			,MO_CALL_SERVICE_WANT_TYPE_WEEK_1 "
	strSql = strSql & "			,MO_CALL_SERVICE_WANT_TYPE_WEEL_2 "
	strSql = strSql & "			,MO_CALL_SERVICE_WANT_WEEK "
	strSql = strSql & "			,MO_CALL_ADD_FAM_1 "
	strSql = strSql & "			,MO_CALL_ADD_FAM_1_PeoPle "
	strSql = strSql & "			,MO_CALL_ADD_FAM_2 "
	strSql = strSql & "			,MO_CALL_ADD_FAM_2_PeoPle "
	strSql = strSql & "			,MO_CALL_ADD_FAM_3 "
	strSql = strSql & "			,MO_CALL_ADD_FAM_3_PeoPle "
    strSql = strSql & "			,MO_CALL_ADD_FAM_4 "
	strSql = strSql & "			,MO_CALL_ADD_FAM_4_PeoPle "
	strSql = strSql & "			,MO_CALL_ADD_FAM_5 "
	strSql = strSql & "			,MO_CALL_ADD_FAM_5_PeoPle "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_1 "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_2 "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_3 "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_4 "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_5 "
	strSql = strSql & "			,MO_CALL_WANT_WORKER_6 "
	strSql = strSql & "			,MO_CALL_PRODUCT_CHOICE_1 "
	strSql = strSql & "			,MO_CALL_PRODUCT_CHOICE_2 "
	strSql = strSql & "			,MO_CALL_PRODUCT_CHOICE_WEEK "
	strSql = strSql & "			,MO_CALL_PRODUCT_CHOICE_PRICE "
	strSql = strSql & "			,MO_CALL_PRODUCT_OUT_DAY "
	strSql = strSql & "			,MO_CALL_MASSAGE_BEFORE "
	strSql = strSql & "			,MO_CALL_MASSAGE_AFTER "
	strSql = strSql & "			,MO_CALL_MASSAGE_ADD "
	strSql = strSql & "			,MO_CALL_VISIT_NURSE_BEFORE "
	strSql = strSql & "			,MO_CALL_VISIT_NURSE_AFTER "
	strSql = strSql & "			,MO_CALL_SODOK_SERVICE "
	strSql = strSql & "			,MO_CALL_GIFT_CHOICE "
	strSql = strSql & "			,MO_CALL_GIFT_CHOICE_SEND "
	strSql = strSql & "			,MO_CALL_GIFT_CHOICE_BABY "
	strSql = strSql & "			,MO_CALL_GIFT_BOX_SEND "
	strSql = strSql & "			,MO_CALL_CONTENT "
	strSql = strSql & "			,MO_CALL_LOCAL "
	strSql = strSql & "			,MO_CALL_IN_OUT_TIME "
	strSql = strSql & "			,MO_CALL_HOLIDAY_PAY "
	strSql = strSql & "			,MO_CALL_BREAK_TIME "
	strSql = strSql & "			,MO_CALL_JOIN_HOMEPAGE "

	If salign <> "" Then 
		Select Case salign
     		Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_NM ASC) ROWNUM "
			Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_NM " & smethod & ") ROWNUM "
			Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_PHONE " & smethod & ") ROWNUM "
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_LOCAL " & smethod & ") ROWNUM "
			Case "4" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_HP " & smethod & ") ROWNUM "
			Case "5" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_ADDR1 " & smethod & ") ROWNUM "
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CALL_SEQ desc) ROWNUM "
	End If 
	
	strSql = strSql & strTable
	strSql = strSql & strWhere
	
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	'Response.write strSql

	Call DBClose(Rs) : DBClose(Rs1)
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>전화상담관리</strong></div>
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
				<a onClick="location.href='./service_call_list.asp'" class="button">전체 리스트</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='./service_call_ins.asp'" style="cursor:pointer;" class="button">등록</a>
				</span>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<col width="15%" />
			 
			<col width="8%" />
			<col   />
			<col width="10%" />
 

			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
                <th>알게된경로</th>
                 
                <th>서비스예정일</th>
				<th>서비스</th>
				<th>전화번호</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx				= arrList(0,num)
			reason			= arrList(1,num)
			mem_nm			= arrList(2,num)
			service_day		= arrList(9,num)
			service_content	= arrList(16,num)

			hp			= Trim(arrList(4,num))
 
 
            md_local	= arrList(53,num) 
 

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
			<tr onClick="location.href='./service_call_ins.asp?idx=<%=idx%>&local=<%=grpcd%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%></td>
				<td><%=reason%></td>
				 
				<td><%=Left(service_day,4)%>-<%=Mid(service_day,5,2)%>-<%=Right(service_day,2)%></td>
				<td><%=service_content%></td>
                <td><%=hp%></td>
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