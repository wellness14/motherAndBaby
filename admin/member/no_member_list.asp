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

	strTable = " FROM MO_MEM_NO_JOIN WITH(NOLOCK) "
'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
	strWhere = " WHERE MD_MEM_SEQ IS not NULL "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
		'	Case "1" : strWhere = strWhere & " AND MM_MEM_ID LIKE '%"& sword &"%' "
		'	Case "2" : strWhere = strWhere & " AND MM_MEM_NM LIKE '%"& sword &"%' "
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
'	strSql = strSql & "			MM_MEM_ID "
'	strSql = strSql & "			,MM_MEM_NM "
'	strSql = strSql & "			,MM_ENT_DT "
	strSql = strSql & "			MD_MEM_SEQ "
	strSql = strSql & "			,MD_MEM_NAME "
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
     	'	Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT DESC) ROWNUM "
		'	Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_MEM_NM " & smethod & ") ROWNUM "
		'	Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT " & smethod & ") ROWNUM "
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_LOCAL " & smethod & ") ROWNUM "
			Case "4" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_PHONE " & smethod & ") ROWNUM "
			Case "5" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HP " & smethod & ") ROWNUM "
			Case "6" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_ADDR1 " & smethod & ") ROWNUM "
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_MEM_SEQ DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>비회원관리</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
				검색 : 
				<select name="smode">
					<!--option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option-->
					<option value="3" <%=fncSetSelectBox("3",smode)%>>전화번호</option>
					<option value="4" <%=fncSetSelectBox("4",smode)%>>핸드폰</option>
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검 색</a>
				<a onClick="location.href='./no_member_list.asp'" class="button">전체 리스트</a>
				<span style="margin-left:40px;">
					<a onClick="location.href='./no_member_ins.asp'" style="cursor:pointer;" class="button">등록</a>
				</span>
				

				
				<span style="margin-left:100px;">
					<input type="button" style="cursor:pointer;" class="button" value="메일발송" onClick="email_send();"> 
				</span>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="3%%" />
			<col width="10%" />
			<col width="13%" />
			<col width="15%" />
			<col width="15%" />
			<col   />
			</colgroup>
			<thead>
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>회원명</th>
				<!--th onClick="fnAlign(2);">가입일</th-->
				<th>가입지역</th>
				<th>집전화</th>
				<th>핸드폰</th>
				<th>집주소</th>
			</tr>
			</thead>
			<tbody>
			<form id="check_form" name="check_form" method="post" action="?">
			
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			mem_seq		= arrList(0,num)
			mem_nm		= arrList(1,num)
			phone		= arrList(2,num)
			hp			= arrList(3,num)
			addr1		= arrList(7,num)
			addr2		= arrList(8,num)
			email		= arrList(9,num)
			md_local	= arrList(15,num)

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
			
			<tr>
				<td><input type="checkbox" name="check_seq" id="check_seq" value="<%=mem_seq%>"/>
				<input type="hidden" name="email" id="email" value="<%=email%>"/>
				<input type="hidden" name="mem_nm" id="mem_nm" value="<%=mem_nm%>"/></td>
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td  onClick="location.href='./no_member_ins.asp?mem_seq=<%=mem_seq%>'" style="cursor:pointer;"><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<!--td><%=ent_dt%></td-->
				<td  onClick="location.href='./no_member_ins.asp?mem_seq=<%=mem_seq%>'" style="cursor:pointer;"><%=local_nm%></td>
				<td  onClick="location.href='./no_member_ins.asp?mem_seq=<%=mem_seq%>'" style="cursor:pointer;"><%=phone%></td>
				<td  onClick="location.href='./no_member_ins.asp?mem_seq=<%=mem_seq%>'" style="cursor:pointer;"><%=hp%></td>
				<td  onClick="location.href='./no_member_ins.asp?mem_seq=<%=mem_seq%>'" style="cursor:pointer;"><%=addr1%>&nbsp;<%=addr2%></td>
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
			</form>
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

	function email_send() {
		 if(confirm("메일을 보내시겠습니까?")) {
		//	location.href="이동할 페이지";

		var form = document.check_form;
		var check_seq = form.check_seq.value;
		alert(form.check_seq.checked);
		if(check_seq == ""){
			alert("선택된 메일이 없습니다.");
			return false;
		}

		form.action = "member_email_choice_send.asp";
		form.target = "_self";
		form.submit();

	//	return true;    
   }

}

</script>
</html>