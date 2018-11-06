<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	If uId = "" Then 
		Response.Redirect "http://mothernbaby.co.kr/mnb_notebook/login.asp"
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

  <!-- #include virtual = "/mnb_notebook/nav.asp"-->



    <div class="container">

		<div class="content">
			<table class="table table-bordered tb">
					<colgroup>
						<col width="20%" />
						<col width="40%" />
						<col width="40%" />
					</colgroup>
					<thead>
					<tr>
						<th> 시간 </th>
						<th> 산모케어 </th>
						<th> 신생아케어 </th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td class="td2"> 09 - 10 </td>
							<td class="td2"> 출근 및 산모아침식사 	</td>
							<td class="td2"> 건강상태 관찰(체온,황달)</td>
						</tr>
						<tr>
							<td class="td2"> 10 - 12 </td>
							<td class="td2">  산모간식준비<br>
												설거지<br>
												청소 및 정리정돈<br>
												좌욕보조<br>
												점심식사 준비 	</td>
							<td class="td2">  젖병 소독/세척 </td>
						</tr>
						<tr>
							<td class="td2"> 12 - 13 </td>
							<td class="td2"> 산모식사 설거지 	</td>
							<td class="td2"> </td>
						</tr>
						<tr>
							<td class="td2"> 13 - 17 </td>
							<td class="td2"> 산후 바디케어(유방, 복부, 손/발)<br>
											 산후체조<br>
											 좌욕, 찜질보조<br>
											 세탁 및 청소 	</td>
							<td class="td2"> 신생아 목욕<br>
											 신생아 바디케어<br>
											 젖병 소독/세척 </td>
						</tr>
						<tr>
							<td class="td2">  17 - 18 </td>
							<td class="td2"> 저녁식사 야식준비  	</td>
							<td class="td2"> 야간 수유준비 </td>
						</tr>
					</tbody>
				</table>
				<div class="title_align_left">
					출퇴근
				</div>
				<div class="align_left">
					<span style="margin-left:80px;"></span>	1. 평일 오전 9시 - 오후 6시 (휴식시간 1시간)<br>
					<span style="margin-left:80px;"></span>	2. 토요일 오전 9시 - 오후 2시 (휴식시간 1시간)
				</div>

				<div class="title_align_left">
				입주
				</div>
				<div class="align_left">
					<span style="margin-left:80px;"></span>	1. 일요일 19시 - 토요일 16시 (휴식시간 2시간)<br>
					<span style="margin-left:80px;"></span>	2. 일요일 19시 - 금요일 19시 (휴식시간 2시간)
				</div>
				<br>
				<div class="align_left">
					입주형은 1일 평균 2시간 또는 1주 7시간범위내에서 산모와 상의하여 외출 가능 합니다.<br><br>22 - 06(익일) 시 사이는 아기와 함께 취침하여 신생아 
					돌보는 일만 합니다.<br><br>휴일근무시/시간초과시 추가요금 발생됩니다.
				</div>

				<br>
		</div>

    </div><!-- /.container -->

  </body>
</html>
