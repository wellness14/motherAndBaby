<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_view.asp
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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
	page = fncRequest("page")
	kind = fncRequest("kind")
	smode	= fncRequest("smode")
	sword	= fncRequest("sword")
	route = fncRequest("route")
	consult_end = fncRequest("consult_end")
	contract_end = fncRequest("contract_end")
	date1 = fncRequest("date1")
	date2 = fncRequest("date2")
	
	strDftUrl = "kind=" & kind
	strDftUrl = strDftUrl & "&smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&route=" & route
	strDftUrl = strDftUrl & "&consult_end=" & consult_end
	strDftUrl = strDftUrl & "&contract_end=" & contract_end
	strDftUrl = strDftUrl & "&date1=" & date1
	strDftUrl = strDftUrl & "&date2=" & date2
	strDftUrl = strDftUrl & "&page=" & page

	strLnkUrl = strDftUrl

	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

		strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If

	edit_check = "N"

	If grpcd = "1" Then
		edit_check = "Y"
	End If
%>
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
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.0.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".datepicker").datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-3y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-3:c+3', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
				  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  dayNames: ['일','월','화','수','목','금','토'],
				  dayNamesShort: ['일','월','화','수','목','금','토'],
				  dayNamesMin: ['일','월','화','수','목','금','토']
			});

			$(".datepicker").attr("readonly", true);
		});
	</script>
</head>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 상담 이벤트 관리 >
			<strong>
				<% If kind = "1" Then %>
					상담 관리
				<% End If %>
				<% If kind = "2" Then %>
					계약 현황
				<% End If %>
			</strong>
		</div>
		<div class="write">
			
			<br />
			<h1>상담 정보</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>성명</th>
				<td><%=arrList(2,0)%></td>
			</tr>
			<tr>
				<th>출산예정일</th>
				<td><%=Left(arrList(12,0),4)%>-<%=Mid(arrList(12,0),5,2)%>-<%=Right(arrList(12,0),2)%></td>
			</tr>
			<tr style="display:none;">
				<th>전화번호</th>
				<td><%=arrList(4,0)%></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td><%=arrList(5,0)%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					(<%=arrList(6,0)%>)&nbsp;<%=arrList(7,0)%>&nbsp;<%=arrList(8,0)%>
				</td>
			</tr>
			<tr>
				<th>상담내용</th>	
				<td><%=Replace(arrList(18,0), Chr(10), "<br/>")%></td>
			</tr>
			<tr>
				<th>상담완료여부</th>	
				<td>
					<%
						If edit_check = "Y" And kind = "1" Then
					%>
							<select name="ms_end" id="ms_end">
								<option value="N" <%=fncSetSelectBox("N",arrList(24,0))%>>N</option>
								<option value="Y" <%=fncSetSelectBox("Y",arrList(24,0))%>>Y</option>
							</select>
					<%
						Else
					%>
							<%=arrList(24,0)%>
					<%
						End If
					%>
				</td>
			</tr>
			<tr>
				<th>계약완료여부</th>	
				<td>
					<%
						ms_contract_end = "N"

						If Not arrList(39,0) = "" Then
							ms_contract_end = "Y"
						End If
					%>

					<%=ms_contract_end%>
				</td>
			</tr>
			<tr>
				<th>계약상품</th>	
				<td>
					<%
						If edit_check = "Y" And kind = "2" Then
					%>
							<input type="radio" name="ms_contract" id="ms_contract" value="" <%=fncSetCheckBox("", arrList(39,0))%> onclick="dtReset();" /> 미선택
							<input type="radio" name="ms_contract" id="ms_contract" value="2주" <%=fncSetCheckBox("2주", arrList(39,0))%> /> 2주
							<input type="radio" name="ms_contract" id="ms_contract" value="3주 이상" <%=fncSetCheckBox("3주 이상", arrList(39,0))%> /> 3주 이상
					<%
						Else
					%>
							<%=arrList(39,0)%>
					<%
						End If
					%>
					
				</td>
			</tr>
			<tr>
				<th>계약일</th>	
				<td>
					<%
						If edit_check = "Y" And kind = "2" Then
					%>
							<input type="text" name="ms_contract_dt" id="ms_contract_dt" class="datepicker" value="<%=arrList(40,0)%>" />
					<%
						Else
					%>
							<%=arrList(40,0)%>
					<%
						End If
					%>
					
				</td>
			</tr>
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<%
							If edit_check = "Y" Then
						%>
						<input type="button" value="수 정" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<%
							End If
						%>
						<input type="button" value="목 록" class="button" onClick="location.href='./event_service_list.asp?<%=strLnkUrl%>';">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var btn = jQuery('#btnSubmit');
		var del	= jQuery('#btnDelte');

		btn.click(function(){
			//location.href="./service_ins.asp?idx=<%=intIDX%>&<%=strLnkUrl%>";

			var ms_contract = $("input[type=radio][name=ms_contract]:checked").val();

			jQuery('#ifrm').attr({'src':'/info/info_01_sql.asp?mode=event_service&kind=<%=kind%>&ms_end=' + $("#ms_end").val() + '&ms_contract=' + ms_contract + '&ms_contract_dt=' + $("#ms_contract_dt").val() + '&idx=<%=intIDX%>'});

			//window.location.href = '/info/info_01_sql.asp?mode=event_service&kind=<%=kind%>&ms_end=' + $("#ms_end").val() + '&ms_contract=' + ms_contract + '&ms_contract_dt=' + $("#ms_contract_dt").val() + '&idx=<%=intIDX%>';
		});

		del.click(function(){
			if (confirm("삭제 하시겠습니까?")) {
				jQuery('#ifrm').attr({'src':'/info/info_01_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});

	function dtReset() {
		$("#ms_contract_dt").val("");
	}
</script>
</html>