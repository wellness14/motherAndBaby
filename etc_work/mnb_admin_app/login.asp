<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->

<%
	
	uId				= Trim(fncRequestCookie("uid"))				'회원	아이디 
 
   
	If uId <> "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_admin_app/service_work.asp"
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

  <body>
  <!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 
  <!-- <div style="text-align:center; line-height:51px;color:#ffffff;font-weight:350;font-size:20pt;margin:0 auto;background-color:#ef4e6f;">로그인</div> -->
 
	</div>
 

    <div class="container">

		<div class="main img" >
			 <img src="img/logo_111.png" style="width:230px; height:60px;" />
		</div>

		<div class="main_font3">
			개인 맞춤형 임신/출산 관리 서비스
		</div>
		
		<form id="LoginForm" name="LoginForm" method="post" action="login_sql.asp">
		
			<div class="login_input_m1">
				<input type="text" name="user_id" id="user_id" class="login_input_01" placeholder="ID" />
			</div>
			<div class="login_input_m3">
				<input type="password" name="user_pw" id="user_pw" class="login_input_01" placeholder="PW" /><br>
			</div>
			
			<div class="login_input">
					<input type="checkbox" name="login_auto" id="login_auto" class="check_box_1"/> <span class="login_text_1">자동로그인</span><span style="margin-right:210px;"></span>
			</div>

			<div class="login_input">
				<input type="submit" name="login_btn" id="login_btn" class="login_input_02" value="로그인" /><br>
			</div>
		</form>

		<!-- <div class="login_input">
			<a href="join.asp"><input type="button" name="join_btn" id="join_btn" class="login_input_03" value="회원가입" /></a>
		</div>

		<div class="login_input">
				<span class="login_text"> <span class="login_text_2">ID / PW</span>(패스워드)<span class="login_text_2">찾기</span>는 PC버전(<span class="login_text_2">www.mothernbaby.co.kr</span>)<br>에서 가능합니다.</span>
		</div>

		<div class="login_input_m2">
			<a href="http://www.mothernbaby.co.kr/" target="_blank"><input type="button" name="pc_ver_btn" id="pc_ver_btn" class="login_input_04" value="PC버전홈페이지" /></a><br>
		</div> -->

		<div class="login_input">
				<span class="login_text_3"> 서비스 이용약관 | 개인정보취급방침 </span>
		</div>

		<div class="login_input">
				<span class="login_text"> 웰니스인텔리전스(주) | 사업자번호 220-88-73478<br>copyrightⓒ 2015 <span class="login_text_5">mother&baby.</span>All rights reserved.</span> 
		</div>






 

    </div><!-- /.container -->

  </body>

    	<script type="text/javascript" charset="utf-8">

			$(document)ready(function() {
				jQuery("#login_btn").click(function() {
					if ($.trim(jQuery("#user_id").val()) == "") {
							alert("아이디를 입력하세요");
							$('#user_id').focus();
							return false; 
					}

					if ($.trim(jQuery("#user_pw").val()) == "") {
							alert("비밀번호를 입력하세요");
							$('#user_pw').focus();
							return false;
					}

				});
			});

			

 
	

	</script>
	<script src="js/leftmenu.js"></script>
</html>
