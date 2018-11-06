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
	<script>

	$(document).ready(function() {	 
 
		$("#r_menu11").click(function() {
			$("#r_menu1").show();
			$("#r_menu2").hide();
		});

		$("#r_menu22").click(function() {
			$("#r_menu1").hide();
			$("#r_menu2").show();
		});
	});

 



	</script>
  </head>

  <body>

 <!-- #include virtual = "/mnb_notebook/nav.asp"-->

<!-- 색 코드  #36c5a5   -->

    <div class="container">

		<div class="content">
			
		<div class="title"   id="r_menu11">
			<img src="/mnb_notebook/img/22_food_02.png" style="cursor:pointer;"/> 
		</div>
	<div id="r_menu1" >	
		<div class="title_align_left">
			1. 하루1회 이상 미역국을 섭취한다.
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;">
			미역에는 요오드
			성분과 무기질이 풍부해 피를 맑게 하고 젖을 잘 나오게 할 뿐만 아니라 혈액순환을 도와 출산 뒤 몸안에 고여있는 어혈을 풀어주는 산모에게 가장
			좋은 음식이다.
		</div>
		
		<div class="title_align_left">
			2. 하루 세끼이상 균형있는 영양소를 골고루 섭취한다.
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;">
			산모는 분만을 겪으며 짧은 시간동안 과다한 체력 소모 뿐 아니라 임신 중 철분결핍이 오기도 한다. 산욕기 동안은 몸매관리는 잠시 미뤄두고 균형있는 식사에 신경 써 산후트러블을 예방하고, 출산 전 몸으로 회복하는데 집중하도록 해야한다.
		</div>	

		<div class="title_align_left">
			3. 단백질, 철분, 칼슘이 많이 들어있는 음식을 섭취한다.
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;">
			단백질은 회음부 및 제왕절개 상처의 빠른 회복과 부종 감소를 돕고 칼슘은 부족한 칼슘을 공급하여 산후풍 및 골다공증을 예방한다.
			특히 칼슘섭취는 모유수유를 통해 아기뼈를 생성하기 때문에 산욕기에는 꼭 섭취해야 한다.
		</div>	

		<div class="title_align_left">
			4. 단 기름진 음식, 찬 음식, 단단한 식품을 삼가한다.
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;">
			몸 안에 나쁜 열을 만들어 산후 회복을 방해하는 찬 음식을 피해야 하며 과일 또한 딱딱하고 찬 성질 때문에 되도록 부드럽게 섭취 하도록 한다. 기름진 음식은 모유를 끈끈하게 하므로 담백하게 조리된 음식을 먹도록 하며, 자극성이 강하거나 카페인이 많은 기호식품은 모유를 통해 아기에게 전달 되므로 최대한 섭취하지 않는 것이 바람직하다.
		</div>	
		<br><br>
</div>	

<div class="title" id="r_menu22">
			<img src="/mnb_notebook/img/22_food_05.png"   style="cursor:pointer;"/> 
		</div>
<div id="r_menu2" style="display:none;">
 

		<br><br>

		<div class="title_align_left">
			1일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[소고기구이/흰밥] [갈치구이] [새우달걀찜] [미나리무침]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[홍합미역국/잡곡밥] [불고기] [멸치볶음] [참나물무침]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[소고기무국/흑미밥] [생선구이] [건새우볶음] [야채샐러드]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[달걀토스트/우유] [과일]
		</div>

		<div class="title_align_left">
			2일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[굴미역국/현미밥] [소고기버섯조림] [버섯볶음] [콩나물무침]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[북어국/잡곡밥] [두부부침] [가지나물] [장조림]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[소고기미역국/흰밥] [더덕초무침] [어묵볶음] [감자버섯볶음]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[감자샐러드샌드위치/주스] [과일]<br>
		</div>

		<div class="title_align_left">
			3일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[감자미역국/흑미밥] [굴비구이] [멸치볶음] [시금치무침]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[된장국/잡곡밥] [코다리북어구이] [무말랭이무침] [미역줄기 볶음]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[홍합미역국/흰밥] [닭찜] [잡채] [김]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[호박죽] [생과일주스]<br>
		</div>

		<div class="title_align_left">
			4일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[소고기미역국/흑미밥] [야채달걀찜] [애호박볶음] [오이피클]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[조갯살미역국/완두콩밥] [고등어양념구이] [감자볶음] [야채샐러드]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[맑은장국/잡곡밥] [생선전] [오징어불고기] [무생채]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[고구마/우유] [과일]
		</div>

		<div class="title_align_left">
			5일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[조갯살미역국/흰밥] ]달걀말이] [두부구이/양념장] [콩나물무침]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[건새우미역국/잡곡밥] [조기구이] [어묵볶음] [열무김치]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[맑으장국/현미밥] [버섯구이] [도라지생채] [소고기장조림]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[흑임자죽/두유] [과일]
		</div>

		<div class="title_align_left">
			6일차
		</div>
		<br>
		<div style="background-color: #EEEEEE;text-align:left;font-size:12px;">
			<span style="font-weight:bold;font-size:15px;">아침</span><br>
			[소고기미역국/흰밥] [생선조림] [알감자조림] [시금치무침]<br>
			<span style="font-weight:bold;font-size:15px;">점심</span><br>
			[감자미역국/잡곡밥] [생선구이] [감자전] [도토리묵 양념장]<br>
			<span style="font-weight:bold;font-size:15px;">저녁</span><br>
			[된장찌개/완두콩밥] [완자전] [콩나물무침] [상추겉절이무침]<br>
			<span style="font-weight:bold;font-size:15px;">간식</span><br>
			[피자샌드위치] [과일주스] [콘샐러드]
		</div>

<br><br>
</div>
	   </div>
    </div><!-- /.container -->

  </body>
</html>
