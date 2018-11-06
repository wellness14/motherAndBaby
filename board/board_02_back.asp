<!--#include virtual="/common/menu/head.asp"-->
<%
	idx = fncRequest("idx")
	intType = fncRequest("type")

	Select Case intType
		Case "예약및결제" : intNum = 0
		Case "서비스" : intNum = 1
		Case "정부지원 바우처" : intNum = 2
		Case "기타" : intNum = 3
	End Select 

	If intNum = "" Then intNum = 0
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub04_subtitle02.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td><img src="/image/text_0034.jpg" border="0" usemap="#faq" /></td>
			</tr>
			</table>
			<p style="margin-top:50px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="155"><img src="/image/bt_0007_on.jpg" class="main_tab" style="cursor:pointer;" width="155" height="40" /></td>
				<td width="154"><img src="/image/bt_0008_off.jpg" class="main_tab" style="cursor:pointer;" width="154" height="40" border="0" /></td>
				<td width="154"><img src="/image/bt_0009_off.jpg" class="main_tab" style="cursor:pointer;" width="154" height="40" border="0" /></td>
				<td width="307"><img src="/image/bt_0010_off.jpg" class="main_tab" style="cursor:pointer;" width="152" height="40" border="0" /></td>
			</tr>
			<tr>
				<td height="4" colspan="4" bgcolor="#a3cb36"><spacer type="block"></td>
			</tr>
			</table>

			<table id="Area" width="770" border="0" align="center" cellpadding="0" cellspacing="0"></table>
			<p style="margin-top:50px;">
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript">
	var main_tab = jQuery('.main_tab');

	function fncSetImg(num){
		jQuery.get("./board_02_ax.asp",{"type":num, "idx":"<%=idx%>"},function(data,testStatus){
			if (data != ""){
				jQuery("#Area").html(data);
			}
		});
	}

	jQuery(document).ready(function(){
		main_tab.click(function(){
			num = main_tab.index(this);
			fncSetTab(main_tab,num)
		});

		main_tab.eq("<%=intNum%>").click();
	});
</script>
</html>
