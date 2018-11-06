<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	mOne = fncRequest("mOne")
%>


<!DOCTYPE html>

<html>
<head>




  <!-- Bootstrap Core CSS -->
   <link href="css_02/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom CSS -->
    <link href="css_02/simple-sidebar.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->







  <title>voucher info</title>


    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"> -->
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

   

<style type="text/css">

@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
table, div, p {font-family:'Nanum Gothic';}
body {
	font-family:'Nanum Gothic';
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
table,{text-align:center;}
#container  { background-color:#ffffff; width:90%; border:0; margin:0 auto;  padding:10px;  }
#container_content  { background-color:#ffffff; width:90%; border:0; margin:0 auto;  padding:10px; float:left; }
#content  { background-color:#ffffff; float:left; width:90%; height:400px;margin:0 auto; }
#sideinfo  { position:fixed; top:0; left:0; float:left;  }
#sideinfo ul  { margin:0; padding:0;  }
#main_text  {color:#2d5da9; font-weight:bold; font-size:30pt; margin:0 auto;}
#sub_text_01  {color:#525352; font-weight:bold; font-size:20pt; margin:30px 0 auto;}
#sub_text_02  {color:#525352; font-weight:bold; font-size:13pt; margin:10px 0 0 0 ;}
#content_name {color:#2d5da9; font-weight:bold;font-size:13pt; margin:50px 0 10px 0 ;}
#content_text { font-size:10pt; margin: 0 0 40px 0 ;}
#voucher_provision { background-color:#ddf0ff; clear:both;  width:90%; height:auto; padding:45px 10px 45px 10px;}
#voucher_provision_name { color:#28282a; font-weight:bold;font-size:16pt; margin:0 0 20px 0; display:inline-block;margin:0 0 30px 45px; }
#voucher_provision_content_01 { color:#313131; font-weight:bold; font-size:12pt; margin:0 0 10px 45px;}
#voucher_provision_content_02 { color:#313131; font-weight:bold; font-size:10pt; margin:0 0 10px 45px; }
#voucher_provision_content_03 {  margin:0 0 30px 45px; padding:0 45px 0 0;}
#table_text_b_01{ background-color:#b5dfff;  text-align:center; vertical-align:middle;  font-size:15px; }
#table_text_b_02{ background-color:#ddf0ff;  text-align:center; vertical-align:middle;  font-size:15px; }
#table_text_w{font-weight:bold; background-color:#2c61af; color:#ffffff; text-align:center; vertical-align:middle; font-size:15px; }
#table_text_name {background-color:#b0d0ff;}
.table_text_name {padding:15px 0 15px 0;}


.button {
	width: 90%;
	height: 10%;
	line-height:3;
	color: #ffffff;
	text-decoration: none;
	font-size: 14px;
	font-weight: bold;
	display: block;
	text-align: center;
	position: relative;

	/* BACKGROUND GRADIENTS */
	background: rgb(97,127,170); /* Old browsers */
	background: -moz-linear-gradient(top, rgba(97,127,170,1) 0%, rgba(44,97,175,1) 90%); 
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(97,127,170,1)), color-stop(90%,rgba(44,97,175,1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, rgba(97,127,170,1) 0%,rgba(44,97,175,1) 90%); /* IE10+ */
	background: linear-gradient(to bottom, rgba(97,127,170,1)0%,rgba(44,97,175,1) 90%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#617faa', endColorstr='#2c61af',GradientType=0 ); /* IE6-9 */

	/* BORDER RADIUS */
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 10px;

	/* BOX SHADOW */
	-moz-box-shadow: 0 1px 3px black;
	-webkit-box-shadow: 0 1px 3px black;
	box-shadow: 0 1px 3px black;
}

/* WHILE HOVERED */
.button:hover {
	background: rgb(139,162,193); /* Old browsers */
	background: -moz-linear-gradient(top,  rgba(139,162,193,1) 0%, rgba(85,136,213,1) 90%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(139,162,193,1)), color-stop(90%,rgba(85,136,213,1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* IE10+ */
	background: linear-gradient(to bottom,  rgba(139,162,193,1) 0%,rgba(85,136,213,1) 90%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#8ba2c1', endColorstr='#5588d5',GradientType=0 ); /* IE6-9 */
	}

/* WHILE BEING CLICKED */
.button:active {
	-moz-box-shadow: 0 2px 6px black;
	-webkit-box-shadow: 0 2px 6px black;
}


#voucher_main_name {color:#272727; font-size:20pt; font-weight:bold; }
</Style>


</head>

<body>






<div id="container">





	<div id="sideinfo">
				
		
		<!-- Sidebar -->
			<div id="sidebar-wrapper">
			    <ul class="sidebar-nav" style="width:82px; height:2000px; background-color:#234f8f;">
			     <% 'If mOne = 1 Then %>
				<li class="sidebar-brand" style="list-style:none;">
				    <a href="http://mothernbaby.co.kr/voucher/new_voucher_01.asp?mOne=1">
				    <img src="/image/voucher_menu01_off.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" 
				    onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/>
				    </a></li>
				    <li style="list-style:none;">
				    <a href="http://mothernbaby.co.kr/voucher/new_voucher_02.asp?mOne=2">
				    <img src="/image/voucher_menu02_on.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" 
				    onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/>
				    </a></li>
				    <% 'End If %>
                
			 </ul>
        </div>
        <!-- /#sidebar-wrapper -->

	<div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
		    <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">메뉴</a>
                    </div>
		 </div>
	    </div>
	 </div>



			<div id="container_content">


				<div id="header">
					<img src="/image/voucher_logo.png" width="123" height="34"  border="0" style="margin-top:10px;" align="right" /></a>
				</div>

		
			<div id="content" style="margin-left:90px;">
				
				

				<h2 id="sub_text_01">산모에게 힘이 되는정부 지원안내</h2><hr width=100%>

				 <h1 id="main_text">마더앤베이비의 산모·신생아 건강관리 서비스</h1>

				<p id="sub_text_02">전문교육을 받은 <span style="color:#2d5da9; font-weight:bold;">산모·신생아 건강관리사가 </span><br/>
				출산가정을 방문해 산모와 신생아를 돌봐드립니다.<p>

				 <p id="content_name"> < 지원대상 ></p>

				 <p id="content_text">산모 및 배우자의 건강보험료 본인부담금 합산액이 전국가구 월평균소득 65%이하 금액에 해당하는 출산 가정<br/>
				※상대적으로 산후관리 부담이 큰 일부 특수가정(쌍생아 이상 출산가정, 희귀난치성질환산모 등)에 대해서는 
				소득기준을 초과하더라도 예외지원 하는 지자체도 있음</p>

				<table  height="auto;" style=" background-color:#ffffff;width:90%" cellpadding="0" cellspacing="2">
				<caption style="text-align: right;" >［ 건강보험료 본인부담금에 의한 전국가구평균소득 65% 판정기준 ]</caption>
					<tr align="center" valign="center" style="background-color:#b0d0ff; color:#ffffff; " ><th colspan="4" style="padding:15px 0 15px 0; font-size:15px;">건강보험료 본인부담금(원)</th></tr>
					<tr id="table_text_w" ><th class="table_text_name">가구원수</th>
					<th class="table_text_name">직장가입자</th>
					<th class="table_text_name">지역가입자</th>
					<th class="table_text_name">혼합(직장+지역)</th></tr>

					<tr id="table_text_b_02"><td id="table_text_name" class="table_text_name">2인</td>
					<td class="table_text_name">61,379</td>
					<td class="table_text_name">47,997</td>
					<td class="table_text_name">62,201</td></tr>

					<tr id="table_text_b_01"><td id="table_text_name" class="table_text_name">3인</td>
					<td class="table_text_name">87,731</td>
					<td class="table_text_name">87,698</td>
					<td class="table_text_name">88,430</td></tr>

					<tr id="table_text_b_02" ><td id="table_text_name" class="table_text_name">4인</td>
					<td class="table_text_name">98,557</td>
					<td class="table_text_name">103,894</td>
					<td class="table_text_name">99,769</td></tr>

					<tr id="table_text_b_01" ><td id="table_text_name" class="table_text_name">5인</td>
					<td class="table_text_name">104,450</td>
					<td class="table_text_name">112,143</td>
					<td class="table_text_name">105,783</td></tr>

					<tr id="table_text_b_02" ><td id="table_text_name" class="table_text_name">6인</td>
					<td class="table_text_name">110,823</td>
					<td class="table_text_name">120,855</td>
					<td class="table_text_name">112,221</td></tr>

					<tr id="table_text_b_01" ><td id="table_text_name" class="table_text_name">7인</td>
					<td class="table_text_name">116,655</td>
					<td class="table_text_name">128,325</td>
					<td class="table_text_name">118,139</td></tr>

					<tr id="table_text_b_02" ><td id="table_text_name" class="table_text_name">8인</td>
					<td class="table_text_name">121,275</td>
					<td class="table_text_name">133,955</td>
					<td class="table_text_name">122,699</td></tr>
				</table>

			      <p><a href="http://www.nhis.or.kr/retrieveHomeMain.xx" target="_blank" class="button"> 건강보험료 본인부담금 납부확인 </a></p>


		


				<p id="content_name"> < 서비스 비용 ></p>

				<p id="content_text">

				<span style="color:#2d5da9; font-weight:bold; font-size:11pt;">서비스 총 가격 :</span> 보건복지부가 정한 상한선 범위 내에서 개별 제공기관이 자율적으로 서비스 가격 책정<br/>
	 
				<span style="color:#2d5da9; font-weight:bold; font-size:11pt;">정부지원금 :</span> 소득수준 및 신생아 유형에 따라 차등 지원<br/>
				 
				<span style="color:#2d5da9; font-weight:bold; font-size:11pt;">본인부담금 :</span> 서비스 총 가격에서 정부지원금을 뺀 차액 부담</p>

			 

				<table  height="auto;" style=" background-color:#ffffff;width:90%" cellpadding="0" cellspacing="2">

					
					<tr id="table_text_w" ><th class="table_text_name">구분</th>
					<th class="table_text_name">가격상한선</th>
					<th class="table_text_name">소득<br/><span style="font-size:9pt;">(전국가구 월평균소득)</span></th>
					<th class="table_text_name">유형</th>
					<th class="table_text_name">본인부담금</th>
					<th class="table_text_name">지원기간</th>
					<th class="table_text_name" style="font-size:9pt;">본인에게 해당하는<br/> 사항을 선택하세요<br/> (택1)</th></tr>

					<tr id="table_text_b_02"><td id="table_text_name" class="table_text_name" rowspan="4">단테아</td>
					<td class="table_text_name" rowspan="4">800,000원</td>
					<td class="table_text_name">40%이하</td>
					<td class="table_text_name"id="table_text_b_01">A-가형</td>
					<td class="table_text_name"rowspan="4">책정가와</br> 정부지원금 차액</td>
					<td class="table_text_name"rowspan="4"id="table_text_b_01">2주</td>
					<td class="table_text_name"rowspan="4">선택</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >40%초과~50%이하</td>
					<td class="table_text_name"id="table_text_b_02">A-나형</td></tr>

					<tr id="table_text_b_02"><td class="table_text_name" >50%초과~65%이하</td>
					<td class="table_text_name"id="table_text_b_01">A-다형</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >65%초과<br/><span style="font-size:9pt;">(예외지원)</span></td>
					<td class="table_text_name"id="table_text_b_02">A-라형</td></tr>


					<tr id="table_text_b_02"><td id="table_text_name" class="table_text_name" rowspan="4">쌍생아</td>
					<td class="table_text_name" rowspan="4">1,500,000원</td>
					<td class="table_text_name">40%이하</td>
					<td class="table_text_name"id="table_text_b_01">B-가형</td>
					<td class="table_text_name"rowspan="4"id="table_text_b_01">책정가와</br> 정부지원금 차액</td>
					<td class="table_text_name"rowspan="4">3주</td>
					<td class="table_text_name"rowspan="4">선택</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >40%초과~50%이하</td>
					<td class="table_text_name"id="table_text_b_02">B-나형</td></tr>

					<tr id="table_text_b_02"><td class="table_text_name" >50%초과~65%이하</td>
					<td class="table_text_name"id="table_text_b_01">B-다형</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >65%초과<br/><span style="font-size:9pt;">(예외지원)</span></td>
					<td class="table_text_name"id="table_text_b_02">B-라형</td></tr>


					<tr id="table_text_b_02"><td id="table_text_name" class="table_text_name" rowspan="4">삼태아 이상<br/>중증 장애인 산모</td>
					<td class="table_text_name" rowspan="4">2,200,000원</td>
					<td class="table_text_name">40%이하</td>
					<td class="table_text_name"id="table_text_b_01">C-가형</td>
					<td class="table_text_name"rowspan="4">책정가와</br> 정부지원금 차액</td>
					<td class="table_text_name"rowspan="4"id="table_text_b_01">4주</td>
					<td class="table_text_name"rowspan="4">선택</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >40%초과~50%이하</td>
					<td class="table_text_name"id="table_text_b_02">C-나형</td></tr>

					<tr id="table_text_b_02"><td class="table_text_name" >50%초과~65%이하</td>
					<td class="table_text_name"id="table_text_b_01">C-다형</td></tr>

					<tr id="table_text_b_01"><td class="table_text_name" >65%초과<br/><span style="font-size:9pt;">(예외지원)</span></td>
					<td class="table_text_name"id="table_text_b_02">C-라형</td></tr>

				</table>

				<p><a href="#" class="button">2015년 최저생계비 기준금액확인 </a></p>


			 
			 
				 <p id="content_name"> < 신청기간 ></p>

				 <p id="content_text">

				 <span style="color:#2d5da9; font-weight:bold; font-size:11pt;">출산 예정일 40일 전부터 출산일로부터 30일까지</span> </p>

				<!--표02-->
				<table width="90%" height="auto;" style=" background-color:#ffffff;" cellpadding="0" cellspacing="2">
	
			
					<tr id="table_text_b_02"><th id="table_text_w" class="table_text_name">출산 전</th>
						<td  class="table_text_name">출산 40일 이전</td>
					</tr>
					

					<tr id="table_text_b_01"><th id="table_text_w" class="table_text_name">출산 후</th>
						<td class="table_text_name">출산이후 30일이 경과되지 않았습니다.</td>
					</tr>
				</table>
			  
				   
				 <p id="content_name"> < 지원내용 ></p>

				 <p id="content_text">산모·신생아 건강관리사가 일정 기간 출산가정을 방문하여 산후관리를 도와주는 산모·신생아 건강관리 서비스 이용권 지급</p>

			
			 
				 <p id="content_name"> < 지원기간 ></p>

				 <p id="content_text">

				 <span style="color:#2d5da9; font-weight:bold; font-size:11pt;">한 아기(단태아) :</span>12일<br/>
	 
				 <span style="color:#2d5da9; font-weight:bold; font-size:11pt;">쌍둥이(쌍태아) :</span>18일<br/>
				 
				 <span style="color:#2d5da9; font-weight:bold; font-size:11pt;">세쌍둥이(삼태아)이상 또는 중증장애 산모 :</span> 24일</p>



				 <p id="content_name"> < 지원내용 ></p>

				 <p id="content_text">산모·신생아 건강관리사가 일정 기간 출산가정을 방문하여 산후관리를 도와주는 산모·신생아 건강관리 서비스 이용권 지급</p>



				 <p id="content_name"> < 유효기간 ></p>

				 <p id="content_text">출산일로부터 60일 이내(60일이 경과되면 바우처 자격 소멸)</p>


				 <p id="content_name"> < 신청장소 ></p>

				 <p id="content_text">산모의 주민등록 주소지 관할 시·군·구 보건소</p>


				 <p id="content_name"> < 신청자격 ></p>

				 <p id="content_text">국내에 주민등록 또는 외국인 등록을 둔 출산 가정<br/>
				 단, 부부 모두가 외국인인 경우 당해 외국인은 국내 체류자격 비자(사증) 종류가 F-2(거주), F-5(영주), F-6(결혼이민)인 경우에 한함</p>



				<p id="content_name"> < 서비스 제공자 ></p>

				 <p id="content_text">「사회서비스 이용 및 이용권 관리에 관한 법률」 제 16조 제1항 및 같은 법 시행규칙 제9조 [별표1]에 따라 등록한 제공기관<br/>
										서비스 제공인력은 같은 법 시행규칙에 따라 보건복지부장관이 고시한 「산모·신생아 방문서비스 제공인력 교육과정」 을 이수한 자</p>

				
				<p id="content_name"> < 카드 발급 신청 방법 ></p>

				<p id="content_text"><span style="color:#525252; font-weight:bold; font-size:12pt;">※국민행복카드만 신청 또는 재발급 신청할 경우 (☞카드사별						영업점으로)</span>
									(1)신청권자: 서비스 대상자 본인<br/>
									(2)서비스 수혜여부와 관계없이 국민행복카드를 발급 받거나 바우처 이용 중 카드를 분실 또는 훼손하여 재발급을 원할 경우 	카드사 영업점 또는 홈페이지를 통해 신청 가능</p>


			 


				<!--표04-->
				<table  height="auto;" style=" background-color:#ffffff;width:90%" cellpadding="0" cellspacing="0">

			
					<tr>
						<th style=" background-color:#214992;"><a><img src="/image/voucher_05.jpg"  style="width:100%"  /></a></th>
							<td id="table_text_b_01" class="table_text_name"style="text-align:left;"><span style="color:#232323;font-weight:bold; font-size:14pt; padding:0 25px 0 25px;">
							1.신청서(재발급)</span></br>
							<span style="padding:0 25px 0 25px;">'바우처 카드 발급 및 개인정보 제공·활용 동의서' 작성·제출(신청인 → 카드사별 영업)</span></br>
							<span style="padding:0 25px 0 25px;">※카드신청서 서식은 각 카드사별 별도서식 적용, 업무 주체: 신청인</span></td>
					</tr>
					

					<tr style=" background-color:#aadaff;"><th><a><img src="/image/voucher_06.jpg"  style="width:100%"  /></a></th>
						<td id="table_text_b_02" class="table_text_name"style="text-align:left; "><span style="color:#232323;font-weight:bold; font-size:14pt; padding:0 25px 0 25px;">
						2.신청서 입력 (카드사 시스템)</span></br>
						<span style="padding:0 25px 0 25px;">카드 발급 신청정보 입력</span></br>
						<span style="padding:0 25px 0 25px;">업무 주체: 각 카드사</span></td>
					</tr>

					<tr style=" background-color:#42a5fa;"><th><a><img src="/image/voucher_07.jpg"  style="width:100%"  /></a></th>
						<td id="table_text_b_01" class="table_text_name"style="text-align:left; "><span style="color:#232323;font-weight:bold; font-size:14pt; padding:0 25px 0 25px;">
						3.카드 제작·배송 (각 카드사)</span></br>
						<span style="padding:0 25px 0 25px;">카드 심사·제작 후 배송 ( 우편 또는 인편 배송 )</span></br>
						<span style="padding:0 25px 0 25px;">※ 3 ~ 7일 이내 배송, 수취인 부재 시 대상자 관할 </span></br>
						<span style="padding:0 25px 0 25px;">시·군·구 (보건소)로  반송처리, 업무 주체: 각 카드사</span></td>
					</tr>
				</table>

			 

				 <p id="content_name"> < 각 카드사별 신청장소 ></p>

			
					<!--카드 표-->

				<table  height="auto;" style=" background-color:#ffffff;width:90%" cellpadding="0" cellspacing="2">

					
					

					<tr id="table_text_b_02"><th  class="table_text_name" rowspan="2" style="width:20%; font-size:15px;">BC카드</th>
					
						<td class="table_text_name" id="table_text_b_01" style=" font-size:13px;">
						<span style="padding:0 25px 0 25px; text-align:left;"> <현재 ~ 6.30> 삼성카드, 롯데카드, BC카드 회원사 (IBK기업은행, NH농협, 대구은행, 부산은행, 경남은행)<7.1 ~ > BC카드 회원사 (우리카드, 우체국, 수협)  <9.1~ > BC카드 회원사 (전북은행, 제주은행, 광주은행</span></td>
					

					<tr id="table_text_w">
						<th class="table_text_name"> <span style="padding:0 25px 0 25px;" >문의 : 1899 - 4651</span></th></tr>



					<tr id="table_text_b_01"><th  class="table_text_name" rowspan="2" style="width:20%; font-size:15px;">삼성카드</th>
					
						<td class="table_text_name" id="table_text_b_01" style=" font-size:13px;">
						<span style="padding:0 25px 0 25px; "> 백화점 (신세계, 세이) 고객서비스 센터 및  지역단 가입센터, 새마을금고</span></td>
					

					<tr id="table_text_w"><th class="table_text_name"> <span style="padding:0 25px 0 25px;" >문의 : 1588 - 8700</span></th></tr>


					<tr id="table_text_b_02"><th  class="table_text_name" rowspan="2" style="width:20%; font-size:15px;">롯데카드</th>
					
					<td class="table_text_name" id="table_text_b_01" style=" font-size:13px;">
					<span style="padding:0 25px 0 25px; "> 롯데백화점 카드센터</span></td>
					

					<tr id="table_text_w"><th class="table_text_name"> <span style="padding:0 25px 0 25px;" >문의 : 1899 - 4651</span></th></tr>



					
				</table>


			 <p id="content_name"> < 결제 방법 ></p>

			 <p id="content_text">('15.6월 이전 신청자, ~6.30) 가상카드번호와 단문자(SMS) 인증번호를 이용한 결제<br/>
									※6월 이전 신청자도 7월 이후 국민행복카드 발급자는 이용자 카드를 통해 결제 가능<br/>
									('15.7월 이후 신청자, ~7.1) 국민행복카드(이용자 카드)와 제공인력 카드를 이용한 결제

			
			<div id="voucher_provision" >

			<p id= "voucher_provision_name" style="font-weight:bold; font-size:20px; "><span style="position:relative; top:-15px; ">마더앤베이비의 산모·신생아 건강관리 「사회서비스 약관」</span></a></p>

			<p id="voucher_provision_content_01">마더앤베이비 사회서비스 이용기간 및 시간 </p>

			<p id="voucher_provision_content_02">이용기간  </p>

			<p id="voucher_provision_content_03">·서비스 개시일 기준 2주 (10일 ~ 12일) 서비스 제공 전 시간 협의에 따라 기간 및 요일이 달라질수 있습니다.<br/>단 쌍생아, 삼태아/ 중증장애인 산모는 별도 규정에 따릅니다.</p>


			<p id="voucher_provision_content_01">신생아 건강관리 서비스표준 서비스제공 기본원칙 </p>

			<p id="voucher_provision_content_02">서비스내용 </p>

			<p id="voucher_provision_content_03">산모 영양관리, 유방관리, 산후체조, 정서지원 등 산모 신생아 건강관리 서비스 표준으로 서비스를 제공합니다.<br/>
			 신생아의 건강상태 관찰, 목욕, 위생관리, 젖병소독, 신생아의 의류관리, 수유보조 등 산모 신생아 건강관리 서비스 표준으로 서비스를 제공합니다.<br/>
			 별도의 추가 프로그램 구매 없이 큰아이 돌보기, 지원대상자가 아닌 기타 가족케어, 대청소, 이불빨래, 묶은 빨래, 손세탁 등의 서비스는 
			 지원이 불가합니다.</p>


			<p id="voucher_provision_content_02">서비스 변경 </p>

			 <p id="voucher_provision_content_03">서비스 진행중에는 제공기관 변경이 불가합니다. (단, 제공기관의 귀책사유 발생 시 변경 가능)<br/>
			 서비스 제공기관에서 제공하는 구체적 서비스 내용 및 일정 변경을 원하는 경우는 이용자와 제공기관간 협의를 통해서 결정합니다.<br/>
			 산모, 신생아 관리사의 일시적 질병이나 귀책사유 발생으로 서비스 진행이 불가피한 경우 교체를 요청할 수 있습니다. (단, 교체 일정은 협의하여 결정합니다.)<br/>
			 고객 불만족으로 인한 산모, 신생아 건강 관리사 변경 요청 시 제공기관은 고객과의 상담을 통하여 변경이 가능합니다.<br/> 
			 서비스 제공자가 특정 이용자를 거부하는 경우, 제공기관은 상담을 통해 서비스 제공자를 변경할 수 있습니다.</p>



			<p id="voucher_provision_content_02">서비스 중단 및 계약해지 </p>

			<p id="voucher_provision_content_03">고객의 단순 변심으로 인한 해지 또는 변경은 인정되지 않으며 해약 통지는 해약일로부터 3일전에 통지하여야 합니다.<br/>
			 단, 부득이한 이유로 제공기관이 사회서비스 제공을 지속할 수 없는 경우가 발생할 시에는 지체없이 고객에게 안내하도록 합니다.</p>



			<p id="voucher_provision_content_02">서비스 중단(계약해지)시 정산방법</p>

			<p id="voucher_provision_content_03">사회서비스 지원사업에서 규정한 서비스 비용정산을 정산하며 본인 부담금 환급을 실시 합니다.<br/> 
			 서비스 개시일로 부터 3일 이내에 서비스 중단이 이루어지는 경우에는 최소관리기준일 3일을 이용한 것으로 간주하고 차액을 환급합니다.</p>

			</div>

			</div>




		
				
			<div id="footer"></div>


 
  <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>










