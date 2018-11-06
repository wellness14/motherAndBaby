<!--#include virtual="/common/menu/head.asp"-->
<%
	intTab = fncRequest("tab")
	If intTab = "" Then intTab = 1
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td style="padding-top:40px;"><img src="/image/sub02_subtitle01.jpg" width="770" height="44" /></td>
		</tr>
		<tr>
			<td style="padding-bottom:50px;"><img src="/image/text_0053.jpg" />
				<table width="770" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93"><img src="/image/bt_0015_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" /></td>
					<td width="93"><img src="/image/bt_0016_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
					<td width="93"><img src="/image/bt_0017_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
					<td width="93"><img src="/image/bt_0018_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
					<td width="93"><img src="/image/bt_0019_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
					<td width="93"><img src="/image/bt_0020_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
					<td width="93"><img src="/image/bt_0021_off.jpg" class="main_tab" style="cursor:pointer;" width="93" height="34" border="0" /></td>
                    <td width="128"><img src="/image/bt_0022_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="34" border="0" /></td>
				</tr>
				<tr>
					<td colspan="8"><img src="/image/img_0008.jpg" width="770" height="4" /></td>
				</tr>
				</table>
				<img id="service_img" src="/image/sub_0014.jpg"/>
			</td>	
		</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript">
	var main_tab = jQuery('.main_tab');
	var Img = jQuery('#service_img');
	var rndNum = Math.floor(Math.random() * 10) + 1; // 랜덤정수발생시켜서 이미지경로뒤에 붙여주면 캐시가아닌 서버에서 이미지가져옴. 
	function fncSetImg(num){
		Img.attr({"src":"/image/sub_00"+ (num+14) +".jpg?" + rndNum });
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
