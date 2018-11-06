
<html>
<head>
<title>산후조리체험앱관리페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/application/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.userData {behavior:url(#default#userdata);}
</style>
<script language="javascript">

function chkVal_login() {
	var mem_id 	= Form_login.id.value;
	var mem_pwd	= Form_login.password.value;
	
	if(mem_id == "") {
		alert("아이디를 입력해주세요");
		Form_login.id.focus();
		return;
	}
	
	if(mem_pwd == "") {
		alert("비밀번호를 입력해주세요");
		Form_login.password.focus();
		return;
	}
	Form_login.action = "login_process.asp";
	Form_login.submit();
}

function chkKey_member(){ //- 엔터시
	if(window.event.keyCode == 13)
		chkVal_login();
} 
function resetForm(){ //- 엔터시
	document.Form_login.id.value = "";
	document.Form_login.password.value = "";

}
</script>

</head>
<body scroll="no">
<form name="Form_login" method="post" action="login_process.asp">
<input type="hidden" name="process" value="login">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="1">       
		<tr>
			<td align="center">
				<table border="0" cellspacing="1" cellpadding="0">
					<tr>
						<td><img src="/application/img/common/admin_intro.jpg" width="468"></td>
					</tr>
					<tr>
						<td height="120">
							<table width="469" height="108" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td align="right" background="/application/img/common/sign_in.gif">
										<table border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td align="right">&nbsp;
												</td>
												<td width="15" align="right">&nbsp;</td>
											</tr>
											<tr>
												<td align="right">
													<!--login 시작 -->
													<table width="100" border="0" cellspacing="1" cellpadding="3">
														<tr>
															<td><img src="/application/img/common/id.gif" width="24" height="14"></td>
															<td><input name="id" type="text" value="" size="15" style="ime-mode:inactive"></td>
															<td>&nbsp;</td>
															<td><img src="/application/img/common/pw.gif" width="24" height="14"></td>
															<td><input name="password" value="" type="password" size="15" style="ime-mode:inactive;" onkeydown="chkKey_member();"></td>
														</tr>
													</table>
													<!-- login 끝 -->
												</td>
												<td align="right">&nbsp;</td>
											</tr>
											<tr>
												<td align="right">
													<!-- Button 시작 -->
													<table width="100" border="0" cellspacing="1" cellpadding="0">
														<tr>
															<td><a href="javascript:chkVal_login();"><img src="/application/img/common/login.gif" width="56" height="25" style="border:0px;"></a></td>
															<td><a href="javascript:;" onclick="javascript:resetForm();"><img src="/application/img/common/cancel.gif" width="56" height="25"  style="border:0px;"></a></td>
															<!--td><a href="javascript:;" onclick="openWin('/admin/member/register.asp','menuinfor','600','500');"><img src="/img/common/register.gif"  style="border:0px;"></a></td-->
														</tr>
													</table>
													<!-- Button 끝 -->
												</td>
												<td align="right">&nbsp;</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</body>
</html>