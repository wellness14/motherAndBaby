<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<link rel="stylesheet" href="/common/css/style.css">
	<title>�����غ��̺�</title>
	<style type="text/css">
	<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			}
			#Layer1 {
			position:absolute;
			width:200px;
			height:115px;
			z-index:1;
		}
	-->
	</style>
</head>
<%
	idx = fncRequest("idx")
	num = fncRequest("num")
	brd_id = fncRequest("brd_id")

	mOne = fncRequest("mOne")
	mTwo = fncRequest("mTwo")
	
	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
	strParam = strParam & "&idx=" & idx
	strParam = strParam & "&num=" & num
	strParam = strParam & "&brd_id=" & brd_id
%>
<body>
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td><img src="/image/img_0002.jpg" width="500" height="32" /></td>
	</tr>
	<tr>
		<td height="50" style="font-size:16px; font-weight:bold; color:#000000"><div align="center">�Խñ��� ��й�ȣ�� �Է��� �ּ���.</div></td>
	</tr>
	<tr>
		<td height="60"><div align="center">
			<input type="text" id="password" name="password" onkeyup="isNum();" size="30" class="textarea"/>
			&nbsp;<img src="/image/bt_0003.jpg" border="0" align="absmiddle" id="btnSubmit" style="cursor:pointer;"/></div>
		</td>
	</tr>
	<tr>
		<td><img src="/image/img_0002.jpg" width="500" height="32" /></td>
	</tr>
	</table>
</body>

<script type="text/javascript" src="/common/js/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
	var btn = jQuery("#btnSubmit");
	btn.click(function(){
		val = jQuery("#password").val();
		if (val.length < 1){
			alert("��й�ȣ�� �Է����ּ���");
			return false;
		}
		jQuery.post("./board_pop_ax.asp",{"idx":"<%=idx%>","num":"<%=num%>", "val":val, "brd_id":"<%=brd_id%>"},function(data,status){
			if (data == 1){
				alert('������ �����մϴ�.');
				self.close();
			}else if (data == 2){
				alert('��й�ȣ�� �Է��� �ּ���');
			}else if (data == 3){
				opener.fncFormSubmit("<%=idx%>","<%=num%>");
				self.close();
			}else if (data == 4){
				alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');
			}
		});
	});

	function isNum(){ 
		var key = event.keyCode;
		if(!((key>=48&&key<=57)|| (key>=96&&key<=105) || key == 8 || key == 13 || key == 45)){ 
			alert('���ڸ� �Է� �����մϴ�'); 
			jQuery("#password").val('');
			event.returnValue = false; 
		} 
	}
</script>
</html>