<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디
	If uId = "" Then 
		Response.Redirect "http://mothernbaby.co.kr/mnb_notebook/login.asp"
	End If 
Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
 
	Dim mode : mode = "ins"

	intIDX = fncRequest("idx")
	hp_seq = fncRequest("hp_seq")
	baby1_seq = fncRequest("baby1_seq")
	note_day_now = fncRequest("note_day")

 	helper_id = uId 'fncRequest("helper_id")

	type1 = "주간"
	type2 = "야간" 

    If intIDX <> "" Then
		strTable = " FROM MO_RESERVATION WITH(NOLOCK)  full outer  join	mo_baby			on MO_RESERVATION.mr_idx = mo_baby.mr_idx"
 
		strWhere = " WHERE MR_CNLKBN='N' AND MO_RESERVATION.MR_IDX = '"& intIDX &"' "
	
	If baby1_seq <> "" Then 
		strWhere = strWhere & " and  mo_baby.mo_seq='"& baby1_seq &"' "
		mode = "upd"

	End If
 
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
		If baby1_seq <> "" Then 			 
			baby_seq					= Rs(54) ' 
		'	helper_id					= Rs(56) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			 
		End if
			arr_res_List = Rs.GetRows()

		End If 
		Call RSClose(Rs)
	End If 
 

 	strSql	 = "		;SELECT distinct mo_note_day  from  MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		day_list = Rs.GetRows()'관리대장일차 
	End If 
	Call RSClose(Rs)


	strSql	 = "		;SELECT distinct max(mo_note_day)  from  MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		max_day = Rs(0)
		max_day_list = Rs.GetRows()'관리대장일차 
	End If 
	Call RSClose(Rs)
 
	strSql	 = "		;SELECT distinct min(mo_note_day)  from  MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		min_day = Rs(0)
		min_day_list = Rs.GetRows()'관리대장일차 
	End If 
	Call RSClose(Rs)
 
	MO_NOTE_DAY = 1

	If note_day_now <> "" Then 
		
		strSql	 = "		;SELECT * from  MO_NOTE_DETAIL "
		strWhere = "		where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY = '"& note_day_now &"' "
		strSql = strSql & strWhere

		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			day_detail_list = Rs.GetRows()'관리대장일차 
		End If 
		Call RSClose(Rs)

	MO_NOTE_DAY = note_day_now

	End if
	 
'serviceSdt_1	serviceEdt_1
    '주간------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오전9시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_AM_9 = Rs.GetRows()'오전9시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오전10시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_AM_10 = Rs.GetRows()'오전10시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오전11시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_AM_11 = Rs.GetRows()'오전11시
	End If 
	Call RSClose(Rs)
 
	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후12시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_12 = Rs.GetRows()'오후12시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후1시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_1 = Rs.GetRows()'오후1시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후2시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_2 = Rs.GetRows()'오후2시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후3시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_3 = Rs.GetRows()'오후3시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후4시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_4 = Rs.GetRows()'오후4시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후5시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_5 = Rs.GetRows()'오후5시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type1 &"' and MO_NOTE_WORK_TIME = '오후6시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE1_PM_6 = Rs.GetRows()'오후6시
	End If 
	Call RSClose(Rs)
 
	'야간------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후7시' "
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_7 = Rs.GetRows()'오후7시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후8시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_8 = Rs.GetRows()'오후8시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후9시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_9 = Rs.GetRows()'오후9시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후10시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_10 = Rs.GetRows()'오후10시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후11시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_11 = Rs.GetRows()'오후11시
	End If 
	Call RSClose(Rs) 

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오후12시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_PM_12 = Rs.GetRows()'오후12시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전1시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_1 = Rs.GetRows()'오전1시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전2시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_2 = Rs.GetRows()'오전2시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전3시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_3 = Rs.GetRows()'오전3시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전4시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_4 = Rs.GetRows()'오전4시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전5시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_5 = Rs.GetRows()'오전5시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전6시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_6 = Rs.GetRows()'오전6시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전7시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_7 = Rs.GetRows()'오전7시
	End If 
	Call RSClose(Rs)

	strSql	 = "		;SELECT * from MO_NOTE_DETAIL "
	strWhere = "  where  MR_IDX='"& intIDX &"' and  MO_BABY_SEQ = '"& baby_seq &"' and  MO_NOTE_DAY= '"& MO_NOTE_DAY &"'  and MO_NOTE_WORK = '"& type2 &"' and MO_NOTE_WORK_TIME = '오전8시' " 
	strSql = strSql & strWhere

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		TYPE2_AM_8 = Rs.GetRows()'오전8시
	End If 
	Call RSClose(Rs)

'-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

	<style type="text/css">
		.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 360px; height:auto;  background-color:#fff; border: 5px solid #36c5a5; z-index: 10;}
		.pop-layer .pop-container {padding: 20px 25px;}
		.pop-layer p.ctxt {color: #666; line-height: 25px;}
		.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

		a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #36c5a5; background-color:#36c5a5; font-size:13px; color:#fff; line-height:25px;}	
		a.close_btn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #36c5a5; background-color:#36c5a5; font-size:13px; color:#fff; line-height:25px;}	
		a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
 
		ul.tabs {
			float:left;
			list-style:none;
			height:32px;
			width:100%;
			border-radius:8px 0 -50px 0;
			margin:0px 0px;
			padding:0;
		}
		  
		ul.tabs li {
			float:left;
			height:31px;
			line-height:31px;
			border:1px solid #999;
			overflow:hidden;
			position:relative;
			background:#e0e0e0;
			-webkit-border-top-left-radius:8px;
			-webkit-border-top-right-radius:8px;
			-moz-border-radius-topleft:8px;
			-moz-border-radius-topright:8px;
			border-top-left-radius:8px;
			border-top-right-radius:8px;
			margin:0 5px -1px 0;
			padding:0;
			/* background-image:url('/mnb_notebook/img/12_careinfo_01_am.jpg'); */
		}
		  
		ul.tabs li a {
			text-decoration:none;
			color:#000;
			display:block;
			font-size:1.2em;
			border:1px solid #fff;
			outline:none;
			-webkit-border-top-left-radius:8px;
			-webkit-border-top-right-radius:8px;
			-moz-border-radius-topleft:8px;
			-moz-border-radius-topright:8px;
			border-top-left-radius:8px;
			border-top-right-radius:8px;
			padding:0 20px;
		}
		  
		ul.tabs li a:hover {
			background:#ccc;
		}
		  
		html ul.tabs li.active,html ul.tabs li.active a:hover {
			background:#fff;
			border-bottom:1px solid #fff;
		}
		  
		.tabContainer {
			border:1px solid #999;
			overflow:hidden;
			clear:both;
			float:left;
			width:100%;
			background:#fff;
			-webkit-border-radius:8px;
			-webkit-border-top-left-radius:0;
			-moz-border-radius:8px;
			-moz-border-radius-topleft:0;
			border-radius:8px;
			border-top-left-radius:0;
		}
		  
		.tabContent {
			font-size: 12px;
			padding:20px;
		}
	</style>



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
	<script src="/mnb_notebook/js/jquery.spinner.js"></script>
 

	
	

	<script type="text/javascript">
  
			var write_time; //시간
			var work_type;  //주야간
			var w_temp;  //온도
			var mom_milk;  //mom_milk
			var milk_powder;  //milk_powder
			var big;  //big
			var small;  //small
			var etc;  //etc
			var note_seq;  //seq
  
			function layer_open(el, time, w_type){
write_time = time;
work_type  = w_type;
$("#writer_time").text(write_time);
 
				var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
				var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

				if(bg){
					$('.layer').fadeIn();
				}else{
					temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
				}

				// 화면의 중앙에 레이어를 띄운다.
		//alert(temp.outerHeight());
				if (100 < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
				else temp.css('top', '0px');
				if (100 < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
				else temp.css('left', '0px');

				temp.find('a.cbtn').click(function(e){
					if(bg){
						$('.layer').fadeOut();
					}else{
						temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			//시간, 주간, day	
					 
					//	if($.trim($("#emperature").val()) != "") {
							jQuery.post("./note_sql.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"MO_NOTE_DAY":$("#MO_NOTE_DAY").val(),"MO_NOTE_WORK":write_time,"type_1":work_type,"baby_seq":$("#baby_seq").val(),"emperature":$("#emperature").val(),"mom_milk":$("#mom_milk").val(),"milk":$("#milk").val(),"big_time":$("#big_time").val(),"small_time":$("#small_time").val(),"etc":$("#etc").val()},function(data,testStatus){
								 //console.log(data);
								if (data == 2) {
										//console.log("data1");
										alert("등록되었습니다.");
										location.reload();
									} else {
										alert('처리중 오류가 발생하였습니다.');
									}
							});
						}
				//	}
					e.preventDefault();
				});

				$('.layer .bg').click(function(e){
					$('.layer').fadeOut();
					e.preventDefault();
				});

			}
 
			function layer_open1(el, time, tp, mm, mp, big, small, etc, n_seq){
				write_time = time;
				$("#writer_time").text(write_time);
				w_temp = tp;
				$("#writer_temp").text(w_temp);
				mom_milk = mm;
				$("#writer_mm").text(mom_milk);
				milk_powder = mp;
				$("#writer_mp").text(milk_powder);
				big = big;
				$("#writer_big").text(big);
				small = small;
				$("#writer_small").text(small);
				etc = etc;
				$("#writer_etc").text(etc);
				
				note_seq = n_seq;
				$("#writer_seq").text(note_seq);
 
				$("#writer_time").val(write_time);
				$("#writer_temp").val(w_temp);
				$("#writer_mm").val(mom_milk);
				$("#writer_mp").val(milk_powder);
				$("#writer_big").val(big);
				$("#writer_small").val(small);
				$("#writer_etc").val(etc);
				$("#writer_seq").val(note_seq);
		 

 
				var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
				var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

				if(bg){
					$('.layer').fadeIn();
				}else{
					temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
				}

				// 화면의 중앙에 레이어를 띄운다.
		//alert(temp.outerHeight());
				if (100 < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
				else temp.css('top', '0px');
				if (100 < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
				else temp.css('left', '0px');

				temp.find('a.cbtn').click(function(e){
					if(bg){
						$('.layer').fadeOut();
					}else{
						temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			//시간, 주간, day			
					}
					e.preventDefault();
				});

				$('.layer .bg').click(function(e){
					$('.layer').fadeOut();
					e.preventDefault();
				});

			}
	 
 
		  		$(document).ready(function() {	 

					jQuery(".baby_btn").click(function() {
					 
						if ($.trim(jQuery("#baby_name").val()) == "") {
								alert("신생아 이름을 입력하세요");
								$('#baby_name').focus();
								return false;
						 
						}
					});

				/*
					jQuery(".baby_twin").click(function() {
					 
						if ($.trim(jQuery("#baby_name").val()) == "") {
								alert("신생아 이름을 입력하세요");
								$('#baby_name').focus();
								return false;
						 
						}

						window.open("http://mothernbaby.co.kr/mnb_notebook/baby_twin_sql.asp?idx="+jQuery("#idx").val()+"&baby_name="+jQuery("#baby_name").val(), "_self","");

					});

					*/

				 
						//hiding tab content except first one
						$(".tabContent").not(":first").hide(); 
						// adding Active class to first selected tab and show 
						$("ul.tabs li:first").addClass("active").show();  

						// Click event on tab
						$("ul.tabs li").click(function() {
						// Removing class of Active tab
						$("ul.tabs li.active").removeClass("active"); 
						// Adding Active class to Clicked tab
						$(this).addClass("active"); 
						// hiding all the tab contents
						$(".tabContent").hide();        
						// showing the clicked tab's content using fading effect
						$($('a',this).attr("href")).fadeIn('slow'); 

						return false;

						});

							function close(layer_id) {
								alert(layer_id);
								var obj = document.getElementById(layer_id);
								obj.style.display = "none";
							}
				}); 

						
				function add_day() {
							
							jQuery.post("./note_add_sql.asp",{"idx":$("#idx").val(),"hp_seq":$("#hp_seq").val(),"MO_NOTE_DAY":$("#MO_NOTE_DAY").val(),"baby_seq":$("#baby_seq").val()},function(data,testStatus){
								 //console.log(data);
								if (data == 2) {
										//console.log("data1");
										alert("관리대장일차가 추가되었습니다.");
									} else {
										alert('처리중 오류가 발생하였습니다.');
									}
							});
				}



				 //레이어 팝업 닫기
 function closeLayer(IdName){
  var pop = document.getElementById(IdName);
  pop.style.display = "none";
 }


 				 
 function update_Layer(){
	$("#writer_time").val();
	$("#writer_temp").val();
	$("#writer_mm").val();
	$("#writer_mp").val();
	$("#writer_big").val();
	$("#writer_small").val();
	$("#writer_etc").val();
	$("#writer_seq").val();

//관리대장일지 각각 업데이트
	jQuery.post("./note_update_sql.asp",{"mo_note_seq":$("#writer_seq").val(),"writer_temp":$("#writer_temp").val(),"writer_mm":$("#writer_mm").val(),"writer_mp":$("#writer_mp").val(),"writer_big":$("#writer_big").val(),"writer_small":$("#writer_small").val(),"writer_etc":$("#writer_etc").val()},function(data,testStatus){
								 //console.log(data);
								if (data == 2) {
										//console.log("data1");
										alert("수정되었습니다.");
										location.reload();
									} else {
										alert('처리중 오류가 발생하였습니다.');
									}
							});

 }
 
   //-->
 </script>
 

  </head>

  <body>

 <!-- #include virtual = "/mnb_notebook/nav.asp"-->


    <div class="container">

		<div class="content">
				<div class="title_align_left">
					 기본정보   			
										 
				</div>
			<form id="babyForm" name="babyForm" method="post" action="baby_sql.asp">
			<input type="hidden" name="idx"			id="idx" value="<%=intIDX%>"/>
			<input type="hidden" name="hp_seq"		id="hp_seq" value="<%=hp_seq%>"/>
			<input type="hidden" name="helper_id"   id="helper_id" value="<%=helper_id%>"/>
			<input type="hidden" name="mode" id="mode" value="<%=mode%>">
			<input type="hidden" name="baby_seq"	id="baby_seq" value="<%=baby_seq%>">
			<input type="hidden" name="MO_NOTE_DAY"	id="MO_NOTE_DAY" value="<%=MO_NOTE_DAY%>">
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
							<td class="td2"><input type="text" id="baby_name" name="baby_name" placeholder="이름을 입력하세요" value="<%=baby_name%>"/></td>
						</tr>
					</tbody>
				</table>
<% If baby1_seq = "" Then %> 			 			
			<div style="center">
				 <span style="margin-left:80px;"></span> <a href="baby_view.asp?hp_seq=<%=hp_seq%>&idx=<%=intIDX%>"><img src="/mnb_notebook/img/10_list_05.png"  style="cursor:pointer;"/> </a>	
				 <input type="image" src="/mnb_notebook/img/11_newinfo_07_on.png" class="baby_btn" align="right"/>  
			</div>
		
			<div class="title">
				<img src="/mnb_notebook/img/10_list_02.png" style="width:100%;"/> 
			</div>
<% End If %>
			</form>

<% If baby1_seq <> "" Then 	%>		 
			<div class="title">
			</div>
			<!-- 관리대장일지 -->
			<div class="align_left">
				관리대장일지 <span style="margin-left:20px;"></span><br>
				<%=MO_NOTE_DAY%>일차
				<br><br>	
				<ul class="tabs">
					  <li><a href="#tab1">주간</a></li>
					  <li><a href="#tab2">야간</a></li>
				</ul>
				<div class="tabContainer">
					  <div id="tab1" class="tabContent">
							<!--탭메뉴1내용-->
							<ul class="list-group">
<%
	If IsArray(TYPE1_AM_9) Then 
		For num=0 To UBound(TYPE1_AM_9,2)	
			note_seq	= TYPE1_AM_9(0,num)
			idx			= TYPE1_AM_9(1,num)
			hp_seq		= TYPE1_AM_9(2,num)
			work_day	= TYPE1_AM_9(3,num)
			work_type	= TYPE1_AM_9(4,num)
			work_time	= TYPE1_AM_9(5,num)
			temp		= TYPE1_AM_9(6,num)
			mom_milk	= TYPE1_AM_9(7,num)
			milk_powder	= TYPE1_AM_9(8,num)
			big			= TYPE1_AM_9(9,num)
			small		= TYPE1_AM_9(10,num)
			etc			= TYPE1_AM_9(11,num)
			baby_seq	= TYPE1_AM_9(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"> <a href="#" class="btn-example" onclick="layer_open1('layer1','오전9시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;"> 오전9시 </a> </li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px;"> <a href="#" class="btn-example" onclick="layer_open('layer2','오전9시','주간');return false;"> 오전9시 </a> </li>
<%
	End If
%>
<%
	If IsArray(TYPE1_AM_10) Then 
		For num=0 To UBound(TYPE1_AM_10,2)	
			note_seq	= TYPE1_AM_10(0,num)
			idx			= TYPE1_AM_10(1,num)
			hp_seq		= TYPE1_AM_10(2,num)
			work_day	= TYPE1_AM_10(3,num)
			work_type	= TYPE1_AM_10(4,num)
			work_time	= TYPE1_AM_10(5,num)
			temp		= TYPE1_AM_10(6,num)
			mom_milk	= TYPE1_AM_10(7,num)
			milk_powder	= TYPE1_AM_10(8,num)
			big			= TYPE1_AM_10(9,num)
			small		= TYPE1_AM_10(10,num)
			etc			= TYPE1_AM_10(11,num)
			baby_seq	= TYPE1_AM_10(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전10시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전10시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전10시','주간');return false;">오전10시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_AM_11) Then 
		For num=0 To UBound(TYPE1_AM_11,2)	
			note_seq	= TYPE1_AM_11(0,num)
			idx			= TYPE1_AM_11(1,num)
			hp_seq		= TYPE1_AM_11(2,num)
			work_day	= TYPE1_AM_11(3,num)
			work_type	= TYPE1_AM_11(4,num)
			work_time	= TYPE1_AM_11(5,num)
			temp		= TYPE1_AM_11(6,num)
			mom_milk	= TYPE1_AM_11(7,num)
			milk_powder	= TYPE1_AM_11(8,num)
			big			= TYPE1_AM_11(9,num)
			small		= TYPE1_AM_11(10,num)
			etc			= TYPE1_AM_11(11,num)
			baby_seq	= TYPE1_AM_11(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전11시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전11시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전11시','주간');return false;">오전11시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_PM_12) Then 
		For num=0 To UBound(TYPE1_PM_12,2)	
			note_seq	= TYPE1_PM_12(0,num)
			idx			= TYPE1_PM_12(1,num)
			hp_seq		= TYPE1_PM_12(2,num)
			work_day	= TYPE1_PM_12(3,num)
			work_type	= TYPE1_PM_12(4,num)
			work_time	= TYPE1_PM_12(5,num)
			temp		= TYPE1_PM_12(6,num)
			mom_milk	= TYPE1_PM_12(7,num)
			milk_powder	= TYPE1_PM_12(8,num)
			big			= TYPE1_PM_12(9,num)
			small		= TYPE1_PM_12(10,num)
			etc			= TYPE1_PM_12(11,num)
			baby_seq	= TYPE1_PM_12(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"> <a href="#" class="btn-example" onclick="layer_open1('layer1','오후12시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>');return false;">오후12시</a></li>
<%
		Next 
	Else
%>
<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"> <a href="#" class="btn-example" onclick="layer_open('layer2','오후12시','주간');return false;">오후12시</a></li>
<%
	End If
%>
							  </ul>
							  <ul class="list-group">
<%
	If IsArray(TYPE1_PM_1) Then 
		For num=0 To UBound(TYPE1_PM_1,2)	
			note_seq	= TYPE1_PM_1(0,num)
			idx			= TYPE1_PM_1(1,num)
			hp_seq		= TYPE1_PM_1(2,num)
			work_day	= TYPE1_PM_1(3,num)
			work_type	= TYPE1_PM_1(4,num)
			work_time	= TYPE1_PM_1(5,num)
			temp		= TYPE1_PM_1(6,num)
			mom_milk	= TYPE1_PM_1(7,num)
			milk_powder	= TYPE1_PM_1(8,num)
			big			= TYPE1_PM_1(9,num)
			small		= TYPE1_PM_1(10,num)
			etc			= TYPE1_PM_1(11,num)
			baby_seq	= TYPE1_PM_1(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후1시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후1시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후1시','주간');return false;">오후1시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_PM_2) Then 
		For num=0 To UBound(TYPE1_PM_2,2)	
			note_seq	= TYPE1_PM_2(0,num)
			idx			= TYPE1_PM_2(1,num)
			hp_seq		= TYPE1_PM_2(2,num)
			work_day	= TYPE1_PM_2(3,num)
			work_type	= TYPE1_PM_2(4,num)
			work_time	= TYPE1_PM_2(5,num)
			temp		= TYPE1_PM_2(6,num)
			mom_milk	= TYPE1_PM_2(7,num)
			milk_powder	= TYPE1_PM_2(8,num)
			big			= TYPE1_PM_2(9,num)
			small		= TYPE1_PM_2(10,num)
			etc			= TYPE1_PM_2(11,num)
			baby_seq	= TYPE1_PM_2(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후2시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후2시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후2시','주간');return false;">오후2시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_PM_3) Then 
		For num=0 To UBound(TYPE1_PM_3,2)	
			note_seq	= TYPE1_PM_3(0,num)
			idx			= TYPE1_PM_3(1,num)
			hp_seq		= TYPE1_PM_3(2,num)
			work_day	= TYPE1_PM_3(3,num)
			work_type	= TYPE1_PM_3(4,num)
			work_time	= TYPE1_PM_3(5,num)
			temp		= TYPE1_PM_3(6,num)
			mom_milk	= TYPE1_PM_3(7,num)
			milk_powder	= TYPE1_PM_3(8,num)
			big			= TYPE1_PM_3(9,num)
			small		= TYPE1_PM_3(10,num)
			etc			= TYPE1_PM_3(11,num)
			baby_seq	= TYPE1_PM_3(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후3시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후3시</a></li>
<%
		Next 
	Else
%>								
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후3시','주간');return false;">오후3시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_PM_4) Then 
		For num=0 To UBound(TYPE1_PM_4,2)	
			note_seq	= TYPE1_PM_4(0,num)
			idx			= TYPE1_PM_4(1,num)
			hp_seq		= TYPE1_PM_4(2,num)
			work_day	= TYPE1_PM_4(3,num)
			work_type	= TYPE1_PM_4(4,num)
			work_time	= TYPE1_PM_4(5,num)
			temp		= TYPE1_PM_4(6,num)
			mom_milk	= TYPE1_PM_4(7,num)
			milk_powder	= TYPE1_PM_4(8,num)
			big			= TYPE1_PM_4(9,num)
			small		= TYPE1_PM_4(10,num)
			etc			= TYPE1_PM_4(11,num)
			baby_seq	= TYPE1_PM_4(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후4시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후4시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후4시','주간');return false;">오후4시 </a></li>
<%
	End If
%>
							  </ul>
							  <ul class="list-group">
<%
	If IsArray(TYPE1_PM_5) Then 
		For num=0 To UBound(TYPE1_PM_5,2)	
			note_seq	= TYPE1_PM_5(0,num)
			idx			= TYPE1_PM_5(1,num)
			hp_seq		= TYPE1_PM_5(2,num)
			work_day	= TYPE1_PM_5(3,num)
			work_type	= TYPE1_PM_5(4,num)
			work_time	= TYPE1_PM_5(5,num)
			temp		= TYPE1_PM_5(6,num)
			mom_milk	= TYPE1_PM_5(7,num)
			milk_powder	= TYPE1_PM_5(8,num)
			big			= TYPE1_PM_5(9,num)
			small		= TYPE1_PM_5(10,num)
			etc			= TYPE1_PM_5(11,num)
			baby_seq	= TYPE1_PM_5(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후5시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>');return false;">오후5시</a></li>
<%
		Next 
	Else 
%>								
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px;"><a href="#" class="btn-example" onclick="layer_open('layer2','오후5시','주간');return false;">오후5시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE1_PM_6) Then 
		For num=0 To UBound(TYPE1_PM_6,2)	
			note_seq	= TYPE1_PM_6(0,num)
			idx			= TYPE1_PM_6(1,num)
			hp_seq		= TYPE1_PM_6(2,num)
			work_day	= TYPE1_PM_6(3,num)
			work_type	= TYPE1_PM_6(4,num)
			work_time	= TYPE1_PM_6(5,num)
			temp		= TYPE1_PM_6(6,num)
			mom_milk	= TYPE1_PM_6(7,num)
			milk_powder	= TYPE1_PM_6(8,num)
			big			= TYPE1_PM_6(9,num)
			small		= TYPE1_PM_6(10,num)
			etc			= TYPE1_PM_6(11,num)
			baby_seq	= TYPE1_PM_6(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후6시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후6시</a></li>
<%
		Next 
	Else
%>								
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2', '오후6시','주간');return false;">오후6시 </a></li>
<%
	End If
%>
							  </ul>
					  </div>
					  <!-- / END #tab1 -->
				 
					  <div id="tab2" class="tabContent">
						 <!--탭메뉴2내용-->
						 	  <ul class="list-group">
<%
	If IsArray(TYPE2_PM_7) Then 
		For num=0 To UBound(TYPE2_PM_7,2)	
			note_seq	= TYPE2_PM_7(0,num)
			idx			= TYPE2_PM_7(1,num)
			hp_seq		= TYPE2_PM_7(2,num)
			work_day	= TYPE2_PM_7(3,num)
			work_type	= TYPE2_PM_7(4,num)
			work_time	= TYPE2_PM_7(5,num)
			temp		= TYPE2_PM_7(6,num)
			mom_milk	= TYPE2_PM_7(7,num)
			milk_powder	= TYPE2_PM_7(8,num)
			big			= TYPE2_PM_7(9,num)
			small		= TYPE2_PM_7(10,num)
			etc			= TYPE2_PM_7(11,num)
			baby_seq	= TYPE2_PM_7(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후7시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후7시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px;"><a href="#" class="btn-example" onclick="layer_open('layer2','오후7시','야간');return false;">오후7시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_PM_8) Then 
		For num=0 To UBound(TYPE2_PM_8,2)	
			note_seq	= TYPE2_PM_8(0,num)
			idx			= TYPE2_PM_8(1,num)
			hp_seq		= TYPE2_PM_8(2,num)
			work_day	= TYPE2_PM_8(3,num)
			work_type	= TYPE2_PM_8(4,num)
			work_time	= TYPE2_PM_8(5,num)
			temp		= TYPE2_PM_8(6,num)
			mom_milk	= TYPE2_PM_8(7,num)
			milk_powder	= TYPE2_PM_8(8,num)
			big			= TYPE2_PM_8(9,num)
			small		= TYPE2_PM_8(10,num)
			etc			= TYPE2_PM_8(11,num)
			baby_seq	= TYPE2_PM_8(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후8시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후8시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후8시','야간');return false;">오후8시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_PM_9) Then 
		For num=0 To UBound(TYPE2_PM_9,2)	
			note_seq	= TYPE2_PM_9(0,num)
			idx			= TYPE2_PM_9(1,num)
			hp_seq		= TYPE2_PM_9(2,num)
			work_day	= TYPE2_PM_9(3,num)
			work_type	= TYPE2_PM_9(4,num)
			work_time	= TYPE2_PM_9(5,num)
			temp		= TYPE2_PM_9(6,num)
			mom_milk	= TYPE2_PM_9(7,num)
			milk_powder	= TYPE2_PM_9(8,num)
			big			= TYPE2_PM_9(9,num)
			small		= TYPE2_PM_9(10,num)
			etc			= TYPE2_PM_9(11,num)
			baby_seq	= TYPE2_PM_9(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후9시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후9시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후9시','야간');return false;">오후9시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_PM_10) Then 
		For num=0 To UBound(TYPE2_PM_10,2)	
			note_seq	= TYPE2_PM_10(0,num)
			idx			= TYPE2_PM_10(1,num)
			hp_seq		= TYPE2_PM_10(2,num)
			work_day	= TYPE2_PM_10(3,num)
			work_type	= TYPE2_PM_10(4,num)
			work_time	= TYPE2_PM_10(5,num)
			temp		= TYPE2_PM_10(6,num)
			mom_milk	= TYPE2_PM_10(7,num)
			milk_powder	= TYPE2_PM_10(8,num)
			big			= TYPE2_PM_10(9,num)
			small		= TYPE2_PM_10(10,num)
			etc			= TYPE2_PM_10(11,num)
			baby_seq	= TYPE2_PM_10(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후10시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후10시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후10시','야간');return false;">오후10시 </a></li>
<%
	End If
%>
							  </ul>
							  <ul class="list-group">
<%
	If IsArray(TYPE2_PM_11) Then 
		For num=0 To UBound(TYPE2_PM_11,2)	
			note_seq	= TYPE2_PM_11(0,num)
			idx			= TYPE2_PM_11(1,num)
			hp_seq		= TYPE2_PM_11(2,num)
			work_day	= TYPE2_PM_11(3,num)
			work_type	= TYPE2_PM_11(4,num)
			work_time	= TYPE2_PM_11(5,num)
			temp		= TYPE2_PM_11(6,num)
			mom_milk	= TYPE2_PM_11(7,num)
			milk_powder	= TYPE2_PM_11(8,num)
			big			= TYPE2_PM_11(9,num)
			small		= TYPE2_PM_11(10,num)
			etc			= TYPE2_PM_11(11,num)
			baby_seq	= TYPE2_PM_11(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후11시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후11시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후11시','야간');return false;">오후11시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_PM_12) Then 
		For num=0 To UBound(TYPE2_PM_12,2)	
			note_seq	= TYPE2_PM_12(0,num)
			idx			= TYPE2_PM_12(1,num)
			hp_seq		= TYPE2_PM_12(2,num)
			work_day	= TYPE2_PM_12(3,num)
			work_type	= TYPE2_PM_12(4,num)
			work_time	= TYPE2_PM_12(5,num)
			temp		= TYPE2_PM_12(6,num)
			mom_milk	= TYPE2_PM_12(7,num)
			milk_powder	= TYPE2_PM_12(8,num)
			big			= TYPE2_PM_12(9,num)
			small		= TYPE2_PM_12(10,num)
			etc			= TYPE2_PM_12(11,num)
			baby_seq	= TYPE2_PM_12(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오후12시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오후12시</a></li>
<%
		Next 
	Else
%>
<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오후12시','야간');return false;">오후12시 </a></li>

<%
	End If
%>
<%
	If IsArray(TYPE2_AM_1) Then 
		For num=0 To UBound(TYPE2_AM_1,2)	
			note_seq	= TYPE2_AM_1(0,num)
			idx			= TYPE2_AM_1(1,num)
			hp_seq		= TYPE2_AM_1(2,num)
			work_day	= TYPE2_AM_1(3,num)
			work_type	= TYPE2_AM_1(4,num)
			work_time	= TYPE2_AM_1(5,num)
			temp		= TYPE2_AM_1(6,num)
			mom_milk	= TYPE2_AM_1(7,num)
			milk_powder	= TYPE2_AM_1(8,num)
			big			= TYPE2_AM_1(9,num)
			small		= TYPE2_AM_1(10,num)
			etc			= TYPE2_AM_1(11,num)
			baby_seq	= TYPE2_AM_1(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전1시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전1시</a></li>
<%
		Next 
	Else
%>							 
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전1시','야간');return false;">오전1시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_2) Then 
		For num=0 To UBound(TYPE2_AM_2,2)	
			note_seq	= TYPE2_AM_2(0,num)
			idx			= TYPE2_AM_2(1,num)
			hp_seq		= TYPE2_AM_2(2,num)
			work_day	= TYPE2_AM_2(3,num)
			work_type	= TYPE2_AM_2(4,num)
			work_time	= TYPE2_AM_2(5,num)
			temp		= TYPE2_AM_2(6,num)
			mom_milk	= TYPE2_AM_2(7,num)
			milk_powder	= TYPE2_AM_2(8,num)
			big			= TYPE2_AM_2(9,num)
			small		= TYPE2_AM_2(10,num)
			etc			= TYPE2_AM_2(11,num)
			baby_seq	= TYPE2_AM_2(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전2시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전2시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전2시','야간');return false;">오전2시 </a></li>
<%
	End If
%>
							  </ul>
							  <ul class="list-group">
<%
	If IsArray(TYPE2_AM_3) Then 
		For num=0 To UBound(TYPE2_AM_3,2)	
			note_seq	= TYPE2_AM_3(0,num)
			idx			= TYPE2_AM_3(1,num)
			hp_seq		= TYPE2_AM_3(2,num)
			work_day	= TYPE2_AM_3(3,num)
			work_type	= TYPE2_AM_3(4,num)
			work_time	= TYPE2_AM_3(5,num)
			temp		= TYPE2_AM_3(6,num)
			mom_milk	= TYPE2_AM_3(7,num)
			milk_powder	= TYPE2_AM_3(8,num)
			big			= TYPE2_AM_3(9,num)
			small		= TYPE2_AM_3(10,num)
			etc			= TYPE2_AM_3(11,num)
			baby_seq	= TYPE2_AM_3(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전3시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전3시</a></li>
<%
		Next 
	Else
%>
								 <li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전3시','야간');return false;">오전3시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_4) Then 
		For num=0 To UBound(TYPE2_AM_4,2)	
			note_seq	= TYPE2_AM_4(0,num)
			idx			= TYPE2_AM_4(1,num)
			hp_seq		= TYPE2_AM_4(2,num)
			work_day	= TYPE2_AM_4(3,num)
			work_type	= TYPE2_AM_4(4,num)
			work_time	= TYPE2_AM_4(5,num)
			temp		= TYPE2_AM_4(6,num)
			mom_milk	= TYPE2_AM_4(7,num)
			milk_powder	= TYPE2_AM_4(8,num)
			big			= TYPE2_AM_4(9,num)
			small		= TYPE2_AM_4(10,num)
			etc			= TYPE2_AM_4(11,num)
			baby_seq	= TYPE2_AM_4(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전4시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전4시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전4시','야간');return false;">오전4시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_5) Then 
		For num=0 To UBound(TYPE2_AM_5,2)	
			note_seq	= TYPE2_AM_5(0,num)
			idx			= TYPE2_AM_5(1,num)
			hp_seq		= TYPE2_AM_5(2,num)
			work_day	= TYPE2_AM_5(3,num)
			work_type	= TYPE2_AM_5(4,num)
			work_time	= TYPE2_AM_5(5,num)
			temp		= TYPE2_AM_5(6,num)
			mom_milk	= TYPE2_AM_5(7,num)
			milk_powder	= TYPE2_AM_5(8,num)
			big			= TYPE2_AM_5(9,num)
			small		= TYPE2_AM_5(10,num)
			etc			= TYPE2_AM_5(11,num)
			baby_seq	= TYPE2_AM_5(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전5시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전5시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전5시','야간');return false;">오전5시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_6) Then 
		For num=0 To UBound(TYPE2_AM_6,2)	
			note_seq	= TYPE2_AM_6(0,num)
			idx			= TYPE2_AM_6(1,num)
			hp_seq		= TYPE2_AM_6(2,num)
			work_day	= TYPE2_AM_6(3,num)
			work_type	= TYPE2_AM_6(4,num)
			work_time	= TYPE2_AM_6(5,num)
			temp		= TYPE2_AM_6(6,num)
			mom_milk	= TYPE2_AM_6(7,num)
			milk_powder	= TYPE2_AM_6(8,num)
			big			= TYPE2_AM_6(9,num)
			small		= TYPE2_AM_6(10,num)
			etc			= TYPE2_AM_6(11,num)
			baby_seq	= TYPE2_AM_6(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전6시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전6시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전6시','야간');return false;">오전6시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_7) Then 
		For num=0 To UBound(TYPE2_AM_7,2)	
			note_seq	= TYPE2_AM_7(0,num)
			idx			= TYPE2_AM_7(1,num)
			hp_seq		= TYPE2_AM_7(2,num)
			work_day	= TYPE2_AM_7(3,num)
			work_type	= TYPE2_AM_7(4,num)
			work_time	= TYPE2_AM_7(5,num)
			temp		= TYPE2_AM_7(6,num)
			mom_milk	= TYPE2_AM_7(7,num)
			milk_powder	= TYPE2_AM_7(8,num)
			big			= TYPE2_AM_7(9,num)
			small		= TYPE2_AM_7(10,num)
			etc			= TYPE2_AM_7(11,num)
			baby_seq	= TYPE2_AM_7(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전7시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전7시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전7시','야간');return false;">오전7시 </a></li>
<%
	End If
%>
<%
	If IsArray(TYPE2_AM_8) Then 
		For num=0 To UBound(TYPE2_AM_8,2)	
			note_seq	= TYPE2_AM_8(0,num)
			idx			= TYPE2_AM_8(1,num)
			hp_seq		= TYPE2_AM_8(2,num)
			work_day	= TYPE2_AM_8(3,num)
			work_type	= TYPE2_AM_8(4,num)
			work_time	= TYPE2_AM_8(5,num)
			temp		= TYPE2_AM_8(6,num)
			mom_milk	= TYPE2_AM_8(7,num)
			milk_powder	= TYPE2_AM_8(8,num)
			big			= TYPE2_AM_8(9,num)
			small		= TYPE2_AM_8(10,num)
			etc			= TYPE2_AM_8(11,num)
			baby_seq	= TYPE2_AM_8(12,num)
%>
<li class="list-group-item list-group-item-warning" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open1('layer1','오전8시' ,'<%=temp%>','<%=mom_milk%>','<%=milk_powder%>','<%=big%>','<%=small%>','<%=etc%>','<%=note_seq%>');return false;">오전8시</a></li>
<%
		Next 
	Else
%>
								<li class="list-group-item list-group-item-success" style="display:inline;font-size:10px"><a href="#" class="btn-example" onclick="layer_open('layer2','오전8시','야간');return false;">오전8시 </a></li>
<%
	End If
%>
							  </ul>
					  </div>
					  <!-- / END #tab2 -->
				</div>
				<!-- 
					 <a href="#" ><img src="/mnb_notebook/img/12_careinfo_01_am.jpg" width="100"/></a>
					 <a href="#" ><img src="/mnb_notebook/img/12_careinfo_01_pm.jpg" width="100" /></a>
				 -->
			</div>

		 
				<!-- 
				<li class="list-group-item list-group-item-info" style="display:inline;">Second item</li>
				<li class="list-group-item list-group-item-warning" style="display:inline;">Third item</li>
				<li class="list-group-item list-group-item-danger" style="display:inline;">Fourth item</li>
				-->

			
			<div id="layer1" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!--content //-->
						<input type="hidden" name="writer_seq" id="writer_seq" value="" />
						<table class="table table-bordered tb">
							<tbody>
								<tr>
									<td class="td1">시간</td>
									<td class="td2"><input type="text" name="writer_time" id="writer_time" class="input_01"  value="" style="width:80px;" readonly /> </td>
								</tr>
								<tr>
									<td class="td1">활력증상(체온)</td>
									<td class="td2"><input type="number" name="writer_temp" id="writer_temp" class="input_01"  value="" style="width:80px;"/></td>
								</tr>
								<tr>
									<td class="td1">In-take(모유B, 분유M)</td>
									<td class="td2">
										<input type="number" name="writer_mm" id="writer_mm" class="input_01" value="" style="width:80px;"/><br>
										<input type="number" name="writer_mp" id="writer_mp" class="input_01" value="" style="width:80px;"/>
									</td>
								</tr>
								<tr>
									<td class="td1">대변</td>
									<td class="td2">
										<input type="number" name="writer_big" id="writer_big" class="input_01"  value="" style="width:80px;"/>
									</td>
								</tr>
								<tr>
									<td class="td1">소변</td>
									<td class="td2">
										<input type="number" name="writer_small" id="writer_small" class="input_01"   value="" style="width:80px;"/>
									</td>
								</tr>
								<tr>
									<td class="td1">기타특이사항</td>
									<td class="td2"><input type="text" name="writer_etc" id="writer_etc" class="input_01"  value="" style="width:80px;"/>
									</td>
								</tr>
							</tbody>
						</table>
					<!--<table class="table table-bordered tb">
							<tbody>
								<tr>
									<td class="td1">시간</td>
									<td class="td2"><div id="writer_time"></td>
								</tr>
								<tr>
									<td class="td1">활력증상(체온)</td>
									<td class="td2"><div id="writer_temp"></div></td>
								</tr>
								<tr>
									<td class="td1">In-take(모유B, 분유M)</td>
									<td class="td2"><div id="writer_mm"></div>,<div id="writer_mp"></div></td>
								</tr>
								<tr>
									<td class="td1">대변</td>
									<td class="td2"><div id="writer_big"></div></td>
								</tr>
								<tr>
									<td class="td1">소변</td>
									<td class="td2"><div id="writer_small"></div></td>
								</tr>
								<tr>
									<td class="td1">기타특이사항</td>
									<td class="td2"><div id="writer_etc"></div></td>
								</tr>
							</tbody>
						</table>-->

						<div class="btn-r">
							<a href="#"  onclick="update_Layer();" class="cbtn">수정</a> <a href="#" class="cbtn">OK</a>
						</div>
						<!--// content-->
					</div>
				</div>
			</div>

			<div id="layer2" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!--content //-->
							<div id="writer_time"></div>

							<!--div class="well">
							<h2>Quantity:</h2>
							<div class="input-append spinner" data-trigger="spinner">
							<input value="1" data-rule="quantity" type="text">
							<div class="add-on"> <a href="javascript:;" class="spin-up" data-spin="up"><i class="icon-sort-up"></i></a> <a href="javascript:;" class="spin-down" data-spin="down"><i class="icon-sort-down"></i></a> </div>
							</div>
							</div-->

							<div class="input">
								<input type="number" name="emperature" id="emperature" class="input_01" placeholder="체온℃"  />
							</div>
							<div class="input">
								<input type="number" name="mom_milk" id="mom_milk" class="input_01" placeholder="모유ml" />
							</div>
							<div class="input">
								<input type="number" name="milk" id="milk" class="input_01" placeholder="분유ml"  />
							</div>
							<div class="input">
								<input type="number" name="big_time" id="big_time" class="input_01" placeholder="회"  />
							</div>
							<div class="input">
								<input type="number" name="small_time" id="small_time" class="input_01" placeholder="회" />
							</div>
							<div class="input">
								<input type="text" name="etc" id="etc" class="input_01" placeholder="기타특이사항"/>
							</div>
						<div class="btn-r">
							 <a href="#" onclick="closeLayer('layer2')" class="close_btn">닫기</a> <a href="#" class="cbtn">입력</a>
						</div>
						<!--// content-->
					</div>
				</div>
			</div>
 			<div class="align_left">
				
			</div>
 
		<br><br><br><br>
			<div class="title_align_left">

				<a href="#" onclick="add_day();"><img src="/mnb_notebook/img/10_list_05.png" /></a><span style="margin-left:90px;"></span>
				
				<a href="baby_view.asp?note_day=<%=min_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>"><img src="/mnb_notebook/img/12_careinfo_04.png" /></a>
<%
	If IsArray(day_list) Then 
		For num=0 To UBound(day_list,2)	
			note_day	= day_list(0,num)
%>		
			<% If note_day = MO_NOTE_DAY Then  %>
			<a href="baby_view.asp?note_day=<%=note_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>"><img src="/mnb_notebook/img/12_careinfo_06.png" /> <% Else %> <a href="baby_view.asp?note_day=<%=note_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>"><img src="/mnb_notebook/img/12_careinfo_05.png" /><% End If %></a>
<%
		Next 
	Else
%>		
			<img src="/mnb_notebook/img/12_careinfo_05.png" />
<%
	End If
%>

				<a href="baby_view.asp?note_day=<%=max_day%>&idx=<%=intIDX%>&hp_seq=<%=hp_seq%>&baby1_seq=<%=baby1_seq%>"> <img src="/mnb_notebook/img/12_careinfo_07.png" /></a> 

			</div>
<% End If %>
			<div class="title">
			</div>
			
		</div>

    </div><!-- /.container -->

  </body>
</html>
