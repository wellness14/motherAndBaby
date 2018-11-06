<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<!DOCTYPE html>
<html lang="ko">
<head>
	    <!--#include virtual="/mobile/common/menu/top_head.asp"-->
</head>
<%
	idx = fncRequest("idx")
	num = fncRequest("num")
	brd_id = fncRequest("brd_id")

	strParam = "&idx=" & idx
	strParam = strParam & "&num=" & num
	strParam = strParam & "&brd_id=" & brd_id
%>
<body>
	<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="/mobile/html/images/img_0002.jpg" width="360" height="32" /></td>
	</tr>
	<tr>
		<td height="50" style="font-size:16px; font-weight:bold; color:#000000"><div align="center">게시글의 비밀번호를 입력해 주세요.</div></td>
	</tr>
	<tr>
		<td height="60"><div align="center">
			<input type="password" id="password" name="password" size="30" class="textarea"/>
			&nbsp;<img src="/mobile/html/images/bt_0003.jpg" width="110" border="0" align="absmiddle" id="btnSubmit" style="cursor:pointer;"/></div>
		</td>
	</tr>
	<tr>
		<td><img src="/mobile/html/images/img_0002.jpg" width="360" height="32" /></td>
	</tr>
	</table>
	<a onclick="div1_closeLayer('ViewPop')" class="close" style="color:blue; font-size:22px; cursor:pointer;">창닫기</a>
</body>

<script type="text/javascript" src="/mobile/common/js/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	var btn = jQuery("#btnSubmit");
	btn.click(function(){
		val = jQuery("#password").val();
		if (val.length < 1){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		jQuery.post("./board_pop_step_ax.asp",{"idx":"<%=idx%>","num":"<%=num%>", "val":val, "brd_id":"<%=brd_id%>"},function(data,status){
			if (data == 1){
				alert('정보가 부족합니다.');
				self.close();
			}else if (data == 2){
				alert('비밀번호를 입력해 주세요');
			}else if (data == 3){
				fncFormSubmit("<%=idx%>","<%=num%>");
				
			}else if (data == 4){
				alert('비밀번호가 일치하지 않습니다.');
			}
		});
	});

	function isNum(){ 
		var key = event.keyCode;
		if(!((key>=48&&key<=57)|| (key>=96&&key<=105) || key == 8 || key == 13 || key == 45)){ 
			alert('숫자만 입력 가능합니다'); 
			jQuery("#password").val('');
			event.returnValue = false; 
		} 
	}

</script>
</html>
