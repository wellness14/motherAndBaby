<!--#include virtual="/common/menu/head.asp"-->
<%
	reUrl = fncRequest("reUrl")

	https = Request.ServerVariables("HTTPS")
	url = Request.ServerVariables("URL")
	query_string = Request.ServerVariables("QUERY_STRING")
	https_url = "https://www.mothernbaby.co.kr:40005" & url & "?" & query_string

	If InStr(url, "login_test.asp") > 0 Then
		If https = "off" Then
			Response.Redirect https_url
		End If
	End If

	
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle01.jpg" width="770" height="41" /></td>
			</tr>
			<tr>
				<td style="padding-top:70px; padding-bottom:20px;"><table width="498" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f6f6f6">
					<tr>
						<td height="70" colspan="2" valign="top">
							<label><img src="/image/text_0023.jpg" width="230" height="50" /></label>
						</td>
					</tr>
					<form id="LoginForm" name="LoginForm" method="post">
						<input type="hidden" name="reUrl" id="reUrl" value="<%=reUrl%>" />
					<tr>
						<td width="74px" height="45" style="padding-left:60px;"><img src="/image/text_0008.jpg" width="74" height="20" /></td>
						<td width="354"><label>
							<input type="text" id="loginid" name="loginid" maxlength="20" class="textarea" size="29" style="ime-mode:disabled;"/>
						</label></td>
					</tr>
					<tr>
						<td height="45" style="padding-left:60px;"><img src="/image/text_0009.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="loginpw" name="loginpw" maxlength="20" class="textarea" size="30" style="ime-mode:disabled;" onKeyDown="if(event.keyCode==13) goLogin();"/>
						</label></td>
					</tr>
					</form>
					<tr>
						<td height="70" colspan="2"><div align="center"><a href="javascript:goLogin();"><img src="/image/bt_0005.jpg" width="150" height="40" border="0" /></a></div></td>
					</tr>	  
					</table>
					<div align="center"><br /><img src="/image/text_0024.jpg" border="0" usemap="#id_pass" /></div>
				</td>	
			</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
	<map name="id_pass" id="id_pass">
		<area shape="rect" coords="377,20,496,49" href="/member/member.asp?mOne=6&mTwo=2" />
		<area shape="rect" coords="378,54,496,83" href="/member/member_find_info.asp?mOne=6&mTwo=1" />
	</map>
</body>

<script type="text/javascript">
	var frm = jQuery("#LoginForm");
	function goLogin() {
		frm.submit();
	}

	frm.submit(function(){
		val = jQuery("#loginid").val();
		if(val.length < 1){
			alert("아이디를 입력하세요.");
			return false;
		}
	
		val = jQuery("#loginpw").val();
		if(val.length < 1){
			alert("패스워드를 입력하세요.");
			return false;
		}
	}).attr({
		'target' : 'ifrm',
		'method' : 'post',
		'action' : 'login_sql.asp'
	});

</script>
</html>
