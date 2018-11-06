<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "30000" 
If menuCode2 = "" Then menuCode2 = "A"

%> 
<!DOCTYPE html>
<html>
<head>
	<!--#include virtual="/mobileweb/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
    	</div>
        <!----------------------------------------- 본문 ----------------------------------------->
        <div id="mcontainer">
        <ul> 
       <% If menuCode2 = "A" Then %>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub02_subtitle01.jpg" width="360"  /></td>
			</tr>
			<tr>
				<td style="padding-bottom:50px;"><img src="/mobileweb/html/images/text_0053.jpg" width="360" />
					<table width="360" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="50"><img src="/mobileweb/html/images/bt_0015_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  height="16"/></td>
						<td width="50"><img src="/mobileweb/html/images/bt_0016_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  border="0" /></td>
						<td width="50"><img src="/mobileweb/html/images/bt_0017_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  border="0" /></td>
						<td width="50"><img src="/mobileweb/html/images/bt_0018_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  border="0" /></td>
						<td width="50"><img src="/mobileweb/html/images/bt_0019_off.jpg" class="main_tab" style="cursor:pointer;" width="43" border="0" /></td>
						<td width="50"><img src="/mobileweb/html/images/bt_0020_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  border="0" /></td>
                        <td width="50"><img src="/mobileweb/html/images/bt_0021_off.jpg" class="main_tab" style="cursor:pointer;" width="43"  border="0" /></td>
						<td width="60"><img src="/mobileweb/html/images/bt_0022_off.jpg" class="main_tab" style="cursor:pointer;" width="59"  height="16" border="0" /></td>
					</tr>
                    
					<tr>
						<td colspan="8"><img src="/mobileweb/html/images/img_0008.jpg" width="360"  /></td>
					</tr>
					</table>
					<img id="service_img" src="/mobileweb/html/images/sub_0014.jpg" width="360" />
				</td>	
			</tr>
			</table>
        <% ElseIf menuCode2="C" Then %> 
            <li><img src="/mobileweb/html/images/sub23.jpg" width="360px" border="0" ></li>
        <% ElseIf menuCode2="D" Then %> 
            <li><img src="/mobileweb/html/images/sub24.jpg" width="360px" border="0" ></li> 
        <% ElseIf menuCode2="E" Then %> 
			<li><img src="/mobileweb/html/images/sub25.jpg" width="360px" border="0" ></li>
        <% ElseIf menuCode2="F" Then %> 
			<table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub02_subtitle07.jpg" width="360" /></td>
				</tr>
				<tr>
					<td style="padding-bottom:50px;"><img src="/mobileweb/html/images/text_0054.jpg" width="360"/>
						<table width="360" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="60"><img src="/mobileweb/html/images/bt_0040_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
							<td width="60"><img src="/mobileweb/html/images/bt_0122_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
							<td width="60"><img src="/mobileweb/html/images/bt_0023_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
							<td width="60"><img src="/mobileweb/html/images/bt_0024_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
							<td width="60"><img src="/mobileweb/html/images/bt_0025_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
							<td width="60"><img src="/mobileweb/html/images/bt_0026_off.jpg" class="main_tab" style="cursor:pointer;" width="60"  border="0" /></td>
						</tr>
						<tr>
							<td colspan="6"><img src="/mobileweb/html/images/img_0008.jpg" width="360" height="4" /></td>
						</tr>
						</table>
						<img id="service_img" src="/mobileweb/html/images/sub_0023.jpg" width="360"/>
					</td>	
				</tr>
		   </table>
		<% End If %> 

        </ul>
        </div>
     <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
	</div> 
</body> 
<script type="text/javascript">
	var main_tab = jQuery('.main_tab');
	var Img = jQuery('#service_img');
    
	function fncSetImg(num){
		<% If menuCode2 = "A" then %>
		Img.attr({"src":"/mobileweb/html/images/sub_00"+ (num+14) +".jpg"});
		<% ElseIf menuCode2="F" Then %>
        Img.attr({"src":"/mobileweb/html/images/sub_00"+ (num+22) +".jpg"});
		<% end if %> 
	}

	jQuery(document).ready(function(){
		main_tab.click(function(){
			num = main_tab.index(this);
			fncSetTab(main_tab,num)
		});

		main_tab.eq(0).click();
	});
</script> 



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
</html>