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
	    <!--#include virtual="/mobileweb/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
         <div id="mnav" class="menu">
			<!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
        </div>
        <!----------------------------------------- 본문 ----------------------------------------->
         <div id="mcontainer">
        <td width="360px" valign="top"><table width="360px"  border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub61.jpg" border="0" width="360" /></td>
			</tr>

			<tr>
				<td style="padding-top:30px; padding-bottom:5px; padding-left:20px; padding-right:20px;"><table width="320" height="310"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#f6f6f6">
					<tr>
						<td height="70" colspan="2" valign="top">
							<label><img src="/mobileweb/html/images/text_0023.jpg" width="230" height="50" /></label>
						</td>
					</tr>
					<form id="LoginForm" name="LoginForm" method="post">
					<tr>
						<td width="94px" height="45" style="padding-left:24px;"><img src="/mobileweb/html/images/text_0008.jpg" width="74" height="20" /></td>
						<td width="226"><label>
							<input type="text" id="loginid" name="loginid" maxlength="20" class="textarea" size="21" style="height:40px; ime-mode:disabled;"/>
						</label></td>
					</tr>
					<tr>
						<td height="45" style="padding-left:24px;"><img src="/mobileweb/html/images/text_0009.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="loginpw" name="loginpw" maxlength="20" class="textarea" size="21" style="height:40px; ime-mode:disabled;" onKeyDown="if(event.keyCode==13) goLogin();"/>
						</label></td>
					</tr>
					</form>
					<tr>
						<td height="70" colspan="2"><div align="center"><a href="javascript:goLogin();"><img src="/mobileweb/html/images/bt_0005.jpg" width="150" height="40" border="0" /></a></div></td>
					</tr>	  
					</table>
				  <div align="center"><br /><img src="/mobileweb/html/images/text_0024.jpg" width="320" border="0" usemap="#id_pass" /></div>
				</td>	
</tr>
</table>
</td>
</div>
    <map name="id_pass" id="id_pass">
		<area shape="rect" coords="48,19,148,39" href="/mobileweb/member/member.asp" />
		<area shape="rect" coords="184,21,284,41" href="/mobileweb/member/member_find_info.asp" />
	</map>
      <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
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