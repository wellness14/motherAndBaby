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
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
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

	strTable = " FROM MO_HELPER WITH(NOLOCK) "

	strWhere = " WHERE MD_HELPER_SEQ IS NOT NULL "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_HELPER_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MD_HELPER_NAME LIKE '%"& sword &"%' "
			Case "3" : strWhere = strWhere & " AND MD_HELPER_LOCAL LIKE '%"& sword &"%' "
			Case "4" : strWhere = strWhere & " AND MD_HELPER_HP LIKE '%"& sword &"%' "
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
	strSql = strSql & "			MD_HELPER_SEQ "
	strSql = strSql & "			,MD_HELPER_NAME "
	strSql = strSql & "			,MD_HELPER_JUMIN1 "
	strSql = strSql & "			,MD_HELPER_JUMIN2 "
	strSql = strSql & "			,MD_HELPER_PHONE "
	strSql = strSql & "			,MD_HELPER_HP "
	strSql = strSql & "			,MD_HELPER_POST "
	strSql = strSql & "			,MD_HELPER_ADDR1 "
	strSql = strSql & "			,MD_HELPER_ADDR2 "
	strSql = strSql & "			,MD_HELPER_FLG "
	strSql = strSql & "			,MD_HELPER_WORK_FLG "
	strSql = strSql & "			,MD_HELPER_BANK "
	strSql = strSql & "			,MD_HELPER_ACCOUNT "
	strSql = strSql & "			,MD_HELPER_ACCOUNT_NAME "
	strSql = strSql & "			,MD_HELPER_HOPE "
	strSql = strSql & "			,MD_HELPER_NEAR "
	strSql = strSql & "			,MD_HELPER_EDU "
	strSql = strSql & "			,MD_HELPER_DIPLOMA_NO "
	strSql = strSql & "			,MD_HELPER_LICENSE "
	strSql = strSql & "			,MD_HELPER_LICENSE_NO "
	strSql = strSql & "			,MD_HELPER_RELIGION "
	strSql = strSql & "			,MD_HELPER_INSURANCE_FLG "
	strSql = strSql & "			,MD_HELPER_INSURANCE_NO "
	strSql = strSql & "			,MD_HELPER_INSURANCE_START "
	strSql = strSql & "			,MD_HELPER_INSURANCE_END "
	strSql = strSql & "			,MD_HELPER_INSURANCE_NOW_FLG "
	strSql = strSql & "			,MD_HELPER_PICTURE "
    strSql = strSql & "			,MD_HELPER_QUALIFICTION "
	strSql = strSql & "			,MD_HELPER_LOCAL "
	strSql = strSql & "			,MD_HELPER_QnA "



	If salign <> "" Then 
		Select Case salign
     		Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_NAME ASC) ROWNUM "
			Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_NAME " & smethod & ") ROWNUM "
			Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_PHONE " & smethod & ") ROWNUM "
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_LOCAL " & smethod & ") ROWNUM "
			Case "4" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_HP " & smethod & ") ROWNUM "
			Case "5" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_ADDR1 " & smethod & ") ROWNUM "
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_NAME ASC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>산모도우미관리</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
				검색 : 
				<select name="smode">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원명</option>
					<option value="3" <%=fncSetSelectBox("3",smode)%>>가입지역</option>
					<option value="4" <%=fncSetSelectBox("4",smode)%>>폰번호</option>
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검 색</a>
				<a onClick="location.href='./helper_list.asp'" class="button">전체 리스트</a>
				<a onClick="location.href='./helper_ins.asp'" class="button">등록</a>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<col width="13%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			</colgroup>
			<thead>
			<tr>
				<th onClick="fnAlign(0);">번호</th>
				<th onClick="fnAlign(1);">회원명</th>
				<th onClick="fnAlign(2);">가입지역</th>
				<th onClick="fnAlign(3);">핸드폰</th>
				<th onClick="fnAlign(4);">집전화</th>
				<th onClick="fnAlign(5);">집주소</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			hp_seq		= arrList(0,num)
			mem_nm		= arrList(1,num)
			phone		= arrList(4,num)
			hp			= arrList(5,num)
			addr1		= arrList(7,num)
			addr2		= arrList(8,num)
			md_local	= arrList(28,num)

			local_nm	= "" 
		'-----------------------------------------------------------------------------
		'	지점 정보 호출
			If md_local <> "" Then 
				strSql = "SELECT CC_KOR_NM2,  CC_KOR_NM  "
				strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
				strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
				Set Rs = DBExec(strSql,"main")
				If Not Rs.EOf Then 
					local_nm = Rs(0)
					local_nm_Local = Rs(1)
				End If 
				Call RSClose(Rs)
			End If 
		'-----------------------------------------------------------------------------

		If local_nm_Local <> "" Then 
		arr_Local	= Split(local_nm_Local,"-")
		Local_main		= arr_Local(0)
	 
	End If 
%>

<script>

</script>
			<tr onClick="location.href='./helper_ins.asp?hp_seq=<%=hp_seq%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%></td>
				<td><%=Local_main%> / <%=local_nm%></td>
				<td><%=hp%></td>
				<td><%=phone%></td>
				<td><%=addr1%>&nbsp;<%=addr2%></td>
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