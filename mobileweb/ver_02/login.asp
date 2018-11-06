<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
		
		function goLogin() {
			var val = jQuery("#loginid").val();
			if(val.length < 1){
				alert("아이디를 입력하세요.");
				jQuery("#loginid").focus();
				return false;
			}
		
			var val = jQuery("#loginpw").val();
			if(val.length < 1){
				alert("패스워드를 입력하세요.");
				jQuery("#loginpw").focus();
				return false;
			}

			jQuery("#LoginForm").submit();
		}
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">로그인</span> <span style="color:#919194;"></span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div>
			<img src="/mobileweb/html/images/sub61.jpg" border="0" />
		</div>
		
		<div style="background-color:#F6F6F6;" class="pb50">
			<form id="LoginForm" name="LoginForm" method="post" action="login_sql.asp" target="ifrm">
			<div class="mt20 pt20">
				<img src="/mobileweb/html/images/text_0023.jpg" />
			</div>

			<div class="mt50">
				<img src="/mobileweb/html/images/text_0008.jpg" />
				<input type="text" id="loginid" name="loginid" maxlength="20" size="21" class="textarea" style="height:40px; ime-mode:disabled;"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0009.jpg" />
				<input type="password" id="loginpw" name="loginpw" maxlength="20" size="21" class="textarea" style="height:40px; ime-mode:disabled;" onKeyDown="if(event.keyCode==13) goLogin();"/>
			</div>

			<div class="mt20">
				<a href="javascript:goLogin();"><img src="/mobileweb/html/images/bt_0005.jpg" border="0" /></a>
			</div>
			</form>
		</div>

		<div><img src="/mobileweb/html/images/text_0024.jpg" border="0" usemap="#id_pass" /></div>
		<map name="id_pass" id="id_pass">
			<area shape="rect" coords="51,18,165,46" href="member.asp" />
			<area shape="rect" coords="198,19,312,43" href="member_find_info.asp" />
		</map>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>