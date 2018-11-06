<!--#include virtual="/common/menu/head.asp"-->
<%
	Dim service_flg : service_flg = True
	dateToday = Replace(Date(),"-","")
	If uId <> "" Then 
		strTable = " FROM MO_RESERVATION WITH(NOLOCK) "

		strWhere = " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& uId &"' "

		strSql = ""
		strSql = strSql & "	SELECT TOP 1 * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		strSql = strSql & " ORDER BY MR_IDX DESC "
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			mem_id		= Rs(1)
			mem_nm		= Rs(2)
			birth		= Rs(3)
			phone		= Rs(4)
			hp			= Rs(5)
			post		= Rs(6)
			addr_1		= Rs(7)
			addr_2		= Rs(8)
			service		= Rs(9)
			period		= Rs(10)
			service_type= Rs(11) 
			childbirth	= Rs(12)
			serviceSdt	= Rs(13)
			serviceEdt	= Rs(14)
			clinic		= Rs(15)
			exper		= Rs(16)
			unique		= Rs(17)
			family		= Rs(18)
			payment		= Rs(19)
			payType		= Rs(20)
			payState	= Rs(21)
			payEdt		= Rs(22)
			content		= Rs(23)
			reg_dt		= Replace(Left(Rs(25),10),"-","")

			If dateToday > serviceEdt Then 
				service_flg = False
			End If 
		Else 
			response.Write "<script type='text/javascript'>alert('예약 내용이 존재하지 않습니다.');location.href='/index.asp';</script>"
			response.End 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='/member/login.asp?mOne=6&mTwo=1';</script>"
		response.End 
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
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle05-2.jpg" /></td>
			</tr>
			<tr>
				<td width="770" style="padding-top:40px; padding-bottom:20px;"><img src="/image/text_0071.jpg" /><spacer type="block"></td>
			</tr>  
			<tr>
				<td width="770" bgcolor="#eee8ea" style="font-size:15px; padding-top:15px; padding-bottom:15px; padding-left:25px; line-height:20px;"><span style="font-weight:bold; color:#000000;"><%=mem_nm%></span>님의 분만(예정)일은 <span style="font-weight:bold; color:#000000;"><%=date_service(childbirth)%>이며</span>,<br />
				현재 마더앤베이비 <span style="font-weight:bold; color:#000000;"><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></span> 서비스가 <span style="font-weight:bold; color:#000000;"><%If service_flg = True Then%>예약되었습니다<%Else%>종료되었습니다<%End If%>.</span></td>
			</tr>  
			<tr>
				<td width="770" style="padding-top:40px; padding-bottom:20px;"><img src="/image/text_0072.jpg" /><spacer type="block"></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="5" cellspacing="2">
			<tr>
				<td width="233" height="30" bgcolor="#c8b1b9"><div align="center" style="font-size:14px; font-weight:bold; color:#FFFFFF">구분</div></td>
				<td width="511" bgcolor="#c8b1b9"><div align="center" style="font-size:14px; font-weight:bold; color:#FFFFFF">내용</div></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:14px; font-weight:bold;"><div align="center">서비스 유형</div></td>
				<td bgcolor="#eee8ea" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></div></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:14px; font-weight:bold;"><div align="center">서비스 기간 </div></td>
				<td bgcolor="#e7dce0" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=date_service(serviceSdt)%> ~ <%=date_service(serviceEdt)%></div></td>
			</tr>		
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:14px; font-weight:bold;"><div align="center">신청일</div></td>
				<td bgcolor="#eee8ea" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=date_service(reg_dt)%></div></td>
			</tr>
			<% If payment <> "" Then %>
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:14px; font-weight:bold;"><div align="center">선금</div></td>
				<td bgcolor="#e7dce0" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=formatnumber(payment,0)%>원</div></td>
			</tr>
			<% End If %>
			<% If payType <> "" Then %>
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:14px; font-weight:bold;"><div align="center">수단</div></td>
				<td bgcolor="#eee8ea" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=payType%></div></td>
			</tr>
			<% End If %>
			<% If payEdt <> "" Then %>
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:14px; font-weight:bold;"><div align="center">결제일</div></td>
				<td bgcolor="#e7dce0" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=date_service(payEdt)%></div></td>
			</tr>
			<% End If %>
			<% If payState <> "" Then %>
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:14px; font-weight:bold;"><div align="center">결제여부</div></td>
				<td bgcolor="#eee8ea" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=payState%></div></td>
			</tr>
			<% End If %>
			<% If content <> "" Then %>
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:14px; font-weight:bold;"><div align="center">상담내용</div></td>
				<td bgcolor="#eee8ea" style="font-size:14px; font-weight:bold; color:#000000"><div align="center"><%=content%></div></td>
			</tr>
			<% End If %>
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
</html>
