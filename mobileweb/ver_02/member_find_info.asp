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
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">ID/비밀번호</span> <span style="color:#919194;">찾기</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<!-- <div>
			<img src="/mobileweb/html/images/sub66.jpg" border="0" />
		</div> -->

		<div class="mt20">
			<img src="/mobileweb/html/images/text_0025.jpg"/>
		</div>
		
		<div style="background-color:#F6F6F6;" class="pb50">
			<form id="oFrm" name="oFrm" method="post">
			<div class="mt20 pt20">
				<input type="radio" name="option" class="option" value="id" checked/>
				<img src="/mobileweb/html/images/text_0026.jpg" height="21px"/>
				<input type="radio" name="option" class="option" value="pw" />
				<img src="/mobileweb/html/images/text_0027.jpg" height="21px"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0011.jpg" />
				<input type="text" name="mem_nm" class="textarea" size="21" valid="E|A=성명을 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0015.jpg" />
				<select name="hp_1" class="textarea" style="height:35px" valid="E|A=핸드폰번호를 선택해 주세요">
					<option value="">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				</label>
				-
				<input type="text" name="hp_2" class="textarea" size="4" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
				-
				<input type="text" name="hp_3" class="textarea" size="4" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
			</div>

			<div class="mt20" id="idArea">
				<img src="/mobileweb/html/images/text_0008.jpg" />
				<input type="text" id="mem_id" name="mem_id" disabled class="textarea" size="21"/>
			</div>
			</form>
		</div>

		<div class="mt20">
			<img src="/mobileweb/html/images/bt_0003.jpg"  border="0" id="btnSubmit" style="cursor:pointer;"/>
		</div>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var option = jQuery(".option");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }

		val = jQuery(":input:radio[name=option]:checked").val();
		mem_id = jQuery("#mem_id").val();
		if (val == "pw" && mem_id == ""){
			alert('아이디를 입력해 주세요');
			return false;
		}
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_find_info_ax.asp"
	});

	jQuery(document).ready(function(){
		option.click(function(){
			num = option.index(this);
			if (num == 1){ jQuery("#mem_id").attr("disabled", false); }
			else{ jQuery("#mem_id").attr("disabled", true); }
		});
	});
</script>

</html>