<title>마더앤베이비</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" /> -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1" />
<% If Left(menuCode1,1) = "1" And menuCode2 = "A" Then %><link type="text/css" rel="stylesheet" href="/mobileweb/common/css/mmain_1.css"/><% End If %>
<% If Left(menuCode1,1) = "1" And menuCode2 = "B" Then %><link type="text/css" rel="stylesheet" href="/mobileweb/common/css/sub2.css"><% End If %>
<% If Left(menuCode1,1) = "2" Or  Left(menuCode1,1) = "3" Or Left(menuCode1,1) = "4" Or Left(menuCode1,1) = "5" Then %><link type="text/css" rel="stylesheet" href="/mobileweb/common/css/sub.css"><% End If %>
<link type="text/css" rel="stylesheet" href="/mobileweb/common/css/font.css"/>
<script type="text/javascript" src="/mobileweb/common/js/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="/mobileweb/common/js/common.js"></script>
<script type="text/javascript" src="/mobileweb/common/js/jquery/jquery.fixedMenu.js"></script>
<script type="text/javascript" src="/mobileweb/common/js/jquery/jquery.toolbar.js"></script>
<% If Left(menuCode1,1) = "1" And menuCode2 = "A" Then %><script type="text/javascript" src="/mobileweb/common/js/superslide.2.1.js"></script><script type="text/javascript" src="/mobileweb/common/js/jquery.bxslider.min.js"></script><% End If %>

<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<%
'-------------------------------------------------------------------------------
'	사용자 정보
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디
	usernm		= LCase(fncRequestCookie("uname"))			'회원	성명
	mem_type	= LCase(Trim(fncRequestcookie("mem_type")))	'회원	구분
'-------------------------------------------------------------------------------

'	response.Write uId
	Dim page_size : page_size = 10

	PageName = Lcase(fncRequestVariables("PATH_INFO"))
%>
