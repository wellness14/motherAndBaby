<!--#include virtual="/common/menu/head.asp"-->
<%
	brd_id = "PRAISE"

	page = fncRequest("page")
	If page = "" Then page = 1
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

'--------------------------------------------------------------------------
'	칭찬합시다 리스트 호출
	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_PRAISE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' "
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
	strSql = strSql & "			,BA_DPH "
	strSql = strSql & "			,BA_PIDX "
	strSql = strSql & "			,BA_MEM_NM  "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT	"
	strSql = strSql & "			,RE_CNT = (SELECT COUNT(1) FROM MO_BRD_CONSULT B WHERE B.BA_PIDX=A.BA_IDX AND B.BA_DPH='2') "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL) BA_LOCAL_NM	"
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL_DETAIL) BA_LOCAL_NM2		"
	strSql = strSql & "		FROM MO_BRD_PRAISE A WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.getRows()
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
				<td style="padding-top:40px;"><img src="/image/sub04_subtitle04.jpg" width="770" height="44" /></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:15px; padding-bottom:15px;"><div align="right"><a href="./board_write.asp?<%=strParam%>"><img src="/image/bt_0011.jpg" width="123" height="36" border="0" /></a></div></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="2">
			<tr>
				<td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
				<td width="69" bgcolor="#979797" class="white_text"><div align="center">지사</div></td>
				<td width="442" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
				<td width="103" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
				<td width="88" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
			</tr>
		<%
			If IsArray(arrList) Then 
				For num=0 To UBound(arrList,2)
					intNum		= intTotalCnt - (page-1) * page_size - num
					ba_idx		= Trim(arrList(0,num))
					ba_dph		= Trim(arrList(1,num))
					ba_pidx		= Trim(arrList(2,num))
					mem_nm		= Trim(arrList(3,num))
					title		= Trim(arrList(4,num))
					sec_flg		= arrList(5,num)
					reg_dt		= Left(arrList(6,num),10)
					re_cnt		= arrList(7,num)
					ba_local_nm   = Trim(arrList(9,num))
					ba_local_nm_real   = Trim(arrList(10,num))
					re_nm = "답변대기"
					If re_cnt > 0 Or ba_dph = 2 Then 
						re_nm = "답변완료"
					End If 

					If ba_dph = 2 Then 
						ba_idx = ba_pidx
					End If 
		%>
			<tr>
				
				<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
				<td bgcolor="#ebebeb"><div align="center"><%=ba_local_nm_real%></div></td>
				<% If ba_dph = "1" Then %>
				<td bgcolor="#ebebeb" style="padding-left:10px;">
				<% Else %>
				<td bgcolor="#e1e1e1" style="padding-left:20px;"><img src="/image/img_0007.jpg" align="absmiddle" />
				<% End If %>
					<a href="#_" onClick="fncView('<%=sec_flg%>','<%=ba_idx%>','<%=intNum%>');" class="bbs_list"><%=title%></a>
				</td>
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
		jQuery('#brdPager').setPager_info('<%=page%>','<%=strPathInfo%>?mOne=4&mTwo=4&x=','<%=intTotalCnt%>','<%=intPreCP%>','<%=intCP%>','<%=intNextCP%>', { nppg : '<%=page_size%>'});
	</script>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
</html>
