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
 
 
  </head>

  <body style="background-color:#ececec;">
	<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>">
  <!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 

    <div class="container">
 
		<div class="service_box_01_sub">
			합리적인 비용으로 이용하실 수<br> 있는 기본형 프로그램<br>

			<span class="service_text_02">베이직</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_01.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a> 
		</div> 
 
 		<div class="service_box_02_sub">
			상담을 통한 1:1 개인 맞춤형<br>서비스<br> 
			<span class="service_text_02">프리미엄</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_02.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 
	
		
		 <div class="service_box_02_sub">
			상담을 통한 1:1 개인 맞춤형<br>서비스<br> 
			<span class="service_text_02">VIP</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_02_VIP.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 
	
 
 		<div class="service_box_02_sub">
			특화된 시스템인 “트리니티 케어 <br> 
			시스템”을 제공하는 서비스<br> 

			<span class="service_text_02">프라이빗</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_03.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div>  

 		<div class="service_box_02_sub">
			바디케어관리와 아기맞이<br> 소독서비스의 <br> 특화프로그램이 제공<br>

			<span class="service_text_02">다둥이케어</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_04.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 

 		<div class="service_box_02_sub">
			바쁜 생활패턴으로 챙기지<br> 못한 출산준비도 세심하게<br> 도와드립니다.  <br>
			<span class="service_text_02">워킹맘케어</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_05.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 

 		<div class="service_box_02_sub">
			임신 중 호르몬관리,<br> 출산 후 탄력복원 등<br> 지속적인 산모님의 건강관리 <br>
			<span class="service_text_02">과체중</span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_06.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 
 
 		<div class="service_box_02_sub">
			35세 이상의 고연령산모의<br> 극심한 피로감과<br> 스트레스를 특별 관리합니다<br>
			<span class="service_text_02">35세 이상 </span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_07.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 

 		<div class="service_box_02_sub">
			퇴원부터 시작되는<br> 산후조리원의 서비스를<br> 댁에서 제공합니다. <br>
			<span class="service_text_02">산후조리원을 내집에 </span>
		</div>

		<div class="plan_input">
			<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/care_service_08.asp"><input type="button" name="plan_btn" id="plan_btn" class="plan_input_01" value="자세히보기"  class="btn-example"  /></a>
		</div> 
 

		<div class="plan_margin_1"></div>

		<div class="login_input">
				<span class="login_text_3"> 서비스 이용약관 | 개인정보취급방침 </span>
		</div>

		<div class="login_input">
				<span class="login_text"> 웰니스인텔리전스(주) | 사업자번호 220-88-73478<br>copyrightⓒ 2015 <span class="login_text_5">mother&baby.</span>All rights reserved.</span> 
		</div>

	 
		<div id="layer1" class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<div style="text-align:center;margin-left:10px;"> 

						<div class="plan_box_02_sub">
							<input type="button" name="addset_btn" id="addset_btn" class="plan_input_02" value="설정하기"  />
						</div>
						<div class="plan_input">
							<input type="button" name="plan_btn" id="plan_btn" class="plan_input_03" value="확인"  />
						</div>

					</div> 
					<!--// content-->
				</div>
			</div>
		</div> 
 


    </div><!-- /.container -->

  </body>

    <script src="js/leftmenu.js"></script>

</html>
