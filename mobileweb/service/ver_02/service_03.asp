<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "30000" 
	If menuCode2 = "" Then menuCode2 = "B"
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
			$("#serviceArea").hide();
			$("#finalArea").hide();
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">내게 맞는</span><span style="color:#919194;">프로그램</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div class="mt20"></div>

		<form id="oFrm" name="oFrm" method="post">
		<input type="hidden" id="mode" name="mode" value="">
		<input type="hidden" id="totlachange" name="totlachange" value="">
		<input type="hidden" id="mo_idx" name="mo_idx" value="">
		<table border="0" align="left" cellpadding="0" cellspacing="0">
			<!-- <tr>
				<td style="padding-top:2px;"></td>
			</tr>
			<tr>
				<td><img src="/mobileweb/html/images/text_0056.jpg" /></td>	
			</tr> -->
			<tr>
				<td bgcolor="#ffffff" align="left" style="padding-top:20px; padding-bottom:20px;">
					<table  border="0" align="center" cellpadding="0" cellspacing="10">
						<tr>
							<td height="42"><img src="/mobileweb/html/images/text_0057.png" height="31"/></td>
							<td colspan="2" style="padding-left:5px;">
								<select name="Ybirth" class="textarea" style="width:80px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
									<option value="">년</option>
									<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
										<option value="<%=num%>"><%=num%></option>
									<% Next %>
								</select>
								<select name="Mbirth" class="textarea" style="width:60px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
									<option value="">월</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>"><%=num%>월</option>
								<% Next %>
								</select>
								<select name="Dbirth" class="textarea" style="width:60px; height:31px;" valid="E|A=생년월일을 선택해 주세요">
									<option value="">일</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>"><%=num%>일</option>
								<% Next %>
								</select>
							</td>
						</tr>
						<tr>
							<td height="42"><img src="/mobileweb/html/images/text_0069.png" height="31" /></td>
							<td colspan="2" style="padding-left:5px;">
								<select name="childbirth_y" class="textarea" style="width:80px; height:31px;" valid="E|A=출산예정일을 선택해 주세요">
									<option value="">년</option>
									<% For num=Year(Date()) To Year(DateAdd("yyyy",4,Date())) %>
										<option value="<%=num%>"><%=num%></option>
									<% Next %>
								</select>
								<select name="childbirth_m" class="textarea" style="width:60px; height:31px;" valid="E|A=출산예정일을 입력해 주세요">
									<option value="">월</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>"><%=num%>월</option>
								<% Next %>
								</select>
								<select name="childbirth_d" class="textarea" style="width:60px; height:31px;" valid="E|A=출산예정일을 입력해 주세요">
									<option value="">일</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>"><%=num%>일</option>
								<% Next %>
								</select>
							</td>
						</tr>
						<tr>
							<td height="42"><img src="/mobileweb/html/images/text_0068.png" height="31" /></td>
							<td colspan="2" style="padding-left:5px;">
								<select name="marry_y" class="textarea" style="width:80px; height:31px;" valid="E|A=결혼기념일을 선택해 주세요">
									 <option value="">년</option>
									<% For num=Year(Date()) To Year(DateAdd("yyyy",-30,Date())) Step -1 %>
										<option value="<%=num%>"><%=num%></option>
									<% Next %>
								</select>
								<select name="marry_m" class="textarea" style="width:60px; height:31px;" valid="E|A=결혼기념일을 입력해 주세요">
									<option value="">월</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>"><%=num%>월</option>
								<% Next %>
								</select>
								<select name="marry_d" class="textarea" style="width:60px; height:31px;" valid="E|A=결혼기념일을 입력해 주세요">
									<option value="">일</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>"><%=num%>일</option>
								<% Next %>
								</select>
							</td>
                        </tr>	  	  
						<tr>
							<td height="42"><img src="/mobileweb/html/images/text_0058.png" height="31"/></td>
							<td colspan="2" style="padding-left:5px;">
								<input type="radio" name="radio1" value="초산" valid="E|A=출산경험을 선택해 주세요"/>초산모&nbsp;&nbsp;
								<input type="radio" name="radio1" value="경산" />경산모 
							</td>
						</tr>
						<tr>
							<td height="42"><img src="/mobileweb/html/images/text_0059.png" height="31" /></td>
							<td colspan="2" style="padding-left:5px;">
								<input type="radio" name="radio2" value="없음" valid="E|A=첫아이유무를 선택해 주세요"/> 없음&nbsp;&nbsp;
								<input type="radio" name="radio2" value="1명" /> 1명&nbsp;&nbsp;
								<input type="radio" name="radio2" value="2명" /> 2명&nbsp;&nbsp;
								<input type="radio" name="radio2" value="3명 이상" /> 3명 이상
							</td>
						</tr>
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0060.png" height="31" /></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="radio" name="radio3" value="이용함" valid="E|A=조리원 이용여부를 선택해 주세요"/> 이용함&nbsp;&nbsp;
                                <input type="radio" name="radio3" value="이용안함" /> 이용안함
                            </td>
                        </tr>	
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0070.png" height="31" /></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="radio" name="radio4" value="자연분만" valid="E|A=분만형태를 선택해 주세요"/> 자연분만&nbsp;&nbsp;
                                <input type="radio" name="radio4" value="제왕절개" /> 제왕절개 
                            </td>
                        </tr>		  	
                        <tr>
                            <td height="60"><img src="/mobileweb/html/images/text_0061.png" height="31"/></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="radio" name="radio5" value="육아맘" valid="E|A=직장유무를 선택해 주세요"/> 육아맘&nbsp;&nbsp;
                                <input type="radio" name="radio5" value="워킹맘" /> 워킹맘 
                            </td>
                        </tr>	
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0062.png" height="31" /></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="text" name="txt1" class="textarea txtArea" size="5" maxlength="2" style="ime-mode:disabled; width:220px;" valid="E|A=현재 주수를 입력해 주세요"/> 주
                            </td>
                        </tr>
                        <tr>
							<td></td>
							<td height="42" style="padding-left:5px;">
                                <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="30">0주</td>
										<td width="150" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="25" class="txtImg"/></td>
										<td width="40"><div align="right">40주</div></td>
									</tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0063.png" height="31"/></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="text" name="txt2" class="textarea txtArea" size="5" maxlength="3" style="ime-mode:disabled; width:220px;" valid="E|A=키를 입력해 주세요"/> cm
                            </td>
                        </tr>
                        <tr>
							<td></td>
                            <td height="42" style="padding-left:5px;">
                                <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="30">1m</td>
										<td width="150" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="25" class="txtImg"/></td>
										<td width="40"><div align="right">2m</div></td>
									</tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0064.png" height="31"/></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="text" name="txt3" class="textarea txtArea" size="5" maxlength="3" style="ime-mode:disabled; width:220px;" valid="E|A=임신전 몸무게를 입력해 주세요"/> kg
                            </td>
                        </tr>
                        <tr>
							<td></td>
							<td height="42" style="padding-left:5px;">
                                <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="30">0kg</td>
										<td width="150" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="25" class="txtImg"/></td>
										<td width="40"><div align="right">&nbsp;200kg</div></td>
									</tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="42"><img src="/mobileweb/html/images/text_0065.png" height="31"/></td>
                            <td colspan="2" style="padding-left:5px;">
                                <input type="text" name="txt4" class="textarea txtArea" size="5" maxlength="3" style="ime-mode:disabled; width:220px;" valid="E|A=현재 몸무게를 입력해 주세요"/> kg
                            </td>
                           
		                </tr>
						<tr>
							<td></td>
							<td height="42" style="padding-left:5px;">
                                <table width="220" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td width="30">0kg</td>
										<td width="150" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="25" class="txtImg"/></td>
										<td width="40"><div align="right">&nbsp;200kg</div></td>
									</tr>
                                </table>
                            </td>
                        </tr>
					</table>
				</td>	
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:30px;"><div align="center"><img src="/mobileweb/html/images/bt_0003.jpg" border="0" id="btnCheck" style="cursor:pointer;"/></div></td>	
			</tr>
			<tr>
				<td>
					<table id="serviceArea"  border="0" align="center" cellpadding="0" cellspacing="0">
						<!-- <tr>
							<td colspan="2" height='60'><img src='/mobileweb/html/images/img_0010.jpg'  /></td>
						</tr> -->
						<tr id="serviceInfo"></tr>
						<!-- <tr>
							<td colspan="2" height='70'><img src='/mobileweb/html/images/text_0073.jpg' /></td>
						</tr> -->
						<tr>
							<td colspan="2" height="70">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2" bgcolor='#f6f6f6' style='padding-top:15px; padding-bottom:15px;'>
								<table border='0' align='center' cellpadding='0' cellspacing='0'>
									<tr>
										<td width='70' height='50'><img src='/mobileweb/html/images/text_0074.jpg' height="19"/></td>
										<td width='110'>
											<select name='sel1' class='textarea11' style='height:35px;'>
												<option value="">선택</option>
											<% For num=1 To 20%>
												<option value="<%=num%>"><%=num%>회</option>
											<% Next %>
											</select>
										</td>
										<td width='70'><img src='/mobileweb/html/images/text_0079.jpg' height="19"/></td>
										<td width='110'><span style='font-weight:bold; color:#000000'>상담신청</span></td>
									</tr>
									<tr>
										<td height='50'><img src='/mobileweb/html/images/text_0075.jpg' height="19"/></td>
										<td>
											<select name='sel2' class='textarea11' style='height:35px; width:77px;'>
												<option value="N">선택안함</option>
												<option value="Y">선택</option>
											</select>
										</td>
										<td><img src='/mobileweb/html/images/text_0080.jpg' height="19"/></td>
										<td>
											<select name='sel3' class='textarea11' style='height:35px;width:77px;'>
												<option value="N">선택안함</option>
												<option value="Y">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<td height='50'><img src='/mobileweb/html/images/text_0076.jpg' height="19"/></td>
										<td>
											<select name='sel4' class='textarea11' style='height:35px; width:77px;'>
												<option value="N">선택안함</option>
												<option value="Y">선택</option>
											</select>
										</td>
										<td><img src='/mobileweb/html/images/text_0081.jpg' height="19"/></td>
										<td>
											<select name='sel5' class='textarea11' style='height:35px;width:77px;'>
												<option value="N">선택안함</option>
												<option value="Y">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<td height='50'><img src='/mobileweb/html/images/text_0077.jpg' height="19"/></td>
										<td><span style='font-weight:bold; color:#000000'>상담신청</span></td>
										<td><img src='/mobileweb/html/images/text_0082.jpg' height="19"/></td>
										<td><span style='font-weight:bold; color:#000000'>상담신청</span></td>
									</tr>
									<tr>
										<td height='50'><img src='/mobileweb/html/images/text_0078.jpg' height="19"/></td>
										<td>
											<select name='sel6' class='textarea11' style='height:35px; width:77px;'>
												<option value="N">선택안함</option>
												<option value="Y">선택</option>
											</select>
										</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" style='padding-top:30px; padding-bottom:30px;'><div align='center'><img src='/mobileweb/html/images/bt_0003.jpg' border='0' id="btnFinal" style="cursor:pointer;"/></div></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table id="finalArea"  border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="2" height="60" style="max-width:410px;"><img src="/mobileweb/html/images/img_0010.jpg"  height="7" /></td>
						</tr>
						<tr id="serviceFinal"></tr>
						<!-- <tr>
							<td colspan="2" style="padding-top:15px; padding-bottom:15px;"><div align="center"><img src="/mobileweb/html/images/text_0083.jpg" /></div></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top:30px; padding-bottom:80px;"><div align="center"><img src="/mobileweb/html/images/bt_0030.jpg" border="0" id="btnSubmit" style="cursor:pointer;"/></div></td>
						</tr> -->
					</table>
				</td>
			</tr>
		</table>
		</form>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnFinal = jQuery("#btnFinal");
	var btnCheck = jQuery("#btnCheck");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if ("<%=uid%>" == ""){
			alert("로그인 후 사용가능합니다.");
			return false;
		}
		if (!checkForm(frm,tar)){ return false }
		jQuery("#totlachange").val(jQuery("#total").val());
		jQuery("#mo_idx").val(jQuery("#service").val());
		jQuery("#mode").val("ins");
		frm.submit();
	});

	btnFinal.click(function(){
		if (!checkForm(frm,tar)){ return false }
		jQuery("#mode").val("type2");
		frm.submit();
	});

	btnCheck.click(function(){
		if (!checkForm(frm,tar)){ return false }
		jQuery("#mode").val("type1");
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "service_03_ax.asp?<%=strLnkUrl%>"
	});

	function fncSetServiceInfo(html){
		tar = jQuery("#serviceInfo");
		if (html != ""){
			jQuery("#serviceArea").show();
			tar.html(html);
		}
	}

	function fncSetServiceFinal(html){
		tar = jQuery("#serviceFinal");
		if (html != ""){
			jQuery("#finalArea").show();
			tar.html(html);
		}
	}

	var txtArea = jQuery(".txtArea");
	var txtImg = jQuery(".txtImg");

	txtArea.keyup(function(){
		num = txtArea.index(this);
		val = txtArea.eq(num).val();
		if (num ==0){
			if (val > 40){ val = 40; }
			val = val * 3.75;
		}else{
			if (val > 200){ val = 200; }
			val = val * 0.75;
		}
		txtImg.eq(num).css({"width":val});
	});
</script>

</html>