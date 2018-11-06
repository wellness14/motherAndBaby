<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_list.asp
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

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	strTable = " FROM MO_RESERVATION A WITH(NOLOCK) "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "
	strWhere = " WHERE MR_CNLKBN='N' and MR_CANCEL_YN = 'Y' "

	'If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "

	If grpcd <> "" And grpcd <> "1" Then
		'본사 내용만 보이게 예외처리 - 2016.03.17
		If grpcd = "10000" Then
			grpcd = 1
		End If

		strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' AND MR_DEL_YN = 'N' "
	End If

	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MR_MEM_ID='"& sword &"' "
			Case "2" : strWhere = strWhere & "  AND MR_MEM_NM='"& sword &"' "
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
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MR_IDX DESC) ROWNUM "
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>취소 리스트</strong></div>
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				검 색 : 
				<select name="smode" class="box">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>회원명</option>
				</select>
				<input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">검 색</a>

				<a onClick="location.href='./member_reser_list.asp';" style="cursor:pointer;" class="button">전체 리스트</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='./member_reser_ins.asp'" style="cursor:pointer;display:none;" class="button">등록</a>
				</span>
			</div>
			</form>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col width="10%" />
			<col width="20%" />
			<col width="30%" />
			<!--col width="15%" /-->
			<col width="9%" />
			<col width="9%" />
			<col width="9%" />
			<col width="9%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>회원명(ID)</th>
				<th>서비스 유형</th>
				<th>취소 사유</th>
				<!--th>산모도우미</th-->
				<th>서비스 기간</th>
				<th>서비스 연장1</th>
				<th>서비스 연장2</th>
				<th>서비스 연장3</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			mem_id		= arrList(1,num)
			mem_nm		= arrList(2,num)
			service		= arrList(9,num)
			period		= arrList(10,num)
			service_type= arrList(11,num)

			service_sdt	= arrList(13,num)
			service_edt	= arrList(14,num)
			reg_dt		= Left(arrList(20,num),10)

			service_sdt1	= arrList(26,num)
			service_edt1	= arrList(27,num)
			service_sdt2	= arrList(28,num)
			service_edt2	= arrList(29,num)
			service_sdt3	= arrList(30,num)
			service_edt3	= arrList(31,num)


			cancel_reason	= arrList(34,num)

			del_yn = arrList(101,num)

			trBackground = "#ffffff"

			If del_yn = "Y" Then
				trBackground = "#eeeeee"
			End If

%>
 
			<tr onclick="location.href='./member_reser_ins.asp?idx=<%=idx%>'" style="cursor:pointer;background:<%=trBackground%>;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<td><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></td>
				<td><%=cancel_reason%></td>
				<!--td>     </td-->
<%If service_sdt <> "" then %>
				<td><%=Left(service_sdt,4)%>-<%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Left(service_edt,4)%>-<%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%></td>
<%else%>        <td></td>  <% End if%>
<%If service_sdt1 <> "" then %>
				<td><%=Left(service_sdt1,4)%>-<%=Mid(service_sdt1,5,2)%>-<%=Right(service_sdt1,2)%> ~ <%=Left(service_edt1,4)%>-<%=Mid(service_edt1,5,2)%>-<%=Right(service_edt1,2)%></td>
<%else%>        <td></td>  <% End if%>
<%If service_sdt2 <> "" then %>
				<td><%=Left(service_sdt2,4)%>-<%=Mid(service_sdt2,5,2)%>-<%=Right(service_sdt2,2)%> ~ <%=Left(service_edt2,4)%>-<%=Mid(service_edt2,5,2)%>-<%=Right(service_edt2,2)%></td>
<%else%>        <td></td>  <% End if%>
<%If service_sdt3 <> "" then %>
				<td><%=Left(service_sdt3,4)%>-<%=Mid(service_sdt3,5,2)%>-<%=Right(service_sdt3,2)%> ~ <%=Left(service_edt3,4)%>-<%=Mid(service_edt3,5,2)%>-<%=Right(service_edt3,2)%></td>
<%else%>        <td></td>  <% End if%>
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