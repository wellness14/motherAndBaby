<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
<form id="oFrm" name="oFrm" method="post">
<input type="hidden" name="mode" value="ins">
<input type="hidden" name="mOne" value="<%=mOne%>">
<input type="hidden" name="mTwo" value="<%=mTwo%>">
<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td style="padding-top:40px;"><img src="/image/sub02_subtitle07.jpg" width="770" height="44" /></td>
		</tr>
		<tr>
			<td style="padding-bottom:50px;"><img src="/image/text_0054.jpg" />
				<!-- <table width="770" border="0" cellspacing="0" cellpadding="0"> -->
				<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!-- <td width="129"><img src="/image/bt_0040_off.jpg" class="main_tab" style="cursor:pointer;" width="129" height="40" border="0" /></td>
					<td width="129"><img src="/image/bt_0122_off.jpg" class="main_tab" style="cursor:pointer;" width="129" height="40" border="0" /></td>
					<td width="128"><img src="/image/bt_0023_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td width="128"><img src="/image/bt_0024_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td width="128"><img src="/image/bt_0025_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td width="128"><img src="/image/bt_0026_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td> -->
					<td><img src="/image/bt_0122_off.jpg" class="main_tab" style="cursor:pointer;" width="129" height="40" border="0" /></td>
					<td><img src="/image/bt_0023_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td><img src="/image/bt_0024_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td><img src="/image/bt_0025_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
					<td><img src="/image/bt_0026_off.jpg" class="main_tab" style="cursor:pointer;" width="128" height="40" border="0" /></td>
    			</tr>
				<tr>
					<!-- <td colspan="6"><img src="/image/img_0008.jpg" width="770" height="4" /></td> -->
					<td colspan="5"><img src="/image/img_0008.jpg" /></td>
				</tr>
				</table>
				<img id="service_img" src="/image/sub_0023.jpg" />

				<div id="icord" style="display:none;">
					<!-- #include file="service_07_icord.asp"-->
				</div>
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
	var icd = jQuery('#icord');
	
	function fncSetImg(num){
		num++;

		if(num==0){
			icd.show();
			Img.hide();
		}else if(num==1){
			icd.hide();
			Img.show();
			Img.attr({"src":"/image/sub_0023.jpg"});
		}else if(num==2){
			icd.hide();
			Img.show();
			Img.attr({"src":"/image/sub_0024.jpg"});
		}else if(num==3){
			icd.hide();
			Img.show();
			Img.attr({"src":"/image/sub_0025.jpg"});
		}else if(num==4){
			icd.hide();
			Img.show();
			Img.attr({"src":"/image/sub_0026.jpg"});
		}else if(num==5){
			icd.hide();
			Img.show();
			Img.attr({"src":"/image/sub_0027.jpg"});
		}


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
