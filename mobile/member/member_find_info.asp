<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 
menuCode1 = "10000" 
menuCode2 = "B"

%> 

<!DOCTYPE html>
<html lang="ko">
<head>
	    <!--#include virtual="/mobile/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobile/common/menu/top_all_menu.asp"-->	
        </div>
         <div id="mnav" class="menu">
			<!--#include virtual="/mobile/common/menu/sub_menu.asp"-->	
        </div>
        <!----------------------------------------- 본문 ----------------------------------------->
         <div id="mcontainer">
        <td width="360px" valign="top"><table width="360px" height="300px" border="0" align="center" cellpadding="0" cellspacing="0">
			<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="360" style="padding-top:0px;"><img src="/mobile/html/images/sub66.jpg" width="360" /></td>
			</tr>
			<tr>
				<td style="padding-top:20px; padding-bottom:10px; padding-left:5px; padding-right:5px;"><div align="center"><img src="/mobile/html/images/text_0025.jpg" width="320px"/><br /><br /></div>
					<table width="350" height="315" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f6f6f6">
					<form id="oFrm" name="oFrm" method="post">
					<tr>
						<td height="50" colspan="2" background="img/img_0001.jpg">
						<label>
							<div align="center" id="se00">
								<div id="se01" class="se03"><input type="radio" name="option" class="option" value="id" checked/>
								<img src="/mobile/html/images/text_0026.jpg" height="21px"/></div>
								<div id="se02" class="se03"><input type="radio" name="option" class="option" value="pw" />
								<img src="/mobile/html/images/text_0027.jpg" height="21px"/></div>
							</div>
						</label></td>
					</tr> 
					<tr>
						<td width="94" height="45" style="padding-left:20px;"><img src="/mobile/html/images/text_0011.jpg" height="20" /></td>
						<td width="226"><label>
							<input type="text" name="mem_nm" class="textarea" size="21" valid="E|A=성명을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td height="45" style="padding-left:20px;"><img src="/mobile/html/images/text_0015.jpg" height="20" /></td>
						<td><label>
							<select name="hp_1" class="textarea" style="height:35px" valid="E|A=핸드폰번호를 선택해 주세요">
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
							<input type="text" name="hp_2" class="textarea" size="4" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" name="hp_3" class="textarea" size="4" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
					<tr id="idArea" style="display:none;">
						<td width="94" height="45" style="padding-left:20px;"><img src="/mobile/html/images/text_0008.jpg" height="20" /></td>
						<td width="226"><label>
							<input type="text" id="mem_id" name="mem_id" class="textarea" size="21"/>
						</label></td>
					</tr>
					</form>
					<tr>
						<td height="70" colspan="2"><div align="center"><img src="/mobile/html/images/bt_0003.jpg" width="110"  border="0" id="btnSubmit" style="cursor:pointer;"/></div></td>
					</tr>	  
					</table>
					<div align="center"><br /></div>
				</td>	
			</tr>
			</table>
		</td>
	</tr>
	</table>
      <!--#include virtual="/mobile/common/menu/foot_menu.asp"-->
	</div> 
</body>      
<script>
	$('document').ready(function(){
    $('.menu').fixedMenu();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){			   
		$(".ani-bg").animate({
			marginTop:"75px"       
		}, 0 );	
	});
</script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				// Define any icon actions before calling the toolbar
				$('.toolbar-icons a').on('click', function( event ) {
					event.preventDefault();
				});
				$('#normal-button-bottom').toolbar({content: '#user-options', position: 'bottom'});
			});
</script>
<script type="text/javascript" src="/mobile/common/js/frm_common.js"></script>
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