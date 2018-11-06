<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "20000" 
If menuCode2 = "" Then menuCode2 = "A"

%> 
<!DOCTYPE html>
<html>
<head>
	<!--#include virtual="/mobile/common/menu/top_head.asp"-->
</head>

<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobile/common/menu/top_all_menu.asp"-->	
        </div>
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobile/common/menu/sub_menu.asp"-->	
    	</div>
        <!----------------------------------------- 본문 ----------------------------------------->
        <div id="mcontainer">
        	<% 
                If menuCode2 = "A" Then 
				   bodyimg = "sub11.jpg" 
				   widthimg = "360px" 
				ElseIf menuCode2 = "B" Then 
				   bodyimg = "sub12.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "C" Then 
				   bodyimg = "sub13.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "D" Then 
				   bodyimg = "sub14.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "E" Then 
				   bodyimg = "sub15.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "F" Then 
				   bodyimg = "sub16.jpg" 
				   widthimg = "360px"
                ElseIf menuCode2 = "H" Then 
				   bodyimg = "sub18.jpg" 
				   widthimg = "360px"
                End If 
           %>
		   <% If menuCode2 <> "G" Then %>
			<ul>
				<li>
				<img src="/mobile/html/images/<%=bodyimg%>" width="<%=widthimg%>" border="0" >
				</li>
            </ul>
		   <% Else %> 
			<ul>
			<table width="350" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td><img src="/mobile/html/images/sub17.jpg" width="360" border="0" /></td>		
			</tr>
			<tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" name="menuCode1" value="20000">
			<input type="hidden" name="menuCode2" value="G">
				<td bgcolor="#f6f6f6" style="padding-bottom:20px; padding-top:20px;">
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="61"><img src="/mobile/html/images/text_0001.jpg" width="61" /></td>
						<td width="288">
							<label>
								<input type="text" name="txtCop" class="textarea" size="28" valid="E|M=20|T=업체명|A=업체명을 입력해 주세요"/>
							</label>
						</td>
					</tr>
					<tr>
						<td><img src="/mobile/html/images/text_0002.jpg" width="61" /></td>
						<td><label>
							<input type="text" name="txtNm" class="textarea" size="28" valid="E|M=10|T=담당자명|A=담당자명을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/mobile/html/images/text_0003.jpg" width="61" /></td>
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
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
					<tr>
						<td><img src="/mobile/html/images/text_0004.jpg" width="61" /></td>
						<td><label>
							<textarea name="textarea" class="textarea10" valid="E|M=230|T=문의내용|A=문의내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>
					</table>
				</td>	
			</form>
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:50px;">
					<div align="center" id="btn11">
						<div class="btn00"><img src="/mobile/html/images/bt_0001.jpg" width="110"  border="0" id="btnSubmit" style="cursor:pointer;"/></div>
						<div class="btn00"><img src="/mobile/html/images/bt_0002.jpg" width="110"  border="0" onClick="location.reload();" style="cursor:pointer;"/></div>
					</div>
				</td>	
			</tr> 
		</table>
			</ul>
			<% End If %> 
        </div>
      <!--#include virtual="/mobile/common/menu/foot_menu.asp"-->
	</div> 
</body> 
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/mobile/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./comp_06_sql.asp"
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