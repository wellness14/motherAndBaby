<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=1190">
	<meta name="naver-site-verification" content="72513fa89e9304c83c420c83705ecbdb2fd413ad"/>
	<meta name="description" content="산후관리서비스, 개인맞춤형 임신/출산/건강 관리 서비스, 프리미엄산후도우미, 조리원추천, 간호사방문, 모유수유, 체형관리, 정부지원">
	<script type="text/javascript" src="/common/js/jquery/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<link type="text/css" rel="stylesheet" href="/common/css/style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<title>마더앤베이비</title>
	<style type="text/css">
	<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
		}
		#Layer1 {
			position:absolute;
			width:200px;
			height:115px;
			z-index:2;
		}
		#Layer2 {
			position:absolute;
			width:200px;
			height:115px;
			z-index:2;
		}
	-->
	</style>

	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-70342832-4', 'auto');
	  ga('send', 'pageview');

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

	<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 54848 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
	<script type="text/javascript">var _TRK_LID="54848";var _L_TD="ssl.logger.co.kr";var _TRK_CDMN=".mothernbaby.co.kr";</script>
	<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net";
	(function(b,s){var f=b.getElementsByTagName(s)[0],j=b.createElement(s);j.async=true;j.src='//fs.bizspring.net/fs4/bstrk.1.js';f.parentNode.insertBefore(j,f);})(document,'script');</script>
	<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=54848&amp;js=N" /></noscript>
	<!-- END OF LOGGER TRACKING SCRIPT -->

	<script>
		function consultResult(channel) {
			ga('send', 'event', 'consult', 'web ' + channel + ' success');
		}
	</script>

	


</head>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'-------------------------------------------------------------------------------
'	사용자 정보
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디
	usernm		= LCase(fncRequestCookie("uname"))			'회원	성명
	mem_type	= LCase(Trim(fncRequestcookie("mem_type")))	'회원	구분
'-------------------------------------------------------------------------------

'	response.Write uId
	Dim page_size : page_size = 10

	mOne = fncRequest("mOne")
	mTwo = fncRequest("mTwo")
	If mOne = "" Then mOne = 1
	If mTwo = "" Then mTwo = 1

	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo

	Select Case mOne
		Case "1" : brdColor = "#54c0cc"
		Case "2" : brdColor = "#fe7ca9"
		Case "3" : brdColor = "#fea67c"
		Case "4" : brdColor = "#a3cb36"
		Case "5" : brdColor = "#368fcb"
		Case "6" : brdColor = "#bdbdbd"
	End Select 

	PageName = Lcase(fncRequestVariables("PATH_INFO"))
	
	'HTTPS로 REDIRECT
	'https = Request.ServerVariables("HTTPS")
	'url = Request.ServerVariables("URL")
	'query_string = Request.ServerVariables("QUERY_STRING")
	'https_url = "https://www.mothernbaby.co.kr:40005" & url & "?" & query_string

	'If InStr(url, "login.asp") > 0 Then
	'	If https = "off" Then
	'		Response.Redirect https_url
	'	End If
	'End If
%>