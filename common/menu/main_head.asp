<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=1190">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="naver-site-verification" content="72513fa89e9304c83c420c83705ecbdb2fd413ad"/>
	<meta name="description" content="���İ�������, ���θ����� �ӽ�/���/�ǰ� ���� ����, �����̾����ĵ����, ��������õ, ��ȣ��湮, ��������, ü������, ��������">
	<script type="text/javascript" src="/common/js/jquery/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<link type="text/css" rel="stylesheet" href="/common/css/main_css.css">
	<title>�����غ��̺�</title>
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
		.cont-list{font-size:12px !important;}
	-->
	</style>
    <script language="javascript">


var mobile = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');

 

var beforeUrl = document.referrer; // ���� ������ �ּҸ� �޾ƿ´�.

 

for (var word in mobile) {

 //����� ������� Ȯ���ϰ� ���� ���� �ּҰ� ����Ͽ��� �Ѿ���� �ʾ��� ��� �����̷�Ʈ �Ѵ�.
 if (navigator.userAgent.match(mobile[word]) != null && beforeUrl.match('/mobileweb/ver_02') == null && beforeUrl.match('/etc_work') == null) {
  location.href=('http://mothernbaby.co.kr/mobileweb/ver_02')
  break;
 }
}

</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-70342832-4', 'auto');
  ga('send', 'pageview');

</script>

<!-- ���� ���� ��ũ��Ʈ , ��� �������� ����ǵ��� ��ġ. �� ��ȯ������ ���������� �׻� �ϴܿ� ��ġ�ؾ��� --> 
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


<!-- *���뽺ũ��Ʈ -->
	<script type="text/javascript" src="//adcheck.about.co.kr/mad/prd/view?shopid=momcho"></script>


	
</head>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
'-------------------------------------------------------------------------------
'	����� ����
	uId			= Trim(fncRequestCookie("uid"))				'ȸ��	���̵�
	usernm		= LCase(fncRequestCookie("uname"))			'ȸ��	����
	mem_type	= LCase(Trim(fncRequestcookie("mem_type")))	'ȸ��	����
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
%>