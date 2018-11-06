<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디 

	If uId = "" Then 
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/plan_info_list.asp"
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

		'-------일정카드 사용자 확인 부분-----------------------------------------------------------------------------
		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where MR_IDX =  '"& mr_idx &"' " 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then   
		
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_CHECK_NAME					=Rs(3)
			MS_CHECK_FLG					=Rs(4)
			MS_CHECK_DATE					=Rs(5) 

			arr_my_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)   


		'-------일정카드 새로운 서비스 등록자 확인 부분------------------------------------------------------------------------------------------------------------
		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'address'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_address_check				=Rs(3)  
			arr_address_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'service'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_service_check				=Rs(3)  
			arr_service_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'gift'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_gift_check				=Rs(3)  
			arr_gift_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'helper'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_helper_check				=Rs(3)  
			arr_helper_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'helper_visit'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_helper_visit_check				=Rs(3)  
			arr_helper_visit_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'bodycare'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_bodycare_check				=Rs(3)  
			arr_bodycare_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'nurse_visit'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_nurse_visit_check				=Rs(3)  
			arr_nurse_visit_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'mom_milk_analysis'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_mom_milk_analysis_check				=Rs(3)  
			arr_mom_milk_analysis_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'sodok'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_sodok_check				=Rs(3)  
			arr_sodok_List = Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'mom_milk_msg'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_mom_milk_msg_check			=Rs(3)  
			arr_mom_milk_msg_List			= Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'pay'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_pay_check					=Rs(3)  
			arr_pay_List					=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_service1'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_service1_check					=Rs(3)  
			arr_add_service1_List					=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_service2'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_service2_check					=Rs(3)  
			arr_add_service2_List					=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_service2'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_service2_check					=Rs(3)  
			arr_add_service2_List					=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_service3'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_service3_check					=Rs(3)  
			arr_add_service3_List					=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_pay1'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_pay1_check			=Rs(3)  
			arr_add_pay1_List			=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_pay2'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_pay2_check			=Rs(3)  
			arr_add_pay2_List			=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *     FROM  MO_APP_MY_DATA_CHECK     where	MR_IDX =  '"& mr_idx &"'	and		MS_CHECK_NAME	=	'add_pay3'	" 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then    
			MR_IDX							=Rs(1)
			MR_MEM_ID						=Rs(2)
			MS_add_pay3_check			=Rs(3)  
			arr_add_pay3_List			=Rs.GetRows()
		End If 
		Call RSClose(Rs)

		'일정카드 새로운 서비스 등록자 작업 끝----------------------------------------------------------------------------------------------------------------

	End If

 	'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs) 

 	'	등록 상품 이름
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT where MD_GIFT_SEQ = '"& product_GIFT_CHOICE &"' "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_selected_name = Rs(1)
		arrProdt_list = Rs.getRows()
	End If 
	Call RSClose(Rs) 

	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
		Now_y = Now_arr(0)
		Now_m = Now_arr(1)
		Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d


	add_eday1 = ""
	add_eday2 = ""
	add_eday3 = ""

	If serviceSdt_1 <> "" And serviceEdt_1 <> ""  Then  
	   add_eday = serviceEdt_1
	   add_sday = serviceSdt_1
	   add_day1 = add_eday - add_sday  
	End If
	If serviceSdt_2 <> "" And serviceEdt_2 <> ""  Then  
	   add_eday = serviceEdt_2
	   add_sday = serviceSdt_2
	   add_day2 = add_eday - add_sday  
	End If
	If serviceSdt_3 <> "" And serviceEdt_3 <> ""  Then  
	   add_eday = serviceEdt_3
	   add_sday = serviceSdt_3
	   add_day3 = add_eday - add_sday  
	End if
 
%>
<!-- 연장 1 연장2 연장3  연장페이1 연장페이2 연장페이3 작업해야함 -->
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
 
	function layer_open(el) { 

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}
  
	var tx = ($(window).width()-$(temp).width())/2;
	var ty = ($(window).height()-$(temp).height())/2;

 
		temp.find('input').click(function(e){
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
  
	function address_update () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"address"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
					location.reload();
				}
		});  
	} 
	function address_service () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"service"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_gift () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"gift"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_helper () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"helper"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_helper_visit () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"helper_visit"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_bodycare () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"bodycare"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_nurse_visit () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"nurse_visit"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				//	alert("22222.");
				location.reload();
				}
		});  
	} 
	function address_mom_milk_analysis () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"mom_milk_analysis"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_sodok () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"sodok"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_mom_milk_msg () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"mom_milk_msg"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_pay () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"pay"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_add_service1 () { //연장1
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_service1"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_add_service2 () { //연장1
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_service2"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function address_add_service3 () { //연장1
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_service3"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	}  
	function add_pay1 () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_pay1"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function add_pay2 () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_pay2"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
	function add_pay3 () { 
		jQuery.post("./plan_list_sql.asp",{"check":"Y","date":"<%=Now_ymd%>","mr_idx":"<%=mr_idx%>","mem_id":"<%=mem_id%>","page_flg":"add_pay3"},function(data,testStatus){
				if (data == 1) {
				//	alert("11111.");
				} else {
				location.reload();
				}
		});  
	} 
</script>
<script>
	$(document).ready(function() {  
            $('div#star1').raty({
                score: "<%=hp_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating1").val(score);
                    $("#displayStarRating1").html(score);  
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"helper_point":$("#starRating1").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					} 
                } 
            }); 
			 $('div#star2').raty({
                score: "<%=nurse_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating2").val(score);
                    $("#displayStarRating2").html(score); 
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"nurse_point":$("#starRating2").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					}  
                }
            }); 
			 $('div#star3').raty({
                score: "<%=bodycare_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating3").val(score);
                    $("#displayStarRating3").html(score); 
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"bodycare_point":$("#starRating3").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					}  
                }
            });  
			 $('div#star4').raty({
                score: "<%=milk_msg_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating4").val(score);
                    $("#displayStarRating4").html(score); 
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"mom_milk_msg_point":$("#starRating4").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					} 
                }
            }); 
			 $('div#star5').raty({
                score: "<%=milk_analysis_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating5").val(score);
                    $("#displayStarRating5").html(score); 
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"mmilk_analysis_point":$("#starRating5").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					}  
                }
            }); 
			 $('div#star6').raty({
                score: "<%=sodok_point%>"
                ,path : "img/"
                ,width : "100%"
                ,click: function(score, evt) {
                    $("#starRating6").val(score);
                    $("#displayStarRating6").html(score); 
					if (confirm('만족도평가를 하시겠습니까??') == true) {    //확인
						jQuery.post("./star_point.asp",{"sodok":$("#starRating6").val(),"mr_idx":$("#mr_idx").val()},function(data,testStatus){
						//console.log(data);
							if (data == 1) {
							//console.log("data1");
								alert("만족도 평가가 완료되었습니다."); 
							} else {
								alert("이미 만족도 평가를 하셨습니다.");
							}
						});  
					}else{   //취소
						return;
					}  
                }
            }); 
	}); 
</script>
</head>
<body style="background-color:#ececec;"> 
<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>">
 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
	<div class="container">  
		<div style="margin-top:30px;"></div> 
		<!-- 
		<div class="plan_box_01">
			일정안내
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_02"></span>
		</div>

		<div class="plan_input">
			<div  class="plan_input_01" style="padding-bottom:40px;"/>등록된 일정이 없습니다.</div>
		</div> 
		 if IsNull(MS_ADDRESS_FLG) 널구분
  -->  

<%
 
	If IsArray(arr_my_List) Then 
		For num=0 To UBound(arr_my_List,2)		
 
			idx			= arr_my_List(1,num)
			mem_id		= arr_my_List(2,num)
			MS_CHECK_NAME	= arr_my_List(3,num)
			MS_CHECK_FLG	= arr_my_List(4,num)
			 
%>



<% if MS_CHECK_NAME = ""  then %>
		<div class="plan_box_01">
			일정안내
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_02"></span>
		</div>

		<div class="plan_input">
			<div  class="plan_input_01" style="padding-bottom:40px;"/>등록된 일정이 없습니다.</div>
		</div> 
<%End if%>

<% if MS_CHECK_NAME = "address" And  IsNull(MS_CHECK_FLG) then %>
	<% If post <> "" Then %>
		<div class="plan_box_01">
			정보확인
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_02">주소지/개인정보를 설정해주세요</span>
		</div>

		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="설정하기"  data-toggle="modal" data-target="#myModal1"/><br>
		</div> 
	<%End If %>
<%End If %>
 
<% If MS_CHECK_NAME = "service" And   IsNull(MS_CHECK_FLG) Then %>

	<% If service <> "" Then %>
		<div class="plan_box_01">
			서비스정보
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01"><%=service%> / <%=period%> /  <%=service_type%></span><br>
			<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
			<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료
		</div>
 
		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal13"/><br>
		</div>
	<% End If %>
<% End If %>

<%If mr_idx <> "" Then %>
<% If MS_CHECK_NAME = "gift" And  IsNull(MS_CHECK_FLG) Then %>
		<% If product_GIFT_CHOICE	<> "" Then %>
			<div class="plan_box_01">
				출산선물선택
			</div>

			<div class="plan_box_01_sub">
				<span class="plan_text_01"> <%=arrProdt_selected_name%></span><br> 
			</div>
		<% Else %>
			<div class="plan_box_01">
				출산선물선택
			</div>
			
			<div class="plan_box_01_sub">
				<span class="plan_text_01"> 출산선물을 선택하세요</span><br> 
			</div>
			<div class="plan_input">
				<input type="button" name="plan_gift_btn" id="plan_gift_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal2"/><br>
			</div> 
	<% End If %>
<%End If %>
<%End if%>


<% If MS_CHECK_NAME = "helper" And  IsNull(MS_CHECK_FLG) Then %>
	<%If helper_name1 <> "" Then %>
		<div class="plan_box_01">
			산후도우미
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01"><%=helper_name1%></span><br>
			<%=helper_hp%>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"   data-toggle="modal" data-target="#myModal3"/><br>
		</div> 
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "helper_visit" And  IsNull(MS_CHECK_FLG) Then %>
	<% if helper_visit_date <> ""  Then
		If helper_visit_time <> "" then
			class_value = helper_visit_time
			dim myarray                          
			myarray=split(class_value,":")
			visit_time	=	myarray(0)      
			visit_minute=	myarray(1)

			If visit_time = "00" Then 
				visit_time = ""
			End If 
		End If 
 %>
		<div class="plan_box_01">
			스케쥴 알림
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01">관리사 방문예정</span><br>
				 <%=Left(helper_visit_date,4)%>년  <%=mid(helper_visit_date,5,2)%>월 <%=right(helper_visit_date,2)%>일 <br>
			<%If visit_time <> "" Then %>
				<%=visit_time%> 시 <%=visit_minute%> 분 
			<%End If %>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_visit_btn" id="plan_visit_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal4"/><br>
		</div> 
	<% End if%>
<% End If %>
 
<% If MS_CHECK_NAME = "bodycare" And  IsNull(MS_CHECK_FLG) Then %>
	<%If massage_mng <> "" Then %>
		<div class="plan_box_01">
			스케쥴 알림 
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01">바디케어</span><br>
			방문예정<br>
			연락처 <%=massage_hp%>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_body_btn" id="plan_body_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal5" /><br>
		</div> 
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "nurse_visit" And  IsNull(MS_CHECK_FLG) Then %>
	<% If  visit_nurse_mng <> "" Then %>
		<div class="plan_box_01">
			스케쥴 알림 
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01">전담 간호사 방문</span><br>
			산전 방문예정<br> 연락처 <%=visit_nurse_hp%>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_nurse_btn" id="plan_nurse_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal6"/><br>
		</div> 
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "mom_milk_analysis" And  IsNull(MS_CHECK_FLG) Then %>
	<% If mom_milk_service = "Y" Then %>
		<div class="plan_box_01">
			스케쥴 알림 
		</div>

		<div class="plan_box_01_sub">
			<span class="plan_text_01">모유성분 분석 서비스</span><br>
			예정<br> 연락처 <%=mom_milk_hp%>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_mmilk_btn" id="plan_mmilk_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal7"/><br>
		</div> 
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "sodok" And  IsNull(MS_CHECK_FLG) Then %>
	<% If product_SODOK_SERVICE = "Y" Then %>
		<div class="plan_box_01">
			스케쥴 알림 
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01">아기맞이 소독 서비스</span><br>
			예정<br> 연락처 <%=sodok_hp%>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_sodok_btn" id="plan_sodok_btn" class="plan_input_01" value="자세히보기"	 data-toggle="modal" data-target="#myModal8"/><br>
		</div>
	<%End If %>
<% End If %>

<% If MS_CHECK_NAME = "mom_milk_msg" And  IsNull(MS_CHECK_FLG) Then %>
	<% If  mom_milk_msg_ser = "Y" Then %>
		<div class="plan_box_01">
			스케쥴 알림 
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_01">모유수유 마사지 예정</span><br>
			총 <%=mom_milk_msg_cnt%>회<br>
			연락처 <%=mom_milk_msg_hp%><br>
		</div>
		<div class="plan_input">
			<input type="button" name="plan_mm_msg_btn" id="plan_mm_msg_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal9"/><br>
		</div>
	<%End If %>
<%  End If %>

<% If MS_CHECK_NAME = "add_service1" And  IsNull(MS_CHECK_FLG) Then %>
 		<% 
			If serviceSdt_1 <> "" And serviceEdt_1 <> ""  Then 
			   add_eday = serviceEdt_1
			   add_sday = serviceSdt_1
			   add_day1 = add_eday - add_sday 
		 %>
		<div class="plan_box_01">
			1차 연장알림
		</div>

		<div class="plan_box_01_sub">
			<span class="plan_text_01"><%=service%>&nbsp;<%=add_day1+1%>일 연장 </span><br>
			<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일  <br>
			<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일   
		</div>		 
		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal14"/><br>
		</div>
		<%
			End If  
		%>
<% End  If %>

<% If MS_CHECK_NAME = "add_service2" And  IsNull(MS_CHECK_FLG) Then %>
		 <% 
			If serviceSdt_2 <> "" And serviceEdt_2 <> ""  Then 
			   add_eday = serviceEdt_2
			   add_sday = serviceSdt_2
			   add_day2 = add_eday - add_sday 
		 %>
		<div class="plan_box_01">
			2차 연장알림
		</div>

		<div class="plan_box_01_sub">
			<span class="plan_text_01"><%=service%>&nbsp;<%=add_day2+1%>일 연장 </span><br>
			<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일  <br>
			<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일   
		</div>		 
		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal15"/><br>
		</div>
		<%
			End If  
		%>
<% End  If %>

<% If MS_CHECK_NAME = "add_service3" And  IsNull(MS_CHECK_FLG) Then %>
		 <% 
			If serviceSdt_3 <> "" And serviceEdt_3 <> ""  Then 
			   add_eday = serviceEdt_3
			   add_sday = serviceSdt_3
			   add_day3 = add_eday - add_sday 
		 %>
		<div class="plan_box_01">
			3차 연장알림
		</div>

		<div class="plan_box_01_sub">
			<span class="plan_text_01"><%=service%>&nbsp;<%=add_day3+1%>일 연장 </span><br>
			<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일  <br>
			<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일   
		</div>		 
		<div class="plan_input">
			<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal16"/><br>
		</div>
		<%
			End If  
		%>
<%  End If %>

<% If MS_CHECK_NAME = "pay" And  IsNull(MS_CHECK_FLG) Then %>
		<%
			'If payment <> ""  Then 
			'	pay_arr=split(payment,",") 
			'	pay_a = pay_arr(0)
			'	pay_b = pay_arr(1)
			'End If 

			If payState = "" Then 
				payState ="결제진행중"
			End If 
		 %>
	
	
	<% If res_pay_ment_dt <> "" Then %>
		<div class="plan_box_01">
			결제알림
		</div>
		<div class="plan_box_01_sub"> 
			<span class="plan_text_01">계약금 : <%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일<br>(<%=payment%>원)입금완료</span><br>
			잔금 : <%=payState%><br>
			<!-- <% If mr_add1_pay <> "" Then %>		
			연장금 : <%=mr_add1_pay%>원<br>
			<%End If %>
			<% If mr_add2_pay <> "" Then %>
		 2차	연장금 : <%=mr_add2_pay%>원<br>
			<%End If %>
			<%If mr_add3_pay <> "" Then %>
		 3차	연장금 : <%=mr_add3_pay%>원<br>
			<%End If %> -->
			<%If mr_add1_pay = "" And mr_add2_pay = "" And mr_add3_pay = "" Then %>
			연장금 : 해당사항 없음<br>
			<%End If %>
		</div>

 

		<div class="plan_input">
			<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal11"/><br>
		</div> 
	<% End  If %> 
<%  End  If %>
  
<% If MS_CHECK_NAME = "add_pay1" And  IsNull(MS_CHECK_FLG) Then %>
	<% If mr_add1_pay <> "" Then '연장1%> 
		<div class="plan_box_01">
			<!-- 1차연장 --> 결제알림
		</div>
		<div class="plan_box_01_sub"> 
			<span class="plan_text_01">1차 연장금 : <%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일<br> (<%=mr_add1_pay%>원) 입금완료</span><br> 
		</div>
 
		<div class="plan_input">
			<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal17"/><br>
		</div>
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "add_pay2" And  IsNull(MS_CHECK_FLG) Then %>
	<% If mr_add2_pay <> "" Then '연장2%> 
		<div class="plan_box_01">
			<!-- 2차연장 --> 결제알림
		</div>
		<div class="plan_box_01_sub"> 
			<span class="plan_text_01"> 2차	연장금 : <%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일 <br>(<%=mr_add2_pay%>원) 입금완료</span><br>
			 
 
		</div>
 
		<div class="plan_input">
			<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal18"/><br>
		</div>
	<% End If %>
<% End If %>

<% If MS_CHECK_NAME = "add_pay3" And  IsNull(MS_CHECK_FLG) Then %>
	<% If mr_add3_pay <> "" Then '연장3%> 
		<div class="plan_box_01">
			<!-- 3차연장  -->결제알림
		</div>
		<div class="plan_box_01_sub"> 
			<span class="plan_text_01">3차	연장금 : <%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일<br> (<%=mr_add3_pay%>원) 입금완료</span><br> 
		</div>
 
		<div class="plan_input">
			<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal19"/><br>
		</div>
	<% End If %> 
<% End If %>

 
<%
		Next 
	Else
%>
		<!-- <div class="plan_box_01">
			일정안내
		</div>
		<div class="plan_box_01_sub">
			<span class="plan_text_02"></span>
		</div>

		<div class="plan_input">
			<div  class="plan_input_01" style="padding-bottom:40px;"/>등록된 일정이 없습니다.</div>
		</div>  -->
<!-- 
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
  -->
<%
	End If
%>

 

	<%
		If Now_ymd = serviceEdt Then 
	%>
		<div class="plan_box_01">
			만족도 조사
		</div>
		<div class="plan_box_01_sub">
			마더앤베이비의 만족도 설문에<br> 응해주세요<br>
			쇼핑몰 현금포인트를<br> 지급해 드립니다.
		</div>
		<div class="plan_input">
			<input type="button" name="plan_poll_btn" id="plan_poll_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal12"/><br>
		</div> 

	<%  End If %>

	<!--   -->
	<% cnt = 0 %>

	<% If MS_address_check = "" Then  %>
		<% If post <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				정보확인
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_02">주소지/개인정보를 설정해주세요</span>
			</div>

			<div class="plan_input">
				<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="설정하기"  data-toggle="modal" data-target="#myModal1"/><br>
			</div> 
		<%End If %>
	<%End If %>
 
	<% If MS_service_check = "" Then  %>
		<% If service <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				서비스정보
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01"><%=service%> / <%=period%> /  <%=service_type%></span><br>
				<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
				<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료
			</div>
	 
			<div class="plan_input">
				<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal13"/><br>
			</div>
		<% End If %>
	<% End If %>
<% If mr_idx <> "" Then %>
	<% If MS_gift_check = "" Then  %>
		<% If product_GIFT_CHOICE	<> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				출산선물선택
			</div>

			<div class="plan_box_01_sub">
				<span class="plan_text_01"> <%=arrProdt_selected_name%></span><br> 
			</div>
			<div class="plan_input">
				<input type="button" name="plan_gift_btn" id="plan_gift_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal2"/><br>
			</div> 
		<% Else %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				출산선물선택
			</div>
			
			<div class="plan_box_01_sub">
				<span class="plan_text_01"> 출산선물을 선택하세요</span><br> 
			</div>
			<div class="plan_input">
				<input type="button" name="plan_gift_btn" id="plan_gift_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal2"/><br>
			</div> 
		<% End If %>
	<% End If %>
<%End if%>

	<% If MS_helper_check = "" Then  %>
		<%If helper_name1 <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				산후도우미
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01"><%=helper_name1%></span><br>
				<%=helper_hp%>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"   data-toggle="modal" data-target="#myModal3"/><br>
			</div> 
		<% End If %>
	<% End If %>

	<% If MS_helper_visit_check = "" Then  %>
		<% if helper_visit_date <> ""  Then
			If helper_visit_time <> "" then
				class_value = helper_visit_time
				dim myarray1                          
				myarray1=split(class_value,":")
				visit_time	=	myarray1(0)      
				visit_minute=	myarray1(1)

				If visit_time = "00" Then 
					visit_time = ""
				End If 
			End If 
 %>
 <% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01">관리사 방문예정</span><br>
					 <%=Left(helper_visit_date,4)%>년  <%=mid(helper_visit_date,5,2)%>월 <%=right(helper_visit_date,2)%>일 <br>
				<%If visit_time <> "" Then %>
					<%=visit_time%> 시 <%=visit_minute%> 분 
				<%End If %>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_visit_btn" id="plan_visit_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal4"/><br>
			</div> 
		<% End if%>
	<% End if%>
 
	<% If MS_bodycare_check = "" Then  %>
		<%If massage_mng <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림 
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01">바디케어</span><br>
				방문예정<br>
				연락처 <%=massage_hp%>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_body_btn" id="plan_body_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal5" /><br>
			</div> 
		<% End If %>
	<% End if%>





<!--  -->

 	<% If MS_nurse_visit_check = "" Then  %>
		<% If  visit_nurse_mng <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림 
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01">전담 간호사 방문</span><br>
				산전 방문예정<br> 연락처 <%=visit_nurse_hp%>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_nurse_btn" id="plan_nurse_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal6"/><br>
			</div> 
		<% End If %>
	<% End If %>

	<% If MS_mom_milk_analysis_check = "" Then  %>
		<% If mom_milk_service = "Y" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림 
			</div>

			<div class="plan_box_01_sub">
				<span class="plan_text_01">모유성분 분석 서비스</span><br>
				예정<br> 연락처 <%=mom_milk_hp%>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_mmilk_btn" id="plan_mmilk_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal7"/><br>
			</div> 
		<% End If %>
	<% End If %>
 
 	<% If MS_sodok_check = "" Then  %>
		<% If product_SODOK_SERVICE = "Y" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림 
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01">아기맞이 소독 서비스</span><br>
				예정<br> 연락처 <%=sodok_hp%>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_sodok_btn" id="plan_sodok_btn" class="plan_input_01" value="자세히보기"	 data-toggle="modal" data-target="#myModal8"/><br>
			</div>
		<%End If %>
	<%End If %>

	<% If MS_mom_milk_msg_check = "" Then  %>
		<% If  mom_milk_msg_ser = "Y" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				스케쥴 알림 
			</div>
			<div class="plan_box_01_sub">
				<span class="plan_text_01">모유수유 마사지 예정</span><br>
				총 <%=mom_milk_msg_cnt%>회<br>
				연락처 <%=mom_milk_msg_hp%><br>
			</div>
			<div class="plan_input">
				<input type="button" name="plan_mm_msg_btn" id="plan_mm_msg_btn" class="plan_input_01" value="자세히보기" data-toggle="modal" data-target="#myModal9"/><br>
			</div>
		<%End If %>
	<%End If %>
 
	<% If MS_add_service1_check = "" Then  %>
			<% 
				If serviceSdt_1 <> "" And serviceEdt_1 <> ""  Then 
				   add_eday = serviceEdt_1
				   add_sday = serviceSdt_1
				   add_day1 = add_eday - add_sday 
			 %>
			 <% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				1차 연장알림
			</div>

			<div class="plan_box_01_sub">
				<span class="plan_text_01"><%=service%>&nbsp;<%=add_day1+1%>일 연장 </span><br>
				<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일  <br>
				<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일   
			</div>		 
			<div class="plan_input">
				<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal14"/><br>
			</div> 
			<% End If  %>
 		<% End If %>

		<% If MS_add_service2_check = "" Then  %>
			 <% 
				If serviceSdt_2 <> "" And serviceEdt_2 <> ""  Then 
				   add_eday = serviceEdt_2
				   add_sday = serviceSdt_2
				   add_day2 = add_eday - add_sday 
			 %>
			 <% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				2차 연장알림
			</div>

			<div class="plan_box_01_sub">
				<span class="plan_text_01"><%=service%>&nbsp;<%=add_day2+1%>일 연장 </span><br>
				<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일  <br>
				<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일   
			</div>		 
			<div class="plan_input">
				<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal15"/><br>
			</div>
			<% End If   %>
		<% End If   %>
 
 		<% If MS_add_service2_check = "" Then  %>
			 <% 
				If serviceSdt_3 <> "" And serviceEdt_3 <> ""  Then 
				   add_eday = serviceEdt_3
				   add_sday = serviceSdt_3
				   add_day3 = add_eday - add_sday 
			 %>
			 <% cnt =  cnt + 1 %>
				<div class="plan_box_01">
					3차 연장알림
				</div>

				<div class="plan_box_01_sub">
					<span class="plan_text_01"><%=service%>&nbsp;<%=add_day3+1%>일 연장 </span><br>
					<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일  <br>
					<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일   
				</div>		 
				<div class="plan_input">
					<input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal16"/><br>
				</div>
			<% End If   %>
		<% End If   %>
 
		<%
			'If payment <> ""  Then 
			'	pay_arr=split(payment,",") 
			'	pay_a = pay_arr(0)
			'	pay_b = pay_arr(1)
			'End If 

			If payState = "" Then 
				payState ="결제진행중"
			End If 
		 %>
	
	<% If MS_pay_check = "" Then  %>
		<% If res_pay_ment_dt <> "" Then %>
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				결제알림
			</div>
			<div class="plan_box_01_sub"> 
				<span class="plan_text_01">계약금 : <%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일<br>(<%=payment%>원)입금완료</span><br>
				잔금 : <%=payState%><br>
				<!-- <% If mr_add1_pay <> "" Then %>		
				연장금 : <%=mr_add1_pay%>원<br>
				<%End If %>
				<% If mr_add2_pay <> "" Then %>
			 2차	연장금 : <%=mr_add2_pay%>원<br>
				<%End If %>
				<%If mr_add3_pay <> "" Then %>
			 3차	연장금 : <%=mr_add3_pay%>원<br>
				<%End If %> -->
				<%If mr_add1_pay = "" And mr_add2_pay = "" And mr_add3_pay = "" Then %>
				연장금 : 해당사항 없음<br>
				<%End If %>
			</div>
 
			<div class="plan_input">
				<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal11"/><br>
			</div> 
		<% End  If %> 
	<% End  If %> 
  
	<% If MS_add_pay1_check = "" Then  %>
		<% If mr_add1_pay <> "" Then '연장1%> 
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				<!-- 1차연장 --> 결제알림
			</div>
			<div class="plan_box_01_sub"> 
				<span class="plan_text_01">1차 연장금 : <%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일<br> (<%=mr_add1_pay%>원) 입금완료</span><br> 
			</div>
	 
			<div class="plan_input">
				<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal17"/><br>
			</div>
		<% End If %>
	<% End If %>	 

 	<% If MS_add_pay2_check = "" Then  %>
		<% If mr_add2_pay <> "" Then '연장2%> 
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				<!-- 2차연장 --> 결제알림
			</div>
			<div class="plan_box_01_sub"> 
				<span class="plan_text_01"> 2차	연장금 : <%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일 <br>(<%=mr_add2_pay%>원) 입금완료</span><br>
				 
	 
			</div>
	 
			<div class="plan_input">
				<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal18"/><br>
			</div>
		<% End If %>
	<% End If %>
 
  	<% If MS_add_pay3_check = "" Then  %>
		<% If mr_add3_pay <> "" Then '연장3%> 
		<% cnt =  cnt + 1 %>
			<div class="plan_box_01">
				<!-- 3차연장  -->결제알림
			</div>
			<div class="plan_box_01_sub"> 
				<span class="plan_text_01">3차	연장금 : <%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일<br> (<%=mr_add3_pay%>원) 입금완료</span><br> 
			</div>
	 
			<div class="plan_input">
				<input type="button" name="plan_addpay_btn" id="plan_addpay_btn" class="plan_input_01" value="자세히보기"  data-toggle="modal" data-target="#myModal19"/><br>
			</div>
		<% End If %> 
	<% End If %> 

<%' Response.write "cnt=" & cnt & "<br>" %>

<% If cnt = 0 Then %>
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
<% End If %> 

   
<!--  -->

 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->

		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">정보확인</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
						<img src="img/address_02.jpg" width="280"/> 

						<div class="plan_box_01_sub">
							<a href="setting.asp"><input type="button" name="addset_btn" id="addset_btn" class="plan_input_02_1" value="설정하기"  /></a>
						</div>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_update();">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">출산선물선택</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
							<a href="#" >쇼핑몰 바로가기</a><br>
							<img src="/image/giftbtn1.jpg" width="250"><br>
							<img src="/image/gift01.jpg" width="250"><br>
							<img src="/image/giftbtn2.jpg" width="250"><br>
							<img src="/image/gift02.jpg" width="250"><br>
							<img src="/image/giftbtn3.jpg" width="250"><br>
							<img src="/image/gift04.jpg" width="250"><br>
							<img src="/image/giftbtn4.jpg" width="250"><br>
							<img src="/image/gift04.jpg" width="250"><br>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_gift();">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">산후도우미</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				<div class="plan_box_01_sub" style="border:1px solid #ffffff;">
					<%=helper_name1%> 관리사님 <br>
					연락처 : <%=helper_hp%><br> 
					<a href="tel:<%=helper_hp%>">통화</a> 
					 
					<% If HELPER_HEALTH_FLG = "Y" Then %>
					<div class="plan_input">
						<input type="button" name="plan_btn" id="plan_btn" class="plan_input_02" value="건강진단완료" style="margin:10px;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;" />
					</div>
					<%End If %>
					<% If  INSURANCE_FLG ="Y" Then %>
					<div class="plan_input">
						<input type="button" name="plan_btn" id="plan_btn" class="plan_input_02" value="배상보험 가입완료" style="margin:10px;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;" />
					</div>
					<%End If %> 
				 </div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_helper();">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>



		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 <span class="plan_text_01">관리사 방문예정</span><br>
					<%=Left(helper_visit_date,4)%>년  <%=mid(helper_visit_date,5,2)%>월 <%=right(helper_visit_date,2)%>일 <br>
				<%If visit_time <> "" Then %>
					<%=visit_time%> 시 <%=visit_minute%> 분
				<%End If %> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_helper_visit();">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
					<div class="plan_box_01_sub">
						 산전 : <%=product_MASSAGE_BEFORE%>회<br>
						 산후 : <%=product_MASSAGE_AFTER%>회<br>
						 담당자 : <%=massage_mng%><br>
						 연락처 : <%=massage_hp%><br>
					</div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_bodycare();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

		<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 		<div class="plan_box_01_sub">
							산전 방문예정<br> 
							연락처 <%=visit_nurse_hp%>
						</div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_nurse_visit();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 		<div class="plan_box_01_sub">
							 모유성분 분석서비스<br>
							 예정<br>
							 담당자 : <%=mom_milk_mng%><br>
							 연락처 : <%=mom_milk_hp%>
						</div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_mom_milk_analysis();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div> 

		<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 		<div class="plan_box_01_sub">
							 아기맞이 소독 서비스<br>
							 예정<br>
							 담당자 : <%=sodok_mng%><br>
							 연락처 : <%=sodok_hp%> 
						</div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_sodok();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div> 

		<div class="modal fade" id="myModal9" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">스케쥴알림</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 		<div class="plan_box_01_sub">
							 모유수유 마사지 예정<br>
							 총 <%=mom_milk_msg_cnt%>회<br>
							 담당자 : <%=mom_milk_msg_mng%><br>
							 연락처 : <%=mom_milk_msg_hp%> 
						</div>
	 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_mom_milk_msg();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal11" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">결제</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
				 		<div class="plan_box_01_sub">
							 <span class="plan_text_01">계약금 : <%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일<br>(<%=payment%>원)입금완료</span><br>
											잔금 : <%=payState%><br>
								<!-- <% If mr_add1_pay <> "" Then %>		
											연장금 : <%=mr_add1_pay%>원<br>
								<%End If %>
								<% If mr_add2_pay <> "" Then %>
										 2차	연장금 : <%=mr_add2_pay%>원<br>
								<%End If %>
								<%If mr_add3_pay <> "" Then %>
										 3차	연장금 : <%=mr_add3_pay%>원<br>
								<%End If %>
								<%If mr_add1_pay = "" And mr_add2_pay = "" And mr_add3_pay = "" Then %>
											연장금 : 해당사항 없음<br>
								<%End If %> -->
						</div> 
				</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_pay();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

		<div class="modal fade" id="myModal12" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">만족도조사 설문 </h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
 
								<div style="padding-top:20px;">
									<input type="hidden" id="starRating1" name="star_helper"/>
									<input type="hidden" id="starRating2" name="star_nurse" />
									<input type="hidden" id="starRating3" name="star_body" />
									<input type="hidden" id="starRating4" name="star_msg" />
									<input type="hidden" id="starRating5" name="star_analysis"/>
									<input type="hidden" id="starRating6" name="star_sodok" />
								</div>
						 
								<div style="padding-top:20px;">
									<!-- <label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span> -->
								</div>
								 
								 <div id="star1" > 산후도우미 </div><br>
								 <div id="star2" > 전담간호사 </div><br>
								 <div id="star3" > 바디케어 </div><br>
								 <div id="star4" > 모유수유마사지 </div><br>
								 <div id="star5" > 모유성분 분석 </div><br>
								 <div id="star6" > 아기맞이 소독 </div><br> 
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal14" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">1차 연장알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><!-- 연장금 : <%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일<br> (<%=mr_add1_pay%>원) 입금완료<br> -->
							<%=service%>&nbsp;<%=add_day1+1%>일 연장 </span><br> 
							<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일  ~<br>
							<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일   
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_add_service1();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal15" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">2차 연장알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%>&nbsp;<%=add_day2+1%>일 연장 </span><br>
							<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일  <br>
							<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일   
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_add_service2();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>
		
		
		<div class="modal fade" id="myModal16" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">3차 연장알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%>&nbsp;<%=add_day3+1%>일 연장 </span><br>
							<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일  <br>
							<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일   
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_add_service3();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal13" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">서비스정보</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%> / <%=period%> /  <%=service_type%></span><br>
							<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
							<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="address_service();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal17" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">연장결제알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%>&nbsp;<%=add_day1+1%>일 연장 <br>
							연장금 : <%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일<br> (<%=mr_add1_pay%>원) 입금완료<br></span>
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="add_pay1();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal18" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">2차 연장결제알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%>&nbsp;<%=add_day2+1%>일 연장 <br>
							연장금 : <%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일<br> (<%=mr_add2_pay%>원) 입금완료<br></span>
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="add_pay2();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>


		<div class="modal fade" id="myModal19" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">3차 연장결제알림</h4>
			  </div> 
					<div class="modal-body" style="text-align:center;">
						
				 		<div class="plan_box_01_sub"> 
							<span class="plan_text_01"><%=service%>&nbsp;<%=add_day3+1%>일 연장 <br>
							연장금 : <%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일<br> (<%=mr_add3_pay%>원) 입금완료<br></span>
						</div>
	 
					</div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal" onclick="add_pay3();" >확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

<!-- 

  Button trigger modal  
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Launch demo modal
</button>

< Modal  >
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


 -->
 
	  




    </div><!-- /.container -->

  </body>

    <script src="js/leftmenu.js"></script>

</html>
