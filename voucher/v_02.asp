<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>voucher_info</title>


    <!-- Bootstrap Core CSS -->
    <link href="css_02/bootstrap.min2.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css_02/simple-sidebar2.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<style type="text/css">
	@media only screen and (max-width: 650px) {
	th, 
	td {
		display: block;
		width: auto;
	}
}

	@import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css');
	table, div, p {font-family:'Nanum Gothic';}
	body {
		font-family:'Nanum Gothic';
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	#container  { width:90%; border:0; margin:0 auto;  padding:10px;  }
	#container_content  {  width:90%; border:0; margin:0 auto;  padding:10px; float:left; }
	#content  { background-color:#ffffff; float:left; width:90%; height:400px;margin:0 auto; }
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


	.button_01 {
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
	.button_01:hover {
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
	.button_01:active {
		-moz-box-shadow: 0 2px 6px black;
		-webkit-box-shadow: 0 2px 6px black;
	}


	#voucher_main_name {color:#272727; font-size:20pt; font-weight:bold; }
	</Style>

</head>

<body>

    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <div id="sideinfo">
					<ul>
				 <% 'If mOne = 1 Then %>
						<li style="list-style:none;"><a href="http://mothernbaby.co.kr/voucher/new_voucher_01.asp?mOne=1"><img src="/image/voucher_menu01_off.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/></a></li>
						<li style="list-style:none;"><a href="http://mothernbaby.co.kr/voucher/new_voucher_02.asp?mOne=2"><img src="/image/voucher_menu02_on.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/></a></li>
				<% 'ElseIf mOne = 2 then%>
						<!-- <li style="list-style:none;"><a href="http://mothernbaby.co.kr/voucher/new_voucher_01.asp?mOne=1"><img src="/image/voucher_menu01_on.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/></a></li>
						<li style="list-style:none;"><a href="http://mothernbaby.co.kr/voucher/new_voucher_02.asp?mOne=2"><img src="/image/voucher_menu02_off.jpg" border="0"style="opacity:1;filter:alpha(opacity=100)" onmouseover="this.style.opacity=0.2;this.filters.alpha.opacity=20" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/></a></li> -->
				<% 'End If %>
					</ul>
			</div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
		<a href="#menu-toggle" class="btn btn-default" id="menu-toggle" style="border-radius:0px; margin-top:20px; padding: 10px 10px;background-color:#234f8f;color:#ffffff;">메뉴보기</a>
        <div id="page-content-wrapper">
		
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
						
                        <div id="container_content">


				<div id="header">
					<img src="/image/voucher_logo.png" width="123" height="34"  border="0"  align="right" /></a>
				</div>

		
			<div id="content" style="margin-left:40px;">
				
				

				<h2 id="sub_text_01">산모에게 힘이 되는정부 지원안내</h2><hr width=100%>

				 <h1 id="main_text">마더앤베이비의 산모·신생아 건강관리 서비스</h1>

				<p id="sub_text_02">전문교육을 받은 <span style="color:#2d5da9; font-weight:bold;">산모·신생아 건강관리사가 </span><br/>
				출산가정을 방문해 산모와 신생아를 돌봐드립니다.<p>

				<div id="voucher_basic_info">
			<P id= "voucher_basic_info_name" style="font-size:20px;font-weight:bold;margin-top:50px;"><a><img src="/image/voucher_09.jpg" width="50" height="50" /></a>기본정보
			<span style="font-size:12pt;">(필수 입력항목)</p>

			
			
			
			<div class="align_left">
				<!-- <div class="header">
					회원가입 <span class="close">X</span>
				</div> -->



					<input type="text" name="user_name" id="user_name" class="input_02" style="width: 210px; margin: 20px 0 10px 0;"placeholder="이름(실명)" /><hr width=100% style="margin-bottom: 15px;">
				</div>


				<div class="input2">
					<span class="input2_title" >생년월일</span>
					<select class="select1"style="background-color: #FFFFFF;width: 80px;  height: 30px;color: #C8C8C8;">
						<option value="">선택</option>
						<option value="2015">2015</option>
					</select>

				
					<select class="select2" style="background-color: #FFFFFF;width: 80px;  height: 30px;color: #C8C8C8; margin-top:10px;">
					<option value="">선택</option>
						<option value="1">1</option>
					</select>
					<select class="select2" style="background-color: #FFFFFF;width: 80px;  height: 30px;color: #C8C8C8;margin-top:10px;">
						<option value="">선택</option>
						<option value="1">1</option>
					</select><hr width=100%>
			

				<div class="input2">
					<span class="input2_title"style="margin: 20px 0 20px 0;">성별</span>
					<input type="radio" name="gender" id="gender1" /> 남자
					<input type="radio" name="gender" id="gender2" /> 여자
				</div><hr width=100%>

				<div class="input2">
					<span class="input2_title"style="margin: 20px 0 20px 0;">휴대폰</span>
					<select class="select2" style="margin-left:15px;background-color: #FFFFFF;width: 80px;  height: 30px;color: #C8C8C8; ">
						<option value="선택">선택</option>
						<option value="010">010</option>
					</select>
					<input type="text" name="hp2" id="hp2" value="" class="input_03"style="width: 90px;margin-top:10px;" />
					<input type="text" name="hp3" id="hp3" value="" class="input_03"style="width: 90px;margin-top:10px;" />
				</div><hr width=100%>


				<div class="input2">
					<span class="input2_title"style="margin: 20px 0 20px 0;">일반전화</span>
					<select class="select2"style="background-color: #FFFFFF;width: 80px;  height: 30px;color: #C8C8C8;">
						<option value="">선택</option>
						<option value="010">031</option>
					</select>
					<input type="text" name="hp2" id="hp2" value="" class="input_03" style="width: 90px;margin-top:10px;" />
					<input type="text" name="hp3" id="hp3" value="" class="input_03" style="width: 90px;margin-top:10px;"/>
				</div><hr width=100% style="margin-bottom: 15px;">





			


				<div class="input2">
					<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" readonly  valid="E|A=우편번호를 입력해 주세요"/>
							-
							<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/>
							<input type="button" style="    border: 1px solid #2c61af; background-color: #FFFFFF; color: #2c61af; height: 30px; -webkit-border-radius: 5px;-moz-border-radius: 5px; border-radius: 5px;margin-top:10px;" value="우편번호검색" id="over_chk_btn" class="over_chk_btn" onclick="check_id()">
							</div>
							<div class="input">
					
					<input type="text" style="width:210px;margin-top:10px;" name="user_name" id="user_name" class="input_02" placeholder="주소를 입력해 주세요."><br/>
					
					<input type="text"style="width:210px;margin-top:10px;" name="user_name" id="user_name" class="input_02" style="margin: 20px 0 20px 0;" placeholder="상세주소를 입력해 주세요.">
				</div>

			

				

			

				
				<div class="chk_txt"style="margin: 20px 0 20px 0;">
					<span class="chk_area"><input type="checkbox" name="agree2" id="agree2" value="Y"/> 이용약관 동의 <span class="req">(필수)</span></span> <span class="co_vw">내용보기</span>
				</div>

				<div class="chk_txt"style="margin: 20px 0 20px 0;">
					<span class="chk_area"><input type="checkbox" name="agree3" id="agree3" value="Y"/> 개인정보 수집 및 이용동의 <span class="req">(필수)</span></span> <span class="co_vw">내용보기</span>
				</div>

				

				<div class="title"style="margin: 50px 0 20px 0;">
					<P id= "voucher_basic_info_name"><a><img src="/image/voucher_10.jpg" width="50" height="50" /></a>선택 입력항목</p>
				</div>

				
					<div style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; max-width:1170px;">
						<span class="input2_title2" >조리원이용</span>
						<span><input type="radio" name="agree_ch_1" id="agree_ch_1" value="Y"/> 이용함 <input type="radio" name="agree_ch_1" id="agree_ch_1" value="N"/> 이용안함</span>
					</div>
					<div style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; max-width:1170px;">
						<span class="input2_title2" >출산경험</span>
						<span><input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 초산모 <input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 경산모</span>
					</div>
					
					<div style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; max-width:1170px;">
						<span class="input2_title2" style="margin:0 0 40px 0;">특이사항</span>
						<span><input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 초산모 
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 경산모
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 초산모
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 경산모</span>

					</div>


					<div style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; max-width:1170px;">
						<span class="input2_title2" style="margin:0 0 40px 0;">가족사항</span>
						<span><input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 부모님 
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 남편
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 큰아이1명
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 아이2명이상
						<input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 기타가족</span>

					</div>

					<div style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; width:100%;">
					
							<textarea style= "margin: 20px 0 20px 0; padding-top:10px; border-top:1px solid #C8C8C8; color:#888888; width:100%; height:200px;" valid="E|A=상담내용을 입력해 주세요"></textarea>
					
						</div>


					
					

				
					 <p><a href="http://www.nhis.or.kr/retrieveHomeMain.xx" target="_blank" class="button_01"> 상담신청 </a></p>
				
			</div>
                       
                    			</div>

                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

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