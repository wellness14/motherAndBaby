<!-- 공통 인클루드 페이지 시작 -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- 공통 인클루드 페이지 마침 -->
<html>
<head>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:500px;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>

	<script type="text/JavaScript">
	<!--
	function fncSubmit() {
		myform.submit();
	}
	//-->
	</script>
</head>
<%
	uId	= Trim(fncRequestCookie("userid"))			'회원	아이디	

	intType = fncRequest("type")
	imageIndex = fncRequest("imageIndex")
	strFileSize = "2M이하"
%>
<body>
	<div id="container">
		<div class="write">
			<div class="selection">
			<form name="myform" method="post" action="/common/inc/Helper_Uploader.asp" enctype="multipart/form-data" >
			<input type="hidden" name="type" value="<%=intType%>" />
			<input type="hidden" name="imageIndex" value="<%=imageIndex%>" />
			<table class="tb_style01">
			<thead>
			<tr>
				<th>첨부파일(<%=strFileSize%>)</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td><input type="file" name="varFileNm" size="40"></td>
			</tr>
			<tr>
				<td>jpg, gif 등록 가능</td>
			</tr>
			</tbody>
			</table>
			</form>
		</div>
		<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" style="background-color:#e7e7e7;  border:1 solid #000000;width:100px; height:30" onclick="javascript:fncSubmit();">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" style="background-color:#e7e7e7;  border:1 solid #000000;width:100px; height:30" onclick="javascript:self.close();">
					</td>
				</tr>  
		</table>
	</div>
</body>
</html>