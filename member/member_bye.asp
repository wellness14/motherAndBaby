<!--#include virtual="/common/menu/head.asp"-->
<%
	If uId = "" Then 
		Response.Redirect "/member/login.asp?mOne=6&mTwo=1"
	End If 
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<!-- �ٵ� ���� ���� -->	
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle05-4.jpg" /></td>
			</tr>
			<tr>
				<td width="770" height="40"><img src="/image/sub_0034.jpg" /><spacer type="block"></td>
			</tr>  
			<tr>
				<td width="770" height="40"><spacer type="block">&nbsp;&nbsp;
					<input type="checkbox" id="checkbox" name="checkbox" value="Y" />�ȳ� ������ ��� Ȯ���Ͽ�����, �̿� �����մϴ�.
				</td>
			</tr>    
			<tr>
				<td style="padding-top:30px; padding-bottom:50px;">
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
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript">
	var btnSubmit = jQuery("#btnSubmit");
	var btnCancel = jQuery("#btnCancel");

	btnSubmit.click(function(){
		val = jQuery("#checkbox:checked").length;
		if (val == 0){
			alert("�ȳ� ������ ��� Ȯ���ϼ̳���?, �̿� ������ �ֽñ� �ٶ��ϴ�.");
			return false;
		}

		if (confirm("ȸ�� Ż�� �Ͻðڽ��ϱ�?")){
			jQuery("#ifrm").attr({"src":"/member/member_sql.asp?mode=del"});
		}
	});

	btnCancel.click(function(){
		location.href="/index.asp";
	});
</script>
</html>
