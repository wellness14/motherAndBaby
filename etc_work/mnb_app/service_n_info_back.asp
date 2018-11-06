<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->


<%
uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

If uId <> "" Then 

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
 
	strSql1 = ""
	strSql1 = strSql1 & " SELECT  *  "
	strSql1 = strSql1 & " from  MO_RESERVATION    " 
	strSql1 = strSql1 & "  where MR_MEM_ID = '"& uId &"' order by mr_idx desc "
	Set Rs = DBExec(strSql1,"main")
	If Not Rs.EOF Then 
			mode = "upd"
 
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
			
			product_1					= Rs(37) ' 유축기 
			product_2					= Rs(38) ' 유축기 소모품
			product_CHOICE_WEEK			= Rs(39) ' 기간
			product_CHOICE_PRICE		= Rs(40) ' 가격
			product_OUT_DAY				= Rs(41) ' 조사기
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
			product_CONTENT2			= Rs(52) '	

			massage_mng					= Rs(54) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			massage_hp					= Rs(55) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			visit_nurse_mng				= Rs(56) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			visit_nurse_hp				= Rs(57) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_mng					= Rs(58) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_hp					= Rs(59) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			res_pay_ment_dt				= Rs(63) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_service			= Rs(64) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_mng				= Rs(65) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_hp					= Rs(66) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			mom_milk_msg_ser			= Rs(67) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_cnt			= Rs(68) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_mng			= Rs(69) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_hp				= Rs(70) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			mr_add1_pay					= Rs(71) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_add2_pay					= Rs(72) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_add3_pay					= Rs(73) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			hp_point					= Rs(74) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			nurse_point					= Rs(75) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			bodycare_point				= Rs(76) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			milk_msg_point				= Rs(77) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			milk_analysis_point			= Rs(78) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_point					= Rs(79) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			helper_visit_date			= Rs(80) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			helper_visit_time			= Rs(81) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			add_pay1_date				= Rs(87) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			add_pay2_date				= Rs(88) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			add_pay3_date				= Rs(89) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			arr_res_List = Rs.GetRows()
	End If   
 
	Call RSClose(Rs)  
End if

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
	  <script type="text/javascript">

 

				function service_check() {
					if ($("#mr_idx").val() == "") {
						alert("서비스 신청고객만 이용하실 수 있습니다."); 
							return false;
					}else{
						location.href = "emergency_talk.asp";
					}
				}
	 
	  </script>
  </head>

  <body>


 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->




    <div class="container">
	<input type="hidden" name="idx" id="mr_idx" value="<%=mr_idx%>" />
		<div class="info_box_01">
			<div class="info_box_01_sub">
				<span class="info_text_01">이용안내 및 상담신청</span>
			</div>
			<div class="info_box_02_sub">
				<a href="service_request.asp"><input type="button" name="emergency_btn" id="emergency_btn" class="info_input_01" value="상담신청" /></a>
			</div>
		</div>
 
		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">출산일 변경이나, 계약일 변경 등의 문의사항</span>
			</div>
			<div class="info_box_02_sub">
				<!-- <a href="emergency_talk.asp"> --><input type="button" name="emergency_btn" id="emergency_btn1" class="info_input_01" value="긴급상담신청" onclick="service_check();"/><!-- </a> -->
			</div>
		</div>

		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">일대일 게시판 상담을 진행합니다.</span>
			</div>
			<div class="info_box_02_sub">
				<a href="service_consult.asp"><input type="button" name="mtm_btn" id="mtm_btn" class="info_input_02" value="1:1상담" /></a>
			</div>
		</div>
 
		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">공지사항</span>
			</div>
			<div class="info_box_02_sub">
				<a href="notice.asp"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="공지사항 바로가기" /></a>
			</div>
		</div>
		 
	 


		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
 
    </div><!-- /.container -->

  </body>
  
  <script src="js/leftmenu.js"></script>

</html>
