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

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&salign=" & salign
	strDftUrl = strDftUrl & "&smethod=" & smethod
'---------------------------------------------------------
 
	strTable = " FROM MO_APP_CALL_SERVICE WITH(NOLOCK) "
 '	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MO_APP_CALL_SERVICE.MD_MEM_ID = MO_MEM_DTL.MD_MEM_ID "
 	strWhere = " WHERE CALL_CNLKBN ='N' "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MD_MEM_ID LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND CALL_NAME LIKE '%"& sword &"%' " 
			Case "3" : strWhere = strWhere & " AND CALL_HP LIKE '%"& sword &"%' "
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
%>
 
  
<%
	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			 CALL_SEQ "
	strSql = strSql & "			,MR_IDX "
	strSql = strSql & "			,MO_APP_CALL_SERVICE.MD_MEM_ID "
	strSql = strSql & "			,CALL_NAME "
	strSql = strSql & "			,CALL_SERVICE_TYPE "
	strSql = strSql & "			,CALL_WANT_DATE "
	strSql = strSql & "			,CALL_WANT_TIME "
	strSql = strSql & "			,CALL_WANT_MINUTE "
	strSql = strSql & "			,CALL_HP "
	strSql = strSql & "			,CALL_CONTENT "
	strSql = strSql & "			,CALL_FINISH_FLG "
	strSql = strSql & "			,CALL_CNLKBN "
	strSql = strSql & "			,CALL_REG_DATE " 
 

	If salign <> "" Then 
		Select Case salign
     		Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CALL_SEQ DESC) ROWNUM "
			Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_APP_CALL_SERVICE.MD_MEM_ID " & smethod & ") ROWNUM "
			Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CALL_NAME " & smethod & ") ROWNUM "
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CALL_HP " & smethod & ") ROWNUM " 
 
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CALL_SEQ DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
				검색 : 
				<select name="smode">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option> 
					<option value="4" <%=fncSetSelectBox("3",smode)%>>핸드폰</option>
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검 색</a>
				<a onClick="location.href='./app_call_service_list.asp'" class="button">전체 리스트</a>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>회원명(ID)</th>
				<th>등록일</th> 
				<th>핸드폰</th>
				<th>내용</th>
				<th>상담여부</th> 
			</tr>
			</thead>
			<tbody>
<%

 

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			seq					= arrList(0,num)
			mr_idx				= arrList(1,num)
			mem_id				= arrList(2,num)
			mem_nm				= arrList(3,num) 
			service_type		= arrList(4,num) 
			want_date			= arrList(5,num) 
			want_time			= arrList(6,num)
			want_minute			= arrList(7,num)
			hp					= arrList(8,num)
			content				= arrList(9,num)
			call_finish_flg		= arrList(10,num)
			call_delete_flg		= arrList(11,num)
			call_reg_date		= arrList(12,num)

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
			<tr onClick="location.href='./app_call_service_ins.asp?seq=<%=seq%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<td><%=Left(call_reg_date,4)%>/<%=mid(call_reg_date,6,2)%>/<%=mid(call_reg_date,9,2)%></td> 
				<td><%=hp%></td>
				<td><%=content%></td>
				<td><% If call_finish_flg = "Y" Then %> 상담완료 <%Else%> 상담대기 <%End If%></td> 
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

	function fnAlign(no) {
		var t = document.getElementById('salign'); 
		t.setAttribute('value',no);
		
		var m = document.getElementById('smethod'); 
		//alert(m.getAttribute('value'));
		if(m.getAttribute('value') ==''){
			m.setAttribute('value','ASC');
		}else{
			if (m.getAttribute('value') =='ASC')
			{
				m.setAttribute('value','DESC');
			}else{
				m.setAttribute('value','ASC');
			}
			
		}
		
		jQuery('#sFom').submit();

	};

</script>
</html>