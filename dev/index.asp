<!--#include virtual="/common/asp/vardef.asp"-->
<html lang="ko">
	<head>
		<title>MegaStudy</title>
		<link rel="stylesheet" type="text/css" href="/common/css/MEGAstudy.css">
		<meta http-equiv="Content-Type" content="text/html;charset=euc-kr">
	</head>
	<body leftmargin="0" marginheight="0" marginwidth="0" topmargin="0">
		<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">
					<!--login table-->
					<table width="451" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><img src="<%=img_admin%>/admin_table_01.jpg" border="0"></td>
						</tr>
						<tr height="88">
							<td height="88" background="<%=img_admin%>/admin_table_02.jpg" valign="top">
								<div align="right">
									<table width="427" border="0" cellspacing="0" cellpadding="0">
										<form id=login_form name=login_form method=post>
											<tr>
												<td rowspan="3" width="67">&nbsp;</td>
												<td width="326">
													<div align="right">
														<font color="aqua"><b>ID : </b><input type="text" id="USERID" name="USERID" onkeydown="Entercheck();" size="11" style="border:1px solid;width:80;height=20;"> <b>PASS :</b></font><font color="#2aff1d"><b> </b><input type="password" id="USER_PWD" name="USER_PWD" onkeydown="Entercheck();" size="11" style="border:1px solid;width:80;height=20;"></font></div>
												</td>
												<td rowspan="2" width="50">&nbsp;</td>
											</tr>
											<tr height="31">
												<td width="326" height="31">
													<div align="right">
														<font color="aqua">
														&nbsp;
														<input type="radio" id="login_type" name="login_type" value="1" <%if left(uip,3)<>"220" then%>checked<%end if%>>관리자 
														<input type="radio" id="login_type" name="login_type" value="2" disabled>웹상담툴 
														<input type="radio" id="login_type" name="login_type" value="3" <%if left(uip,3)="220" then%>checked<%end if%>>컨텐츠제작</font>
													</div>
												</td>
											</tr>
											<tr>
												<td width="326">
													<div align="right">
														<img src="<%=img_admin%>/btn_login.gif" onclick="javascript:go_submit();" style="cursor:hand;" border="0"></div>
												</td>
												<td width="50"></td>
											</tr>
										</form>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td><img src="<%=img_admin%>/admin_table_03.jpg" border="0"></td>
						</tr>
					</table>
					<!--login table--></td>
			</tr>
			</TBODY>
		</table>
	</body>

<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript">
<!--
	var frm = jQuery("#login_form");

	jQuery(".confirm").click(function(){
		frm.submit();
	});

	frm.submit(function(){
		val = jQuery("#USERID").val();
		if(val.length < 1){
			alert("아이디를 입력하세요.");
			return false;
		}
	
		val = jQuery("#USER_PWD").val();
		if(val.length < 1){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}).attr({
	//	'target' : 'ifrm',
		'method' : 'post',
		'action' : 'user_check.asp'
	});

	function Entercheck(){
		if(event.keyCode == 13){
			frm.submit();
			return;
		}
	}
-->
</script>
</html>