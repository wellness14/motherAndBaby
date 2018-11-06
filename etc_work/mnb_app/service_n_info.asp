<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->

<%

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

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


 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->




    <div> 
		<div class="info_box_011">
			<div class="info_box_011_sub" style="padding-left:20px;">
				<img src="img/info_emg_consel.png"/> 
					<a href="tel:02-557-3579"><span class="info_text_01" style="color:#2185c5;font-weight:700;font-size:15pt;margin-top:20px;">실시간 전화상담</span></a> 
					<div style="margin-left:82px;margin-top:-30px;"><a href="tel:02-557-3579"><span class="info_text_01" style="font-size:9pt;">전화하기</span></a>
					<a href="tel:02-557-3579"><img src="img/info_gray_bt.png" align="right" style="padding-right:15px;margin-top:-10px;"/></a></div>
				
			</div>
			<!-- <div class="info_box_02_sub">
				<a href="tel:02-557-3579"><input type="button" name="emergency_btn" id="emergency_btn" class="info_input_01" value="전화하기" /></a>
			</div> -->
		</div>
 
		<div class="info_box_01_11">
			<div class="info_box_012_sub" style="padding-left:20px;">
				<img src="img/info_1_consel.png"/> 
					<a href="service_res_consult.asp"><span class="info_text_01" style="color:#2185c5;font-weight:700;font-size:15pt;margin-top:20px;">예약전화상담</span></a>
					<div style="margin-left:82px;margin-top:-30px;"><span class="info_text_01" style="font-size:9pt;width:50px;">9시 ~ 18시까지 상담 예약 가능합니다.</span>
					<a href="service_res_consult.asp"><img src="img/info_gray_bt.png" align="right" style="padding-right:15px;margin-top:-10px;"/></a> </div>
				
			</div>
			<!-- <span class="info_text_01">오전9시 ~ 오후6시까지 상담예약이 가능합니다. </span> -->
			<!-- <div class="info_box_02_sub">
				<a href="service_res_consult.asp"><input type="button" name="emergency_btn" id="emergency_btn" class="info_input_01" value="예약" /></a>
			</div> -->
		</div>
 
	
	<!--	<div class="info_box_01_1">
			<div class="info_box_01_sub">
				<span class="info_text_01">출산일 변경이나, 계약일 변경 등의 문의사항</span>
			</div>
			<div class="info_box_02_sub">
				<!-- <a href="emergency_talk.asp">  <input type="button" name="emergency_btn" id="emergency_btn1" class="info_input_01" value="긴급상담신청" onclick="service_check();"/>  </a>  
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
		  -->
	 


		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
 
    </div><!-- /.container -->

  </body>
  
  <script src="js/leftmenu.js"></script>

</html>
