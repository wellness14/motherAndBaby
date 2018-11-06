<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/care.css" />
    <title>마더앤베이비모바일</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu_02.css" rel="stylesheet">
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<!-- <span class="btn-left" id="back"><img src="/mobileweb/html/images/menu_bar_01.png" alt=""></span>
			<h2 class="top_title"><span style="color:#ed587a;">마더앤</span><span style="color:#919194;">베이비</span></h2> -->
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/main/nav.asp"--></span>
		</div>
	</header>

	<div id="tab_menu">
		<table class="tab_menu_tb">
			<tr>
				<th class="on">산후케어서비스▼</th>
				<th class="off">내게맞는서비스찾기▼</th>
			</tr>
		</table>
	</div>

	<div id="container" class="">
		<div id="app_info">
			<div id="main_txt">
				<p>내게맞는서비스찾기</p>
				<hr width="100%" />
			</div>

			<div id="main_txt_02">
				<p class="main_txt_02_01">산모님의 정보를 입력하시면</p>
				<p class="main_txt_02_02">맞춤형 산모케어프로그램 추천드립니다.</p>
			</div>

			<div id ="care_program">
				<table width="100%" height="auto;" style=" background-color:#ffffff;border-spacing:2px;border-collapse:separate;" >
	
			
					<tr id="care_01">
						<th id="care_img" ><img src="/mobileweb/html/images/care_01.jpg" class="care_img_icon"/><!-- <span style="margin-left:20px;">생년월일</span> --></th>
						<th class="care_name" >생년월일</th>
						<td  class="txt_area" colspan="2">
						<select name="Ybirth" class="textarea" style="width:80px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
						</select>
						<select name="Mbirth" class="textarea" style="width:60px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
						</select>
						<select name="Dbirth" class="textarea" style="width:60px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
						</select></td>
					</tr>
					

					<tr id="care_02">
					<th id="care_img" ><img src="/mobileweb/html/images/care_02.jpg"class="care_img_icon"/></th>
						<th class="care_name">출산예정일</th>
						<td class="txt_area" colspan="2">
						<select name="childbirth_y" class="textarea" style="width:80px; height:31px;" valid="E|A=출산예정일을 선택해 주세요">
						</select>
						<select name="childbirth_m" class="textarea" style="width:60px; height:31px;" valid="E|A=출산예정일을 입력해 주세요">
						</select>
                        <select name="childbirth_d" class="textarea" style="width:60px; height:31px;" valid="E|A=출산예정일을 입력해 주세요">
						</select></td>
					</tr>


					<tr id="care_03">
					<th id="care_img" ><img src="/mobileweb/html/images/care_03.jpg"class="care_img_icon"/></th>
						<th class="care_name">결혼기념일</th>
						<td class="txt_area" colspan="2">
						 <select name="marry_y" class="textarea" style="width:80px; height:31px;" valid="E|A=결혼기념일을 선택해 주세요">
						</select>
						<select name="marry_m" class="textarea" style="width:60px; height:31px;" valid="E|A=결혼기념일을 입력해 주세요">
						</select>
                        <select name="marry_d" class="textarea" style="width:60px; height:31px;" valid="E|A=결혼기념일을 입력해 주세요">
						</select></td>
					</tr>


					<tr id="care_04">
					<th id="care_img" ><img src="/mobileweb/html/images/care_04.jpg"class="care_img_icon"/></th>
						<th class="care_name">출산경험</th>
						<td class="txt_area" colspan="2">
						 <input type="radio" name="radio1" value="초산" valid="E|A=출산경험을 선택해 주세요"/>초산모&nbsp;&nbsp;
                                <input type="radio" name="radio1" value="경산" />경산모
						</td>
					</tr>


					<tr id="care_05">
					<th id="care_img" ><img src="/mobileweb/html/images/care_05.jpg"class="care_img_icon"/></th>
						<th class="care_name">첫아이유무</th>
						<td class="txt_area" colspan="2">
						 <input type="radio" name="radio2" value="없음" valid="E|A=첫아이유무를 선택해 주세요"/> 없음&nbsp;&nbsp;
                                <input type="radio" name="radio2" value="1명" /> 1명&nbsp;&nbsp;
                                <input type="radio" name="radio2" value="2명" /> 2명&nbsp;&nbsp;
                                <input type="radio" name="radio2" value="3명 이상" /> 3명 이상
						</td>
					</tr>


					<tr id="care_06">
					<th id="care_img" ><img src="/mobileweb/html/images/care_06.jpg"class="care_img_icon"/></th>
						<th class="care_name">조리원이용</th>
						<td class="txt_area" colspan="2">
						  <input type="radio" name="radio3" value="이용함" valid="E|A=조리원 이용여부를 선택해 주세요"/> 이용함&nbsp;&nbsp;
                                <input type="radio" name="radio3" value="이용안함" /> 이용안함
						</td>
					</tr>



					<tr id="care_07">
					<th id="care_img" ><img src="/mobileweb/html/images/care_07.jpg"class="care_img_icon"/></th>
						<th class="care_name">분만형태</th>
						<td class="txt_area" colspan="2">
						  <input type="radio" name="radio4" value="자연분만" valid="E|A=분만형태를 선택해 주세요"/> 자연분만&nbsp;&nbsp;
                                <input type="radio" name="radio4" value="제왕절개" /> 제왕절개 
						</td>
					</tr>


					<tr id="care_08">
					<th id="care_img" ><img src="/mobileweb/html/images/care_08.jpg"class="care_img_icon"/></th>
						<th class="care_name">직장유무</th>
						<td class="txt_area" colspan="2">
						 <input type="radio" name="radio5" value="육아맘" valid="E|A=직장유무를 선택해 주세요"/> 육아맘&nbsp;&nbsp;
                                <input type="radio" name="radio5" value="워킹맘" /> 워킹맘 
						</td>
					</tr>

					<tr id="care_09">
					<th id="care_img" ><img src="/mobileweb/html/images/care_09.jpg"class="care_img_icon"/></th>
						<th class="care_name">현재주수</th>
						<td class="txt_area">
						 <input type="text" name="txt1" class="textarea txtArea" size="3" maxlength="2" style="ime-mode:disabled;" valid="E|A=현재 주수를 입력해 주세요"/>주
						 </td>
						 <td>
							  <table border="0" align="center" cellpadding="0" cellspacing="0">
							   <tr>
										<td width="30">0주</td>
										<td width="150" bgcolor="#d7d7d7"><!-- <img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/>점점차는이미지 --></td>
										<td width="40"><div align="right">40주</div></td>
							   </tr>
							   </table>
							</td>
						</td>
					</tr>

					<tr id="care_10">
					<th id="care_img" ><img src="/mobileweb/html/images/care_10.jpg"class="care_img_icon"/></th>
						<th class="care_name">키</th>
						<td class="txt_area">
						 <input type="text" name="txt2" class="textarea txtArea" size="3" maxlength="3" style="ime-mode:disabled;" valid="E|A=키를 입력해 주세요"/>cm
						 </td>
						 
						 <td>

						 <table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30">1m</td>
                                    <td width="150" bgcolor="#d7d7d7"><!-- <img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/> 점점차는이미지--></td>
                                    <td width="40"><div align="right">2m</div></td>
                                </tr>
                                </table>
						 </td>
					</tr>


					<tr id="care_11">
					<th id="care_img" ><img src="/mobileweb/html/images/care_11.jpg"class="care_img_icon"/></th>
						<th class="care_name">임신 전 몸무게</th>
						<td class="txt_area">
						 <input type="text" name="txt3" class="textarea txtArea" size="2" maxlength="3" style="ime-mode:disabled;" valid="E|A=임신전 몸무게를 입력해 주세요"/> kg
						 </td>
						 
						 <td>

						 <table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30">0kg</td>
                                    <td width="150" bgcolor="#d7d7d7"><!-- <img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/> 점점차는이미지--></td>
                                    <td width="40"><div align="right">200kg</div></td>
                                </tr>
                                </table>
						 </td>
					</tr>


					<tr id="care_12">
					<th id="care_img" ><img src="/mobileweb/html/images/care_12.jpg"class="care_img_icon"/></th>
						<th class="care_name">현재몸무게</th>
						<td class="txt_area">
						 <input type="text" name="txt4" class="textarea txtArea" size="2" maxlength="3" style="ime-mode:disabled;" valid="E|A=현재 몸무게를 입력해 주세요"/> kg
						 </td>
						 
						 <td>

						 <table border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="30">0kg</td>
                                    <td width="150" bgcolor="#d7d7d7"><!-- <img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/> 점점차는이미지--></td>
                                    <td width="40"><div align="right">200kg</div></td>
                                </tr>
                                </table>
						 </td>
					</tr>




				</table>
			</div>
		</div>
	</div>

	<div id="footer">
		<ul class="btn-grp">
			<li class="mr30">로그인</li>
			<li class="mr30">회원가입</li>
			<li>PC버전</li>
		</ul>

		<div class="posts-list">
			<p>서비스 이용약관 | <strong>개인정보취급방침</strong></p>
			<p>웰니스인텔리전스(주) | 사업자번호 220-88-73478</p>
		</div>
		<div class="Copyright">Copyright© 2015<span style="color:#ed587a;"> mother&baby.</span> All right reserved</div>
	</div>
</div>




</body>
<script src="css/leftmenu.js"></script>

</html>
