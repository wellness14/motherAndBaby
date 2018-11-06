<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle01-1.jpg" width="770" height="42" /></td>
			</tr>
			<tr>
				<td style="padding-top:70px; padding-bottom:20px;"><div align="center"><img src="/image/text_0025.jpg" /><br /><br /></div>
					<table width="498" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f6f6f6">
					<form id="oFrm" name="oFrm" method="post">
					<tr>
						<td height="50" colspan="2" background="img/img_0001.jpg">
						<label>
							<div align="center">
								<input type="radio" name="option" class="option" value="id" checked/>
								<img src="/image/text_0026.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="option" class="option" value="pw" />
								<img src="/image/text_0027.jpg" />
							</div>
						</label></td>
					</tr> 
					<tr>
						<td width="144" height="45" style="padding-left:70px;"><img src="/image/text_0011.jpg" width="74" height="20" /></td>
						<td width="354"><label>
							<input type="text" name="mem_nm" class="textarea" size="30" valid="E|A=성명을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td height="45" style="padding-left:70px;"><img src="/image/text_0015.jpg" width="74" height="20" /></td>
						<td><label>
							<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
								<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							</label>
							-
							<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;
							&nbsp;
						</td>
					</tr>
					<tr id="idArea" style="display:none;">
						<td width="144" height="45" style="padding-left:70px;"><img src="/image/text_0008.jpg" width="74" height="20" /></td>
						<td width="354"><label>
							<input type="text" id="mem_id" name="mem_id" class="textarea" size="30"/>
						</label></td>
					</tr>
					</form>
					<tr>
						<td height="70" colspan="2"><div align="center"><img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/></div></td>
					</tr>	  
					</table>
					<div align="center"><br /></div>
				</td>	
			</tr>
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var option = jQuery(".option");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }

		val = jQuery(":input:radio[name=option]:checked").val();
		mem_id = jQuery("#mem_id").val();
		if (val == "pw" && mem_id == ""){
			alert('아이디를 입력해 주세요');
			return false;
		}
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_find_info_ax.asp"
	});

	jQuery(document).ready(function(){
		option.click(function(){
			num = option.index(this);
			if (num == 1){ jQuery("#idArea").show(); }
			else{ jQuery("#idArea").hide(); }
		});
	});
</script>
</html>
