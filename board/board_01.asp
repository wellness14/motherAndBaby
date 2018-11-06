<!--#include virtual="/common/menu/head.asp"-->
<%
	brd_id = "NOTICE"

	page = fncRequest("page")
	If page = "" Then page = 1
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

'--------------------------------------------------------------------------
'	공지사항 리스트 호출
	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' and BA_NOTICE_FLG='H'"
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	strSql = " SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_TYPE "
	strSql = strSql & "			,BA_MEM_NM  "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT	"
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_DPH='1' and BA_NOTICE_FLG='H'"
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrNoticList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-top:40px;"><img src="/image/sub04_subtitle01.jpg" width="770" height="43" /></td>
				</tr>
			</table>

			<p style="margin-top:40px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="2">
				<tr>
					<td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
					<td width="69" bgcolor="#979797" class="white_text"><div align="center">분류</div></td>
					<td width="442" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
					<td width="103" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
					<td width="88" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
				</tr>
			<%
				If IsArray(arrNoticList) Then 
					For num=0 To UBound(arrNoticList,2)
						intNum		= intTotalCnt - (page-1) * page_size - num
						idx			= Trim(arrNoticList(0,num))
						ba_type		= Trim(arrNoticList(1,num))
						mem_nm		= Trim(arrNoticList(2,num))
						title		= Trim(arrNoticList(3,num))
						sec_flg		= arrNoticList(4,num)
						reg_dt		= Left(arrNoticList(5,num),10)
			%>
				<tr>
					<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
					<td bgcolor="#ebebeb"><div align="center"><%=ba_type%></div></td>
					<td bgcolor="#ebebeb" style="padding-left:10px;"><a href="#_" onclick="fncView('<%=sec_flg%>','<%=idx%>','<%=intNum%>');" class="bbs_list"><%=title%></a></td>
					<td bgcolor="#ebebeb"><div align="center"><%=mem_nm%></div></td>
					<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
				</tr>
			<%
					Next 
				End If 
			%>
			</table>
			<p style="margin-top:20px;">	 	  
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td id="brdPager"></td>
				</tr>
			</table>
			<p style="margin-top:50px;">	  
		</td>
	</tr>
	</table>
	<script type="text/javascript" src="/Common/js/jquery/jquery.pager.js"></script>
	<script type="text/javascript">
		jQuery('#brdPager').setPager_info('<%=page%>','<%=strPathInfo%>?x=','<%=intTotalCnt%>','<%=intPreCP%>','<%=intCP%>','<%=intNextCP%>', { nppg : '<%=page_size%>'});
	</script>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
</html>