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
	
	mem_id = fncRequest("mem_id")   
    If mem_id <> "" Then
		strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE MM_MEM_ID = '"& mem_id &"' "

		strSql = ""
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
		strSql = strSql & "			,MD_LOCAL_DETAIL "
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT DESC) ROWNUM "
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
'	지점 정보 호출
	md_local = arrList(17,0)
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_nm = Rs(0)
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------
'지명 예) 서울, 대전, 경기
'-----------------------------------------------------------------------------
'	지점 정보 호출
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------


 '------달력추가로 수정--------------------------------------------------
	If birthday <> ""  Then 
		birth_m = Mid(arrList(6,0),5,2)
		birth_d = Right(arrList(6,0),2)
		birth_ymd = Left(arrList(6,0),4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
'-------달력 추가로 수정----------------------------------------------------


%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="mem_id" value="<%=arrList(0,0)%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>회원ID</th>
				<td><%=arrList(0,0)%></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><% If arrList(1,0) <> ""  Then %><%=arrList(1,0)%> <% Else %> <%End If %></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><% If arrList(2,0) <> ""  Then %><%=arrList(2,0)%> <% Else %> <%End If %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="mem_pw" size="35"/>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="radio1" value="2" <%=fncSetCheckBox("2",arrList(5,0))%> /> 여자&nbsp;&nbsp;
					<input type="radio" name="radio1" value="1" <%=fncSetCheckBox("1",arrList(5,0))%>/> 남자
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" id="datepicker" name="birth" value="<%=birth_ymd%>"> 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
				<%
					 If arrList(3,0) <> "" Then 
					arrPhone = Split(arrList(3,0),"-")
				%>
					<select name="phone_1" >
						<option value="">선택</option>
						<option value="02" <%=fncSetSelectBox("02",arrPhone(0))%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",arrPhone(0))%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",arrPhone(0))%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",arrPhone(0))%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",arrPhone(0))%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",arrPhone(0))%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",arrPhone(0))%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",arrPhone(0))%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",arrPhone(0))%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",arrPhone(0))%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",arrPhone(0))%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",arrPhone(0))%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",arrPhone(0))%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",arrPhone(0))%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",arrPhone(0))%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",arrPhone(0))%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",arrPhone(0))%>>070</option>
					</select>
					-
					<input type="text" name="phone_2" size="5" maxlength="4" value="<%=arrPhone(1)%>" />
					-
					<input type="text" name="phone_3" size="5" maxlength="4" value="<%=arrPhone(2)%>" />
					<% Else %>
					<select name="phone_1" >
						<option value="">선택</option>
						<option value="02" >02</option>
						<option value="031" >031</option>
						<option value="032" >032</option>
						<option value="033" >033</option>
						<option value="041" >041</option>
						<option value="042" >042</option>
						<option value="043" >043</option>
						<option value="051" >051</option>
						<option value="052" >052</option>
						<option value="053" >053</option>
						<option value="054" >054</option>
						<option value="055" >055</option>
						<option value="061" >061</option>
						<option value="062" >062</option>
						<option value="063" >063</option>
						<option value="064" >064</option>
						<option value="070" >070</option>
					</select>
					-
					<input type="text" name="phone_2" size="5" maxlength="4" value="" />
					-
					<input type="text" name="phone_3" size="5" maxlength="4" value="" />
					<%End If %>
				</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
				<%
					If arrList(4,0) <> "" Then 
					arrHp = Split(arrList(4,0),"-")
				%>
					<select name="hp_1" >
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					-
					<input type="text" name="hp_2" size="5" maxlength="4" value="<%=arrHp(1)%>" />
					-
					<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" />&nbsp;
					<input type="checkbox" name="check3" value="Y" <%=fncSetCheckBox("Y",arrList(11,0))%>/> SMS 수신동의	
					<% Else %>
						<select name="hp_1" >
						<option value="">선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
					</select>
					-
					<input type="text" name="hp_2" size="5" maxlength="4" value="" />
					-
					<input type="text" name="hp_3" size="5" maxlength="4" value="" />

					<%End If %>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(7,0),3)%>" />
					-
					<input type="text" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(7,0),3)%>" />

					<input type="text" name="addr_1" class="textarea" size="60" value="<%=arrList(8,0)%>" />
					<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(9,0)%>" />
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" class="textarea" size="35" value="<%=arrList(10,0)%>" />&nbsp;&nbsp;
					<input type="checkbox" name="check4" value="Y" <%=fncSetCheckBox("Y",arrList(12,0))%>/> 이메일 수신동의 
				</td>
			</tr>
			<tr>
				<th>지점</th>
				<td>
					<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
						<option value="">지역</option>
					<%
						If IsArray(arrLocal) Then 
							For num = 0 To UBound(arrLocal,2)
					%>
						<option value="<%=arrLocal(0,num)%>" <%If local_nm = arrLocal(0,num) Then%>selected<%End If%>><%=arrLocal(0,num)%></option>
					<%
							Next 
						End If 
					%>
					</select>
					<select id="part" name="part" class="textarea" style="height:35px;">
						<option value="">지점</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>분만예정일</th>
				<td>
			<%
				Mchildbirth = Mid(arrList(13,0),5,2)
				If Mchildbirth <> "" Then 
					If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
					Dchildbirth = Right(arrList(13,0),2)
					If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
			%>
					<select name="childbirth_y">
						<option value="">년</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(13,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="childbirth_m">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>월</option>
					<% Next %>
					</select>
					<select name="childbirth_d">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>일</option>
					<% Next %>
					</select>
			<%
				End If 
			%>
				</td>
			</tr>	  	  
			<tr>
				<th>큰아이 여부</th>
				<td>
					<input type="radio" name="radio3" value="초산" <%=fncSetCheckBox("초산",arrList(14,0))%>/> 초산&nbsp;&nbsp;
					<input type="radio" name="radio3" value="1명" <%=fncSetCheckBox("1명",arrList(14,0))%>/> 1명&nbsp;&nbsp;
					<input type="radio" name="radio3" value="2명이상" <%=fncSetCheckBox("2명이상",arrList(14,0))%>/> 2명이상
				</td>
			</tr>	  	  	    	  
			<tr>
				<th>산모 구분</th>
				<td>
					<input type="radio" name="radio4" value="바우처" <%=fncSetCheckBox("바우처",arrList(15,0))%>/> 바우처&nbsp;&nbsp;
					<input type="radio" name="radio4" value="일반" <%=fncSetCheckBox("일반",arrList(15,0))%>/> 일반 
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
			jQuery('#ifrm').attr({'src':'./member_sql.asp?mode=del&mem_id=<%=mem_id%>'});
		}
	});

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_sql.asp"
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