<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_ins.asp
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
	<!-- 달력 추가 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
    <!-- -->
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
	Dim mode : mode = "ins"
	
	idx = fncRequest("seq")   
    If idx <> "" Then

		strTable = " FROM MO_APP_CALL_SERVICE WITH(NOLOCK) "
	'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID " 
		strWhere = " WHERE CALL_SEQ = '"& idx &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
	'	strSql = strSql & "			* "
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
		strSql = strSql & "			,CALL_MEMO " 
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY CALL_SEQ DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			birthday = Rs(6)
			mode	= "upd"
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 
%>
 
<%
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------


 '------달력추가로 수정--------------------------------------------------
 
'-------달력 추가로 수정----------------------------------------------------


%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=arrList(0,0)%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<% If arrList(2,0) <> "" Then %>
			<tr>
				<th>회원ID</th>
				<td><%=arrList(2,0)%></td>
			</tr>
			<% End If %>
			<tr>
				<th>회원명</th>
				<td><% If arrList(3,0) <> ""  Then %><%=arrList(3,0)%> <% Else %> <%End If %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><% If arrList(12,0) <> ""  Then %><%=arrList(12,0)%> <% Else %> <%End If %></td>
			</tr> 
 

			<tr>
				<th>전화상담타입</th>
				<td>
					<select name="call_service" id="call_service">
						<option value="">선택</option>
						<option value="서비스일정변경"<%=fncSetSelectBox("서비스일정변경",arrList(4,0))%>>서비스일정변경</option>
						<option value="출산일변경"<%=fncSetSelectBox("출산일변경",arrList(4,0))%>>출산일변경</option>
						<option value="서비스프로그램변경"<%=fncSetSelectBox("서비스프로그램변경",arrList(4,0))%>>서비스프로그램변경</option>
						<option value="출산선물변경"<%=fncSetSelectBox("출산선물변경",arrList(4,0))%>>출산선물변경</option>
						<option value="서비스가입문의"<%=fncSetSelectBox("서비스가입문의",arrList(4,0))%>>서비스가입문의</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>  
			<tr>
				<th>핸드폰번호</th>
				<td>
				<%
					If arrList(8,0) <> "" Then 
					arrHp = Split(arrList(8,0),"-")
				%>
					<select name="hp1" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					-
					<input type="text" name="hp2" size="5" maxlength="4" value="<%=arrHp(1)%>"  />
					-
					<input type="text" name="hp3" size="5" maxlength="4" value="<%=arrHp(2)%>"  />&nbsp;
		 
					<% Else %>
						<select name="hp1">
						<option value="">선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
					</select>
					-
					<input type="text" name="hp2" size="5" maxlength="4" value=""	/>
					-
					<input type="text" name="hp3" size="5" maxlength="4" value="" />

					<%End If %>
				</td>
			</tr>   
			<tr>
				<th>상담가능날짜</th>
				<td>
					<input type="text" id="datepicker" name="datepicker" value="<%=arrList(5,0)%>" placeholder="상담가능날짜" /> 
					 
				</td>
			</tr>
			<tr>
				<th>상담가능시간</th>
				<td>
					<select class="select4"  name="con_time" id="con_time" >
						<option value="">선택</option>
							<%
								For num=9 To 18		 
							%>
								<option value="<%=num%>시"<%=fncSetSelectBox(num&"시",arrList(6,0))%>><%=num%>시</option> 
							<%
								next
							%>
					</select>
					<select class="select4"  name="con_minute" id="con_minute" >
						<option value="">선택</option> 
						<option value="10분"<%=fncSetSelectBox("10분",arrList(7,0))%>>10분</option>
						<option value="20분"<%=fncSetSelectBox("20분",arrList(7,0))%>>20분</option>
						<option value="30분"<%=fncSetSelectBox("30분",arrList(7,0))%>>30분</option>
						<option value="40분"<%=fncSetSelectBox("40분",arrList(7,0))%>>40분</option>
						<option value="50분"<%=fncSetSelectBox("50분",arrList(7,0))%>>50분</option> 
					</select>
				</td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td>
					<textarea	name="content" id="content" style="width:100%; height:200px;"><%=arrList(9,0)%></textarea>
				</td>
			</tr>
			<tr>
				<th>관리자메모</th>
				<td>
					<textarea	name="content_memo" id="content_memo" style="width:100%; height:200px;"><%=arrList(13,0)%></textarea>
				</td>
			</tr>
			<tr>
				<th>상담완료여부</th>
				<td>
					<select class="select4"  name="finish_flg" id="finish_flg"  >
						<option value="">선택</option> 
						<option value="Y"<%=fncSetSelectBox("Y",arrList(10,0))%>>상담완료</option>
						<option value="N"<%=fncSetSelectBox("N",arrList(10,0))%>>상담대기</option> 
					</select> 
				</td>
			</tr>

			</thead>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>

<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<!-- 달력추가 시작-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<script> 
$(document).ready(function() {	   
	$( "#datepicker" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
  }); 
</script>
<!-- 달력추가 끝-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');

	btnDel.click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./app_call_service_sql.asp?mode=del&idx=<%=idx%>'});
		}
	});

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./app_call_service_sql.asp"
	});
</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}
 
	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>