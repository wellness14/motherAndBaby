<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 지역 관리
'파 일 명 : local_ins.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include file = "./local_inc.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>
<%
	Dim mode : mode = "ins"
	
	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM MO_COMM_CD WITH(NOLOCK) "

		strWhere = " WHERE CC_COMM_KIND = '88' AND CC_COMM_CD = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "		CC_COMM_CD"
		strSql = strSql & "		,CC_KOR_NM"
		strSql = strSql & "		,CC_USE_YN"
		strSql = strSql & "		,CC_REG_DT"
		strSql = strSql & "		,CC_KOR_NM2 "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			mode		= "upd"
			
			kor_nm		= Rs("CC_KOR_NM")
			use_yn		= Rs("CC_USE_YN")
			kor_nm2		= Rs("CC_KOR_NM2")

			arrLocal	= Split(kor_nm,"-")
			local		= arrLocal(0)
			part		= arrLocal(1)
		End If 
		Call RSClose(Rs)
	End If 	
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 메인 관리 > <strong><%=strTitle%></strong></div>
		<div class="write">
			
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>도시</th>
				<td><input type="text" name="local" maxlength="20" size="50" value="<%=local%>" valid="E|M=40|A=도시를 입력해 주세요"></td>
			</tr>
			<tr>
				<th>지역</th>
				<td><input type="text" name="part" maxlength="20" size="50" value="<%=part%>" valid="E|M=40|A=지역를 입력해 주세요"></td>
			</tr>
			<tr>
				<th>사용여부</th>
				<td>
					<input type="radio" name="use_flg" value="Y" <%=fncSetCheckBox(use_yn,"Y")%> valid="E|A=사용여부를 선택해 주세요"> 사용&nbsp;&nbsp;&nbsp;
					<input type="radio" name="use_flg" value="N" <%=fncSetCheckBox(use_yn,"N")%>> 미사용&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
			</thead>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>

<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
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
		"action" : "<%=urlSql%>"
	});
</script>
</html>