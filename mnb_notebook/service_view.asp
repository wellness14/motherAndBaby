<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 

<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	If uId = "" Then 
		Response.Redirect "http://mothernbaby.co.kr/mnb_notebook/login.asp"
	End If 

	Dim mode : mode = "ins"

	intIDX = fncRequest("idx")   
	hp_seq = fncRequest("hp_seq")
	baby1_seq = fncRequest("baby1_seq")
	note_day_now = fncRequest("note_day")
	note_seq = fncRequest("note_seq")

	mem_id = fncRequest("id")
	mem_nm = fncRequest("name")
	birth = fncRequest("birth")
	addr_1 = fncRequest("address1")
	addr_2 = fncRequest("address2")
	baby_name = fncRequest("baby_name")
	hp = fncRequest("hp")
	phone = fncRequest("phone")
	MO_NOTE_DAY = 1


					 


    If intIDX <> "" Then
		strTable = " FROM MO_RESERVATION WITH(NOLOCK) "
		strTable = strTable & "    full outer  join	MO_SERVICE_LIST			on MO_RESERVATION.mr_idx = MO_SERVICE_LIST.mr_idx "
		strWhere = " WHERE MR_CNLKBN='N' AND MO_RESERVATION.MR_IDX = '"& intIDX &"' and  MO_SERVICE_LIST.mo_baby_seq = '"& baby1_seq &"'"

	If note_seq <> ""  Then
		strWhere = strWhere & " and  MO_SERVICE_LIST.mo_note_seq = '"& note_seq &"' "
	End if

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			 
			mr_idx		= Rs(0)
			mem_id		= Rs(1)
			mem_nm		= Rs(2)
			birth		= Rs(3)
			phone		= Rs(4)
			hp			= Rs(5)
			post		= Rs(6)
			addr_1		= Rs(7)
			addr_2		= Rs(8)
			service		= Rs(9)
			period		= Rs(10)
			service_type= Rs(11) 
			childbirth	= Rs(12)
			serviceSdt	= Rs(13)
			serviceEdt	= Rs(14)
			clinic		= Rs(15)
			exper		= Rs(16)
			unique		= Rs(17)
			family		= Rs(18)
			payment		= Rs(19)
			payType		= Rs(20)
			payState	= Rs(21)
			payEdt		= Rs(22)
			content		= Rs(23)
			serviceSdt_1= Rs(26)
			serviceEdt_1= Rs(27)
			serviceSdt_2= Rs(28)
			serviceEdt_2= Rs(29)
			serviceSdt_3= Rs(30)
			serviceEdt_3= Rs(31)
			pay_name    = Rs(32)
			cancel_yn   = Rs(33)
			cancel_reason= Rs(34)
			s_happy_call= Rs(35)
			e_happy_call= Rs(36)
			
			product_1					= Rs(37) '유축기 
			product_2					= Rs(38) '유축기 소모품
			product_CHOICE_WEEK			= Rs(39) '기간
			product_CHOICE_PRICE		= Rs(40) '가격
			product_OUT_DAY				= Rs(41) '조사기
			product_MASSAGE_BEFORE		= Rs(42) ' 마사지 산전
			product_MASSAGE_AFTER		= Rs(43) ' 산후
			product_MASSAGE_ADD			= Rs(44) ' 추가
			product_VISIT_NURSE_BEFORE	= Rs(45) ' 방문간호사 산전
			product_VISIT_NURSE_AFTER	= Rs(46) ' 산후
			product_SODOK_SERVICE		= Rs(47) ' 소독서비스
			product_GIFT_CHOICE			= Rs(48) ' 출산선물선택
			product_GIFT_CHOICE_SEND	= Rs(49) ' 택배일
			product_GIFT_CHOICE_BABY	= Rs(50) ' 폴스베이비
			product_GIFT_BOX_SEND		= Rs(51) ' 출산선물박스 택배일
			product_CONTENT2			= Rs(52) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			
			note_seq			= Rs(54) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
		If note_seq <> "" Then 
			mode = "upd"
	
			idx					= Rs(55) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hp_seq				= Rs(56) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			baby_seq			= Rs(57) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			check1			= Rs(58) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check2			= Rs(59) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check3			= Rs(60) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check4			= Rs(61) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			check5			= Rs(62) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check6			= Rs(63) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check7			= Rs(64) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check8			= Rs(65) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check9			= Rs(66) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check10			= Rs(67) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			check11			= Rs(68) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check12			= Rs(69) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check13			= Rs(70) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check14			= Rs(71) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check15			= Rs(72) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check16			= Rs(73) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check17			= Rs(74) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			check18			= Rs(75) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check19			= Rs(76) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check20			= Rs(77) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check21			= Rs(78) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			check22			= Rs(79) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			content1			= Rs(80) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
 
		End if
			arr_res_List = Rs.GetRows()

		End If 
		Call RSClose(Rs)

 
  
 

		strSql	 = "		;SELECT distinct mo_note_seq, mo_note_day  from  MO_SERVICE_LIST "
		strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
		strSql = strSql & strWhere

		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			day_list = Rs.GetRows()'관리대장일차 
		End If 
		Call RSClose(Rs)


		strSql	 = "		;SELECT distinct max(mo_note_day)  from  MO_SERVICE_LIST "
		strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
		strSql = strSql & strWhere

		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			max_day = Rs(0)
			max_day_list = Rs.GetRows()'관리대장일차 
		End If 
		Call RSClose(Rs)


		strSql	 = "		;SELECT distinct min(mo_note_day)  from  MO_SERVICE_LIST "
		strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
		strSql = strSql & strWhere

		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			min_day = Rs(0)
			min_day_list = Rs.GetRows()'관리대장일차 
		End If 
		Call RSClose(Rs)


		If note_day_now <> "" Then 
		
		strSql	 = "		;SELECT * from  MO_SERVICE_LIST "
		strWhere = "		where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY = '"& note_day_now &"' "
		strSql = strSql & strWhere

		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			day_detail_list = Rs.GetRows()'관리대장일차 
		End If 
		Call RSClose(Rs)

			MO_NOTE_DAY = note_day_now

		End If
	

End If 
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

    <title>Mother n Baby 산모도우미 수첩</title>

    <!-- Bootstrap core CSS -->
    <link href="/mnb_notebook/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/mnb_notebook/css/style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mnb_notebook/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/mnb_notebook/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/mnb_notebook/js/ie10-viewport-bug-workaround.js"></script>
	<script>
	
		function check_update1 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check1":$("#check1").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") :  location.reload();break;case("3") :location.reload();break;case("0"):alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}

		function check_update2 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check2":$("#check2").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") :   location.reload();		break;
				case("3") :	  location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update3 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check3":$("#check3").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update4 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check4":$("#check4").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update5 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check5":$("#check5").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update6 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check6":$("#check6").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update7 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check7":$("#check7").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update8 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check8":$("#check8").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}

		function check_update9 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check9":$("#check9").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update10 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check10":$("#check10").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update11 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check11":$("#check11").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update12 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check12":$("#check12").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update13 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check13":$("#check13").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update14 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check14":$("#check14").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update15 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check15":$("#check15").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update16 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check16":$("#check16").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update17 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check17":$("#check17").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update18 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check18":$("#check18").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update19 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check19":$("#check19").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update20 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check20":$("#check20").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update21 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check21":$("#check21").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
		function check_update22 () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"check22":$("#check22").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}

		function check_update_event_contents () {
			 jQuery.post("./check_update.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"mode":$("#mode").val(),"baby_seq":$("#baby_seq").val(),"mo_note_seq":$("#mo_note_seq").val(),"event_contents":$("#event_contents").val()},function(data,testStatus){
					 
			switch(data) {
				case("2") : location.reload();		break;
				case("3") :	location.reload();		break;
				case("0") :  alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');	return false;
				break;
			}
		});
	}
	</script>
  </head>

  <body>

 <!-- #include virtual = "/mnb_notebook/nav.asp"-->

 

    <div class="container">
	<form name="s_form" method="post" action="note_service_sql.asp">
	<input type="hidden" name="idx" id="idx" value="<%=intIDX%>" />
	<input type="hidden" name="hp_seq" id="hp_seq" value="<%=hp_seq%>" />
	<input type="hidden" name="baby_seq" id="baby_seq" value="<%=baby1_seq%>" />
	<input type="hidden" name="mo_note_seq" id="mo_note_seq" value="<%=note_seq%>" />
	<input type="hidden" name="mode" id="mode" value="<%=mode%>">
		<div class="content">
				<div class="title_align_left">
					 기본정보
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">ID/이름</td>
							<td class="td2">[<%=mem_id%>] / [<%=mem_nm%>]</td>
						</tr>
						<tr>
							<td class="td1">생년월일</td>
							<td class="td2"><%=Left(birth,4)%>년<%=Mid(birth,5,2)%>월<%=Right(birth,2)%>일</td>
						</tr>
						<tr>
							<td class="td1">연락처</td>
							<td class="td2">[<%=phone%>]  [<%=hp%>]</td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td class="td2"><%=addr_1%> <%=addr_2%></td>
						</tr>
						<tr>
							<td class="td1">신생아 이름</td>
							<td class="td2"><%=baby_name%> </td>
						</tr>
					</tbody>
				</table>

 

				<div class="title_align_left">
					 관리대장일지 <%=MO_NOTE_DAY%>일차
				</div>

				<div class="align_left">
					 기본케어
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">인사예절</td>
							<td class="td2">
							<% If check1 <> "" Then %>
									<img src="/mnb_notebook/img/18_survice_04.png" />
							<%else%>
											<input type="button" class="" name="check1" id="check1" value="완료" onclick="check_update1();" />
							<% End If %></td>
						</tr>
						<tr>
							<td class="td1">유니폼착용</td>
							<td class="td2">
							<% If check2 <> "" Then %>
									<img src="/mnb_notebook/img/18_survice_04.png" />
							<%else%>
									<input type="button" class="" name="check2" id="check2" value="완료" onclick="check_update2();"/></td>
							<% End If %>
							
						</tr>
						<tr>
							<td class="td1">접촉전 손씻기</td>
							<td class="td2">
							<% If check3 <> "" Then %>
							<img src="/mnb_notebook/img/18_survice_04.png" />
							<% Else %>
							<input type="button" class=""  name="check3" id="check3" value="완료" onclick="check_update3();" /><%End if%></td>
						</tr>
						<tr>
							<td class="td1">일정 진행 확인</td>
							<td class="td2">
							<% If check4 <> "" Then %>
							<img src="/mnb_notebook/img/18_survice_04.png" />
							<% Else %>
							<input type="button" class="" name="check4" id="check4"  value="완료" onclick="check_update4();" /><% End If %></td>
						</tr>
					</tbody>
				</table>
 

				<div class="align_left">
					 산모케어
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">건강체크 / 간염예방관리</td>
							<td class="td2"><% If check5 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check5" id="check5"  value="완료" onclick="check_update5();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">영양관리(식사,간식)</td>
							<td class="td2"><% If check6 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check6" id="check6"  value="완료" onclick="check_update6();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 유방관리 / 수유보조</td>
							<td class="td2"><% If check7 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check7" id="check7"  value="완료" onclick="check_update7();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 회음부관리(좌욕,적외선조사기)</td>
							<td class="td2"><% If check8 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check8" id="check8"  value="완료" onclick="check_update8();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 산모관리</td>
							<td class="td2"><% If check9 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check9" id="check9"  value="완료" onclick="check_update9();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 산후체크</td>
							<td class="td2"><% If check10 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check10" id="check10"  value="완료" onclick="check_update10();" /><%End if%></td>
						</tr>
					</tbody>
				</table>


				<div class="align_left">
					 신생아 케어
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">건강체크(체온, 황달)</td>
							<td class="td2"><% If check11 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check11" id="check11" value="완료" onclick="check_update11();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">수유상태(구토 / 트림)</td>
							<td class="td2"><% If check12 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class=""  name="check12" id="check12" value="완료" onclick="check_update12();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 수유량(모유 / 분유)</td>
							<td class="td2"><% If check13 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check13" id="check13"  value="완료" onclick="check_update13();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">신생아 목욕</td>
							<td class="td2"><% If check14 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check14" id="check14"  value="완료" onclick="check_update14();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">신생아 마사지</td>
							<td class="td2"><% If check15 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check15" id="check15"  value="완료" onclick="check_update15();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">배꼽관리 및 소독</td>
							<td class="td2"><% If check16 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check16" id="check16"  value="완료" onclick="check_update16();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">감염관리 및 예방접종</td>
							<td class="td2"><% If check17 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check17" id="check17"  value="완료" onclick="check_update17();"/><%End if%></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1"> 젖병세척 / 소독</td>
							<td class="td2"><% If check18 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check18" id="check18" value="완료" onclick="check_update18();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 유축기 관리</td>
							<td class="td2"><% If check19 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check19" id="check19"  value="완료" onclick="check_update19();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">청결(설거지 / 세탁물관리)</td>
							<td class="td2"><% If check20 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check20" id="check20"  value="완료" onclick="check_update20();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1">집안청소 / 환기</td>
							<td class="td2"><% If check21 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check21" id="check21"  value="완료" onclick="check_update21();"/><%End if%></td>
						</tr>
						<tr>
							<td class="td1"> 집안일 정리 / 마무리</td>
							<td class="td2"><% If check22 <> "" Then %><img src="/mnb_notebook/img/18_survice_04.png" /><%else%><input type="button" class="" name="check22" id="check22"  value="완료" onclick="check_update22();"/><%End if%></td>
						</tr>
					</tbody>
				</table>

				<div class="align_left">
				비고 <textarea  style="width:100%;" rows="10" name="event_contents" id="event_contents" placeholder="내용을 입력해주세요" ><%=content1%></textarea>
				</div>
				</form>

				<div class="align_left">
					<input type="image" src="/mnb_notebook/img/10_list_05.png" align="center"/>

					<a href="service_view.asp?note_day=<%=min_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>&baby_name=<%=baby_name%>"><img src="/mnb_notebook/img/12_careinfo_04.png" align="center"/></a>
<%
	If IsArray(day_list) Then 
		For num=0 To UBound(day_list,2)	
			note_seq	= day_list(0,num)
			note_day	= day_list(1,num)
%>		
			<% If note_day = MO_NOTE_DAY Then  %>
			<a href="service_view.asp?note_day=<%=note_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>&note_seq=<%=note_seq%>&baby_name=<%=baby_name%>"><img src="/mnb_notebook/img/12_careinfo_06.png" align="center"/> <% Else %> <a href="service_view.asp?note_day=<%=note_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>&note_seq=<%=note_seq%>&baby_name=<%=baby_name%>"><img src="/mnb_notebook/img/12_careinfo_05.png" align="center"/><% End If %></a>
<%
		Next 
	Else
%>		
			<img src="/mnb_notebook/img/12_careinfo_05.png" align="center"/>
<%
	End If
%>

				<a href="service_view.asp?note_day=<%=max_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>&note_seq=<%=note_seq%>&baby_name=<%=baby_name%>"> <img src="/mnb_notebook/img/12_careinfo_07.png" align="center"/></a> 

				</div>
<br><br>
		</div>

    </div><!-- /.container -->

  </body>
</html>
