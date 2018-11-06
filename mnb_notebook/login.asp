
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




  </head>

  <body>

    <div class="container">

		<div class="content">
			<div class="login_logo">
				<img src="/mnb_notebook/img/01_login_01.png" />
			</div>
			
			<form id="LoginForm" name="LoginForm" method="post" action="login_sql.asp">
			
			<div class="login_input">
				<input type="text" name="user_id" id="user_id" class="login_input_01" placeholder="아이디" />
			</div>
			
			<div class="login_input">
				<input type="password" name="user_pwd" id="user_pwd" class="login_input_01" placeholder="비밀번호" />
			</div>

			<div class="login_btn">
				<input type="image" src="/mnb_notebook/img/01_login_03.png" />
			</div>
		
			<div class="login_input">
				<input type="checkbox" name="login_auto" id="login_auto" /> 자동 로그인
			</div>
			</form>
			<div class="member_join">
				계정이 없는경우
				마더앤베이비 본사에 신청하여 
				계정을 생성하세요
			</div>
			<div class="member_join">
				<img src="/mnb_notebook/img/01_login_05.png" style="width:100%;" />
			</div>

		</div>

    </div><!-- /.container -->

  </body>

  	<script type="text/javascript" charset="utf-8"> 
		
		
		//var login_btn = jQuery(".login_btn");


			jQuery(".login_btn").click(function() {
				if ($.trim(jQuery("#user_id").val()) == "") {
						alert("아이디를 입력하세요");
						$('#user_id').focus();
						return false;
				 
				}

				if ($.trim(jQuery("#user_pwd").val()) == "") {
						alert("비밀번호를 입력하세요");
						$('#user_pwd').focus();
						return false;
				 
				}

			});

	</script>


</html>