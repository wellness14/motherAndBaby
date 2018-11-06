<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual = "/etc_work/mnb_app/fnc.asp"-->

<%
	uId	= Trim(fncRequestCookie("uid"))'회원 아이디 

	If uId = "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/login.asp"
	End If

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
 
	strSql1 = ""
	strSql1 = strSql1 & " SELECT  *  "
	strSql1 = strSql1 & " from  MO_RESERVATION    " 
	strSql1 = strSql1 & " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& uId &"' order by mr_idx desc "

	Set Rs = DBExec(strSql1, "main")
	
	Dim service_check

	If Rs.Eof Then
		service_check = "F"
		mr_idx = "-1"
	Else
		service_check = "T"

		mr_idx = Rs("MR_IDX")

		childbirth = Rs("MR_CHILDBIRTH")
		childbirth_diff = 280 - DateDiff("D", Date(), dateConvert1(childbirth))
		childbirth_week = childbirth_diff / 7

		nm = Rs("MR_MEM_NM")
		addr1 = Rs("MR_ADDR1")
		addr2 = Rs("MR_ADDR2")
		hp = Rs("MR_HP")
		service_name = Rs("MR_SERVICE")
		service_period = Rs("MR_PERIOD")
		service_type = Rs("MR_TYPE")

		servicesdt = Rs("MR_SERVICESDT")
		serivce_start_diff = DateDiff("D", Date(), dateConvert1(servicesdt))
		serviceedt = Rs("MR_SERVICEEDT")

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
	
	'-------일정카드 사용자 확인 부분 날짜 등등-----------------------------------------------------------------------------
	strSql = ""
	strSql = strSql & " ;SELECT  *  FROM  MO_APP_MY_DATA_CHECK  where MR_IDX =  '"& mr_idx &"' AND MS_CHECK_NAME NOT IN ('bodycare', 'nurse_visit', 'mom_milk_analysis', 'sodok', 'mom_milk_msg', 'add_pay1', 'add_pay2', 'add_pay3') order by  MS_CHECK_DATE  desc "

	Set Rs = DBExec(strSql,"main")
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
	</script>
</head>

<body style="background-color:#c9c9c9;">
	<!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->

	<div class="container">
		<% If Rs.Eof Then %>
			<div style="background:#ffffff; height:200px; text-align:center; line-height:200px; font-weight:bold; font-size:15pt; border-radius:10px; color:#515151">마이 마더앤베이비 내역이 없습니다.</div>
		<% End If %>
		<%
			Dim i, total

			i = 1
			total = Rs.RecordCount

			Do Until Rs.Eof
				check_name = Rs("MS_CHECK_NAME")
				check_date = Rs("MS_CHECK_DATE")

				If check_name = "address" Then
					title = "서비스 제공을 위한 정보설정"
					content = addr1 & " " & addr2
					content = content & "<br/>" & hp
				ElseIf check_name = "gift" Then
					title = "출산선물"
					content = gift_name
				ElseIf check_name = "service" Then
					title = service_name & " / " & service_period & " / " & service_type
					content = dateConvert2(servicesdt) & " 시작<br/> " & dateConvert2(serviceedt) & " 종료"
				ElseIf check_name = "helper" Then
					title = helper_name & " 관리사님 방문예정"
					content = "연락처 <a href=""tel:" & helper_hp & """>" & helper_hp & "</a>"

					If helper_helath = "Y" Then
						content = content & "<div class=""plan-card-care"">건강진단완료</div>"
					End If

					If helper_insurance = "Y" Then
						content = content & "<div class=""plan-card-care"">배상보험 가입완료</div>"
					End If
				ElseIf check_name = "helper_visit" Then
					title = "관리사 방문예정"
					content = dateConvert2(servicesdt)
				ElseIf check_name = "bodycare" Then
					title = "서비스"
					content = ""
				ElseIf check_name = "nurse_visit" Then
					title = "서비스"
					content = ""
				ElseIf check_name = "mom_milk_analysis" Then
					title = "서비스"
					content = ""
				ElseIf check_name = "sodok" Then
					title = "서비스"
					content = ""
				ElseIf check_name = "mom_milk_msg" Then
					title = "서비스"
					content = ""
				ElseIf check_name = "add_service1" Then
					title = "서비스 연장알림"
					content = ""
					content = content & service_name & "&nbsp;" & add_service_diff1 & "일 연장<br/>"
					content = content & dateConvert2(add_service_sdt1) & " 시작<br/>"
					content = content & dateConvert2(add_service_edt1) & " 종료"
				ElseIf check_name = "add_service2" Then
					title = "서비스 연장알림"
					content = ""
					content = content & service_name & "&nbsp;" & add_service_diff2 & "일 연장<br/>"
					content = content & dateConvert2(add_service_sdt2) & " 시작<br/>"
					content = content & dateConvert2(add_service_edt2) & " 종료"
				ElseIf check_name = "add_service3" Then
					title = "서비스 연장알림"
					content = ""
					content = content & service_name & "&nbsp;" & add_service_diff3 & "일 연장<br/>"
					content = content & dateConvert2(add_service_sdt3) & " 시작<br/>"
					content = content & dateConvert2(add_service_edt3) & " 종료"
				ElseIf check_name = "pay" Then
					title = nm & "고객님의 결제정보 안내"
					content = ""

					If payment_res_dt <> "" Then
						content = content & "계약금 : " & dateConvert2(payment_res_dt) & "(" & numberFormatConvert(payment) & "원) 입금완료<br/>"
					Else
						content = content & "계약금 : 결제진행중<br/>"
					End If
					
					content = content & "잔금: " & payment_state & "<br/>"

					If add_service_sdt1 = "" Then
						content = content & "연장금: 시간초과 및 주말근무시 추가요금이 발생합니다."
					Else
						If add_service_sdt2 = "" Then
							content = content & "연장금: " & numberFormatConvert(add_service_pay1) & "원"
						Else
							content = content & "1차 연장금: " & numberFormatConvert(add_service_pay1) & "원"
							content = content & "<br/>2차 연장금: " & numberFormatConvert(add_service_pay2) & "원"
							If add_service_sdt3 <> "" Then
								content = content & "<br/>3차 연장금: " & numberFormatConvert(add_service_pay3) & "원"
							End If
						End If
					End If
				ElseIf check_name = "add_pay1" Then
					title = nm & "고객님의 결제정보 안내"
					content = ""
				ElseIf check_name = "add_pay2" Then
					title = nm & "고객님의 결제정보 안내"
					content = ""
				ElseIf check_name = "add_pay3" Then
					title = nm & "고객님의 결제정보 안내"
					content = ""
				ElseIf check_name = "premium_service" Then
					title = nm & "고객님을 위한 케어서비스 안내"
					content = ""
					content = serviceCount(service_name&service_period, "전담간호사 방문서비스") & "<br/>"
					content = content & serviceCount(service_name&service_period, "산전/산후 바디케어") & "<br/>"
					If service_name = "다둥이" Then
						content = content & serviceCount(service_name&service_period, "모유수유마사지") & "<br/>"
					End If
					content = content & serviceCount(service_name&service_period, "모유성분 분석서비스") & "<br/>"
					content = content & serviceCount(service_name&service_period, "아기맞이 소독서비스") & "<br/>"
					'content = content & "예정되어 있습니다.<br/>"
					'content = content & "스케줄 조정을 위해 연락 부탁드립니다.<a href=""tel:02-557-3579""><img src=""img/nav_call.png"" /></a>"
				End If
		%>
				<%=myMnb(i, total, check_name, title, content, check_date)%>
		<%
			i = i + 1
			Rs.MoveNext
			Loop

			Call RSClose(Rs)
		%>
	</div>
	
	<!-- #include virtual = "/etc_work/mnb_app/footer.asp" -->

	<script src="js/leftmenu.js"></script>

</body>
</html>