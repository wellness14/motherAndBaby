<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/FunDef.asp"-->
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
	<script src="service/js/jquery.rwdImageMaps.min.js"></script>
 	<script type="text/javascript">
		$(document).ready(function() {
			$('img[usemap]').rwdImageMaps();
		});
	</script>
 
  </head>

  <body>


 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->




	<div id="container" style="margin-top:50px; padding:10px;">
		<img src="/mobileweb/html/images/program_01.jpg" usemap="#care_service_01" border="0">
		
		<map name="care_service_01" id="care_service_01">
		  <area shape="rect" coords="333,2283,445,2324" href="service_request.asp" />
		  <area shape="rect" coords="460,2286,567,2325" href="tel:025573579" />
		</map>

		<!-- <ul class="care-service-btn">
			<a href="board_03.asp"><li class="mr30">1:1상담</li></a>
			<a href="tel:025573579"><li>전화하기</li></a>
		</ul> -->
	</div>
		 
	 


		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
 
    </div><!-- /.container -->

  </body>
  
  <script src="js/leftmenu.js"></script>

</html>
