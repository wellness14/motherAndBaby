<%@Language="VBScript" CODEPAGE="65001" %>
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"
 
	uId			= Trim(fncRequestCookie("uid"))					'회원	아이디
	uname		= Trim(fncRequestCookie("uname"))				'회원	아이디

	If uId = "" Then 
	'	response.Write "<script type='text/javascript'>parent.location.href='/etc_work/mnb_app/plan_list.asp'</script>"
		response.Write "<script type='text/javascript'>alert('로그인이 필요한 서비스입니다.');parent.location.href='/etc_work/mnb_app/login.asp'</script>"
	'	Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/login.asp"
	End If 

	part = fncRequest("part")   
	'아이디정보로 예약번호 가져오기 

    If uId <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

	 	strWhere = " WHERE MS_CNLKBN='N' AND MS_MEM_ID = '"& uId &"' order by MS_IDX  desc "

	'	strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& ms_idx_result &"' "

		strSql = ""
		strSql = strSql & "	;SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
  
			MS_IDX = Rs(0)
			MS_MEM_ID = Rs(1)
			MS_MEM_NM = Rs(2)
			MS_BIRTH = Rs(3)
			MS_PHONE = Rs(4)
			MS_HP = Rs(5)
			MS_POST = Rs(6)
			MS_ADDR1 = Rs(7)
			MS_ADDR2 = Rs(8)
			MS_SERVICE = Rs(9)
			MS_PERIOD = Rs(10)
			MS_TYPE = Rs(11)
			MS_CHILDBIRTH = Rs(12)
	
			MS_SERVICEDT = Rs(13)
			MS_CLINIC = Rs(14)
			MS_EXPER = Rs(15)
			MS_UNIQUE = Rs(16)
			MS_FAMILY = Rs(17)
			MS_CONTENT = Rs(18)
			MS_PROVISION_1 = Rs(19)
			MS_PROVISION_2 = Rs(20)
			MS_CNLKBN = Rs(21)
			MS_REG_DT = Rs(22)
			MD_LOCAL1 = Rs(23)

			MS_END = Rs(24)
			MS_JUMIN1 = Rs(25)
			MS_JUMIN2 = Rs(26)
			MS_CONTENT_2 = Rs(27)     
			MD_LOCAL_DETAIL = Rs(28) 

			hospital_date		= Rs(29) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_post		= Rs(30) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_address1	= Rs(31) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			MS_SEX = Rs(32) 
			MS_AGREE1 = Rs(33) 
			MS_AGREE2 = Rs(34) 
			MS_AGREE3 = Rs(35) 
			MS_AGREE4 = Rs(36) 
			MS_AGREE5 = Rs(37) 

			mode = "upd"
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	 
	End If 




	'	등록 상품 호출
	strSql = "  ;select * from  MO_SERVICE_CODE where depth=1 and  codename not in ('추가비용')  order by SERVICE_SEQ  asc "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("codename")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


 '------달력추가로 수정----------------------------------------------------------------------------------
	'1 생년월일
	If MS_BIRTH <> "" Then 
		birth_m = Mid(MS_BIRTH,5,2)
		birth_d = Right(MS_BIRTH,2)
		birth_ymd = Left(MS_BIRTH,4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	'2 출산예정일
	If MS_CHILDBIRTH <> "" Then 
		childbirth_m = Mid(MS_CHILDBIRTH,5,2)
		childbirth_d = Right(MS_CHILDBIRTH,2)
		childbirth_ymd = Left(MS_CHILDBIRTH,4) & "-" & childbirth_m & "-" & childbirth_d

		If childbirth_ymd = "--" Then
			childbirth_ymd = ""
		End If
	End If

			'2 서비스희망일
	If MS_SERVICEDT <> "" Then 
		serviceSdt_m = Mid(MS_SERVICEDT,5,2)
		serviceSdt_d = Right(MS_SERVICEDT,2)
		serviceSdt_ymd = Left(MS_SERVICEDT,4) & "-" & serviceSdt_m & "-" & serviceSdt_d

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
'---------------------------------------------------------------------------------------------------
 
'----------------------------------------------------------------------------------------------------

	If MD_LOCAL_DETAIL <> "" Then 
	'	지점 정보 호출
		md_local = MD_LOCAL_DETAIL
		strSql = ";SELECT KOR_NM FROM ( "
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
	strSql = ";SELECT KOR_NM FROM ( "
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
 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마더앤베이비</title>
	<!-- 달력 추가 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
	<!-- -->
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet">
	<link href="leftmenu.css" rel="stylesheet">

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
						$("#hospital_post").val(data.zonecode); //5자리 새우편번호 사용
						$("#hospital_address1").val(fullAddr);

						// 커서를 상세주소 필드로 이동한다.
						//$("#address2").focus();
					}
				}).open();
			});

			
 

		});
	</script>
  </head>

  <body> 

 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
 
    <div class="container"> 
		<div class="title" style="margin-top:70px;">
			 상담신청정보(선택사항) 
		</div>

		<div style="padding:20px;margin-bottom:20px;width:100%; border:1px solid #2185c5;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;"> 
			<form name="setting_form" id="setting_form" method="post" action="service_request_sql.asp">
					<input type="hidden" name="idx" value="<%=MS_IDX%>" />
					<input type="hidden" name="mode" value="<%=mode%>" />
					<input type="hidden" name="user_id" value="<%=uId%>" />

					<!-- 본사용앱 관리자에서 정보변경 확인하기 위한 작업 -->
					<input type="hidden" name="before_service_nm" value="<%=MS_SERVICE%>" />
					<input type="hidden" name="before_use_week" value="<%=MS_PERIOD%>" />
					<input type="hidden" name="before_use_type" value="<%=MS_TYPE%>" />
					<input type="hidden" name="before_childbirth" value="<%=MS_CHILDBIRTH%>" />
					<input type="hidden" name="before_serviceSdt" value="<%=MS_SERVICEDT%>" />  
					<input type="hidden" name="before_local" value="<%=local_nm%>" />  
					<input type="hidden" name="before_part" value="<%=MD_LOCAL1%>" />
					
					<input type="hidden" name="before_radio3" value="<%=MS_CLINIC%>" />
					<input type="hidden" name="before_exp_baby" value="<%=MS_EXPER%>" /> 
					
					<input type="hidden" name="before_unique_1" value="<%=MS_UNIQUE%>" />
					<input type="hidden" name="before_fam1" value="<%=MS_FAMILY%>" />
					<input type="hidden" name="before_hospital_date" value="<%=hospital_date_ymd%>" /> 
					<input type="hidden" name="before_hospital_post" value="<%=hospital_post%>" /> 
					<input type="hidden" name="before_hospital_address1" value="<%=hospital_address1%>" />
					<input type="hidden" name="before_contents" value="<%=MS_CONTENT%>" /> 
					<input type="hidden" name="before_birth" value="<%=MS_BIRTH%>" />
					<input type="hidden" name="before_gender" value="<%=MS_SEX%>" />
					<input type="hidden" name="before_hp" value="<%=MS_HP%>" /> 
					<!-- 끝 -->
					
 
				<% If uId <> "" Then %>
 					<input type="hidden" name="user_name" style="width:182px; height:35px; border:1px solid #A9A9A9; padding-left:2px; color:#333;" placeholder="이름(실명)" value="<%=uname%>" />
				<% else %>
					<div class="input">
						<span class="input2_title">이름</span> <input type="text" name="user_name" id="user_name"   style="width:182px; height:35px; border:1px solid #A9A9A9; padding-left:2px; color:#333;" placeholder="이름(실명)" /> 
					</div>
				<%end If %>
					<div class="input">
						<span class="input2_title" >서비스선택</span>
						  <select name="service_nm" class="textarea" style="height:35px; background:#ffffff;width:182px;border:1px solid #A9A9A9; color:#A9A9A9;">
						  <option value=""selected >선택</option>
							<%
								vCnt = UBOUND(arrProdt,2)
									For num = 0 To vCnt
							%>
								<option value="<%=arrProdt(4,num)%>"<%If MS_SERVICE = arrProdt(4,num) Then%>selected<%End If%>><%=arrProdt(4,num)%></option>
							<%
								 Next
							%>
						 </select> 
					</div>


 					<div class="input">
					<span class="input2_title">이용기간</span>
						<select class="select3"  name="use_week" id="use_week" class="info_hp1" style="height:35px; background:#ffffff;width:182px;color:#A9A9A9;">
							<option value="">이용기간</option>
							<option value="1주"<%=fncSetSelectBox("1주",MS_PERIOD)%>>1주</option>
							<option value="2주"<%=fncSetSelectBox("2주",MS_PERIOD)%>>2주</option>
							<option value="3주"<%=fncSetSelectBox("3주",MS_PERIOD)%>>3주</option>
							<option value="4주"<%=fncSetSelectBox("4주",MS_PERIOD)%>>4주</option>
							<option value="6주"<%=fncSetSelectBox("6주",MS_PERIOD)%>>6주</option>
							<option value="8주"<%=fncSetSelectBox("8주",MS_PERIOD)%>>8주</option>
						</select> 
					</div>
 					<div class="input">
					<span class="input2_title">이용형태</span>
						<select class="select3"  name="use_type" id="use_type" class="info_hp1" style="height:35px; background:#ffffff;width:182px;color:#A9A9A9;" >
							<option value="">이용형태</option>
							<option value="입주 + 5일"<%=fncSetSelectBox("입주 + 5일",MS_TYPE)%>>입주+5일</option>
							<option value="입주 + 6일"<%=fncSetSelectBox("입주 + 6일",MS_TYPE)%>>입주+6일</option>
							<option value="출퇴근 + 5일"<%=fncSetSelectBox("출퇴근 + 5일",MS_TYPE)%>>출퇴근+5일</option>
							<option value="출퇴근 + 6일"<%=fncSetSelectBox("출퇴근 + 6일",MS_TYPE)%>>출퇴근+6일</option>
							<option value="출퇴근 + 입주 + 5일"<%=fncSetSelectBox("출퇴근 + 입주 + 5일",MS_TYPE)%>>출퇴근+입주+5일</option>
							<option value="출퇴근 + 입주 + 6일"<%=fncSetSelectBox("출퇴근 + 입주 + 6일",MS_TYPE)%>>출퇴근+입주+6일</option>
						</select> 
					</div>
					<div class="input">
						<span class="input2_title">출산예정일</span> <input type="text" id="datepicker" name="childbirth" placeholder="날짜를 선택하세요" style="width:181px;height:35px;border:1px solid #A9A9A9;" value="<%=childbirth_ymd%>" readonly/> 
					</div>
					<div class="input">
						<span class="input2_title">서비스희망일</span> <input type="text" id="datepicker1" name="serviceSdt" placeholder="날짜를 선택하세요" style="width:181px;height:35px;border:1px solid #A9A9A9;" value="<%=serviceSdt_ymd%>" readonly/> 
					</div>
					<div class="input">
					<span class="input2_title">지점선택</span>
						<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;width:110px;background:#ffffff;color:#A9A9A9;">
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
					<select id="part" name="part"  onChange="fncSetImg(this.value);" class="textarea" style="height:35px;width:68px;background:#ffffff;color:#A9A9A9;">
						<option value="">지점</option> 
					</select> 
					</div> 

 
					<div id="img_id" style="margin:10px 0 10px 0;"> 
						 
					</div>
 
					<!-- <div class="input" id="code_1" style="display:none;">
					본사
					</div>
					<div class="input" id="code_1001" style="display:none;">
					양천
					</div> -->

					<div class="input">
							<span class="input2_title">조리원</span> <input type="radio" name="radio3" id="radio3" value="이용함"  <%=fncSetCheckBox("이용함",MS_CLINIC)%> /> 이용함 
							<span style="margin-left:20px;"></span><input type="radio" name="radio3" id="radio3" value="이용안함"  <%=fncSetCheckBox("이용안함",MS_CLINIC)%> /> 이용안함 
					</div>
					<div class="input">
						 <span class="input2_title">출산경험</span> <input type="radio" name="exp_baby" id="exp_baby" value="초산모"  <%=fncSetCheckBox("초산모",MS_EXPER)%> /> 초산모 
								<span style="margin-left:20px;"></span><input type="radio" name="exp_baby" id="exp_baby" value="경산모"  <%=fncSetCheckBox("경산모",MS_EXPER)%> /> 경산모 
					</div>
					<div class="input">
						 <span class="input2_title">특이사항</span> <input type="radio" name="unique_check" id="unique_check" value="없음"  <% If MS_UNIQUE <> "" Then %>checked<% End If %> /> 없음 
								<span style="margin-left:20px;"></span><input type="radio" name="unique_check" id="unique_check" value="있음" <%If InStr(MS_UNIQUE,"쌍둥이") > 0 or InStr(MS_UNIQUE,"임신성 당뇨") > 0 or InStr(MS_UNIQUE,"부종") > 0 or InStr(MS_UNIQUE,"고혈압") > 0  Then %>checked<% End If %>/> 있음 
						<div id="view_3" style="display:block;margin-left:105px;" >
								<input type="checkbox" name="unique_1" id="unique_1" value="쌍둥이"		<%If InStr(MS_UNIQUE,"쌍둥이") > 0		Then %>checked<%End If%> /> 쌍둥이 
								<input type="checkbox" name="unique_1" id="unique_3" value="임신성 당뇨"	<%If InStr(MS_UNIQUE,"임신성 당뇨") > 0		Then %>checked<%End If%> /> 임신성 당뇨 <br>
								<input type="checkbox" name="unique_1" id="unique_2" value="부종"			<%If InStr(MS_UNIQUE,"부종") > 0  		Then %>checked<%End If%> /> 부종 
								<input type="checkbox" name="unique_1" id="unique_4" value="고혈압"		<%If InStr(MS_UNIQUE,"고혈압") > 0		Then %>checked<%End If%> /> 고혈압
						</div>
					</div>
					<div class="input">
						 <span class="input2_title">가족사항</span>
						  
							<input type="checkbox" name="fam1" id="fam1" value="부모님"			<%If InStr(MS_FAMILY,"부모님") > 0 Then%>checked<%End If%> /> 부모님 
							<input type="checkbox" name="fam1" id="fam3" value="큰아이 1명"		<%If InStr(MS_FAMILY,"큰아이 1명") > 0 Then%>checked<%End If%> /> 큰아이 1명 
							<input type="checkbox" name="fam1" id="fam2" value="남편"			<%If InStr(MS_FAMILY,"남편") > 0 Then%>checked<%End If%> /> 남편
						<div id="view_3" style="display:block;margin-left:105px;" >
							<input type="checkbox" name="fam1" id="fam4" value="큰아이 2명이상" <%If InStr(MS_FAMILY,"큰아이 2명이상") > 0 Then%>checked<%End If%>/> 큰아이 2명이상
							<input type="checkbox" name="fam1" id="fam5" value="기타가족"		<%If InStr(MS_FAMILY,"기타가족") > 0 Then%>checked<%End If%>/> 기타가족 
						</div>
						 
					</div>
					<div class="join_box_02_sub">
						 <span class="input2_title">입원병원정보</span> <input type="text" id="datepicker2" name="hospital_date" value="<%=hospital_date_ymd%>" class="setting_in_text_5" placeholder="입원날짜를 입력하세요" style="border:1px solid #A9A9A9;"> 
					</div>
					<div class="join_box_01_sub">
						<div id="view_3" style="display:block;margin-left:105px;" >
							<input type="text" name="hospital_post" id="hospital_post" class="setting_in_text_022" value="<%=hospital_post%>"  placeholder="우편번호"  style=" border:1px solid #A9A9A9;"/> 
							<input type="button" name="post_btn" id="post_btn" style="height:35px; vertical-align: top;" class="setting_btn1" value="주소찾기" />
						</div>
					</div> 
					<div class="join_box_02_sub">
						<div id="view_3" style="display:block;margin-left:105px;" >
							<input type="text" name="hospital_address1" id="hospital_address1" class="setting_in_text_5" style="" value="<%=hospital_address1%>" placeholder="주소를입력하세요"/> 
						</div>
					</div> 

					<div class="join_box_01_sub">
						<span class="input2_title">상담내용</span>  
						<div style="text-align:center;">
							<textarea rows="10" cols="5" class="textarea_01" name="contents" style="width:100%;" placeholder="내용입력"><%=MS_CONTENT%></textarea>
						</div> 
					</div>

				<div class="input2">
					<span class="input2_title">생년월일</span>
					<input type="text" id="datepicker3" name="birth" style="height:35px;" value="<%=birth_ymd%>" placeholder="생년월일을 입력하세요." readonly> 
				</div>

				<div class="input2">
					<span class="input2_title">성별</span>
					<input type="radio" name="gender" id="gender1" value="1" <%If InStr(MS_SEX,"1") > 0 Then%>checked<%End If%> /> 남자
					<input type="radio" name="gender" id="gender2" value="2" <%If InStr(MS_SEX,"2") > 0 Then%>checked<%End If%> /> 여자
				</div> 
				<%
					If MS_HP <> "" Then 
					arrHp = Split(MS_HP,"-")
				%>
				<div class="input">
					<span class="input2_title">휴대폰</span>
					<select name="hp1" id="hp1" style="height:35px; background:#ffffff;color:#A9A9A9;">
						<option value="">선택</option>
						<option value="010"<%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011"<%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016"<%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017"<%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018"<%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019"<%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					<input type="text" name="hp2" id="hp2" style="height:35px;" value="<%=arrHp(1)%>" maxlength="4" class="input_033" placeholder="휴대폰" />
					<input type="text" name="hp3" id="hp3" style="height:35px;" value="<%=arrHp(2)%>" maxlength="4" class="input_033" placeholder="휴대폰" />
				</div>  
				<%else%>
				<div class="input2">
					<span class="input2_title">휴대폰</span>
					<select  name="hp1" id="hp1" style="width:55px;height:35px; background:#ffffff;color:#A9A9A9;">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="hp2" id="hp2" style="width:60px;height:35px;" value="" maxlength="4" class="input_033" placeholder="휴대폰" />
					<input type="text" name="hp3" id="hp3" style="width:60px;height:35px;" value="" maxlength="4" class="input_033" placeholder="휴대폰" />
				</div>  
				<%End if%>

				<div class="input2">
<%If mode = "ins" Then %>			
			
					<div>
						<span class="input2_title2">-생년월일 수집 및 이용동의</span>
						<span><input type="radio" name="agree_ch_1" id="agree_ch_1" value="Y" <%If InStr(MS_AGREE1,"Y") > 0 Then%>checked<%End If%>  /> 동의 
							  <!-- <input type="radio" name="agree_ch_1" id="agree_ch_1" value="N" <%If InStr(MS_AGREE1,"N") > 0 Then%>checked<%End If%> /> 미동의</span> -->
					</div>
					<div>
						<span class="input2_title2">-성별 수집 및 이용동의</span>
						<span><input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y" <%If InStr(MS_AGREE2,"Y") > 0 Then%>checked<%End If%> /> 동의 
							  <!-- <input type="radio" name="agree_ch_2" id="agree_ch_2" value="N" <%If InStr(MS_AGREE2,"N") > 0 Then%>checked<%End If%> /> 미동의</span> -->
					</div>
					<div>
						<span class="input2_title2">-이메일 마케팅 수신동의</span>
						<span><input type="radio" name="agree_ch_3" id="agree_ch_3" value="Y" <%If InStr(MS_AGREE3,"Y") > 0 Then%>checked<%End If%> /> 동의 
							  <!-- <input type="radio" name="agree_ch_3" id="agree_ch_3" value="N" <%If InStr(MS_AGREE3,"N") > 0 Then%>checked<%End If%> /> 미동의</span> -->
					</div>
					<div>
						<span class="input2_title2">-휴대폰 마케팅 수신동의</span>
						<span><input type="radio" name="agree_ch_4" id="agree_ch_4" value="Y" <%If InStr(MS_AGREE4,"Y") > 0 Then%>checked<%End If%> /> 동의 
							  <!-- <input type="radio" name="agree_ch_4" id="agree_ch_4" value="N" <%If InStr(MS_AGREE4,"N") > 0 Then%>checked<%End If%> /> 미동의</span> -->
					</div>
					<div>
						<span class="input2_title2">-개인정보 유효기간 3년지정<br/>(미동의시 1년)</span>
						<span><input type="radio" name="agree_ch_5" id="agree_ch_5" value="Y" <%If InStr(MS_AGREE5,"Y") > 0 Then%>checked<%End If%> /> 동의 
							  <!-- <input type="radio" name="agree_ch_5" id="agree_ch_5" value="N" <%If InStr(MS_AGREE5,"N") > 0 Then%>checked<%End If%> /> 미동의</span> -->
					</div>
					<div class="input2" style="text-align:right;">
						<input type="checkbox" name="check_all" id="check_all" /> 선택항목 전체동의
					</div>
		</div>
					<div class="input2">
						<span class="input2_title2 fb">개인정보 수집 및 이용</span>
					</div>

					<table class="table table-bordered tb">
						<tbody>
							<tr>
								<td class="td1">구분</td>
								<td class="td2">선택</td>
							</tr>
							<tr>
								<td class="td1">목적</td>
								<td class="td2">맞춤정보 제공, 마케팅</td>
							</tr>
							<tr>
								<td class="td1">항목</td>
								<td class="td2">성별, 생년월일, 휴대폰번호</td>
							</tr>
							<tr>
								<td class="td1">보유기간</td>
								<td class="td2">회원탈퇴 후 5일까지</td>
							</tr>
						</tbody>
					</table>
				</div> 
<%End if%>
				<div>
					<input type="submit" value="상담신청하기" id="join_btn" class="btn-block join_btn">
				</div>
		  </form>
		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
    </div><!-- /.container -->

  </body>
  
<script src="js/leftmenu.js"></script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript" charset="euc-kr">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax_app.asp?local="+val+"&localCd="+cd,"#part");
	}


	function fncSetImg(val,cd){
		fncAxListHtml("/common/inc/local_ax_mobile.asp?part="+$("#part").val(),"#img_id");
	}

 
	fncSetPart("<%=local_nm%>","<%=md_local%>");


/*	
	if ( $("#part").val() != "") {
			alert($("#part").val());
	}
*/
 
 
 
</script>
<!-- 달력추가 시작-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<!-- 달력 -->
   <script type="text/javascript"> 


			


		var join_btn = jQuery("#join_btn");
 
 
		join_btn.click(function(){
			
			/*
			if ($.trim(jQuery("#user_id").val()) == "") {
					alert("아이디를 입력하세요");
					$('#user_id').focus();
					return false;
			 
			}else{
				var email_id = jQuery("#user_id").val();
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  

				if(regex.test(email_id) === false) {  
					alert("잘못된 이메일 형식입니다.");
					$('#user_id').focus();
					return false;  
				} else {  
					//alert('ok');
				}  

			}

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

 

			if ($.trim(jQuery("#user_name").val()) == "") {
				 
					alert("이름을 입력하세요");
					$('#user_name').focus();
					return false;
			} 
 
			if ($('input:checkbox[id="over14_agree1"]').is(":checked") == false) {
						 
					alert("만14세이상 동의하기를 체크하세요");
					$('#over14_agree1').focus();
					return false;
			}
			if ($('input:checkbox[id="agree2"]').is(":checked") == false) {
						 
					alert("이용약관 동의하기를 체크하세요");
					$('#agree2').focus();
					return false;
			}
			if ($('input:checkbox[id="person_data_agree3"]').is(":checked") == false) {
						 
					alert("개인정보 수집 및 이용동의를 체크하세요");
					$('#person_data_agree3').focus();
					return false;
			}

			if(jQuery("#idCheck").val() == "N"){
			//	alert("아이디 중복 체크를 확인해주세요");
				$("#id_ment").show();
				$('#over_chk_btn').focus();
				return false;
			}

*/


			
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



        });


     
		function check_id(){

			var form = document.join_fm;
		 
			var id_chk = form.user_id.value;
			if(id_chk == ""){
				alert("아이디를 입력해주세요");
				$('#user_id').focus();
			}else{
				var email_id = jQuery("#user_id").val();
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  

				if(regex.test(email_id) === false) {  
					alert("잘못된 이메일 형식입니다.");
					$('#user_id').focus();
					return false;  
				} else {  
					//alert('ok');
				}

				jQuery.post("./id_check.asp",{"user_id":$("#user_id").val()},function(data,testStatus){
 //console.log(data);
				if (data == 0) {
						//console.log("data1");
						alert("사용할 수 있는 아이디 입니다..");
						jQuery("#idCheck").val("Y");
					
					} else {
						alert('중복된 아이디입니다. 다른아이디를 선택하세요.');
					}
			}); 
			//	window.open('id_check.php?user_id='+id_chk, 'CheckWindow', 'width=400,height=200,toolbar=no,status=no,resizable=no'); 
			//	jQuery("#idCheck").val("Y");
			}
		} 


		$(document).ready(function(){
 

			//최상단 체크박스 클릭
			$("#check_all").click(function(){
				//클릭되었으면
				if($("#check_all").prop("checked")){
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input:radio[name='agree_ch_1']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_2']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_3']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_4']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_5']:radio[value='Y']").prop("checked",true);
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input:radio[name='agree_ch_1']").removeAttr("checked");
					$("input:radio[name='agree_ch_2']").removeAttr("checked");
					$("input:radio[name='agree_ch_3']").removeAttr("checked");
					$("input:radio[name='agree_ch_4']").removeAttr("checked");
					$("input:radio[name='agree_ch_5']").removeAttr("checked");
				}
			});

			
			$("#sanmo_name").click(function(){
				//클릭되었으면
				if($("#sanmo_name").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
					$("#customer_nm").val($("#user_name").val()); 
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
  
					$("#customer_nm").val(""); 
				}
					 
			});


  
		 
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
			$( "#datepicker3" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 




		});
	</script>

</html>
