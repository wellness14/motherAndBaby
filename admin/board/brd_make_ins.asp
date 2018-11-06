<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리 - 게시판 생성
'파 일 명 : brd_make_ins.asp
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
<!-- #include file = "./brd_make_inc.asp" -->
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
	intIDX	= fncRequest("idx")
	If intIDX <> "" Then 
		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "		BM_IDX "
		strSql = strSql & "		,BM_BRD_TYPE "
		strSql = strSql & "		,BM_BRD_ID "
		strSql = strSql & "		,BM_BRD_NM "
		strSql = strSql & "		,BM_SEC_FLG "
		strSql = strSql & "		,BM_FILE_CNT "
		strSql = strSql & "		,BM_USE_FLG "
		strSql = strSql & "		,BM_SERVICE_URL "
		strSql = strSql & "	FROM MO_BRD_MAS WITH(NOLOCK) "
		strSql = strSql & " WHERE BM_CNLKBN='N' AND BM_IDX='"& intIDX &"' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode		= "upd"
			brd_type	= Rs("BM_BRD_TYPE")
			brd_id		= Rs("BM_BRD_ID")
			brd_nm		= Rs("BM_BRD_NM")
			sec_flg		= Rs("BM_SEC_FLG")
			file_cnt	= Rs("BM_FILE_CNT")
			use_flg		= Rs("BM_USE_FLG")
			service_url	= Rs("BM_SERVICE_URL")
		End If 
		Call RSClose(Rs)
	End If 
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 게시판 관리 > <strong>게시판 생성</strong></div>
		<div class="write">
			<form id="sfrm" name="sfrm" method="get" action="?">
			<div class="selection">
				사용여부 :
				<select name="intUse" onchange="jQuery('#sfrm').submit();" style="width:90px">
					<option value="">선택</option>
					<option value="1" <%=fncSetSelectBox(intUse,"1")%>>사용</option>
					<option value="2" <%=fncSetSelectBox(intUse,"2")%>>사용안함</option>
				</select>&nbsp;&nbsp;&nbsp;
				<input type="text" id="sword" name="sword" size="20" maxlength="40" value="<%=sword%>" />
				<span style="margin-left:20px;">
					<a onClick="jQuery('#sfrm').submit();" style="cursor:pointer;" class="button">검 색</a>
					<a onClick="location.href='<%=urlList%>';" style="cursor:pointer;" class="button">전체 리스트</a>
					<a onClick="location.href='<%=urlIns%>?<%=strLnkUrl%>'" style="cursor:pointer;" class="button">게시판 생성</a>
				</span>
			</div>
			</form>
			<form id="ofrm" name="ofrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>"/>
			<input type="hidden" name="idx" value="<%=intIDX%>" />
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
				<col width="5%" /><col />
			</colgroup>
			<thead>
				<tr><th colspan="4" style="text-align:center;">게시판 생성</th></tr>
			</thead>
			
			<tbody>
			<tr>
				<th>게시판 타입</th>
				<td colspan="3">
					<input type="radio" name="brd_type" value="1" <%=fncSetCheckBox(brd_type,"1")%> valid="E|A=게시판 타입을 선택해 주세요"> 공지 게시판&nbsp;&nbsp;&nbsp;
					<input type="radio" name="brd_type" value="2" <%=fncSetCheckBox(brd_type,"2")%>> 덧글 게시판&nbsp;&nbsp;&nbsp;
					<input type="radio" name="brd_type" value="3" <%=fncSetCheckBox(brd_type,"3")%>> 이벤트 게시판&nbsp;&nbsp;&nbsp;
					<input type="radio" name="brd_type" value="4" <%=fncSetCheckBox(brd_type,"4")%>> 일반 게시판&nbsp;&nbsp;&nbsp;
					<input type="radio" name="brd_type" value="5" <%=fncSetCheckBox(brd_type,"5")%>> FAQ 게시판&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>게시판 ID</th>
				<td><%If brd_id <> "" Then%><%=brd_id%><%Else%><input type="text" name="brd_id" size="20" id="onlyAlphabet" valid="E|M=20|A=게시판 ID를 입력해 주세요"><%End If%></td>
				<th>게시판명</th>
				<td><input type="text" name="brd_nm" size="20" value="<%=brd_nm%>" valid="E|M=50|A=게시판명을 선택해 주세요"></td>
			</tr>
			<tr>
				<th>첨부파일 </th>
				<td colspan="3">
					<select name="file_cnt">
						<option value="">첨부파일</option>
						<option value="1" <%=fncSetSelectBox(file_cnt,"1")%>>1개</option>
						<option value="2" <%=fncSetSelectBox(file_cnt,"2")%>>2개</option>
						<option value="3" <%=fncSetSelectBox(file_cnt,"3")%>>3개</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>비밀글 사용여부</th>
				<td colspan="3">
					<input type="radio" name="sec_flg" value="A" <%=fncSetCheckBox(sec_flg,"A")%> valid="E|A=비밀글 사용여부를 선택해 주세요"> 전체 비밀글&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sec_flg" value="Y" <%=fncSetCheckBox(sec_flg,"Y")%>> 부분비밀글&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sec_flg" value="N" <%=fncSetCheckBox(sec_flg,"N")%>> 사용안함
				</td>
			</tr>
			<tr>
				<th>게시판 사용여부</th>
				<td colspan="3">
					<input type="radio" name="use_flg" value="Y" <%=fncSetCheckBox(use_flg,"Y")%> valid="E|A=게시판 사용여부를 선택해 주세요"> 사용&nbsp;&nbsp;&nbsp;
					<input type="radio" name="use_flg" value="N" <%=fncSetCheckBox(use_flg,"N")%>> 사용안함
				</td>
			</tr>
			<tr>
				<th>서비스 URL</th>
				<td colspan="3"><input type="text" name="service_url" size="50" value="<%=service_url%>"></td>
			</tr>
			</tbody>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" style="background-color:#e7e7e7;  border:1 solid #000000;width:100px; height:30" id="btnSubmit">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" style="background-color:#e7e7e7;  border:1 solid #000000;width:100px; height:30" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#ofrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./brd_make_sql.asp"
	});

	jQuery("#onlyAlphabet").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = jQuery(this).val();
			jQuery(this).val(inputVal.replace(/[^a-z]/gi,''));
		}
	});
</script>
</html>