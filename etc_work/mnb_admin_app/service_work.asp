<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%
	uId				= Trim(fncRequestCookie("uid"))				'회원	아이디 

	If uId = "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_admin_app/login.asp"
	End If

	sql1 = "SELECT COUNT(*) AS CNT FROM MO_APP_CALL_SERVICE WHERE ISNULL(CALL_FINISH_FLG, '') != 'Y' AND CALL_CNLKBN = 'N'"
	Set rs1 = DBExec(sql1,"main")
	call_count = rs1("CNT")
	Call RSClose(rs1)

	If call_count > 0 Then
		call_notice = "NEW (" & call_count & ")"
	End If

	sql2 = "select COUNT(*) AS CNT FROM MO_APP_MY_DATA_HISTORY WHERE ISNULL(MH_CHECK, '') != 'Y'"
	Set rs2 = DBExec(sql2,"main")
	history_count = rs2("CNT")
	Call RSClose(rs2)

	If history_count > 0 Then
		history_notice = "NEW (" & history_count & ")"
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
</head>
<body style="background-color:#dfdfdf;">
 
  <!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"-->  
   
    <div class="container">
		<!-- 
		<div class="info_box_01">
			<div class="info_box_01_sub">
				<span class="info_text_01">이용안내 및 상담신청</span>
			</div>
			<div class="info_box_02_sub">
				<a href="service_request.asp"><input type="button" name="emergency_btn" id="emergency_btn" class="info_input_01" value="상담신청" /></a>
			</div>
		</div> 
		-->
 
		<!-- <div class="info_box_01">
			<div class="info_box_01_sub">
				<span class="info_text_01">출산일 변경이나, 계약일 변경 등의 문의사항</span>
			</div>
			<div class="info_box_02_sub">
				<a href="emergency_talk.asp"><input type="button" name="emergency_btn" id="emergency_btn" class="info_input_01" value="긴급상담신청" /></a>
			</div>
		</div>

		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">일대일 게시판 상담을 진행합니다.</span>
			</div>
			<div class="info_box_02_sub">
				<a href="service_consult_list.asp"><input type="button" name="mtm_btn" id="mtm_btn" class="info_input_02" value="1:1상담" /></a>
			</div>
		</div> -->
 
		<!-- <div class="info_box_01">
			<div class="info_box_01_sub">
				<span class="info_text_01">공지사항</span>
			</div>
			<div class="info_box_02_sub">
				<a href="notice_list.asp"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="공지사항 바로가기" /></a>
			</div>
		</div>  -->
		<div class="info_box_01">
			<div class="info_box_01_sub">
				<span class="info_text_01">예약전화상담 리스트</span> <span style="color:red;font-size:10pt;"><%=call_notice%></span>
			</div>                                                       
			<div class="info_box_02_sub">
				<a href="call_consult_list.asp"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="자세히보기" /></a>
			</div>
		</div> 

		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">고객 정보변경 확인</span> <span style="color:red;font-size:10pt;"><%=history_notice%></span>
			</div>
			<div class="info_box_02_sub">
				<a href="customer_data_update.asp"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="자세히보기" /></a>
			</div>
		</div>

		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">고객 리스트</span>
			</div>
			<div class="info_box_02_sub">
				<a href="customer_list.asp"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="자세히보기" /></a>
			</div>
		</div>

		

		<!--
		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">산후도우미 정보변경 확인</span>
			</div>
			<div class="info_box_02_sub">
				<a href="#"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="산후도우미 정보변경 확인" /></a>
			</div>
		</div>


 
		<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">산후도우미 리스트</span>
			</div>
			<div class="info_box_02_sub">
				<a href="#"><input type="button" name="notice_btn" id="notice_btn" class="info_input_03" value="산후도우미 리스트" /></a>
			</div>
		</div>  
		-->
		
 
    </div><!-- /.container -->
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
  </body>
  
  <script src="js/leftmenu.js"></script>

</html>
