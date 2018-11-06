<div id="footer">
	<ul class="btn-grp">
		<% If uid = "" Then %>
			<li class="mr10"><a href="login.asp">로그인</a></li>
			<li class="mr10"><a href="member.asp">회원가입</a></li>
		<% Else %>
			<li class="mr10"><a href="logout.asp">로그아웃</a></li>
			<li class="mr10"><a href="member_change.asp">마이페이지</a></li>
		<% End If %>
		<li><a href="http://www.mothernbaby.co.kr" target="_blank">PC버전</a></li>
	</ul>

	<div class="posts-list" style="padding:0 10px;font-size:1rem;">

<!-- 		<p>웰니스인텔리전스(주) | 사업자번호 220-88-73478</p> -->
<!-- 		<p>대표 : 서동필 | 개인정보보호책임자 : 이대이 </p> -->
<!--  -->
<!-- 		<address style="margin-bottom: 10px;">서울시 강남구 선릉로 120길 5 동곡빌딩 3층</address> -->
<!-- 		<p> -->
<!-- 			<a href="tel:02-557-3579">TEL : 02-557-3579(산모친구)</a> -->
<!-- 			 | FAX : 02-557-3576 -->
<!-- 		</p> -->
<!-- 		<p>통신판매업번호 : 제2014-서울강남-01187호</p> -->
<!-- 		<p>국내유료직업소개사업 등록번호 : 제2015-3220163-14-5-00023호</p> -->
<!-- 		<p>직업정보제공사업 신고번호 : 제J1200320140019호</p> -->
<!-- 		<p>특허출원번호 : 10-2014-0051817</p> -->
<!-- 		<p>의료기판매업신고번호 : 제 6169호</p> -->
<!-- 		<p>서비스 이용약관 | <strong>개인정보취급방침</strong></p> -->
		<p style="text-align:left;">
			웰니스인텔리전스(주) 
			<strong style="margin-left:5px;">대표</strong> : 서동필 
			<strong style="margin-left:5px;">개인정보보호책임자</strong> : 이대이
			<strong style="margin-left:5px;">사업자번호</strong> : 220-88-73478
			<strong style="margin-left:5px;">통신판매업번호</strong> : 제2014-서울강남-01187호
			<strong style="margin-left:5px;">국내유료직업소개사업 등록번호</strong> : 제2015-3220163-14-5-00023호
			<strong style="margin-left:5px;">직업정보제공사업 신고번호</strong> : 제J1200320140019호
			<strong style="margin-left:5px;">특허출원번호</strong> : 10-2014-0051817
			<strong style="margin-left:5px;">의료기판매업신고번호</strong> : 제 6169호
		</p>
		<address style="margin-bottom: 5px;">서울시 강남구 선릉로 120길 5 동곡빌딩 3층</address>
		<p>
			<a href="tel:02-557-3579">TEL : 02-557-3579(산모친구)</a>
			 | FAX : 02-557-3576
		</p>
	</div>
	<div class="Copyright">Copyright© 2015<span style="color:#ed587a;"> mother&baby.</span> All right reserved</div>
</div>

<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70342832-1', 'auto');
  ga('send', 'pageview');

</script>

<script>
	function mainCall() {
		ga('send', 'event', 'tel', 'main');

		window.location.href = '/mobileweb/ver_02/map_info_v02.asp';
	}

	function callClick(tel) {
		ga('send', 'event', 'tel', tel);

		window.location.href = 'tel:' + tel;
	}

	function consultResult() {
		ga('send', 'event', 'consult', 'mobile success');
	}
</script>

<!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 --> 
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_93ab7478c71";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>

<script src="js/leftmenu.js"></script>