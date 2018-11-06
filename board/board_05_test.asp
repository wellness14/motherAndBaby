<!--#include virtual="/common/menu/head.asp"-->
<%
	brd_id = "EVENT"

'--------------------------------------------------------------------------
'	이벤트 리스트 호출
	strSql = "SELECT "
	strSql = strSql & "		BA_IDX "
	strSql = strSql & "		,BA_TITLE "
	strSql = strSql & "		,BA_SEC_FLG "
	strSql = strSql & "		,BA_STD_SDT "
	strSql = strSql & "		,BA_STD_EDT "
	strSql = strSql & "		,BA_FILE_NM "
	strSql = strSql & "		,BA_FILE_PATH "
	strSql = strSql & "FROM MO_BRD_EVENT WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' AND BA_FILE_PATH !='' "
	strSql = strSql & "ORDER BY BA_IDX DESC "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrEventList = Rs.getRows()
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
					<td style="padding-top:40px;"><img src="/image/sub04_subtitle05.jpg" width="770" height="44" /></td>
				</tr>
				<tr>
					<td height="40px;"><!--img src="/image/text_0055.jpg" width="143" height="22" /--></td>
				</tr>
			</table>

			<table width="769" border="0" align="center" cellpadding="0" cellspacing="0">
		<%
			Dim strEventList : strEventList = ""
			Dim strImg : strImg = ""
			Dim strTxt : strTxt = ""
			Dim arrFilePath : arrFilePath = Null
			If IsArray(arrEventList) Then 
				intTotalCnt = UBound(arrEventList,2)
				For num = 0 To intTotalCnt
				'------------------------------------------------
				'	이미지 영역
					idx			= Trim(arrEventList(0,num))
					title		= Trim(arrEventList(1,num))
					sdate		= Replace(arrEventList(3,num),"-",".")
					edate		= Replace(arrEventList(4,num),"-",".")
					file_path	= arrEventList(6,num)
					If file_path <> "" Then arrFilePath = Split(file_path,"||")

					If num <> 0 And num Mod 3 = 0 Then 
						strEventList = strEventList & "<tr>"
						strEventList = strEventList & "		<td width='769' bgcolor='#FFFFFF'>"
						strEventList = strEventList & "			<table width='255' border='0' cellpadding='0' cellspacing='1' bgcolor='#e0e0e0'>"
						strEventList = strEventList & "			<tr>" & strImg &"</tr>" 
						strEventList = strEventList & "			<tr>" & strTxt &"</tr>"
						strEventList = strEventList & "			</table>"
						strEventList = strEventList & "		</td> "
						strEventList = strEventList & "</tr>"

						strImg = ""
						strTxt = ""
					End If 
					strImg =  strImg & "<td width='255' bgcolor='#FFFFFF'><img src='/upload_file/file/"& arrFilePath(0) &"' width='255' height='178' border='0' onclick=fncView('N','"& idx &"',''); style='cursor:pointer;'/></td>"

					strTxt =  strTxt & "<td bgcolor='#f4f4f4' style='padding: 15px 15px 15px 15px;' class='event_text'>"& title &"<br />"
					strTxt =  strTxt & "<span class='event_text_1'>"& sdate &"~"& edate &"</span></td>"
				'------------------------------------------------

				'------------------------------------------------
				'	텍스트 영역
				'------------------------------------------------
				Next 
				strEventList = strEventList & "<tr>"
				strEventList = strEventList & "		<td width='769' bgcolor='#FFFFFF'>"
				strEventList = strEventList & "			<table width='255' border='0' cellpadding='0' cellspacing='1' bgcolor='#e0e0e0'>"
				strEventList = strEventList & "			<tr>" & strImg &"</tr>" 
				strEventList = strEventList & "			<tr>" & strTxt &"</tr>"
				strEventList = strEventList & "			</table>"
				strEventList = strEventList & "		</td> "
				strEventList = strEventList & "</tr>"
				response.Write strEventList
			End If 
		%>
			</table>
			<p style="margin-top:50px;">
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
</html>
