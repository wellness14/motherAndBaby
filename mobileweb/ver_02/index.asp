<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">

	<link rel="stylesheet" href="css/swiper.min.css">

	<style>
	.sewol-m { position: absolute; width: 40px; top: 8px; left: 66px; display: block;}
	.sewol-m img { width: 100%; }
	</style>

	<script src="js/swiper.min.js"></script>

	<script>
 
	$(document).ready(function(){
//		window.onload = function(){ 
//			document.getElementById('myModal1').play();
//		} 
	//	$("#myModal1 .modal-dialog").click(function() {alert('ttt');})
		var mySwiper = new Swiper(".swiper-container",{
			spaceBetween: 0,
			loop: true,
			pagination: ".swiper-pagination"
		});
	});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
<!-- 			<a href="http://campaign.naver.com/memory/" class="sewol-m"> -->
<!-- 				<img src="/mobileweb/html/images/sewol.png" alt="세월호 추모 리본"> -->
<!-- 			</a> -->
			<span class="btn-right go-calc" style="right:50px;"><a href="http://momcho.co.kr/m/helperVoucherCalc.do" target="_blank">
				정부지원금<br/>계산기
			</a></span>
			<h2 class="top_title"><span style="color:#ed587a;">마더앤</span><span style="color:#919194;">베이비</span></h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
			<span class="btn-right go-consult"><a href="http://mothernbaby.co.kr/mobileweb/ver_02/info_01.asp">
				상담
			</a></span>
			<!-- <span class="btn-right go-consult"><a href="http://mothernbaby.co.kr/mobileweb/ver_02/info_01.asp">
				<img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/>
				상담
			</a></span>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				<img src="/mobileweb/html/images/calling.png" style="width:19px;" alt=""/>
				전화
			</a></span> -->
	</header>

	<div id="container" class="">
		<ul class="main-menu">
			<li>
				<a href="comp.asp?menuCode1=20000&menuCode2=B">
					<span class="tit">“마더앤베이비 만의 특별함”</span>
					<span class="sut">개인맞춤형 임신출산 관리 서비스</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/list_09.jpg" />
				</a>
			</li>

			<li>
				<a href="care_service.asp">
					<span class="tit">산후케어 서비스</span>
					<span class="sut">마더앤베이비의 산후케어 서비스 프로그램입니다.</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/list_14.jpg" />
				</a>
			</li>

			<li>
				<a href="info_01.asp">
					<span class="tit">상담신청</span>
					<span class="sut">서비스 가입에 대한 문의사항을 친절히 알려드립니다.</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/list_07.jpg" />
				</a>
			</li>

			<li>
				<a href="map_info_v02.asp">
					<span class="tit">지역별지사안내</span>
					<span class="sut">서울·인천·경기·대전·경상북도·해외</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/list_12.jpg" />
				</a>
			</li>

			<li>
				<a href="info_02.asp?menuCode1=40000&menuCode2=F">
					<span class="tit">출산선물</span>
					<span class="sut">산후관리서비스를 이용하시는 모든 산모님께 마음을 담아 드립니다.</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/list_01.jpg" />
				</a>
			</li>

			<li>
				<a href="http://latherapie.co.kr/m/index.do" target="_blank">
					<span class="tit">라테라피</span>
					<span class="sut">내 집에서 편안하게 받는 고급스파</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/managerHeader2.jpg" />
				</a>
			</li>

			<li style="height:200px;">
				<a href="http://www.momcho.co.kr/" target="_blank">
					<span class="tit">임신출산육아</span>
					<span class="sut">
						다양한 정보가 궁금하다면?<br/>
						맘초에서 GO!
					</span>
					<span class="plus_btn" ><img src="/mobileweb/html/images/plus_btn.png" style="width:20px;" alt=""></span>
					<img src="/mobileweb/html/images/goMomcho.jpg"/>
				</a>
			</li>
		</ul>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>



<!--팝업창시작-->
<form name="pop_form">
<!--원래주석-->
 <!--  data-toggle="modal" data-target="#myModal1"  -->
 <!--원래주석 끝-->
		<input type="button" name="button1" data-toggle="modal" data-target="#myModal1"  style="display:none;"/>
		<div class="modal fade" name="myModal1" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document"  >
			<div class="modal-content" style="margin-top:35%;">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"style="position:absolute;top:-10px;right:0px;">&times;</span></button> 
				<!--팝업창 네이밍(가림)-->
				<!--<h4 class="modal-title" id="myModalLabel">팝업</h4>-->
			 </div>
			  <div class="modal-body" style="text-align:center; padding:0px">
					<div class="swiper-container">
						<div class="swiper-wrapper">

						
						
<!-- 								베이비페어 팝업 -->
<!-- 							<div class="swiper-slide"> -->
<!-- 								<a href="http://www.mothernbaby.co.kr/board/board_01_view.asp?mOne=4&mTwo=5&brd_id=EVENT&idx=77" target="_blank"><img src="/mobileweb/html/images/bf_mpopup20181012__m.jpg" style="width:100%;"/></a> -->
<!-- 							</div> -->
<!-- 베이비페어 2018 팝업 -->
<!-- 							<div class="swiper-slide"> -->
<!-- 								<a href="http://www.mothernbaby.co.kr/board/board_01_view.asp?m0ne=4&mTwo=5&brd_id=EVENT&idx=77" target="_blank"><img src="/mobileweb/html/images/bf_mpopup_20181012.jpg" style="width:100%;"/></a> -->
<!--                             </div> -->

						    <div class="swiper-slide">
								<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/voucher.html" target="_blank"><img src="/mobileweb/html/images/seoul_voucher_m.jpg" style="width:100%;"/></a>
							</div>

							<div class="swiper-slide">
								<a href="http://mothernbaby.co.kr/mobileweb/ver_02/info_02.asp?menuCode1=40000&menuCode2=D" target="_blank"><img src="/mobileweb/html/images/mpopup_voucher2.jpg"  style="width:100%;"/></a>
							</div>

							<div class="swiper-slide">
								<a href="https://www.momcho.co.kr/m/centerSearch/1?utm_source=mothernbaby&utm_medium=banner&utm_campaign=%EB%A7%88%EB%8D%94%EC%95%A4%EB%B2%A0%EC%9D%B4%EB%B9%84_%EB%AA%A8%EB%B0%94%EC%9D%BC" target="_blank"><img src="/mobileweb/html/images/mpopup_momcho.jpg" style="width:100%;"/></a>
							</div>

							<div class="swiper-slide">
								<a href="http://mothernbaby.co.kr/mobileweb/ver_02/info_02.asp?menuCode1=40000&menuCode2=F" target="_blank"><img src="/mobileweb/html/images/mpopup_gift.jpg" style="width:100%;"/></a>
							</div>

							<div class="swiper-slide">
								<a href="http://health.gangnam.go.kr/content/1040/view.do?mid=419-1040&lang=ko" target="_blank"><img src="/mobileweb/html/images/mpopup_voucher.jpg"  style="width:100%;"/></a>
							</div>

<!-- 							지사장 모집 -->
							<div class="swiper-slide">
								<a href="http://mothernbaby.co.kr/comp/comp_11.asp?mOne=5&mTwo=4" target="_blank"><img src="/mobileweb/html/images/mpopup_jisa.jpg"  style="width:100%;"/></a>
							</div> 

						</div>
						<!-- <div class="swiper-pagination"></div> -->
					</div>
			  </div>
			  <style>
				.swiper-pagination {width:100%; left:0;}
				.swiper-pagination span {margin-right:7px;}
			  </style>
			  <div class="swiper-pagination"></div>
			  <div class="modal-footer">
			  	<input type="checkbox" name="chkbox1" value="checkbox" style=" position: absolute; left: 5px;"><span style="font-size:12px;    position: absolute; left: 30px;    margin-top: 2px; ">오늘 하루 이 창을 열지 않음</span>
				<span style="font-size:12px;"><a href="javascript:closeWin1();" style="text-decoration:none; color:black;">[닫기]&nbsp;&nbsp;</a>
			 
			  </div>
			</div>
		  </div>
		</div>
</form> 
<!-- 팝업창 끝 -->




<script>
//document.pop_form.button1.click(); 

function closeWin1() { 
	if ( document.pop_form.chkbox1.checked ){ 
		setCookie( "maindiv", "done" , 1 ); 
	}
	
	document.all['myModal1'].style.visibility = "hidden";
	$('#myModal1').modal('hide');
}

</script>

<!--팝업-->
<!-- POPUP -->
<!-- 
<div id="divpop" style="position:absolute;     top: 25%; z-index:9999;background-color:white; border:1px solid #ccc; layer-background-color:white; visibility:hidden;">
<div align="center" style="padding-top:5px;">
<table width=350 height=300 cellpadding=2 cellspacing=0>
<tr>
	<td style= height=200 align=center bgcolor=white>
	<a href="
http://me2.do/Gb0Wtz8b" target="_blank">
		<img src="" style="cursor:pointer;" border="0" style="opacity:1;filter:alpha(opacity=100)" onmouseover="this.style.opacity=0.7; this.filters.alpha.opacity=70" onmouseout="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
        

	</td>
</tr>
<tr>
		<form name="notice_form">
	<td align=right bgcolor=white style="height: 50px;">
		<input type="checkbox" name="chkbox" value="checkbox" style=" position: absolute; left: 5px;"><span style="font-size:12px;    position: absolute; left: 20px; ">오늘 하루 이 창을 열지 않음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		<span style="font-size:12px;"><a href="javascript:closeWin();" style="text-decoration:none; color:black;">[닫기]&nbsp;&nbsp;</a>
	</span></div><p style="margin-top:10px;"></p></td>
</tr>
		</form>
</table>
</div> 

 -->
</body>

<% '팝업쿠키1 시작------------------------------------------------------------------------------------------------------ %>

<script language="JavaScript">
<!--
function setCookie( name, value, expiredays ) { 
	var todayDate = new Date(); 
		todayDate.setDate( todayDate.getDate() + expiredays ); 
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
	} 

function closeWin() { 
	if ( document.notice_form.chkbox.checked ){ 
		setCookie( "maindiv", "done" , 1 ); 
	} 
	document.all['divpop'].style.visibility = "hidden";
}


function closeWin2() { 
	if ( document.notice_form2.chkbox.checked ){ 
		setCookie( "maindiv2", "done2" , 1 ); 
	} 
	document.all['divpop2'].style.visibility = "hidden";
}

function closeWin3() { 
	if ( document.notice_form2.chkbox.checked ){ 
		setCookie( "maindiv3", "done3" , 1 ); 
	} 
	document.all['divpop3'].style.visibility = "hidden";
}
//-->  
</script>

<script language="Javascript">
/*cookiedata = document.cookie;    
if ( cookiedata.indexOf("maindiv=done") < 0 ){      
	document.all['divpop'].style.visibility = "visible";
	} 
	else {
		document.all['divpop'].style.visibility = "hidden"; 
}*/
</script>


<!-- 모달팝업 -->

<script language="Javascript">
cookiedata = document.cookie;   
 
if ( cookiedata.indexOf("maindiv=done") < 0 ){      
	document.all['myModal1'].style.visibility = "visible";
	//document.pop_form.button1.click(); 
	$('#myModal1').modal('show');
	} 
	else {
		document.all['myModal1'].style.visibility = "hidden"; 
}
</script>

<!--  -->


 


<script language="Javascript">
/*cookiedata2 = document.cookie;    
if ( cookiedata2.indexOf("maindiv2=done2") < 0 ){      
	document.all['divpop2'].style.visibility = "visible";
	} 
	else {
		document.all['divpop2'].style.visibility = "hidden"; 
}*/
</script>
<!-- POPUP -->


<script language="Javascript">
/*cookiedata3 = document.cookie;    
if ( cookiedata2.indexOf("maindiv3=done3") < 0 ){      
	document.all['divpop3'].style.visibility = "visible";
	} 
	else {
		document.all['divpop3'].style.visibility = "hidden"; 
}*/
</script>
<!-- POPUP -->

<% '팝업쿠키1 끝--------------------------------------------------------------------------------------------------------- %>

</html>
