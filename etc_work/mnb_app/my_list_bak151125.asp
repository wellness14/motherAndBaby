<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

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
			service_date = Rs(25)  '서비스 등록일(서비스 신청날짜)
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
			res_pay_ment_dt				= Rs(63) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_service			= Rs(64) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_mng				= Rs(65) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_hp					= Rs(66) ' 모유성분 분석서비스 

			mom_milk_msg_ser			= Rs(67) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_cnt			= Rs(68) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_mng			= Rs(69) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mom_milk_msg_hp				= Rs(70) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			mr_add1_pay					= Rs(71) ' 연장금1
			mr_add2_pay					= Rs(72) ' 연장금2
			mr_add3_pay					= Rs(73) ' 연장금3

			hp_point					= Rs(74) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			nurse_point					= Rs(75) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			bodycare_point				= Rs(76) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			milk_msg_point				= Rs(77) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			milk_analysis_point			= Rs(78) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			sodok_point					= Rs(79) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			helper_visit_date			= Rs(80) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			helper_visit_time			= Rs(81) ' 상담자 메모 관리자만 볼수있음. -- 사용

			mr_sodok_date				= Rs(82) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_bodycare_date			= Rs(83) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_nurse_date				= Rs(84) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_mmilk_analysis_date		= Rs(85) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			mr_milk_msg_date			= Rs(86) ' 상담자 메모 관리자만 볼수있음. -- 사용안함

			add_pay1_date				= Rs(87) ' 연장금1 등록일
			add_pay2_date				= Rs(88) ' 연장금2 등록일
			add_pay3_date				= Rs(89) ' 연장금3 등록일
 
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

		'-------일정카드 사용자 확인 부분 날짜 등등-----------------------------------------------------------------------------
		strSql1 = ""
		strSql1 = strSql1 & " ;SELECT  *  FROM  MO_APP_MY_DATA_CHECK  where MR_IDX =  '"& mr_idx &"' order by  MS_CHECK_DATE  desc " 
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then   

			MR_IDX					=Rs(1)
			MR_MEM_ID				=Rs(2) 
			MS_CHECK_NAME			=Rs(3) 
			MS_CHECK_FLG			=Rs(4) 
			MS_CHECK_DATE			=Rs(5)    

			arr_mylist = Rs.getRows()
		End If 
		Call RSClose(Rs) 
		'------------------------------------------------------------------------------------------------------------
	End If

 	'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)
 
	'	정보수정날짜  
	strSql = " select MM_UPD_DT from MO_MEM_MAS where  MM_MEM_ID  =  '"& uId &"' "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		update_date = Rs(0)
		arr_list = Rs.getRows()
	End If 
	Call RSClose(Rs) 

'	If payment <> ""  Then 
'		pay_arr=split(payment,",") 
'		pay_a = pay_arr(0)
'		pay_b = pay_arr(1)
'	End If 
  
	If update_date <> "" Then 
		 up_date 			= 	Left(update_date,10)
	End If 
	If service_date <> "" Then 
		 service_date_in 	= 	Left(service_date,10)
	End If 

	' 출산
	If up_date <> "" Then 
		update_date_arr=split(up_date,"-") 
		update_date_y = update_date_arr(0)
		update_date_m = update_date_arr(1)
		update_date_d = update_date_arr(2)
		update_date_ymd = update_date_y &  update_date_m  &  update_date_d 
	End If 

	' 
 	If service_date_in <> "" Then 
		service_date_arr=split(service_date_in,"-") 
		service_date_y = service_date_arr(0)
		service_date_m = service_date_arr(1)
		service_date_d = service_date_arr(2)
		service_date_ymd = service_date_y &  service_date_m  &  service_date_d 
	End If  

	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
		Now_y = Now_arr(0)
		Now_m = Now_arr(1)
		Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d

	If helper_visit_time <> "" then
		class_value = helper_visit_time
		dim myarray                          
		myarray=split(class_value,":")
		visit_time	=	myarray(0)      
		visit_minute=	myarray(1)
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
		temp.find('input.plan_input_03').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();//'닫기'버튼을 클릭하면 레이어가 사라진다.
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
<body>
<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>">
<!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->  
	<div class="container">  
	<!--  
	주소정보확인					(날짜, 완료구분)	2
	서비스정보						(날짜, 완료구분)	2
	츨산선물						(날짜, 완료구분)	
	산후도우미						(날짜, 완료구분)	2
	스케줄알림1 : 관리사방문예정		(날짜, 완료구분)	2
	스케줄알림2 : 바디케어			(날짜, 완료구분)	2
	스케줄알림3 : 간호사방뭉			(날짜, 완료구분)	2
	스케줄알림4 : 모유성분 분석 서비스	(날짜, 완료구분)	2
	스케줄알림5 : 소독서비스			(날짜, 완료구분)	2
	스케줄알림6 : 모유수유 마사지		(날짜, 완료구분)	2
	연장알림						(날짜, 완료구분)	2
	결제알림						(날짜, 완료구분)	2 
	서비스번호, 아이디 ,  
	서비스정보 확인  확인 미확인 구분수정, 연장 확인 미확인 구분 수정
	--> 
	<div style="margin-top:40px;"></div>
 

<%
	If IsArray(arr_mylist) Then 
		For num=0 To UBound(arr_mylist,2)		
 
			idx			= arr_mylist(1,num)
			mem_id		= arr_mylist(2,num)
			check_name	= arr_mylist(3,num)
			check_flag	= arr_mylist(4,num)
			check_date	= arr_mylist(5,num)


If check_name = "address"			Then	check_name = "주소지/개인정보"			End If 
If check_name = "helper_visit"		Then	check_name = "스케쥴-관리사방문"			End If 
If check_name = "add_pay1"			Then	check_name = "결제(1차연장)"			End If 
If check_name = "add_pay2"			Then	check_name = "결제(2차연장)"			End If 
If check_name = "add_pay3"			Then	check_name = "결제(3차연장)"			End If 
If check_name = "nurse_visit"		Then	check_name = "스케쥴-간호사방문"			End If 
If check_name = "service"			Then	check_name = "서비스정보"				End If 
If check_name = "mom_milk_analysis" Then	check_name = "스케쥴-모유성분분석"		End If 
If check_name = "pay"				Then	check_name = "결제"					End If 
If check_name = "add_service1"		Then	check_name = "연장1"				End If 
If check_name = "add_service2"		Then	check_name = "연장2"				End If 
If check_name = "add_service3"		Then	check_name = "연장3"				End If 
If check_name = "gift"				Then	check_name = "출산선물선택"				End If 
If check_name = "helper"			Then	check_name = "산후도우미"				End If 
If check_name = "mom_milk_msg"		Then	check_name = "스케쥴-모유수유마사지"		End If 
If check_name = "sodok"				Then	check_name = "스케쥴-소독서비스"			End If 
If check_name = "bodycare"			Then	check_name = "스케쥴-전신마사지"			End If  
%>  
		<%If addr_1 <> "" Then %> 
			<% If check_name =  "주소지/개인정보" Then %> 
			<div class="my_box_01_1">
				<div class="my_box_02_2">
					<% If MS_CHECK_FLG = "Y" Then %> 확인 <% Else %> 정보확인 <% End If %>
				</div>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03"><%=addr_1%><br><%=addr_2%></span><br> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>
  
			<!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
				<span class="service_text_03"><%=addr_1%><br><%=addr_2%><br></span> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			 </div>  -->
			 <%End if%>
		<%End If %>

		<%If helper_visit_date <> "" Then %> 
				<% If check_name =  "스케쥴-관리사방문" Then %> 

			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					완료
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03">관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (??병원) 입원실 ???호<br>  </span> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> 


 
 
				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= helper_visit_date Then %>완료<% else %>예정<%End if%></span></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div>
					<span class="service_text_03">관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (??병원) 입원실 ???호<br>  </span> 
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				 </div>  -->
			 <%End if%>
		<%End If %>

		<%If add_pay1_date <> "" Then %> 
			<% If check_name =  "결제(1차연장)" Then %>  
			<div class="my_box_01">
				<%If MS_CHECK_FLG = "Y" Then %>
					<div class="my_box_02">
						완료
					</div>
				<%Else %>
					<div class="my_box_02">
						예정
					</div>
				<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일 (<%=mr_add1_pay%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>  
 
				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div>
					<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일 (<%=mr_add1_pay%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				</div> -->
			 <%End if%>
		<%End If %>
  
		<%If add_pay2_date <> "" Then %> 
			<% If check_name =  "결제(2차연장)" Then %>  
			<div class="my_box_01">
				<%If MS_CHECK_FLG = "Y" Then %>
					<div class="my_box_02">
						완료
					</div>
				<%Else %>
					<div class="my_box_02">
						예정
					</div>
				<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일 (<%=mr_add2_pay%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>   

				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div>
					<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일 (<%=mr_add2_pay%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				</div> -->
			 <%End if%>
		<%End If %>
		
		<%If add_pay3_date <> "" Then %> 
			<% If check_name =  "결제(3차연장)" Then %> 
			<div class="my_box_01">
				<%If MS_CHECK_FLG = "Y" Then %>
					<div class="my_box_02">
						완료
					</div>
				<%Else %>
					<div class="my_box_02">
						예정
					</div>
				<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일 (<%=mr_add3_pay%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>  


			<!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
				<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일 (<%=mr_add3_pay%>원)</span><br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> -->
			 <%End if%>
		<%End If %>

		<%If visit_nurse_hp <> "" Then %>
			<% If check_name =  "스케쥴-간호사방문" Then %> 

			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= mr_nurse_date Then %>완료<% else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03">  연락처 <%=visit_nurse_hp%></span><br> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 
  
<!-- 

			<div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_nurse_date Then %>완료<% else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
		 
				<span class="service_text_03">  연락처 <%=visit_nurse_hp%></span><br> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div>-->
			 <%End if%> 
		<%End If %>

		<%If service <> "" Then %>
			<% If check_name =  "서비스정보" Then %> 
			<div class="my_box_01_1">
				<div class="my_box_02_2">
					<% If MS_CHECK_FLG = "Y" Then %> 확인 <% Else %> <%=check_name%> <% End If %>
				</div>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
					<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료<br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>

 
			<!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
				<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
					<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료<br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> -->
			 <%End if%> 
		<%End If %>
 
		<% If mom_milk_hp <> "" Then %>
			<% If check_name =  "스케쥴-모유성분분석" Then %> 

			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= mr_mmilk_analysis_date Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03">방문예정<br> 연락처 <%=mom_milk_hp%></span><br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 

 

<!-- 
			<div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_mmilk_analysis_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
	 
				<span class="service_text_03">방문예정<br> 연락처 <%=mom_milk_hp%></span><br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> -->
			 <%End if%>
		<%End If %>
 
		<%If res_pay_ment_dt <> ""  Then   %>
			<% If check_name =  "결제" Then %> 
			<div class="my_box_01">
				<%If MS_CHECK_FLG = "Y" Then %>
					<div class="my_box_02">
						완료
					</div>
				<%Else %>
					<div class="my_box_02">
						예정
					</div>
				<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
						<span class="service_text_03">계약금 입금확인<br><%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일 (<%=payment%>원)</span><br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div>   





			<!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
				 
				<span class="service_text_03">계약금 입금확인<br><%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일 (<%=payment%>원)</span><br>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> -->
			 <%End if%>
		<%End If %> 

		<%If serviceSdt_1 <> "" Then %>
			<% If check_name =  "연장1" Then %> 

			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= serviceEdt_1 Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일 시작<br>
					<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 

 

			<!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= serviceEdt_1 Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div>
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일 시작<br>
					<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
				</div> -->
			<%End If %>
		<%End If %>

		<%If serviceSdt_2 <> "" Then %> 
			<% If check_name =  "연장2" Then %> 

			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= serviceEdt_1 Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일 시작<br>
					<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 
  

				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= serviceEdt_2 Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div>
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일 시작<br>
					<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
				</div> -->
			<%End If %>
		<%End If %> 

		<%If serviceSdt_3 <> "" Then %> 
			<% If check_name =  "연장3" Then %>  


			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= serviceEdt_1 Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일 시작<br>
					<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 
 

				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= serviceEdt_3 Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div>
					<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
					<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일 시작<br>
					<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일 종료<br>
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
				</div> -->
			<%End If %>
		<%End If %>
 


  
		<%  
		rst = Len(product_GIFT_CHOICE) 

		if rst = "0" then%>
 
		<%Else %>
		<% If check_name =  "출산선물선택" Then %> 
			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					완료
				</div>
			<%Else %>
				<div class="my_box_02">
					정보확인
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03"><%=product_GIFT_CHOICE%><br></span> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> 
	
 
			 <!-- <div class="mylist_box_01_sub">
				<div style="margin-bottom:40px;">
					<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
				</div> 

				<span class="service_text_03"><%=product_GIFT_CHOICE%><br></span> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> -->
			 <%End if%>
		<%End If %>

		<% If check_name =  "산후도우미" Then %>
			 <%If helper_name1	<>	"" Then %> 
			<div class="my_box_01_1">
				<div class="my_box_02_2">
					<%If Now_ymd >= helper_visit_date Then %>완료<% Else %>예정<%End if%>
				</div>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03"><%=helper_name1%>관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (??병원) 입원실 ???호<br><%=helper_hp%><br></span>
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
			</div> 

		 <!-- <div class="mylist_box_01_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= helper_visit_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
			</div> 
			<span class="service_text_03"><%=helper_name1%>관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (??병원) 입원실 ???호<br><%=helper_hp%><br></span>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
		</div> -->
			 <%End if%> 
		<%End If %>
 
		<%If mom_milk_msg_cnt <> "" Then %>
			<% If check_name =  "스케쥴-모유수유마사지" Then %>
			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= mr_milk_msg_date Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03">모유수유 마사지 예정<br>
												총 <%=mom_milk_msg_cnt%>회<br>
												연락처 <%=mom_milk_msg_hp%><br></span> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 
 



				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_milk_msg_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div> 
					 
					<span class="service_text_03">모유수유 마사지 예정<br>
												총 <%=mom_milk_msg_cnt%>회<br>
												연락처 <%=mom_milk_msg_hp%><br></span> 
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				</div> -->
			 <%End if%>
		<%End If %>

 		<%If sodok_hp <> "" Then %>
			<% If check_name =  "스케쥴-소독서비스" Then %> 
			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= mr_sodok_date Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
			
			<div class="my_box_01_sub">
				<span class="service_text_03">아기맞이 소독서비스 <br>  연락처 : <%=sodok_hp%><br> </span>  
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 



 

				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_sodok_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div> 
					 
					<span class="service_text_03">아기맞이 소독서비스 <br>  연락처 : <%=sodok_hp%><br> </span>  
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				</div> -->
			 <%End if%>
		<%End If %>

 		<% If massage_hp <> "" Then %>
			<% If check_name =  "스케쥴-전신마사지" Then %> 
			<div class="my_box_01">
			<%If MS_CHECK_FLG = "Y" Then %>
				<div class="my_box_02">
					<%If Now_ymd >= mr_bodycare_date Then %>완료<% Else %>예정<%End if%>
				</div>
			<%Else %>
				<div class="my_box_02">
					예정
				</div>
			<%End If %>
				<div class="my_box_03">
					<%=check_name%>
				</div>
			</div>
 
			<div class="my_box_01_sub">
				<span class="service_text_03">바디케어 방문예정<br>  연락처 :  <%=massage_hp%></span><br> 
				<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span> 
			</div> 
 


				<!-- <div class="mylist_box_01_sub">
					<div style="margin-bottom:40px;">
						<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_bodycare_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">스케쥴</span><span style="float:right;padding-right:50px;"><%=check_name%></span>
					</div> 
					 
					<span class="service_text_03">바디케어 방문예정<br>  연락처 :  <%=massage_hp%></span><br> 
					<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
				</div> -->
			 <%End if%>
		<%End If %>

 


	<!-- </div>  -->
 			
		 
<%
		Next 
	Else
%>
		<div class="mylist_box_01_sub">
			<span class="service_text_03">확인할 정보가 없습니다.</span>
		</div>
<%
	End If
%>

<!-- 
<%	If res_pay_ment_dt <> ""  Then   %>
		<div class="mylist_box_01_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;">결제</span>
			</div>

			<span class="service_text_03">계약금 입금확인<br><%=Left(res_pay_ment_dt,4)%>년<%=mid(res_pay_ment_dt,5,2)%>월<%=right(res_pay_ment_dt,2)%>일 (<%=payment%>원)</span><br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(res_pay_ment_dt,4)%>.<%=mid(res_pay_ment_dt,5,2)%>.<%=right(res_pay_ment_dt,2)%></span>
		</div> 
<%End if%>

<%If addr_1 <> "" Then %>
 	 	<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;">주소지/개인정보</span>
			</div> 

			<span class="service_text_03"><%=addr_1%><br><%=addr_2%><br></span> 
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADDRESS_CHECK_DATE,4)%>.<%=mid(MS_ADDRESS_CHECK_DATE,5,2)%>.<%=right(MS_ADDRESS_CHECK_DATE,2)%></span>
		</div>
 <%End if%>

<%If sodok_hp <> "" Then %>
 		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_sodok_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">스케쥴</span>
			</div> 

			<span class="service_text_03">아기맞이 소독서비스 완료<br>  연락처 : <%=sodok_hp%><br> </span>  
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_SODOK_CHECK_DATE,4)%>.<%=mid(MS_SODOK_CHECK_DATE,5,2)%>.<%=right(MS_SODOK_CHECK_DATE,2)%></span>
		</div>
<%End if%>

<%If service <> "" Then %>
		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">서비스정보</span>
			</div> 

			<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
			<%=Left(serviceSdt,4)%>년  <%=mid(serviceSdt,5,2)%>월 <%=right(serviceSdt,2)%>일 시작<br>
			<%=Left(serviceEdt,4)%>년  <%=mid(serviceEdt,5,2)%>월 <%=right(serviceEdt,2)%>일 종료<br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_SERVICE_CHECK_DATE,4)%>.<%=mid(MS_SERVICE_CHECK_DATE,5,2)%>.<%=right(MS_SERVICE_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<%If helper_visit_date <> "" Then %>
		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">완료</span><span style="float:right;padding-right:50px;">스케쥴</span>
			</div> 

			<span class="service_text_03">관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (00병원) 입원실 102호<br>  </span> 
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_VISIT_CHECK_DATE,4)%>.<%=mid(MS_VISIT_CHECK_DATE,5,2)%>.<%=right(MS_VISIT_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<%If helper_name1 <> "" Then %>
 	 	<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">산후도우미</span>
			</div> 

			<span class="service_text_03"><%=helper_name1%>관리사 방문예정<br><%=Left(helper_visit_date,4)%>년<%=mid(helper_visit_date,5,2)%>월<%=right(helper_visit_date,2)%>일 <%=visit_time%>:<%=visit_minute%><br>방문장소 (00병원) 입원실 102호<br><%=helper_hp%><br></span>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_HELPER_CHECK_DATE,4)%>.<%=mid(MS_HELPER_CHECK_DATE,5,2)%>.<%=right(MS_HELPER_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<% If massage_hp <> "" Then %>
		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_bodycare_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">스케쥴</span>
			</div> 

			<span class="service_text_03">바디케어 방문예정<br>  연락처 :  <%=massage_hp%></span><br> 
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_BODYCARE_CHECK_DATE,4)%>.<%=mid(MS_BODYCARE_CHECK_DATE,5,2)%>.<%=right(MS_BODYCARE_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<%If visit_nurse_hp <> "" Then %>
 		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_nurse_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">전담간호사</span>
			</div>
 
			<span class="service_text_03">방문예정<br> 연락처 <%=visit_nurse_hp%></span><br> 
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_NURSE_VISIT_CHECK_DATE,4)%>.<%=mid(MS_NURSE_VISIT_CHECK_DATE,5,2)%>.<%=right(MS_NURSE_VISIT_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<% If mom_milk_hp <> "" Then %>
 		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_mmilk_analysis_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">스케쥴</span>
			</div>  

			<span class="service_text_03">방문예정<br> 연락처 <%=mom_milk_hp%></span><br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_MILK_ANALYSIS_CHECK_DATE,4)%>.<%=mid(MS_MILK_ANALYSIS_CHECK_DATE,5,2)%>.<%=right(MS_MILK_ANALYSIS_CHECK_DATE,2)%></span>
		</div>
<%End If %>

<%If mom_milk_msg_cnt <> "" Then %>
 		 <div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag"><%If Now_ymd >= mr_milk_msg_date Then %>완료<% Else %>예정<%End if%></span><span style="float:right;padding-right:50px;">스케쥴</span>
			</div>  
			
			<span class="service_text_03">모유수유 마사지 예정<br>
											총 <%=mom_milk_msg_cnt%>회<br>
											연락처 <%=mom_milk_msg_hp%><br></span> 
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_MOM_MILK_DATE,4)%>.<%=mid(MS_MOM_MILK_DATE,5,2)%>.<%=right(MS_MOM_MILK_DATE,2)%></span>
		</div>
<%End If %>

<%If serviceSdt_1 <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">연장알림1</span>
			</div> 

			<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
			<%=Left(serviceSdt_1,4)%>년  <%=mid(serviceSdt_1,5,2)%>월 <%=right(serviceSdt_1,2)%>일 시작<br>
			<%=Left(serviceEdt_1,4)%>년  <%=mid(serviceEdt_1,5,2)%>월 <%=right(serviceEdt_1,2)%>일 종료<br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_1_DATE,4)%>.<%=mid(MS_ADD_1_DATE,5,2)%>.<%=right(MS_ADD_1_DATE,2)%></span>
		</div>
<%End If %>

<%If serviceSdt_2 <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">연장알림2</span>
			</div> 

			<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
			<%=Left(serviceSdt_2,4)%>년  <%=mid(serviceSdt_2,5,2)%>월 <%=right(serviceSdt_2,2)%>일 시작<br>
			<%=Left(serviceEdt_2,4)%>년  <%=mid(serviceEdt_2,5,2)%>월 <%=right(serviceEdt_2,2)%>일 종료<br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_2_DATE,4)%>.<%=mid(MS_ADD_2_DATE,5,2)%>.<%=right(MS_ADD_2_DATE,2)%></span>
		</div>
<%End If %>

<%If serviceSdt_3 <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">연장알림3</span>
			</div> 

			<span class="service_text_03"><%=service%> / <%=period%> /  <%=service_type%></span><br>
			<%=Left(serviceSdt_3,4)%>년  <%=mid(serviceSdt_3,5,2)%>월 <%=right(serviceSdt_3,2)%>일 시작<br>
			<%=Left(serviceEdt_3,4)%>년  <%=mid(serviceEdt_3,5,2)%>월 <%=right(serviceEdt_3,2)%>일 종료<br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_3_DATE,4)%>.<%=mid(MS_ADD_3_DATE,5,2)%>.<%=right(MS_ADD_3_DATE,2)%></span>
		</div>
<%End If %>

<%If add_pay1_date <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">1차연장 결제알림</span>
			</div> 

			<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay1_date,4)%>년<%=mid(add_pay1_date,5,2)%>월<%=right(add_pay1_date,2)%>일 (<%=mr_add1_pay%>원)</span><br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_1_PAY_DATE,4)%>.<%=mid(MS_ADD_1_PAY_DATE,5,2)%>.<%=right(MS_ADD_1_PAY_DATE,2)%></span>
		</div>
<%End If %>

<%If add_pay2_date <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">2차연장 결제알림</span>
			</div> 

			<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay2_date,4)%>년<%=mid(add_pay2_date,5,2)%>월<%=right(add_pay2_date,2)%>일 (<%=mr_add2_pay%>원)</span><br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_2_PAY_DATE,4)%>.<%=mid(MS_ADD_2_PAY_DATE,5,2)%>.<%=right(MS_ADD_2_PAY_DATE,2)%></span>
		</div>
<%End If %>

<%If add_pay3_date <> "" Then %>
		<div class="mylist_box_02_sub">
			<div style="margin-bottom:40px;">
				<span name="post_btn" id="post_btn" class="mylist_flag">확인</span><span style="float:right;padding-right:50px;">3차연장 결제알림</span>
			</div> 

			<span class="service_text_03">연장금 입금확인<br><%=Left(add_pay3_date,4)%>년<%=mid(add_pay3_date,5,2)%>월<%=right(add_pay3_date,2)%>일 (<%=mr_add3_pay%>원)</span><br>
			<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(MS_ADD_3_PAY_DATE,4)%>.<%=mid(MS_ADD_3_PAY_DATE,5,2)%>.<%=right(MS_ADD_3_PAY_DATE,2)%></span>
		</div>
<%End If %>

<%
If res_pay_ment_dt = "" And addr_1 = "" And sodok_hp  = "" And service = "" And helper_visit_date = "" And helper_name1 = "" And massage_hp = "" And visit_nurse_hp = "" And mom_milk_hp = "" And mom_milk_msg_cnt = "" And serviceSdt_1 = "" And serviceSdt_2 = "" And serviceSdt_3 = "" And add_pay1_date = "" And add_pay2_date = "" And add_pay3_date = "" Then  %>
		<div class="mylist_box_02_sub">
			<span class="service_text_03">확인할 정보가 없습니다.</span>
		</div>
<%End If %>
 -->
 
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->

	  



    </div><!-- /.container -->

  </body>

    <script src="js/leftmenu.js"></script>

</html>
