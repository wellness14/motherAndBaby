<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디
 

	If uId <> "" Then 
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/plan_list.asp"
	End If 

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

			massage_mng					= Rs(54) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			massage_hp					= Rs(55) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			visit_nurse_mng				= Rs(56) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			visit_nurse_hp				= Rs(57) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_mng					= Rs(58) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_hp					= Rs(59) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			res_pay_ment_dt				= Rs(60) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
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
 
			arr_res_List = Rs.GetRows()
	End If   
 
 
	Call RSClose(Rs)


	 If mr_idx <> "" Then
 
	  'SELECT MD_HELPER_SEQ   FROM MO_HELPER_SERVICE    where MR_IDX = '537'
		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT MD_HELPER_SEQ  "
		strSql1 = strSql1 & "  FROM MO_HELPER_SERVICE  "
		strSql1 = strSql1 & "  where MR_IDX = '"& mr_idx &"' " 

		Set Rs = DBExec(strSql1,"main")	
		If Not Rs.EOF Then 
			
			rs_mo_helper_seq	= Rs(0)
 
			arrTmp = Rs.GetRows() 	 
		End If 
	 
		Call RSClose(Rs)
 
 
		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM MO_HELPER     where MD_HELPER_SEQ =  '"& rs_mo_helper_seq &"' "
 

		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then  
				helper_name1	=Rs(1)
				helper_hp		=Rs(5)
				INSURANCE_FLG	=Rs(22)
				HELPER_HEALTH_FLG	=Rs(43)
				helper_List = Rs.GetRows()
		End If 
		 Call RSClose(Rs)
 
 End If

 	'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arrProdt = Rs.getRows()
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

		 
 

	function layer_open(el){ 

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}
 
 
		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');
 
 
		temp.find('input.plan_input_03').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});
  
		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}
	 
</script>
 
  </head>

  <body style="background-color:#ececec;">
	<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>">
 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->


    <div class="container">

 
		<!-- <div class="plan_box_01">
			정보확인
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_02">주소지/개인정보를 설정해주세요</span>
		</div>

		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="설정하기"  data-toggle="modal" data-target="#myModal1"/><br>
		</div>  -->
 
		<div class="plan_box_01">
			서비스정보
		</div>
		<div class="plan_box_01_sub">
			마더앤베이비의<br>
			서비스 프로그램정보입니다.
		</div>
 
		<div class="plan_input">
			<a href="service_info_list.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기" /></a><br>
		</div>
   


 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->

	 



	 	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">정보확인</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
						<img src="img/adress_02.jpg" width="280"/> 

						<div class="plan_box_02_sub">
							<a href="setting.asp"><input type="button" name="addset_btn" id="addset_btn" class="plan_input_02_1" value="설정하기"/></a>
						</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

 


    </div><!-- /.container -->

  </body>

    <script src="js/leftmenu.js"></script>

</html>
