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
		<!-- 바디 영역 시작 -->	
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><h1>이메일 수신거부</h1></td>
			</tr>
			<tr>
				<td width="770">
					<div align="center"><h3>마더앤베이비 이메일을 수신거부 하시겠습니까?</h3></div>
				</td>
			</tr>
			<tr>
				<td width="770">
					<div align="center">수신거부를 하시면 이벤트 정보를 받아보실수 없습니다.</div>
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
