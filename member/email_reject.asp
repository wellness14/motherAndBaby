<!--#include virtual="/common/menu/head.asp"-->
<%
	If uId <> "" Then 
		Response.Redirect "/member/member_change.asp?mOne=6&mTwo=6"
	End If 
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!-- �ٵ� ���� ���� -->	
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><h1>�̸��� ���Űź�</h1></td>
			</tr>
			<tr>
				<td width="770">
					<div align="center"><h3>�����غ��̺� �̸����� ���Űź� �Ͻðڽ��ϱ�?</h3></div>
				</td>
			</tr>
			<tr>
				<td width="770">
					<div align="center">���Űźθ� �Ͻø� �̺�Ʈ ������ �޾ƺ��Ǽ� �����ϴ�.</div>
				</td>
			</tr>
			<tr>
				<td width="770" style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer"/>
						&nbsp;&nbsp;<img src="/image/bt_0002.jpg" width="150" height="40" border="0" id="btnCancel" style="cursor:pointer"/>
					</div>
				</td>	
			</tr>    
			</table>
		</td>
		</tr>
		</table>
		<div style="height:100px;">&nbsp;</div>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript">
	var btnSubmit = jQuery("#btnSubmit");
	var btnCancel = jQuery("#btnCancel");

	btnSubmit.click(function(){
		location.href="/member/login.asp?mOne=6&mTwo=1&reUrl=" + escape("/member/member_change.asp?mOne=6&mTwo=6");
	});

	btnCancel.click(function(){
		location.href="/index.asp";
	});
</script>
</html>
