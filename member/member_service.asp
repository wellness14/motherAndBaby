<!--#include virtual="/common/menu/head.asp"-->
<%
	If uId <> "" Then 
		strSql = ""
		strSql = strSql & " SELECT MS_IDX, MO_SERVICE, MS_TOTAL, MS_REG_DT "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & " WHERE MS_MEM_ID = '"& uId &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
		arrList = Empty
	End If 
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle05-3.jpg" width="770" height="41" /></td>
			</tr> 
			<tr>
				<td width="770" height="120"><img src="/image/text_0084.jpg" /></td>
			</tr>       
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="2">
			<tr>
				<td width="67" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
				<td width="104" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
				<td width="473" bgcolor="#979797" class="white_text"><div align="center">추천서비스 및 기간 </div></td>
				<td width="116" bgcolor="#979797" class="white_text"><div align="center">예상금액</div></td>
			</tr>
		<%
			If IsArray(arrList) Then 
				intTotalCnt = UBound(arrList,2) + 1
				For num=0 To UBound(arrList,2)
					intIDX	= arrList(0,num)
					service	= Replace(Trim(arrList(1,num)),"||",", ")
					total	= FormatNumber(arrList(2,num),0)
					reg_dt	= Replace(Left(arrList(3,num),10),"-",".")
		%>
			<tr>
				<td height="34" bgcolor="#ebebeb"><div align="center"><%=intTotalCnt - num%></div></td>
				<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
				<td bgcolor="#ebebeb" style="padding-left:10px;"><a href="./member_service_view.asp?idx=<%=intIDX%>&<%=strParam%>" class="bbs_list"><%=service%></a></td>
				<td bgcolor="#ebebeb"><div align="center" style="font-weight:bold; color:#000000"><%=total%>원</div></td>
			</tr>
		<%
				Next 
			End If 
		%>
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->	
</body>
</html>
