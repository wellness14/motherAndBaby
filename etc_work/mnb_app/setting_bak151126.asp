<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%
	Dim mode : mode = "ins"

	uId				= Trim(fncRequestCookie("uid"))				'회원	아이디
	uname			= Trim(fncRequestCookie("uname"))			'회원	아이디
	auto_login_ck	= Trim(fncRequestCookie("auto_login_ck"))	'자동로그인 쿠키
 

	If uId = "" Then 
	'	response.Write "<script type='text/javascript'>parent.location.href='/etc_work/mnb_app/plan_list.asp'</script>"
		response.Write "<script type='text/javascript'>alert('로그인이 필요한 서비스입니다.');parent.location.href='/etc_work/mnb_app/login.asp'</script>"
	'	Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/login.asp"
	End If 

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
 
  
			strSql1 = ""
			strSql1 = strSql1 & " SELECT  *  "
			strSql1 = strSql1 & " from  MO_MEM_DTL   " 
			strSql1 = strSql1 & " where MD_MEM_ID = '"& uId &"'  "
			Set Rs = DBExec(strSql1,"main")
			If Not Rs.EOF Then 
					mode = "upd"

					MD_HP			= Rs(2)
					MD_BIRTH		= Rs(4)
					MD_POST			= Rs(5)
					MD_ADDR1		= Rs(6)
					MD_ADDR2		= Rs(7) 
					MD_LOCAL1		= Rs(11)
					MD_LOCAL_DETAIL	= Rs(16) 

					arr_mem_List = Rs.GetRows()
			End If   
 
			Call DBClose(Rs) : DBClose(Rs1)
 
'	등록 상품 호출
	strSql = "  select * from  MO_SERVICE_CODE where depth=1 and  codename not in ('추가비용')  order by SERVICE_SEQ  asc "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("codename")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)

'	이름
	strSql = "  select * from  MO_MEM_MAS where MM_MEM_ID = '"& uId &"' "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		user_name = Rs(2)
		mem_mas = Rs.getRows()
	End If 
	Call RSClose(Rs)

 '------달력추가로 수정----------------------------------------------------------------------------------
	'1 생년월일
	If birth <> "" Then 
		birth_m = Mid(birth,5,2)
		birth_d = Right(birth,2)
		birth_ymd = Left(birth,4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	'2 출산예정일
	If childbirth <> "" Then 
		childbirth_m = Mid(childbirth,5,2)
		childbirth_d = Right(childbirth,2)
		childbirth_ymd = Left(childbirth,4) & "-" & childbirth_m & "-" & childbirth_d

		If childbirth_ymd = "--" Then
			childbirth_ymd = ""
		End If
	End If


		'2 서비스희망일
	If serviceSdt <> "" Then 
		serviceSdt_m = Mid(serviceSdt,5,2)
		serviceSdt_d = Right(serviceSdt,2)
		serviceSdt_ymd = Left(serviceSdt,4) & "-" & serviceSdt_m & "-" & serviceSdt_d

		If serviceSdt_ymd = "--" Then
			serviceSdt_ymd = ""
		End If
	End If

			'2 입원
	If hospital_date <> "" Then 
		hospital_date_m = Mid(hospital_date,5,2)
		hospital_date_d = Right(hospital_date,2)
		hospital_date_ymd = Left(hospital_date,4) & "-" & hospital_date_m & "-" & hospital_date_d

		If hospital_date_ymd = "--" Then
			hospital_date_ymd = ""
		End If
	End If
'---------------------------------------------------------------------------------------------------
	If MD_LOCAL_DETAIL <> "" Then 
	'	지점 정보 호출
		md_local = MD_LOCAL_DETAIL
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
	End If 

'---------------------------------------------------------------------------------------------------
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
 

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마더앤베이비</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet">
	<link href="leftmenu.css" rel="stylesheet">
	<!-- 달력 추가 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
	<!-- -->
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>
	

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#post_btn").click(function() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if(data.userSelectedType === 'R'){
							//법정동명이 있을 경우 추가한다.
							if(data.bname !== ''){
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if(data.buildingName !== ''){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$("#post").val(data.zonecode); //5자리 새우편번호 사용
						$("#address1").val(fullAddr);

						// 커서를 상세주소 필드로 이동한다.
						$("#address2").val("");
						$("#address2").focus();
					}
				}).open();
			});
		});
	</script>
  </head>

  <body style="background-Color:#ececec">

 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
 
    <div class="container">
		<form name="setting_form" id="setting_form" method="post" action="setting_sql.asp">
			<input type="hidden" name="idx" value="<%=mr_idx%>" />
			<input type="hidden" name="mode" value="<%=mode%>" />
			<input type="hidden" name="user_id" value="<%=uId%>" />
			<input type="hidden" name="user_name" value="<%=user_name%>" />
			<input type="hidden" name="birth" value="<%=MD_BIRTH%>" />
			<input type="hidden" name="hp" value="<%=MD_HP%>" />
			<!-- 관리자에서 정보수정 확인을 위한 작업 --> 
			<input type="hidden" name="before_post" value="<%=MD_POST%>" />
			<input type="hidden" name="before_addr1" value="<%=MD_ADDR1%>" />
			<input type="hidden" name="before_addr2" value="<%=MD_ADDR2%>" /> 
			<!-- 관리자에서 정보수정 확인을 위한 작업 -->

			<div class="setting_box_01">
				<div class="setting_box_01_sub">
					<input type="text" name="post" id="post" class="setting_in_text" value="<%=MD_POST%>" /> <input type="button" name="post_btn" id="post_btn" class="setting_btn" value="주소찾기" />
				</div>
				<div class="setting_box_02_sub">
					<input type="text" name="address1" id="address1" class="setting_in_text_2" value="<%=MD_ADDR1%>" /> 
				</div>
				<div class="setting_box_02_sub_1">
					<input type="text" name="address2" id="address2" class="setting_in_text_3" value="<%=MD_ADDR2%>" /> 
				</div>
				<div class="setting_box_02_sub_2">
					<input type="submit" name="setting_save_btn" id="setting_save_btn" class="setting_input_01" value="저장" />
				 </div>
			</div> 
		</form>
	
	
	
	<div style="padding:20px;width:100%; -webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;background-color:#fff;"> 
		<form name="setting_form2" id="setting_form2" method="post" action="setting_mem_sql.asp">
			<input type="hidden" name="mode" value="<%=mode%>" />
			<input type="hidden" name="user_id" value="<%=uId%>" />
			<input type="hidden" name="user_name" value="<%=user_name%>" />
			<div class="input" style="text-align:center;">
				<span class="input2_title_01"><%=uId%> (<%=uname%> 회원님)</span>
			</div>
			<div class="input">
				<input type="password" name="user_pwd" id="user_pwd" class="input_04" placeholder="변경할 비밀번호" />
			</div>

			<div class="input">
				<input type="password" name="user_pwd_re" id="user_pwd_re" class="input_04" placeholder="비밀번호 확인" />
			</div>

			<div class="input_txt">
				6~15자 이상의 비밀번호를 입력하세요.<br>4개 이상의 연속된 숫자, 문자는 제한합니다.
			</div>
			<%
				If MD_HP <> "" Then 
				arrHp = Split(MD_HP,"-")
			%>
			<div class="input pt_5">
				<span class="input2_title_02">휴대폰</span>
					<select class="select2" name="hp1" id="hp1" style="background:#fff;">
						<option value="">선택</option>
						<option value="010"<%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011"<%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016"<%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017"<%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018"<%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019"<%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					<input type="text" name="hp2" id="hp2" value="<%=arrHp(1)%>" maxlength="4" class="input_03" placeholder="중간번호" />
					<input type="text" name="hp3" id="hp3" value="<%=arrHp(2)%>" maxlength="4" class="input_03" placeholder="뒷번호" />
			</div>
			<%else%>
			<div class="input pt_5">
				<span class="input2_title_02">휴대폰</span>
					<select class="select2" name="hp1" id="hp1">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="hp2" id="hp2" value="" maxlength="4" class="input_03" placeholder="중간번호" />
					<input type="text" name="hp3" id="hp3" value="" maxlength="4" class="input_03" placeholder="뒷번호" />
			</div>
			<%End If %>
			
		
			<div class="setting_box_02_sub_2">
				<input type="submit" name="setting_mem_save_btn" id="setting_mem_save_btn" class="setting_input_01" value="저장" />
			</div>
		</form>

	</div>
	<!-- <div style="padding:20px;width:100%; border:1px solid #2185c5;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;"> 
			<div class="input">
				<span class="input2_title">서비스선택</span>
				<select name="service_nm"   class="textarea" style="height:35px;">
				<option value=""selected>선택</option>
					<%
						vCnt = UBOUND(arrProdt,2)
							For num = 0 To vCnt
					%>
						<option value="<%=arrProdt(4,num)%>" <%If service = arrProdt(4,num) Then%>selected<%End If%>><%=arrProdt(4,num)%></option>
					<%
						 Next
					%>
				 </select> 
			</div>
			<div class="input">
			<span class="input2_title">이용기간</span>
				<select class="select2" name="use_week" id="use_week" class="info_hp1">
					<option value="">이용기간</option>
					<option value="1주"<%=fncSetSelectBox("1주",period)%>>1주</option>
					<option value="2주"<%=fncSetSelectBox("2주",period)%>>2주</option>
					<option value="3주"<%=fncSetSelectBox("3주",period)%>>3주</option>
					<option value="4주"<%=fncSetSelectBox("4주",period)%>>4주</option>
					<option value="6주"<%=fncSetSelectBox("6주",period)%>>6주</option>
					<option value="8주"<%=fncSetSelectBox("8주",period)%>>8주</option>
				</select> 
			</div>
			<div class="input">
			<span class="input2_title">이용형태</span>
				<select class="select2"  name="use_type" id="use_type" class="info_hp1">
					<option value="">이용형태</option>
					<option value="입주 + 5일"<%=fncSetSelectBox("입주 + 5일",service_type)%>>입주+5일</option>
					<option value="입주 + 6일"<%=fncSetSelectBox("입주 + 6일",service_type)%>>입주+6일</option>
					<option value="출퇴근 + 5일"<%=fncSetSelectBox("출퇴근 + 5일",service_type)%>>출퇴근+5일</option>
					<option value="출퇴근 + 6일"<%=fncSetSelectBox("출퇴근 + 6일",service_type)%>>출퇴근+6일</option>
					<option value="출퇴근 + 입주 + 5일"<%=fncSetSelectBox("출퇴근 + 입주 + 5일",service_type)%>>출퇴근+입주+5일</option>
					<option value="출퇴근 + 입주 + 6일"<%=fncSetSelectBox("출퇴근 + 입주 + 6일",service_type)%>>출퇴근+입주+6일</option>
				</select> 
			</div>
			<div class="input">
				<span class="input2_title">출산예정일</span><input type="text" id="datepicker" name="childbirth" placeholder="날짜를 선택하세요" value="<%=childbirth_ymd%>"/> 
			</div>
			<div class="input">
				<span class="input2_title">서비스희망일</span><input type="text" id="datepicker1" name="serviceSdt" placeholder="날짜를 선택하세요" value="<%=serviceSdt_ymd%>"/> 
			</div>
			<div class="input">
			<span class="input2_title">지점선택</span>
				<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
					<option value="">지역</option>
				<%	
 
					If IsArray(arrLocal) Then	
						For num = 0 To UBound(arrLocal,2)	
				%>	
					<option value="<%=arrLocal(0,num)%>" <% If local_nm = arrLocal(0,num) Then %>selected<%  End If %>><%=arrLocal(0,num)%></option>	
				<%	
						Next	
					End If	
				%>	
				</select>	
			<select id="part" name="part" class="textarea" style="height:35px;">
				 --<option value="">지점</option>-- 
			</select>
			</div> 
			<div class="input">
					<span class="input2_title">조리원</span> <input type="radio" name="radio3" id="radio3" value="이용함"  <%=fncSetCheckBox("이용함",clinic)%> /> 이용함 
					<span style="margin-left:20px;"></span><input type="radio" name="radio3" id="radio3" value="이용안함"  <%=fncSetCheckBox("이용안함",clinic)%> /> 이용안함 
			</div>
			<div class="input">
				 <span class="input2_title">출산경험</span> <input type="radio" name="exp_baby" id="exp_baby" value="초산모"  <%=fncSetCheckBox("초산모",exper)%> /> 초산모 
						<span style="margin-left:20px;"></span><input type="radio" name="exp_baby" id="exp_baby" value="경산모"  <%=fncSetCheckBox("경산모",exper)%> /> 경산모 
			</div>
			<div class="input">
				 <span class="input2_title">특이사항</span> <input type="radio" name="unique_check" id="unique_check" value="없음"  <% If unique <> "" Then %>checked<% End If %> /> 없음 
						<span style="margin-left:20px;"></span><input type="radio" name="unique_check" id="unique_check" value="있음" <%If InStr(unique,"쌍둥이") > 0 or InStr(unique,"임신성 당뇨") > 0 or InStr(unique,"부종") > 0 or InStr(unique,"고혈압") > 0  Then %>checked<% End If %>/> 있음 
				<div id="view_3" style="display:block;margin-left:105px;" >
						<input type="checkbox" name="unique_1" id="unique_1" value="쌍둥이"			<%If InStr(unique,"쌍둥이") > 0 Then%>checked<%End If%> /> 쌍둥이 
						<input type="checkbox" name="unique_1" id="unique_3" value="임신성 당뇨"	<%If InStr(unique,"임신성 당뇨") > 0 Then%>checked<%End If%> /> 임신성 당뇨 
						<input type="checkbox" name="unique_1" id="unique_2" value="부종"			<%If InStr(unique,"부종") > 0 Then%>checked<%End If%> /> 부종 
						<input type="checkbox" name="unique_1" id="unique_4" value="고혈압"			<%If InStr(unique,"고혈압") > 0 Then%>checked<%End If%> /> 고혈압
				</div>
			</div>
			<div class="input">
				 <span class="input2_title">가족사항</span>
				  
					<input type="checkbox" name="fam1" id="fam1" value="부모님"			<%If InStr(family,"부모님") > 0 Then%>checked<%End If%> /> 부모님 
					<input type="checkbox" name="fam1" id="fam3" value="큰아이 1명"		<%If InStr(family,"큰아이 1명") > 0 Then%>checked<%End If%> /> 큰아이 1명 
					<input type="checkbox" name="fam1" id="fam2" value="남편"			<%If InStr(family,"남편") > 0 Then%>checked<%End If%> /> 남편
				<div id="view_3" style="display:block;margin-left:105px;" >
					<input type="checkbox" name="fam1" id="fam4" value="큰아이 2명이상" <%If InStr(family,"큰아이 2명이상") > 0 Then%>checked<%End If%>/> 큰아이 2명이상
					<input type="checkbox" name="fam1" id="fam5" value="기타가족"		<%If InStr(family,"기타가족") > 0 Then%>checked<%End If%>/> 기타가족 
				</div>
				 
			</div>
			<div class="join_box_02_sub">
				 <span class="input2_title">입원병원정보</span><input type="text" id="datepicker2" name="hospital_date" value="<%=hospital_date_ymd%>" class="setting_in_text_5" placeholder="입원날짜를 입력하세요"> 
			</div>
			<div class="join_box_01_sub">
				<span class="setting_title">입원병원정보</span><input type="text" name="hospital_post" id="hospital_post" class="setting_in_text_02" value="<%=hospital_post%>" /> <input type="button" name="post_btn" id="post_btn" class="setting_btn" value="주소찾기" />
			</div> 
			<div class="join_box_02_sub">
				<span class="setting_title">입원병원정보</span><input type="text" name="hospital_address1" id="hospital_address1" class="setting_in_text_5" value="<%=hospital_address1%>" /> 
			</div> 
	</div>

		</form> -->

<% If uId <> "" Then %>
 		
		<div class="setting_box_01_2">
			<div class="setting_login_input_m1">
				<%=uId%>
			</div>
			 
			<div class="setting_box_02_sub_2">
				<a href="logout.asp"><input type="button" name="emergency_btn" id="emergency_btn" class="setting_input_01" value="로그아웃" /></a>
			 </div>
			<div class="setting_box_02_sub_3">
<% If Request.Cookies("auto_login_ck")("Flag") <> "" Then %>
				<input type="checkbox" name="auto_login" id="auto_login" class="autol_text" value="Y"   checked  /> <span class="autol_text_1">자동로그인</span>
<%else%>
				<input type="checkbox" name="auto_login" id="auto_login" class="autol_text" value="Y"       /> <span class="autol_text_1">자동로그인</span>
<%End If %>
			</div>
		</div>   
 
<% 
 
Else %>

		<div class="setting_box_01_2">
			<div class="setting_login_input_m1">
				<input type="text" name="user_id" id="user_id" class="setting_input_02" placeholder="ID" />
			</div>
			<div class="setting_login_input_m1">
				<input type="password" name="user_pw" id="user_pw" class="setting_input_02" placeholder="PW" /><br>
			</div>
			<div class="setting_box_02_sub_2">
				<input type="button" name="emergency_btn" id="emergency_btn" class="setting_input_01" value="로그인" />
			 </div>
			<div class="setting_box_02_sub_3">
				<input type="checkbox" name="auto_login" id="auto_login" class="autol_text" value="Y" /> <span class="autol_text_1">자동로그인</span>
			</div>
		</div>	
		
<% End If %>
 
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
    </div><!-- /.container -->

  </body>

	<script src="js/leftmenu.js"></script>
	<script type="text/javascript" src="/common/js/ajax_common.js"></script>
	<script type="text/javascript" charset="utf-8">
		function fncSetPart(val,cd){
			fncAxListHtml("/common/inc/local_ax_test.asp?local="+val+"&localCd="+cd,"#part");
		}

		fncSetPart("<%=local_nm%>","<%=md_local%>");
	</script>
	<!-- 달력추가 시작-->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
	<!-- 달력 -->
	<script>
		$(document).ready(function(){
			$( "#datepicker" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 
			$( "#datepicker1" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 
			$( "#datepicker2" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 


		});

		$("#setting_mem_save_btn").click(function(){

			if (jQuery("#user_pwd").val() != "" ) {
			
					if ($.trim(jQuery("#user_pwd").val()) == "") {
				  
						alert("비밀번호를 입력하세요");
						$('#user_pwd').focus();
						return false;
			 
					} 

					if ($.trim(jQuery("#user_pwd_re").val()) == "") {
						 
							alert("비밀번호를 재입력하세요");
							$('#user_pwd_re').focus();
							return false;
					}
						 
		 
					if((jQuery("#user_pwd").val().length) < 6 || (jQuery("#user_pwd").val().length) > 15){
						alert("6자이상 15자 이하의 비밀번호를 입력하세요");
						$('#user_pwd').focus();
						return false;
					}

					if(jQuery("#user_pwd").val() != jQuery("#user_pwd_re").val()) {
						alert("비밀번호를 확인해주세요");
						$('#user_pwd').focus();
						return false;
					}
		 
					
					if (jQuery("#user_pwd").val() != "" ) {
					   // 동일한 문자/숫자 4이상, 연속된 문자
						if(/(\w)\1\1\1/.test(jQuery("#user_pwd").val()) || isContinuedValue(jQuery("#user_pwd").val())) {
							alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다."); 
							return false;
						}
					}


					if ($.trim(jQuery("#hp1").val()) == "") {
						  
							alert("핸드폰번호를 입력하세요");
							$('#hp1').focus();
							return false;
					 
					}

					if ($.trim(jQuery("#hp2").val()) == "") {
						  
							alert("핸드폰번호를 입력하세요");
							$('#hp2').focus();
							return false;
					 
					}

					if ($.trim(jQuery("#hp3").val()) == "") {
						  
							alert("핸드폰번호를 입력하세요");
							$('#hp3').focus();
							return false;
					 
					}

					function isContinuedValue(value) {
						console.log("value = " + value);
						var intCnt1 = 0;
						var intCnt2 = 0;
						var temp0 = "";
						var temp1 = "";
						var temp2 = "";
						var temp3 = "";
				 
						for (var i = 0; i < value.length-3; i++) {
							console.log("=========================");
							temp0 = value.charAt(i);
							temp1 = value.charAt(i + 1);
							temp2 = value.charAt(i + 2);
							temp3 = value.charAt(i + 3);
				 
							console.log(temp0)
							console.log(temp1)
							console.log(temp2)
							console.log(temp3)
				 
							if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
									&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
									&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
								intCnt1 = intCnt1 + 1;
							}
				 
							if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
									&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
									&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
								intCnt2 = intCnt2 + 1;
							}
							console.log("=========================");
						}
				 
						console.log(intCnt1 > 0 || intCnt2 > 0);
						return (intCnt1 > 0 || intCnt2 > 0);
					}
			}
		});
	
	/*
	function auto_login() {
		jQuery.post("./login_auto_sql.asp",{"check":"Y","mem_id":"<%=uId%>","uname":"<%=uname%>"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
			//	 location.reload();
					alert("자동로그인이 설정되었습니다.");
				}
		});   
	}
*/


			$("#auto_login").click(function(){
				//클릭되었으면
				if($("#auto_login").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
					jQuery.post("./login_auto_sql.asp",{"check":"Y","mem_id":"<%=uId%>","uname":"<%=uname%>"},function(data,testStatus){
						if (data == 1) {
						//	alert("11111.");
						} else {
						 
							alert("자동로그인이 설정되었습니다.");
							location.reload();
						}
					}); 
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
  
					jQuery.post("./login_auto_off_sql.asp",{"check":"Y","mem_id":"<%=uId%>","uname":"<%=uname%>"},function(data,testStatus){
						if (data == 1) {
						//	alert("11111.");
						} else {
						//	 location.reload();
							alert("자동로그인이 해제되었습니다.");
							location.reload();
						}
					}); 
				}
					 
			});
 



 
	</script>
</html>
