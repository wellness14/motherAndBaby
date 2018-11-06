<!--#include virtual="/common/menu/head.asp"-->
<%
	Select Case mTwo
		Case 3 : brd_id = "CONSULT"
		Case 4 : brd_id = "PRAISE"
	End Select 

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 생성여부 확인
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');history.back(-1);</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 기본 셋팅 정보 추출
	strSql = "SELECT "
	strSql = strSql & "		BM_BRD_TYPE "
	strSql = strSql & "		,BM_BRD_ID "
	strSql = strSql & "		,BM_SEC_FLG "
	strSql = strSql & "		,BM_FILE_CNT "
	strSql = strSql & "	FROM MO_BRD_MAS WITN(NOLOCK) "
	strSql = strSql & "	WHERE BM_BRD_ID='"& brd_id &"' AND BM_CNLKBN='N' AND BM_USE_FLG='Y' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		brd_type	= Rs("BM_BRD_TYPE")
		brd_sec		= Rs("BM_SEC_FLG")
		file_cnt	= Rs("BM_FILE_CNT")
	Else 
		response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');history.back(-1);</script>"
		response.End 
	End If 
	Call DBClose(RS)
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	지점 정보 호출
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

	'페이지 Default Query String
	strDftUrl = "mOne=" & mOne
	strDftUrl = strDftUrl & "&mTwo=" & mTwo
	strDftUrl = strDftUrl & "&brd_id=" & brd_id
	strDftUrl = strDftUrl & "&brd_type=" & brd_type
	strDftUrl = strDftUrl & "&brd_sec=" & brd_sec
	strDftUrl = strDftUrl & "&file_cnt=" & file_cnt

	'페이지 값을 더한 Query String
	strLnkUrl = strDftUrl & "&page=" & page
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub04_subtitle0<%=mTwo%>.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td width="770" height="40"><spacer type="block" /></td>
			</tr>
			<tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
				<td bgcolor="#f6f6f6" style="padding-top:20px; padding-bottom:20px;">
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><img src="/image/text_0011.jpg" width="74" height="20" /></td>
						<td width="546"><input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=10|A=성명을 입력해 주세요"/></td>
					</tr>
					<% If brd_sec = "A" Or brd_sec = "Y" Then %>
					<tr>
						<td><img src="/image/text_0009.jpg" /></td>
						<td><input type="text" name="pw" class="textarea" size="35" valid="E|N|M=10|T=비밀번호|A=비밀번호를 입력해 주세요"/></td>
					</tr>
					<% End If %>
					<tr>
						<td><img src="/image/text_0999.jpg" width="74" height="20" /></td>
						<td><input type="text" name="email" class="textarea" size="60" valid="E|M=50|A=이메일을 입력해 주세요"/></td>
					</tr>	
					<tr>
						<td><img src="/image/text_0085.png" /></td>
						<td>
							<select name="local" onChange="fncSetPart(this.value);" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지역</option>
							<%
								If IsArray(arrLocal) Then 
									For num = 0 To UBound(arrLocal,2)
							%>
								<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
							<%
									Next 
								End If 
							%>
							</select>
							<select id="part" name="part" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지점선택</option>
							</select>
						</td>
					</tr>	
					<!--tr>
						<td><img src="/image/text_0035.jpg" width="53" height="19" /></td>
						<td>
							<select name="select6" class="textarea" style="height:35px;">
								<option>지사선택</option>
							</select>
						</td>
					</tr-->
					<tr>
						<td><img src="/image/text_0036.jpg" width="53" height="19" /></td>
						<td><input type="text" name="title" class="textarea" size="60" valid="E|M=200|A=제목을 입력해 주세요"/></td>
					</tr>
					<!--tr>
						<td><img src="/image/text_0037.jpg" width="53" height="19" /></td>
						<td><label>
						<input type="text" name="textfield24" class="textarea" size="35"/>
						&nbsp;&nbsp;<a href="#"><img src="/image/bt_0012.jpg" width="107" height="28" border="0" align="absmiddle" /></a></label></td>
					</tr-->
					<tr>
						<td><img src="/image/text_0038.jpg" width="53" height="19" /></td>
						<td><textarea name="content" class="textarea2" valid="E|M=3000|A=내용을 입력해 주세요"></textarea></td>
					</tr>
					<!--tr>
						<td><img src="/image/text_0039.jpg" width="74" height="15" /></td>
						<td><input type="text" name="" class="textarea" size="15"/></td>
					</tr-->
					</table>
				</td>
			</form>
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:50px;">
					<div align="center"><img src="/image/bt_0013.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onClick="history.back(-1);" style="cursor:pointer;"/></div>
				</td>
			</tr>
			</table>
			<p style="margin-top:20px;">	 
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
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
		"action" : "./board_sql.asp?<%=strLnkUrl%>"
	});
</script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>
</html>
