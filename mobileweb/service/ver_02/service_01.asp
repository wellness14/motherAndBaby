<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "30000" 
	If menuCode2 = "" Then menuCode2 = "A"

	If menuCode2 = "A" Then 
		bodyimg = ""
		tit = "<span style=""color:#ed587a;"">산후케어</span><span style=""color:#919194;"">서비스</span>"
	ElseIf menuCode2 = "B" Then 
		bodyimg = "" 
		tit = ""
	ElseIf menuCode2 = "C" Then 
		bodyimg = ""
		tit = "<span style=""color:#ed587a;"">바디케어</span><span style=""color:#919194;"">프로그램</span>"
	ElseIf menuCode2 = "D" Then 
		bodyimg = "sub24_01.jpg" 
		tit = "<span style=""color:#ed587a;"">수유관리</span><span style=""color:#919194;"">프로그램</span>"
	ElseIf menuCode2 = "E" Then 
		bodyimg = "sub25_01.jpg" 
		tit = "<span style=""color:#ed587a;"">영양관리</span><span style=""color:#919194;"">프로그램</span>"
	ElseIf menuCode2 = "F" Then 
		bodyimg = "" 
		tit = "<span style=""color:#ed587a;"">부가서비스</span><span style=""color:#919194;"">안내</span>"
	End If
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
	<script type="text/javascript" src="/mobileweb/common/js/common.js"></script>
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
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<% If bodyimg <> "" Then %>
			<img src="/mobileweb/html/images/<%=bodyimg%>" border="0" />
		<% Else %>
			<% If menuCode2="A" Then %>
				<table border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub02_subtitle01.jpg"  /></td>
					</tr>
					<tr>
						<td style="padding-bottom:50px;"><img src="/mobileweb/html/images/text_0053.jpg" />
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="50"><img src="/mobileweb/html/images/bt_0015_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0016_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0017_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0018_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0019_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0020_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="50"><img src="/mobileweb/html/images/bt_0021_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0022_off.jpg" class="main_tab" style="cursor:pointer;" height="28" border="0" /></td>
							</tr>
							
							<tr>
								<td colspan="8"><img src="/mobileweb/html/images/img_0008.jpg" /></td>
							</tr>
							</table>
							<img id="service_img" src="/mobileweb/html/images/sub_0014.jpg" />
						</td>	
					</tr>
				</table>
			<% ElseIf menuCode2="C" Then %>
				<img src="/mobileweb/html/images/sub23.jpg" border="0" /><br/>
				<a href="http://www.latherapie.co.kr/"target="_blank"><img src="/mobileweb/html/images/sub23_01.jpg" border="0" /></a>
			<% ElseIf menuCode2="F" Then %>
				<table border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub02_subtitle07.jpg" /></td>
					</tr>
					<tr>
						<td style="padding-bottom:50px;"><img src="/mobileweb/html/images/text_0054.jpg" />
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="60"><img src="/mobileweb/html/images/bt_0040_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0122_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0023_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0024_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0025_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
								<td width="60"><img src="/mobileweb/html/images/bt_0026_off.jpg" class="main_tab" style="cursor:pointer;" height="27" border="0" /></td>
							</tr>
							<tr>
								<td colspan="6"><img src="/mobileweb/html/images/img_0008.jpg" height="4" /></td>
							</tr>
							</table>
							<img id="service_img" src="/mobileweb/html/images/sub_0023.jpg"/>
						</td>	
					</tr>
				</table>
			<% End If %>
		<% End If %>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

<script type="text/javascript">
	var main_tab = jQuery('.main_tab');
	var Img = jQuery('#service_img');
	
	function fncSetImg(num){
		<% If menuCode2 = "A" Then %>
			Img.attr({"src":"/mobileweb/html/images/sub_00"+ (num+14) +".jpg"});
		<% ElseIf menuCode2="F" Then %>
			Img.attr({"src":"/mobileweb/html/images/sub_00"+ (num+22) +".jpg"});
		<% End if %> 
	}

	jQuery(document).ready(function(){
		main_tab.click(function(){
			num = main_tab.index(this);
			fncSetTab(main_tab,num)
		});

		main_tab.eq(0).click();
	});
</script>

</html>