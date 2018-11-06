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
	<script>
 
	$(document).ready(function(){
//		window.onload = function(){ 
//			document.getElementById('myModal1').play();
//		} 
	//	$("#myModal1 .modal-dialog").click(function() {alert('ttt');})
	});
	</script>
	    
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title"><span style="color:#ed587a;">마더앤</span><span style="color:#919194;">베이비</span></h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
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
		</ul>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

<form name="pop_form">
 <!--  data-toggle="modal" data-target="#myModal1"  -->
		<input type="button" name="button1" data-toggle="modal" data-target="#myModal1"  style="display:none;"/>
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document"  >
			<div class="modal-content" style="margin-top:35%;">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"style="position:absolute;top:-10px;right:0px;">&times;</span></button>
				<!--<h4 class="modal-title" id="myModalLabel">팝업</h4>-->
			  </div>
			  <div class="modal-body" style="text-align:center; padding:0px"><a href="http://me2.do/5daKHG2Z">
						<img src="/mobileweb/html/images/20151126_mambe_m_popup.jpg"  style="width:100%;"/></a>
 
			  </div>
			  <div class="modal-footer">
			  	<input type="checkbox" name="chkbox1" value="checkbox" style=" position: absolute; left: 5px;"><span style="font-size:12px;    position: absolute; left: 30px;    margin-top: 2px; ">오늘 하루 이 창을 열지 않음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<span style="font-size:12px;"><a href="javascript:closeWin1();" style="text-decoration:none; color:black;">[닫기]&nbsp;&nbsp;</a>
			 
			  </div>
			</div>
		  </div>
		</div>
</form>
<!--  -->

<script>
//document.pop_form.button1.click(); 

function closeWin1() { 
	if ( document.pop_form.chkbox1.checked ){ 
		setCookie( "maindiv", "done" , 1 ); 
	} 
	
	document.all['myModal1'].style.visibility = "hidden";

	$('#myModal1').modal('hide'); //data-miss 대신 사용할 수 있음.
 
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
cookiedata = document.cookie;    
if ( cookiedata.indexOf("maindiv=done") < 0 ){      
	document.all['divpop'].style.visibility = "visible";
	} 
	else {
		document.all['divpop'].style.visibility = "hidden"; 
}
</script>


<!-- 모달팝업 -->

<script language="Javascript">
cookiedata = document.cookie;   
 
if ( cookiedata.indexOf("maindiv=done") < 0 ){      
	document.all['myModal1'].style.visibility = "visible";
	document.pop_form.button1.click(); 
	} 
	else {
		document.all['myModal1'].style.visibility = "hidden"; 
}
</script>

<!--  -->


 


<script language="Javascript">
cookiedata2 = document.cookie;    
if ( cookiedata2.indexOf("maindiv2=done2") < 0 ){      
	document.all['divpop2'].style.visibility = "visible";
	} 
	else {
		document.all['divpop2'].style.visibility = "hidden"; 
}
</script>
<!-- POPUP -->


<script language="Javascript">
cookiedata3 = document.cookie;    
if ( cookiedata2.indexOf("maindiv3=done3") < 0 ){      
	document.all['divpop3'].style.visibility = "visible";
	} 
	else {
		document.all['divpop3'].style.visibility = "hidden"; 
}
</script>
<!-- POPUP -->

<% '팝업쿠키1 끝--------------------------------------------------------------------------------------------------------- %>

</html>
