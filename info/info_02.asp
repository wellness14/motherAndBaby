<!--#include virtual="/common/menu/head.asp"-->

	<meta charset="euc-kr">
	<title>예약/결제 안내</title>
	<style>
	body {font: Dotum,'돋움'; margin:0px 0px 0px 0px;}
	.sido {width:770px; padding:0px 0px 30px 0px;}
	.sido_name {height:30px; width:755px; background-color:#54c0cc; font-weight:bold; font-size:14px; color:#ffffff; padding: 0px 0px 0px 15px; line-height:30px;}
	.sigu ul{width::770px; padding: 10px 0px 0px 15px; overflow:auto;}
	.sigu li {list-style: none; float: left; line-height: 30px; vertical-align: middle; text-align: left; font-weight:bold; padding:0px 30px 0px 0px; width:80px; color:#666666;}
	.sigu li.wide {width: 200px;}
	.sigu li.orange {color: #F35001;}
	.sigu li.black {color: #000000;}
	#account_bank {display:none; height:250px;}
	#account {color:#898584; font-weight:bold; padding:0px 0px 0px 15px;}
	#account .dot {color:#FFB592; padding:0px 0px 0px 10px;}
	#account .line {position:relative; background-color:#FFB592; height:1px; width:650px; left:100px; top:-11px;}
	.bank {color:#333333; font-weight:bold; font-size:17px; padding:15px 0px 30px 200px;}
	
	</style>
	<link type="text/css" rel="stylesheet" href="http://mothernbaby.co.kr/common/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript" language="javascript">
		$(document).ready(function() {
			$(".sido").each(function(i) {
				$(".sido:eq(" + i + ") li").each(function(j) {
					$(this).click(function() {
						$(".sido").each(function(k) {
							$(".sido:eq(" + k + ") li").each(function(l) {
								$(this).css("color","#000000");
							});
						});

						$(this).css("color","red");

						$(".sido").each(function(m) {
							if (i != m) {
								$(".sido:eq(" + m + ")").find("#account_bank").slideUp();
							}
						});
						//일반 계좌
						var bank_name = $(this).attr("bank_name");
						var bank_account = $(this).attr("bank_account");
						var holder_name = $(this).attr("holder_name");
						//바우처 계좌
						var b_bank_name = $(this).attr("b_bank_name");
						var b_bank_account = $(this).attr("b_bank_account");
						var b_holder_name = $(this).attr("b_holder_name");

						$(".sido:eq(" + i + ")").find("#account_bank").slideDown();
						$(".sido:eq(" + i + ")").find(".bank").find(".bank_name").html(bank_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".bank_account").html(bank_account);
						$(".sido:eq(" + i + ")").find(".bank").find(".holder_name").html(holder_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_bank_name").html(b_bank_name);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_bank_account").html(b_bank_account);
						$(".sido:eq(" + i + ")").find(".bank").find(".b_holder_name").html(b_holder_name);
					});
				}).css("cursor", "pointer");
			});
			
		});
	</script>
 </head>

<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
				<td style="padding-top:40px;"><img src="/image/sub03_subtitle02.jpg" width="770" height="44" /></td>
			</tr>
			<tr>            
				<td>
						<div id="top">
						<img src="/image/sub_0033.jpg" width="770" height="1111" />
						</div><blockquote></blockquote>
						<div class="sido">
							<div class="sido_name">서울</div>
							<div class="sigu">
								<ul>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">강남구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">강동구</li>
									<li bank_name="우리은행" bank_account="1005-403-341323" holder_name="이채정(마더앤베이비 강북지사)" b_bank_name="우리은행" b_bank_account="1005-103-341334" b_holder_name="이채정(마더앤베이비 강북, 노원, 도봉)">강북구</li>
									<li bank_name="신한은행" bank_account="110-468-139853" holder_name="한수경(마더앤베이비 강서지사)" b_bank_name="국민은행" b_bank_account="094701-04-313728" b_holder_name="한수경(마더앤베이비강서·양천지사)">강서구</li>
									<li bank_name="우리은행" bank_account="1002-855-672280" holder_name="조미경(마더앤베이비 관악지사)" b_bank_name="우리은행" b_bank_account="1005-502-794877" b_holder_name="조미경(마더앤베이비 동작·관악·금천)">관악구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">광진구</li>
									<li bank_name="KB국민은행" bank_account="535501-04-123954" holder_name="이금희(마더앤베이비 구로지사)" b_bank_name="국민은행" b_bank_account="804601-04-224922" b_holder_name="이금희 (마더앤베이비 영등포·구로)">구로구</li>
									<li bank_name="우리은행" bank_account="1002-855-672280" holder_name="조미경(마더앤베이비 금천지사)" b_bank_name="우리은행" b_bank_account="1005-502-794877" b_holder_name="조미경(마더앤베이비 동작·관악·금천)">금천구</li>
									<li bank_name="우리은행" bank_account="1005-403-341323" holder_name="이채정(마더앤베이비 노원지사)" b_bank_name="우리은행" b_bank_account="1005-103-341334" b_holder_name="이채정(마더앤베이비 강북, 노원, 도봉)">노원구</li>
									<li bank_name="우리은행" bank_account="1005-403-341323" holder_name="이채정(마더앤베이비 도봉지사)" b_bank_name="우리은행" b_bank_account="1005-103-341334" b_holder_name="이채정(마더앤베이비 강북, 노원, 도봉)">도봉구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">동대문구</li>
									<li bank_name="우리은행" bank_account="1002-855-672280" holder_name="조미경(마더앤베이비 동작지사)" b_bank_name="우리은행" b_bank_account="1005-502-794877" b_holder_name="조미경(마더앤베이비 동작·관악·금천)">동작구</li>
									<li bank_name="농협" bank_account="301-3040-3577-51" holder_name="신정임(마더앤베이비 마포지사)" b_bank_name="농협" b_bank_account="301-3040-3573-11" b_holder_name="신정임(마더앤베이비 은평·마포·서대문지사)">마포구</li>
									<li bank_name="농협" bank_account="301-3040-3577-51" holder_name="신정임(마더앤베이비 서대문지사)" b_bank_name="농협" b_bank_account="301-3040-3573-11" b_holder_name="신정임(마더앤베이비 은평·마포·서대문지사)">서대문구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">서초구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">성동구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">성북구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">송파구</li>
									<li bank_name="신한은행" bank_account="110-468-139853" holder_name="한수경(마더앤베이비 양천지사)" b_bank_name="국민은행" b_bank_account="094701-04-313728" b_holder_name="한수경(마더앤베이비강서·양천지사)">양천구</li>
									<li bank_name="KB국민은행" bank_account="535501-04-123954" holder_name="이금희(마더앤베이비 영등포지사)" b_bank_name="국민은행" b_bank_account="804601-04-224922" b_holder_name="이금희 (마더앤베이비 영등포·구로)">영등포구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">용산구</li>
									<li bank_name="농협" bank_account="301-3040-3577-51" holder_name="신정임(마더앤베이비 은평지사)" b_bank_name="농협" b_bank_account="301-3040-3573-11" b_holder_name="신정임(마더앤베이비 은평·마포·서대문지사)">은평구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">종로구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">중구</li>
									<li bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">중랑구</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">일반계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(국민은행)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span><br/><br/></div>
								</div>
								<div id="account">바우처계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">바우처은행명</span>
									<span class="b_bank_account">바우처 계좌번호</span>
									<div class="bank_holder">예금주: <span class="b_holder_name">홍길순<br/><br/></span></div>
								</div>
							</div>
						</div>					
						<div class="sido">
							<div class="sido_name">인천</div>
							<div class="sigu">
								<ul>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">서구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">계양구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">동구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">중구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">남구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">연수구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">남동구</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">부평구</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">일반계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(국민은행)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span><br/><br/></div>
								</div>
								<div id="account">바우처계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">바우처은행명</span>
									<span class="b_bank_account">바우처 계좌번호</span>
									<div class="bank_holder">예금주: <span class="b_holder_name">홍길순<br/><br/></span></div>
								</div>
							</div>
						</div>

						<div class="sido">
							<div class="sido_name">경기</div>
							<div class="sigu">
								<ul>
									<li class="black" bank_name="KB국민은행" bank_account="469901-04-215774" holder_name="김나현 (마더앤베이비 고양지사)" b_bank_name="국민은행" b_bank_account="194601-04-243316" b_holder_name="김나현(마더앤베이비고양·일산·파주·김포)">고양</li>
									<li class="black" bank_name="KB국민은행" bank_account="469901-04-215774" holder_name="김나현 (마더앤베이비 일산지사)"b_bank_name="국민은행" b_bank_account="194601-04-243316" b_holder_name="김나현(마더앤베이비고양·일산·파주·김포)">일산</li>
									<li class="black" bank_name="KB국민은행" bank_account="469901-04-215774" holder_name="김나현 (마더앤베이비 김포지사)"b_bank_name="국민은행" b_bank_account="194601-04-243316" b_holder_name="김나현(마더앤베이비고양·일산·파주·김포)">김포</li>
									<li class="black" bank_name="KB국민은행" bank_account="469901-04-215774" holder_name="김나현 (마더앤베이비 파주지사)"b_bank_name="국민은행" b_bank_account="194601-04-243316" b_holder_name="김나현(마더앤베이비고양·일산·파주·김포)">파주</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필 (마더앤베이비 의정부지점)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">의정부</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필 (마더앤베이비 양주지점)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">양주</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필 (마더앤베이비 포천지점)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">포천</li>
									<li class="black" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필 (마더앤베이비 동두천지점)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">동두천</li>
									<li class="black" bank_name="신한은행" bank_account="110-250-834034" holder_name="이인선 (마더앤베이비 수원지사)" b_bank_name="신한은행" b_bank_account="110-487-539479" b_holder_name="이인선(마더앤베이비 수원지사)">수원</li>
									<li class="black" bank_name="하나은행" bank_account="484-910330-68307" holder_name="송병임 (마더앤베이비 안양지사)" b_bank_name="하나은행" b_bank_account="484-910011-74904" b_holder_name="송병임(마더앤베이비)">안양</li>
									<li class="black" bank_name="하나은행" bank_account="484-910330-68307" holder_name="송병임 (마더앤베이비 군포지사)" b_bank_name="하나은행" b_bank_account="484-910011-74904" b_holder_name="송병임(마더앤베이비)">군포</li>
									<li class="black" bank_name="하나은행" bank_account="484-910330-68307" holder_name="송병임 (마더앤베이비 의왕지사)" b_bank_name="하나은행" b_bank_account="484-910011-74904" b_holder_name="송병임(마더앤베이비)">의왕</li>
									<li class="black" bank_name="하나은행" bank_account="484-910330-68307" holder_name="송병임 (마더앤베이비 과천지사)" b_bank_name="하나은행" b_bank_account="484-910011-74904" b_holder_name="송병임(마더앤베이비)">과천</li>
									<li class="black wide" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필 (마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">그 외 기타 경기 지역</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">일반계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(국민은행)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span><br/><br/></div>
								</div>
								<div id="account">바우처계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">바우처은행명</span>
									<span class="b_bank_account">바우처 계좌번호</span>
									<div class="bank_holder">예금주: <span class="b_holder_name">홍길순<br/><br/></span></div>
								</div>
							</div>
						</div>

<!-- 						<div class="sido"> -->
<!-- 							<div class="sido_name">대전</div> -->
<!-- 							<div class="sigu"> -->
<!-- 								<ul> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="478102-04-337215" holder_name="최정근 (마더앤베이비 유성구지사)">유성구</li> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="478102-04-337215" holder_name="최정근 (마더앤베이비 서구지사)">서구</li> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="478102-04-337215" holder_name="최정근 (마더앤베이비 대덕구지사)">대덕구</li> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="478102-04-337215" holder_name="최정근 (마더앤베이비 동구지사)">동구</li> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="478102-04-337215" holder_name="최정근 (마더앤베이비 중구지사)">중구</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div id="account_bank"> -->
<!-- 								<div id="account">계좌<span class="dot">●</span><div class="line"></div></div> -->
<!-- 								<div id="bank"> -->
<!-- 									<span class="bank_name">KB(국민은행)</span> -->
<!-- 									<span class="bank_account">378801-01-07-123123</span> -->
<!-- 									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!--                        	<div class="sido"> -->
<!-- 							<div class="sido_name">구미</div> -->
<!-- 							<div class="sigu"> -->
<!-- 								<ul> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="234901-01-056778" holder_name="강지희 (마더앤베이비 김천지사)">김천</li> -->
<!-- 									<li class="black" bank_name="KB국민은행" bank_account="234901-01-056778" holder_name="강지희 (마더앤베이비 구미지사)">구미</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 							<div id="account_bank"> -->
<!-- 								<div id="account">계좌<span class="dot">●</span><div class="line"></div></div> -->
<!-- 								<div id="bank"> -->
<!-- 									<span class="bank_name">KB(국민은행)</span> -->
<!-- 									<span class="bank_account">378801-01-07-123123</span> -->
<!-- 									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

						<div class="sido">
							<div class="sido_name">그외기타지역</div>
							<div class="sigu">
								<ul>
									<li class="wide" bank_name="KB국민은행" bank_account="378801-01-072771" holder_name="서동필(마더앤베이비)" b_bank_name="우리은행" b_bank_account="1005-103-220459" b_holder_name="정혜윤 (마더앤베이비산후도우미)">그외기타지역</li>
								</ul>
							</div>
							<div id="account_bank">
								<div id="account">일반계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="bank_name">KB(국민은행)</span>
									<span class="bank_account">378801-01-07-123123</span>
									<div class="bank_holder">예금주: <span class="holder_name">홍길동</span><br/><br/></div>
								</div>
								<div id="account">바우처계좌<span class="dot">●</span><div class="line"></div></div>
								<div class="bank">
									<span class="b_bank_name">바우처은행명</span>
									<span class="b_bank_account">바우처 계좌번호</span>
									<div class="bank_holder">예금주: <span class="b_holder_name">홍길순<br/><br/></span></div>
								</div>
							</div>
						</div>
                        
 
				</td>
			</tr>
                </td>
			</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->

</body>
</html>
