<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=1190">

	<script type="text/javascript" src="/common/js/jquery/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="/common/js/common.js"></script>
	<link type="text/css" rel="stylesheet" href="/common/css/style.css">
	<title>마더앤베이비 & 아이윙</title>
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
			/*.img2 {width:740px; height:233px; background-image:url(/image/iwing_02.jpg); background-repeat:no-repeat;}
			.input_01 {width:225px; height:38px; padding-left:5px}
			.pl_50 {padding-left:140px;}
			.pl_24 {padding-left:36px;}
			.pt_50 {padding-top:50px;padding-left:40px;}
			.pt_15 {padding-top:15px;padding-left:40px;}*/

			.iwing_02 {width:740px; height:233px; background-image:url("/image/iwing_02.jpg"); background-repeat:no-repeat; padding-left:140px;}
			.input_01 {width:225px; height:38px; padding-left:5px}
			.pl_50 {padding-left:50px;}
			.pl_35 {padding-left:35px;}
			.pl_35_2 {padding-left:35px;}
			.pt_50 {padding-top:50px;}
			.pt_15 {padding-top:15px;}
	-->
	</style>
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
%>