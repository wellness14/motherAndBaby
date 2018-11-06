<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
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
	<script src="/mnb_notebook/js/jquery.spinner.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="/mnb_notebook/js/jquery.spinner.js"></script>

	
	

	 

  </head>

  <body>

 <!-- #include virtual = "/mnb_notebook/nav.asp"-->
<br><br><br><br><br>

 
<br><br>

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
<div class="well">
<h2>Quantity:</h2>
<div class="input-append spinner" data-trigger="spinner">
<input type="text" value="1" data-rule="quantity">
<div class="add-on"> <a href="javascript:;" class="spin-up" data-spin="up"><i class="icon-sort-up"></i></a> <a href="javascript:;" class="spin-down" data-spin="down"><i class="icon-sort-down"></i></a> </div>
</div>
</div>
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

  </body>
</html>
