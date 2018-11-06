<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리
'파 일 명 : brd_view.asp
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
		strSql = strSql & "		,BA_SEC_NUM "
		strSql = strSql & "		,BA_REG_DT "
		strSql = strSql & "		,BA_EMAIL "
		strSql = strSql & "		,BA_CNT "
		strSql = strSql & "		,BA_FILE_NM "
		strSql = strSql & "		,BA_FILE_PATH "
		If brd_type = "1" Or brd_type = "5" Then 
		strSql = strSql & "		,BA_TYPE "
		End If 
		If brd_type = "2" Then 
		strSql = strSql & "		,BA_LOCAL "
		End If 
		If brd_type = "3" Then 
		strSql = strSql & "		,BA_STD_SDT "
		strSql = strSql & "		,BA_STD_EDT "
		End If 
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			ba_dph		= Rs("BA_DPH")
			ba_pidx		= Rs("BA_PIDX")
			mem_id		= Rs("BA_MEM_ID")
			mem_nm		= Rs("BA_MEM_NM")
			title		= Rs("BA_TITLE")
			content		= Re_sqlFilter(Rs("BA_CONTENT"))
			sec_flg		= Rs("BA_SEC_FLG")
			sec_num		= Rs("BA_SEC_NUM")
			email		= Rs("BA_EMAIL")
			intCnt		= Rs("BA_CNT")
			file_nm		= Rs("BA_FILE_NM")
			file_path	= Rs("BA_FILE_PATH")
			If brd_type = "1" Or brd_type = "5" Then 
			ba_type		= Rs("BA_TYPE")
			End If 	
			If brd_type = "2" Then 
			md_local	= Rs("BA_LOCAL")
			End If 
			If brd_type = "3" Then
			sdate		= Rs("BA_STD_SDT")
			edate		= Rs("BA_STD_EDT")
			End If 		
		End If 
		Call RSClose(Rs)

	'-----------------------------------------------------------------------------
	'	지점 정보 호출
		If md_local <> "" Then 
			strSql = "SELECT CC_KOR_NM2 "
			strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
			strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOf Then 
				local_nm = Rs(0)
			End If 
			Call RSClose(Rs)
		End If 
	'-----------------------------------------------------------------------------

	'----------------------------------------------------------------------
	'	답변글 확인
		If brd_type = "2" Then 
			strSql = ""
			strSql = strSql & "	SELECT "
			strSql = strSql & "		BA_DPH "
			strSql = strSql & "		,BA_PIDX "
			strSql = strSql & "		,BA_MEM_ID "
			strSql = strSql & "		,BA_MEM_NM "
			strSql = strSql & "		,BA_TITLE "
			strSql = strSql & "		,BA_CONTENT "
			strSql = strSql & strTable
			strSql = strSql & "WHERE BA_PIDX = '"& intIDX &"' AND BA_DPH='2' " 
			strSql = strSql & "ORDER BY BA_SEQ DESC "
			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then 
				mode = "recom"
				arrRecomList = Rs.getRows()
			End If 
			Call RSClose(Rs)
		End If 
	'----------------------------------------------------------------------
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 	  

		strSql = " UPDATE "& brd_tbl &" SET BA_CNT = BA_CNT+1 WHERE BA_IDX = '"& intIDX &"' "
		Call DBExec(strSql, "main") : Call DBClose(DBCon)
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

		.textarea{   overflow-y:scroll; }
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
			<%If brd_sec = "A" Or brd_sec = "Y" Then %>
			<tr>
				<th>비밀번호</th>
				<td><%=sec_num%></td>
			</tr>
			<% End If %>
			<% If brd_type = "2" Then %>
			<tr>
				<th>지역</th>
				<td><%=local_nm%></td>
			</tr>	
			<% End If %>
			<tr>
				<th>연락처/이메일</th>
				<td><%=email%></td>
			</tr>
			<% If brd_type = "1" Or brd_type = "5" Then %>
			<tr>
				<th>분류</th>
				<td><%=ba_type%></td>
			</tr>	
			<% End If %>
			<% If brd_type = "3" Then %>
			<tr>
				<th>이벤트 기간</th>
				<td>
					<%=sdate%> ~ <%=edate%>
				</td>
			</tr>	
			<% End If %>
			<tr>
				<th>제목</th>
				<td><%=title%></td>
			</tr>
			<tr>
				<th>내용</th>	
				<td><textarea name="content1" style="width:100%; height:200px; overflow-y:scroll;" readonly><%=content%></textarea></td>
			</tr>
			<% If file_cnt > 0 And file_nm <> "" Then %>
			<tr>
				<th>첨부파일</th>
				<td>
			<% 
				Dim arrFileNm : arrFileNm = Null
				If file_nm <> "" Then 
					arrFileNm = Split(file_nm,"||")
					arrFilePath = Split(file_path,"||")
				End If 
				For num=0 To UBound(arrFileNm) 
			%>
					<a href="/upload_file/file/<%=Trim(arrFilePath(num))%>" target="_blank"><%=Trim(arrFileNm(num))%></a> <br />
			<%
				Next 
			%>
				</td>
			</tr>
			<% End If %>
			</thead>
			</table>
			<p>&nbsp;</p>

		<%	If IsArray(arrRecomList) Then %>
			<h1>답변글</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="8%" /><col />
			</colgroup>
			<thead>
		<%
			For num=0 To UBound(arrRecomList,2)
				re_pidx		= arrRecomList(2,num)
				re_title	= arrRecomList(4,num)
				re_content	= arrRecomList(5,num)
		%>
			<tr>
				<th>제목</th>
				<td><%=re_title%></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content1" style="width:100%; height:200px; overflow-y:scroll;"  readonly><%=re_content%></textarea></td>
			</tr>
		<%
			Next 
		%>
			</thead>
			</table>
		<% End If %>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="수 정" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<% If brd_type = "2" Then %>
						<input type="button" value="<%If mode="recom" Then%>답변수정<%Else%>답변달기<%End If%>" id="btnRecom" class="button">&nbsp;&nbsp;&nbsp;
						<% End If %>
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="목 록" class="button" onClick="location.href='<%=urlList%>?<%=strLnkUrl%>';">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var btn = jQuery('#btnSubmit');
		var recom = jQuery('#btnRecom');
		var del	= jQuery('#btnDelte');

		btn.click(function(){
			location.href="<%=urlIns%>?idx=<%=intIDX%>&<%=strLnkUrl%>";
		});

		recom.click(function(){
			location.href="<%=urlReply%>?idx=<%=intIDX%>&<%=strLnkUrl%>";
		});

		del.click(function(){
			if (confirm("삭제 하시겠습니까?")) {
				jQuery('#ifrm').attr({'src':'<%=urlSql%>?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>
</html>