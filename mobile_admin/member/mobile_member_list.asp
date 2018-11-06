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

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&salign=" & salign
	strDftUrl = strDftUrl & "&smethod=" & smethod
'---------------------------------------------------------

	strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
	strWhere = " WHERE MM_DEL_DT IS NULL "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MM_MEM_ID LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND MM_MEM_NM LIKE '%"& sword &"%' "
			Case "3" : strWhere = strWhere & " AND MD_PHONE LIKE '%"& sword &"%' "
			Case "4" : strWhere = strWhere & " AND MD_HP LIKE '%"& sword &"%' "
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
	strSql = strSql & "			MM_MEM_ID "
	strSql = strSql & "			,MM_MEM_NM "
	strSql = strSql & "			,MM_ENT_DT "
	strSql = strSql & "			,MD_PHONE "
	strSql = strSql & "			,MD_HP "
	strSql = strSql & "			,MD_SEX "
	strSql = strSql & "			,MD_BIRTH "
	strSql = strSql & "			,MD_POST "
	strSql = strSql & "			,MD_ADDR1 "
	strSql = strSql & "			,MD_ADDR2 "
	strSql = strSql & "			,MD_EMAIL "
	strSql = strSql & "			,MD_SNS_FLG "
	strSql = strSql & "			,MD_EMAIL_FLG "
	strSql = strSql & "			,MD_CHILDBIRTH "
	strSql = strSql & "			,MD_CHILD_FLG "
	strSql = strSql & "			,MD_TYPE "
	strSql = strSql & "			,MD_LOCAL "

	If salign <> "" Then 
		Select Case salign
     		Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT DESC) ROWNUM "
			Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_MEM_NM " & smethod & ") ROWNUM "
			Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT " & smethod & ") ROWNUM "
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_LOCAL " & smethod & ") ROWNUM "
			Case "4" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_PHONE " & smethod & ") ROWNUM "
			Case "5" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HP " & smethod & ") ROWNUM "
			Case "6" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_ADDR1 " & smethod & ") ROWNUM "
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong> <a onClick="location.href='../logout.asp'" class="button" style="float:right;color:#fff;">로그아웃</a></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
				검색:
				<select name="smode">
					<option value="">조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option>
					<option value="3" <%=fncSetSelectBox("3",smode)%>>전화번호</option>
					<option value="4" <%=fncSetSelectBox("4",smode)%>>핸드폰</option>
				</select>
				<input type="text" name="sword" size="10" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검색</a>
				<a onClick="location.href='./mobile_member_list.asp'" class="button">전체리스트</a>
 <!--
				<a onClick="location.href='./mobile_service_list.asp'" class="button">상담신청</a>
				<a onClick="location.href='./mobile_member_service.asp'" class="button">나의 맞춤 서비스</a>
				<a onClick="location.href='./mobile_member_reser_list.asp'" class="button">대기리스트</a>
				<a onClick="location.href='./mobile_member_reser_pay_y_list.asp'" class="button">입금확인 리스트</a>
				<a onClick="location.href='./mobile_member_reser_service_ing_list.asp'" class="button">진행중 리스트</a>
				<a onClick="location.href='./mobile_member_reser_service_end_list.asp'" class="button">진행종료 리스트</a>
				<a onClick="location.href='./mobile_member_reser_cancel_list.asp'" class="button">취소 리스트</a>

				<a onClick="location.href='/mobile_admin/board/mobile_brd_list.asp?brd_id=consult'" class="button">1:1 상담문의</a>
				<a onClick="location.href='/mobile_admin/board/mobile_brd_list.asp?brd_id=PRAISE'" class="button">칭찬하기</a>
				<a onClick="location.href='/mobile_admin/logout.asp'" class="button">로그아웃</a>
 -->
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<col  />
		 
			<!--col width="10%" /-->
			<col width="20%" />
			<!--col width="10%" /-->
			</colgroup>
			<thead>
			<tr>
				<th onClick="fnAlign(0);">번호</th>
				<th onClick="fnAlign(1);">회원명(ID)</th>
				<!--th onClick="fnAlign(2);">가입일</th-->
				<th onClick="fnAlign(3);">가입지역</th>
				<!--th onClick="fnAlign(4);">집전화</th-->
				<th onClick="fnAlign(5);">핸드폰</th>
				<!--th onClick="fnAlign(6);">집주소</th-->
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			mem_id		= arrList(0,num)
			mem_nm		= arrList(1,num)
			ent_dt		= arrList(2,num)
			phone		= arrList(3,num)
			hp			= arrList(4,num)
			addr1		= arrList(8,num)
			addr2		= arrList(9,num)
			md_local	= arrList(16,num)

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
			<tr onClick="location.href='./mobile_member_ins.asp?mem_id=<%=mem_id%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<!--td><%=ent_dt%></td-->
				<td><%=local_nm%></td>
				<!--td><%=phone%></td-->
				<td><%=hp%></td>
				<!--td><%=addr1%>&nbsp;<%=addr2%></td-->
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