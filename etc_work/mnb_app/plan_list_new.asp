<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual = "/etc_work/mnb_app/fnc.asp"-->
 
<%
	uId	= Trim(fncRequestCookie("uid"))'회원 아이디 

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
 
	strSql1 = ""
	strSql1 = strSql1 & " SELECT  *  "
	strSql1 = strSql1 & " from  MO_RESERVATION    " 
	strSql1 = strSql1 & " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& uId &"' order by mr_idx desc "

	Set Rs = DBExec(strSql1, "main")
	
	Dim service_contract_check

	If Rs.Eof Then
		service_contract_check = "F"
	Else
		service_contract_check = "T"

		mr_idx = Rs("MR_IDX")

		childbirth = Rs("MR_CHILDBIRTH")
		childbirth_diff = 280 - DateDiff("D", Date(), dateConvert1(childbirth))
		childbirth_week = childbirth_diff / 7

		nm = Rs("MR_MEM_NM")
		mem_id = Rs("MR_MEM_ID")
		service_name = Rs("MR_SERVICE")
		service_period = Rs("MR_PERIOD")
		service_type = Rs("MR_TYPE")

		servicesdt = Rs("MR_SERVICESDT")
		serivce_start_diff = DateDiff("D", Date(), dateConvert1(servicesdt))
		serviceedt = Rs("MR_SERVICEEDT")
		serivce_end_diff = DateDiff("D", Date(), dateConvert1(serviceedt))

		payment = Rs("MR_PAY_MENT")

		payment_res_dt = Rs("MR_RES_PAY_MENT_DT")

		payment_state = Rs("MR_PAY_STATE")

		If payment_state = "" Then
			payment_state = "결제진행중"
		End If

		If payment_state = "결제완료" Then
			payment_dt = Rs("MR_PAY_DT")
			payment_state = payment_state & " (" & dateConvert2(payment_dt) & ")"
		End If

		gift_choice = Rs("MR_GIFT_CHOICE")
		gift_choice_baby = Rs("MR_GIFT_CHOICE_BABY")

		add_service_sdt1 = Rs("MR_SERVICESDT1")
		add_service_edt1 = Rs("MR_SERVICEEDT1")

		If add_service_sdt1 <> "" Then
			add_service_diff1 = DateDiff("D", dateConvert1(add_service_sdt1), dateConvert1(add_service_edt1))
		End If

		add_service_pay1 = Rs("MR_ADD1_PAY")

		add_service_sdt2 = Rs("MR_SERVICESDT2")
		add_service_edt2 = Rs("MR_SERVICEEDT2")

		If add_service_sdt2 <> "" Then
			add_service_diff2 = DateDiff("D", dateConvert1(add_service_sdt2), dateConvert1(add_service_edt2))
		End If

		add_service_pay2 = Rs("MR_ADD2_PAY")

		add_service_sdt3 = Rs("MR_SERVICESDT3")
		add_service_edt3 = Rs("MR_SERVICEEDT3")

		If add_service_sdt3 <> "" Then
			add_service_diff3 = DateDiff("D", dateConvert1(add_service_sdt3), dateConvert1(add_service_edt3))
		End If

		add_service_pay3 = Rs("MR_ADD3_PAY")

		reg_dt = Replace(Left(Rs("MR_REG_DT"), 10), "-", "")
		pay_type = Rs("MR_PAY_TYPE")
		content = Rs("MR_CONTENT")

		product_choice_1 = Rs("MR_PRODUCT_CHOICE_1")
		product_choice_2 = Rs("MR_PRODUCT_CHOICE_2")
		product_choice_week = Rs("MR_PRODUCT_CHOICE_WEEK")
		product_choice_price = Rs("MR_PRODUCT_CHOICE_PRICE")
		product_out_day = Rs("MR_PRODUCT_OUT_DAY")

		care_place = Rs("MR_CARE_PLACE")
		care_place_post = Rs("MR_CARE_PLACE_POST")
		care_place_addr1 = Rs("MR_CARE_PLACE_ADDR1")
		care_place_addr2 = Rs("MR_CARE_PLACE_ADDR2")

		clinic_date = Rs("MR_CLINIC_DATE")
		clinic_period = Rs("MR_CLINIC_PERIOD")

		childbirth_form = Rs("MR_CHILDBIRTH_FORM")
		breast_feeding = Rs("MR_BREAST_FEEDING")
		exper = Rs("MR_EXPER")
	End If

	Call RSClose(Rs)

	'출산선물
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT where MD_GIFT_SEQ = '"& gift_choice &"' "
 
	Set Rs = DBExec(strSql, "main")

	If Not Rs.EOf Then 
		gift_name = Rs("MD_GIFT_NAME")

		If gift_choice_baby = "Y" Then
			gift_name = gift_name & " / 폴스베이비"
		End If
	End If

	If gift_name = "" And gift_choice_baby = "Y" Then
		gift_name = "폴스베이비"
	End If
	
	Call RSClose(Rs)
	
	'회원정보
	strSql1 = "SELECT * FROM  MO_MEM_MAS A, MO_MEM_DTL B, MO_COMM_CD C WHERE A.MM_MEM_ID = B.MD_MEM_ID AND B.MD_LOCAL = C.CC_COMM_CD AND A.MM_MEM_ID = '"& uId &"'"

	Set Rs = DBExec(strSql1, "main")

	If Rs.Eof Then
	Else
		cc_kor_nm = Rs("CC_KOR_NM")
		cc_comm_tel = Rs("CC_COMM_TEL")
		cc_comm_fax = Rs("CC_COMM_FAX")
		cc_comm_account_bank = Rs("CC_COMM_ACCOUNT_BANK")
		cc_comm_account_name = Rs("CC_COMM_ACCOUNT_NAME")
	End If

	Call RSClose(Rs)

	'산후도우미
	strSql = "SELECT MD_HELPER_NAME, MD_HELPER_HP, MD_HELPER_INSURANCE_FLG, MD_HELPER_HEALTH FROM MO_HELPER_SERVICE A, MO_HELPER B WHERE A.MD_HELPER_SEQ = B.MD_HELPER_SEQ AND A.MR_IDX = '" & mr_idx & "'"

	Set Rs = DBExec(strSql, "main")

	If Not Rs.EOf Then
		helper_name = Rs("MD_HELPER_NAME")
		helper_hp = Rs("MD_HELPER_HP")
		helper_insurance = Rs("MD_HELPER_INSURANCE_FLG")
		helper_helath = Rs("MD_HELPER_HEALTH")
	End If

	Call RSClose(Rs)

	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
	Now_y = Now_arr(0)
	Now_m = Now_arr(1)
	Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d

	'-------일정카드 사용자 확인 부분 날짜 등등-----------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " ;SELECT  *  FROM  MO_APP_MY_DATA_CHECK  where MR_IDX =  '"& mr_idx &"' AND MS_CHECK_NAME NOT IN ('bodycare', 'nurse_visit', 'mom_milk_analysis', 'sodok', 'mom_milk_msg', 'add_pay1', 'add_pay2', 'add_pay3') order by  MS_CHECK_DATE  desc "

	Set Rs = DBExec(strSql,"main")

	Do Until Rs.Eof
		check_name = Rs("MS_CHECK_NAME")
		check_date = Rs("MS_CHECK_DATE")

		If check_name = "address" Then
			address_check = "Y"
		ElseIf check_name = "gift" Then
			gift_check = "Y"
		ElseIf check_name = "service" Then
			service_check = "Y"
		ElseIf check_name = "helper" Then
			helper_check = "Y"
		ElseIf check_name = "helper_visit" Then
			helper_visit_check = "Y"
		ElseIf check_name = "bodycare" Then
			bodycare_check = "Y"
		ElseIf check_name = "nurse_visit" Then
			nurse_visit_check = "Y"
		ElseIf check_name = "mom_milk_analysis" Then
			mom_milk_analysis_check = "Y"
		ElseIf check_name = "sodok" Then
			sodok_check = "Y"
		ElseIf check_name = "mom_milk_msg" Then
			mom_milk_msg_check = "Y"
		ElseIf check_name = "add_service1" Then
			add_service1_check = "Y"
		ElseIf check_name = "add_service2" Then
			add_service2_check = "Y"
		ElseIf check_name = "add_service3" Then
			add_service3_check = "Y"
		ElseIf check_name = "pay" Then
			pay_check = "Y"
		ElseIf check_name = "add_pay1" Then
			add_pay1_check = "Y"
		ElseIf check_name = "add_pay2" Then
			add_pay2_check = "Y"
		ElseIf check_name = "add_pay3" Then
			add_pay3_check = "Y"
		ElseIf check_name = "premium_service" Then
			premium_service_check = "Y"
		End If
	i = i + 1
	Rs.MoveNext
	Loop
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
    <link href="css/style.css" rel="stylesheet">
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
	 <script src="js/jquery.raty.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#service-detail").click(function() {
				window.location.href = "service_info_list.asp";
			});

			$(".plan-card-confirm").each(function() {
				$(this).click(function() {
					var id = $(this).attr("id");
					
					confirm_update(id);
				});
			});
		});

		function confirm_update(val) {
			//if (confirm("내용을 확인하셨습니까?\n확인 후에는 마이 마더앤베이비에서 확인 가능합니다.")) {
				jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":val},function(data,testStatus){
					if (data == 1) {	
					} else {
						alert("확인한 정보는 마이마더앤베이비 메뉴에서 다시볼수 있습니다.");
						location.reload();
					}
				});
			//}
		}
	</script>
</head>
<body style="background-color:#dfdfdf;">
<html>
<body>
	<!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->

	<div class="container">
		<% If uId <> "" Then %>
		<div class="plan-card">
			<div class="plan-card-title">정보확인</div>
			<div class="plan-card-content">서비스 제공을 위한 정보설정</div>
			<div class="plan-card-line"></div>
			<div class="plan-card-desc">
				<% If care_place <> "" Then %>
					<div style="font-weight:bold; font-size:14pt; margin-bottom:20px;"><%=nm%> 고객님</div>
					<div style="font-weight:bold; font-size:13pt;">가입프로그램</div>
					&nbsp;&nbsp;&nbsp;&nbsp;- <%=nm%> 고객님 서비스정보<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- <%=service_name%> / <%=service_type%> / <%=service_period%><br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- <%=dateConvert2(servicesdt)%> 시작예정<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;- <%=dateConvert2(serviceedt)%> 종료예정<br/><br/>

					<span style="font-weight:bold; font-size:13pt;">지점</span>&nbsp;&nbsp;<%=cc_kor_nm%><br/><br/>
					<span style="font-weight:bold; font-size:13pt;">산후조리장소</span>&nbsp;&nbsp;<%=care_place%>
				<% Else %>
					정확한 서비스를 제공하기 위해 필요한 정보입니다.
				<% End If %>
			</div>
			<div class="plan-card-btn" data-toggle="modal" <% If care_place <> "" Then %> data-target="#infoDetailModal" <% Else %> data-target="#infoModal" <% End If %>>자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
		</div>
		<% End If %>

		<% If service_contract_check = "F" Or uId = "" Then %>
			<div class="plan-card">
				<div class="plan-card-title">서비스정보</div>
				<div class="plan-card-content">서비스 프로그램 정보</div>
				<div class="plan-card-line"></div>
				<div class="plan-card-desc">
					마더앤베이비의 서비스 프로그램 정보입니다.
				</div>
				<div class="plan-card-btn" id="service-detail">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
			</div>
		<% End If %>

		
		<% If service_contract_check = "T" Then %>
			<div class="plan-card">
				<div class="plan-card-title">서비스정보</div>
				<div class="plan-card-content"><%=nm%>고객님 서비스정보</div>
				<div class="plan-card-line"></div>
				<div class="plan-card-desc">
					<%=service_name%> / <%=service_period%> / <%=service_type%><br/>
					<%=dateConvert2(servicesdt)%> 시작<br/>
					<%=dateConvert2(serviceedt)%> 종료
				</div>
				<div class="plan-card-btn" data-toggle="modal" data-target="#serviceModal">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
			</div>
			
			<% If cc_kor_nm <> "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">지점안내</div>
					<div class="plan-card-content">마더앤베이비 서비스제공지점 안내</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						지점: <%=cc_kor_nm%><br/>
						전화번호: <%=cc_comm_tel%><br/>
						팩스: <%=cc_comm_fax%><br/>
						계좌안내<br/>
						- 계좌번호: <%=cc_comm_account_bank%><br/>
						- 예금주: <%=cc_comm_account_name%>
					</div>
					<a href="tel:<%=cc_comm_tel%>"><div class="plan-card-btn">통화하기</div></a>
				</div>
			<% End If %>

			<div class="plan-card">
				<div class="plan-card-title">결제알림</div>
				<div class="plan-card-content"><%=nm%>고객님의 결제정보 안내</div>
				<div class="plan-card-line"></div>
				<div class="plan-card-desc">
					<% If payment_res_dt <> "" Then %>
						계약금 : <%=dateConvert2(payment_res_dt)%> (<%=numberFormatConvert(payment)%>원) 입금완료<br/>
					<% Else %>
						계약금 : 결제진행중<br/>
					<% End If %>
					잔금: <%=payment_state%><br/>

					<% If add_service_sdt1 = "" Then %>
						연장금: 시간초과 및 주말근무시 추가요금이 발생합니다.
					<% Else %>
						<% If add_service_sdt2 = "" Then %>
							연장금: <%=numberFormatConvert(add_service_pay1)%>원
						<% Else %>
							1차 연장금: <%=numberFormatConvert(add_service_pay1)%>원
							<br/>2차 연장금: <%=numberFormatConvert(add_service_pay2)%>원
							<% If add_service_sdt3 <> "" Then %>
								<br/>3차 연장금: <%=numberFormatConvert(add_service_pay3)%>원
							<% End If %>
						<% End If %>
					<% End If %>
				</div>
				<!-- <div class="plan-card-btn">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div> -->
			</div>

			<div class="plan-card">
				<div class="plan-card-title">대여알림</div>
				<div class="plan-card-content">산후조리용품 대여</div>
				<div class="plan-card-line"></div>
				<div class="plan-card-desc">
					<% If product_choice_1 <> "" Then %>
						<%=product_choice_1%><br/>
					<% End If %>

					<% If product_choice_2 <> "" Then %>
						<%=product_choice_2%><br/>
					<% End If %>

					<% If product_choice_week <> "" Then %>
						대여기간 <%=product_choice_week%>주<br/>
					<% End If %>

					<% If product_choice_1 = "" And product_choice_2 = "" Then %>
						산모님의 빠른 회복을 돕기 위한 용품을 대여해 드립니다.
					<% End If %>
				</div>
				<div class="plan-card-btn" data-toggle="modal" data-target="#rentModal">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
			</div>

			<% If gift_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">출산선물</div>
					<div class="plan-card-content">출산선물을 드립니다.</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<% If gift_name = "" Then %>
							출산선물을 선택하세요
						<% Else %>
							<%=gift_name%>
						<% End If %>
					</div>
					<% If gift_name = "" Then %>
						<div class="plan-card-btn" data-toggle="modal" data-target="#giftModal">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
					<% Else %>
						<div class="plan-card-btn plan-card-confirm" id="gift">확인</div>
					<% End If %>
				</div>
			<% End If %>

			<% If serivce_start_diff <= 1 And helper_visit_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">스케쥴 알림</div>
					<div class="plan-card-content">관리사 방문예정</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<%=dateConvert2(servicesdt)%>
						<% If care_place <> "" Then %>
							<br/>방문장소: <%=care_place%>
						<% End If %>
					</div>
					<div class="plan-card-btn plan-card-confirm" id="helper_visit">확인</div>
				</div>
			<% End If %>

			<% If serivce_start_diff <= 0 And helper_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">산후도우미</div>
					<div class="plan-card-content"><%=helper_name%> 관리사님</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						연락처: <a href="tel:<%=helper_hp%>"><%=helper_hp%></a><br/>

						<% If helper_helath = "Y" Then %>
						<div class="plan-card-care">건강진단완료</div>
						<% End If %>

						<% If helper_insurance = "Y" Then %>
						<div class="plan-card-care">배상보험 가입완료</div>
						<% End If %>
					</div>
					<div class="plan-card-btn plan-card-confirm" id="helper">확인</div>
				</div>
			<% End If %>
			
			<% If add_service_sdt1 <> "" And add_service1_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">1차 연장알림</div>
					<div class="plan-card-content">서비스연장정보를 확인하세요</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<%=service_name%>&nbsp;<%=add_service_diff1%>일 연장<br/>
						<%=dateConvert2(add_service_sdt1)%> 시작<br/>
						<%=dateConvert2(add_service_edt1)%> 종료
					</div>
					<div class="plan-card-btn plan-card-confirm" id="add_service1">확인</div>
				</div>
			<% End If %>

			<% If add_service_sdt2 <> "" And add_service2_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">2차 연장알림</div>
					<div class="plan-card-content">서비스연장정보를 확인하세요</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<%=service_name%>&nbsp;<%=add_service_diff2%>일 연장<br/>
						<%=dateConvert2(add_service_sdt2)%> 시작<br/>
						<%=dateConvert2(add_service_edt2)%> 종료
					</div>
					<div class="plan-card-btn plan-card-confirm" id="add_service2">확인</div>
				</div>
			<% End If %>

			<% If add_service_sdt3 <> "" And add_service3_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">3차 연장알림</div>
					<div class="plan-card-content">서비스연장정보를 확인하세요</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<%=service_name%>&nbsp;<%=add_service_diff3%>일 연장<br/>
						<%=dateConvert2(add_service_sdt3)%> 시작<br/>
						<%=dateConvert2(add_service_edt3)%> 종료
					</div>
					<div class="plan-card-btn plan-card-confirm" id="add_service3">확인</div>
				</div>
			<% End If %>
			
			<% If childbirth_week >= 36 And (service_name = "프라이빗" Or service_name = "다둥이" Or service_name = "워킹맘" Or service_name = "과체중" Or service_name = "35세이상" Or service_name = "산후조리원을 내집") And premium_service_check = "" Then %>
				<div class="plan-card">
					<div class="plan-card-title">스케쥴 알림</div>
					<div class="plan-card-content">고객님을 위한 케어서비스 안내</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						<%=serviceCount(service_name&service_period, "전담간호사 방문서비스")%><br/>
						<%=serviceCount(service_name&service_period, "산전/산후 바디케어")%><br/>
						<% If service_name = "다둥이" Then %>
						<%=serviceCount(service_name&service_period, "모유수유마사지")%><br/>
						<% End If %>
						<%=serviceCount(service_name&service_period, "모유성분 분석서비스")%><br/>
						<%=serviceCount(service_name&service_period, "아기맞이 소독서비스")%><br/>
						예정되어 있습니다.<br/>
						스케줄 조정을 위해 연락 부탁드립니다.<a href="tel:02-557-3579"><img src="img/nav_call.png" /></a>
					</div>
					<div class="plan-card-btn plan-card-confirm" id="premium_service">확인</div>
				</div>
			<% End If %>

			<% If serivce_end_diff <= 0 Then %>
				<div class="plan-card">
					<div class="plan-card-title">만족도조사</div>
					<div class="plan-card-content">만족도조사 설문</div>
					<div class="plan-card-line"></div>
					<div class="plan-card-desc">
						서비스 만족도조사를 위해 설문이 필요합니다.
					</div>
					<div class="plan-card-btn" data-toggle="modal" data-target="#satisfactionModal">자세히보기 <span class="arrow"><img src="img/nav_white_bt.png" /></span></div>
				</div>
			<% End If %>
		<% End If %>
	</div>

	<!-- #include virtual = "/etc_work/mnb_app/footer.asp" -->

	<!-- #include virtual = "/etc_work/mnb_app/plan_pop.asp" -->

	<script src="js/leftmenu.js"></script>
</body>
</html>