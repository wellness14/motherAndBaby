<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "40000" 
	If menuCode2 = "" Then menuCode2 = "A"

	If menuCode2 = "B" Then 
		bodyimg = "sub32_01.jpg" 
		tit = "<span style=""color:#ed587a;"">예약/결제</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "C" Then 
		bodyimg = "sub34_01.jpg" 
		tit = "<span style=""color:#ed587a;"">예약취소/환불</span><span style=""color:#919194;"">규정</span>"
	ElseIf menuCode2 = "D" Then 
		tit = "<span style=""color:#ed587a;"">정부지원사업</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "G" Then 
		tit = "<span style=""color:#ed587a; font-size:13px;"">국내유료 직업소개</span><span style=""color:#919194;font-size:13px;"">요금 등 고시</span>"
	ElseIf menuCode2 = "E" Then 
		bodyimg = "sub35_01.jpg" 
		tit = "<span style=""color:#ed587a;"">서비스용품</span><span style=""color:#919194;"">안내</span>"
	ElseIf menuCode2 = "F" Then 
		bodyimg = "sub36.jpg" 
		tit = "<span style=""color:#ed587a;"">출산선물</span><span style=""color:#919194;"">안내</span>"
	End If
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일 | 정부지원사업안내</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script src="js/jquery.rwdImageMaps.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('img[usemap]').rwdImageMaps();
		});
	</script>
	<style>
.goverment--wrap{text-align:left;padding:0.5rem;}
.goverment--wrap h2{font-size:1.8rem;color:#FF9667;margin-top:1rem;letter-spacing:-1.5px;}
.goverment--wrap h2 span{font-size:1.1rem;display:block;color:#FDB998;letter-spacing:0px;}
.goverment--wrap h3{font-size:1.4rem;color:#FDB998;letter-spacing:-1px;margin-top:3rem;}
.goverment--wrap .goGovDetail{display:block;padding:1rem;margin:3rem auto 0;text-align:center;background-color:#FDB998;color:#FFF;}
.goverment--wrap .goGovDetail span{color:#000;}
.goverment--wrap dl>dt {float: left;font-size:1rem;}
.goverment--wrap p {font-size:1rem;}
.goverment--wrap dl>dd {padding-left: 40px;color:#999;font-size:1rem;margin-bottom:1rem;}
.goverment--wrap ul>li {list-style:none;color:#999;font-size:1rem;margin-bottom:0.5rem;}
.goverment--wrap ul>li>img {width:30px;}
.gosi{font-size:13px;padding-top:20px;text-align:left;}
</style>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<% If menuCode2 = "G" Then %>
<p class="gosi">
[부록 1] <br/><br/>
고용노동부 고시 제2014-77호 ｢직업안정법｣ 제19조제3항에따른국내유료직업소개요금을 다음과 같이 개정․고시합니다. <br/>
    2015년 1월 1일 고용노동부장관<br/><br/>
국내유료직업소개요금 등 고시<br/><br/>
Ⅰ. 국내유료직업소개요금 등<br/><br/>
1. 직업소개사업자는 구인자와 구직자 간에 근로계약이 체결된 이후에 소개요금을 구인자 또는 구직자로부터 받을 수 있다.<br/><br/>
2. 제1호에 따른 소개요금은 다음 각 목의 기준에 따라서 징수한다. 다만, 구직자에게서 받는 소개요금은 반드시 사전에 구직자와 체결한 서면계약에 근거하여야 한다. 이 경우 소개사업자가 징수할 수 있는 소개요금의 총액은 구인자에게서 받는 요금과 구직자에게서 받는 요금을 합하여 가목의 소개요금 한도를 초과할 수 없다.<br/>
 가. 구인자에 대한 소개요금  <br/><br/>
 1) 고용기간이 3개월 미만인 경우: 고용기간 중 지급하기로 한 임금의 100분의 20 이하(건설일용의 경우에는 100분의 10 이하)<br/>
 2) 고용기간이 3개월 이상인 경우: 3개월간 지급하기로 한 임금의 100분의 20 이하(건설일용의 경우에는 100분의 10 이하)  <br/>
 3)구직자가 간병, 파출부, 건설일용 근로자인 경우에는 위 소개요금의 한도에서 직업소개기관과 구직자간에 별지 서식의 건설일용 및 간병ㆍ파출 소개요금 대리수령 동의서에 의한 서면으로 합의한 소개요금을 구직자가 사업주로부터 대리 수령하여 직업소개기관에 전달할 수 있다.<br/>
 
 나. 구직자에 대한 소개요금  <br/><br/>
 1)고용기간이 3개월 미만인 경우: 고용기간 중 지급하기로 한 임금의 100분의 4 이하  <br/>
 2)고용기간이 3개월 이상인 경우: 3개월간 지급하기로 한 임금의 100분의 4 이하 <br/>
 3) 파출부, 간병인 등 일용근로자를 회원제로 소개․운영하는 경우에는 소개요금에 갈음하여 구인자 및 구직자로부터 각각 월 3만5천원의 범위에서 회비를 징수할 수 있다. 이 경우 회원으로 가입한 일용 근로자에게는 월회비 외에 추가 소개요금을 징수할 수 없다. <br/>
 4)소개요금의 산출근거가 되는 임금은｢근로기준법｣ 제2조제1항 제5호에 따른 임금으로 한다. 다만, 임금을 따로 정하지 않고 봉사료를 주된 수입으로 하는 직종에 소개하는 경우에는 구인자가 제출하는 수입보증서의 금액에 의하여 임금을 산출하며, 구인자가 침식을 제공하는 경우에는 월 5만원의 범위에서 해당 침식비를 임금에 가산할 수 있다.<br/>
Ⅱ. 행정사항<br/><br/>
1. 시행일   이 고시는 발령한 날부터 시행한다.<br/><br/>
2. 재검토기한   이 고시는｢훈령ㆍ예규 등의 발령 및 관리에 관한 규정｣ (대통령 훈령 제248호)에 따라 발령 후 법령이나 현실여건의 변화 등을 검토하여 2017년 12월 31일까지 폐지 또는 개정한다.<br/>
</p>
		<% ElseIf menuCode2 = "D" Then %>
<div class="goverment--wrap">
	<h2>
		<span>마더앤베이비!</span>
		정부지원사업에 대해 안내해 드립니다.
	</h2>
	
	<h3>&lt; 신청서 접수 &gt;</h3>
	<dl>
		<dt>신청장소 : </dt>
		<dd>산모 주소지 관할 시 &middot; 군 &middot; 구 보건소</dd>
		<dt>제출서류 : </dt>
		<dd>신청서 등은 시 &middot; 군 &middot; 구 보건소에 비치되어 있으며, 신분증과 소득증명자료 필요</dd>
	</dl>
	<ul>
<!-- 		<li> -->
<!-- 			<img src="/mobileweb/html/images/Document-96.png" alt=""> -->
<!-- 		</li> -->
		<li>
			① 출산(예정)일 증빙서류 : 의사진단서, 의사소견서(출산 전), 출생증명서(출산 후), 산모수첩
		</li>
		<li>
			② 근로자 : 전월 건강보혐료 납부확인서 또는 근로소득 원천징수부나 월급명세서 가구원이 휴직한 경우 휴직증명서 (단, 신청일 기준 6개월이상 경과한 휴직)
		</li>
		<li>
			③ 자영업자 : 전월 건강보험료 영수증 또는 고지서 사본
		</li>
	</ul>

	<h3>&lt; 서비스 해당 지역 &gt;</h3>
	<dl>
		<dt>서비스 해당지역 : </dt>
		<dd>서울 및 경기</dd>
	</dl>

	<h3>&lt; 이용기간 및 시간 &gt;</h3>
	<dl>
		<dt>이용기간 : </dt>
		<dd>서비스 개시일 기준 표준 2주(10일)</dd>
		<dt>이용시간 : </dt>
		<dd>월~금요일 (09:00~18:00, 휴게시간 1시간 포함)</dd>
	</dl>
	<p>* 서비스 제공계획 수립시 산모의 요청에 의해 서비스 시간 및 요일조정 가능</p>

	<h3>&lt; 서비스 내용 &gt;</h3>
	<dl>
		<dt>산모관리 : </dt>
		<dd>산모의 영양관리(산모식사) / 유방관리 / 산후체조 / 좌욕 / 정신적 안정 및 정서적 지지</dd>
		<dt>신생아괸리 : </dt>
		<dd>돌보기 보조 / 건강관리 및 기본 예방접종 안내 / 감염 예방 &middot; 관리</dd>
		<dt>가사지원 : </dt>
		<dd>정리정돈 및 청소 / 산모 &middot; 신생아관련 세탁물 관리 / 큰아기, 직계존속 가족 돌보기</dd>
	</dl>
	<ul>
		<li>- 본 서비스 내용보다 더 많은 서비스를 원할 경우에는 개인 부담으로 이용 가능합니다.</li>
		<li>- 산후관리사의 일시적인 질병이나 귀책사유 등의 경우에는 교체요청을 할 수 있으나 충원에 시간이 소요될 수 있습니다.</li>
		<li>- 서비스 도중 제공기관 변경은 불가능하며 변경요청은 최소 서비스 개시 7일전에 요청하여야 합니다.</li>
		<li>- 산후관리사의 고의적인 과실에 의한 손실에 대해서는 배상책임보험에 의하여 손실을 보상합니다.</li>
	</ul>
	<a href="http://www.mothernbaby.co.kr/mobileweb/ver_02/voucher.html" class="goGovDetail">정부지원사업 관련 <span>자세히보기</span></a>
</div>
	<% ElseIf menuCode2 = "F" Then %>
		<img src="/mobileweb/html/images/<%=bodyimg%>" border="0"  usemap="#gift_link"/>

		<map name="gift_link" id="gift_link">
		  <area shape="rect" coords="71,1689,545,1740" href="http://momnshop.com/shop/goods/goods_list.php?&category=005002" target="new"/>
		  <area shape="rect" coords="3,2935,622,3056" href="http://momnshop.com/shop/goods/goods_list.php?&category=005003" target="new"/>
		  <area shape="rect" coords="3,4234,622,4334" href="http://momnshop.com/shop/goods/goods_list.php?&category=005004" target="new"/>
		  <area shape="rect" coords="3,5270,622,5523" href="http://momnshop.com/shop/goods/goods_list.php?&category=005005" target="new"/>
		</map>
	<% Else %>
		<img src="/mobileweb/html/images/<%=bodyimg%>" border="0"/>
	<% End If %>
</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>
