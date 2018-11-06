<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리
'파 일 명 : brd_reply.asp
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
<!-- #include file = "./brd_inc.asp" -->
<%	
	mode = "recom_ins"

	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM "& brd_tbl &" WITH(NOLOCK) "

		strWhere = " WHERE BA_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "		BA_DPH "
		strSql = strSql & "		,BA_PIDX "
		strSql = strSql & "		,BA_MEM_ID "
		strSql = strSql & "		,BA_MEM_NM "
		strSql = strSql & "		,BA_TITLE "
		strSql = strSql & "		,BA_CONTENT "
		strSql = strSql & "		,BA_SEC_FLG "
		strSql = strSql & "		,BA_REG_DT "
		strSql = strSql & "		,BA_EMAIL "
		strSql = strSql & "		,BA_CNT "
		strSql = strSql & "		,BA_FILE_NM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			ba_dph		= Rs("BA_DPH")
			ba_pidx		= Rs("BA_PIDX")
			mem_id		= Rs("BA_MEM_ID")
			mem_nm		= Rs("BA_MEM_NM")
			title		= Rs("BA_TITLE")
			content		= Rs("BA_CONTENT")
			sec_flg		= Rs("BA_SEC_FLG")
			email		= Rs("BA_EMAIL")
			intCnt		= Rs("BA_CNT")
			file_nm		= Rs("BA_FILE_NM")
		End If 
		Call RSClose(Rs)

	'----------------------------------------------------------------------
	'	답변글 확인
		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "		BA_IDX "
		strSql = strSql & "		,BA_PIDX "
		strSql = strSql & "		,BA_MEM_ID "
		strSql = strSql & "		,BA_MEM_NM "
		strSql = strSql & "		,BA_TITLE "
		strSql = strSql & "		,BA_CONTENT "
		strSql = strSql & strTable
		strSql = strSql & "WHERE BA_PIDX = '"& intIDX &"' AND BA_DPH='2' " 
		strSql = strSql & "ORDER BY BA_SEQ DESC "

		'Response.write strSql

		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			mode		= "recom_upd"
			re_idx		= Rs("BA_IDX")
			re_mem_nm	= Rs("BA_MEM_NM")
			re_title	= Rs("BA_TITLE")
			re_content	= Rs("BA_CONTENT")
		End If 
		Call RSClose(Rs)
	'----------------------------------------------------------------------
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 	   
%>
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
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 게시판 관리 > <strong><%=brd_nm%></strong></div>
		<div class="write">
			<!--#include file ="./brd_top.asp"-->

			<h1>사용자 등록글</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>성명</th>
				<td><%=mem_nm%></td>
			</tr>
			<%If brd_sec = "A" Or brd_sec="Y" Then %>
			<tr>
				<th>비밀번호</th>
				<td><%=pw%></td>
			</tr>
			<% End If %>
			<tr>
				<th>이메일</th>
				<td><%=email%></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=title%></td>
			</tr>
			<tr>
				<th>내용</th>	
				<td><textarea name="content1" style="width:100%; height:200px;" disabled="true"><%=content%></textarea></td>
			</tr>
			<% If file_cnt > 0 Then %>
			<tr>
				<th>첨부파일</th>
				<td>
				<% For num=1 To file_cnt %>
					111
				<% Next %>
				</td>
			</tr>
			<% End If %>
			</thead>
			</table>
			<p>&nbsp;</p>

			<h1>답변글</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<input type="hidden" name="re_idx" value="<%=re_idx%>">
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="80" value="<%=re_title%>" valid="E|M=200|A=답변 제목을 입력해 주세요"></td>
			</tr>
			<tr style="display:none;">
				<th>작성자</th>
				<td><input type="text" name="mem_nm" size="30" value="<%=uNm & " " & uLv%>" valid="E|M=200|A=작성자를 입력해 주세요"></td>
			</tr>
			<tr>
				<th>내용</th>	
				<td><textarea name="content" style="width:100%; height:200px;" valid="E|A=답변내용을 입력해 주세요"><%=re_content%></textarea></td>
			</tr>
			</form>
			</thead>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="location.href='<%=urlView%>?idx=<%=intIDX%>&<%=strLnkUrl%>';">
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
		"action" : "<%=urlSql%>?<%=strLnkUrl%>"
	});
</script>
</html>