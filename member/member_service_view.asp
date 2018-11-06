<!--#include virtual="/common/menu/head.asp"-->
<%
	intIDX = fncRequest("idx")
	If intIDX <> "" Then 
		strSql = ""
		strSql = strSql & " SELECT * "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & " WHERE MS_IDX = '"& intIDX &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			ms_birth			= Rs(3)
			ms_childbirth		= Rs(4)
			ms_marry			= Rs(5)
			ms_type1			= Rs(6)
			ms_type2			= Rs(7)
			ms_type3			= Rs(8)
			ms_type4			= Rs(9)
			ms_type5			= Rs(10)
			ms_txt1				= Rs(11)
			ms_txt2				= Rs(12)
			ms_txt3				= Rs(13)
			ms_txt4				= Rs(14)
			ms_sel1				= Rs(15)
			ms_sel2				= Rs(16)
			ms_sel3				= Rs(17)
			ms_sel4				= Rs(18)
			ms_sel5				= Rs(19)
			ms_sel6				= Rs(20)
			ms_total			= Rs(22)
			mo_idx				= Rs(25)
			mo_service			= Rs(33)
			mo_charge			= Rs(34)

			strSql = " SELECT MS_SERVICE_NM FROM MO_SERVICE_LINK A WITH(NOLOCK) "
			strSql = strSql & " 	INNER JOIN MO_SERVICE_NM B WITH(NOLOCK) ON A.MS_IDX = B.MS_IDX "
			strSql = strSql & " WHERE MO_IDX='"& mo_idx &"' "
			strSql = strSql & " ORDER BY A.MS_IDX ASC "
			Set Rs1 = DBExec(strSql,"main")
			If Not Rs1.EOF Then 
				Do Until Rs1.EOF
					If service_nm <> "" Then service_nm = service_nm & ","
					service_nm = service_nm & Rs1(0)
					Rs1.movenext
				Loop
			End If 
		End If 
		Call RSClose(Rs)
	Else 
		response.redirect "./member_service.asp?" & strParam
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
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle05-3.jpg" width="770" height="41" /></td>
			</tr> 
			<tr>
				<td width="770" height="60"><div align="right"><a href="#"><img src="/image/bt_0031.jpg" border="0" /></a></div></td>
			</tr>       
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="#f6f6f6" style="padding-top:20px; padding-bottom:20px;">
					<table width="750" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="203" height="60"><img src="/image/text_0057.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=Left(ms_birth,4)%>년 <%=Mid(ms_birth,5,2)%>월 <%=Right(ms_birth,2)%>일</span></td>
					</tr>
					<tr>
						<td width="203" height="60"><img src="/image/text_0069.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=Left(ms_childbirth,4)%>년 <%=Mid(ms_childbirth,5,2)%>월 <%=Right(ms_childbirth,2)%>일</span></td>
					</tr>
					<tr>
						<td width="203" height="60"><img src="/image/text_0068.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=Left(ms_marry,4)%>년 <%=Mid(ms_marry,5,2)%>월 <%=Right(ms_marry,2)%>일</span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0058.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=ms_type1%></span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0059.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=ms_type2%></span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0060.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=ms_type3%></span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0070.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=ms_type4%></span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0061.jpg" /></td>
						<td colspan="2"><span style="font-weight:bold; color:#000000">: <%=ms_type5%></span></td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0062.jpg" /></td>
						<td width="102"><span style="font-weight:bold; color:#000000">: <%=ms_txt1%>주</span></td>
						<td width="405">
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0주</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">40주</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0063.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000">: <%=ms_txt2%>cm</span></td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">1m</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">2m</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0064.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000">: <%=ms_txt3%>kg</span></td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0065.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000">: <%=ms_txt4%>kg</span></td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
						</td>
					</tr>
					</table>	
				</td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="60" colspan="2"><img src="/image/img_0010.jpg" width="770" height="7" /></td>
			</tr>
			<tr>
				<td width="179" height="180" bgcolor="#f6f6f6"><div align="center"><img src="/image/img_0011.jpg" /></div></td>
				<td width="591" bgcolor="#f6f6f6" style="font-size:15px; color:#000000">산모님의 건강한 산후조리를 마더앤베이비가 함께하겠습니다.<br />
				산모님께는 <span style="color:#ff015a; font-weight:bold;"><%=Replace(mo_service,"||",", ")%></span> 프로그램이 적합하시며, <br />
				<span style="color:#ff015a; font-weight:bold;">서비스요금은 <%=FormatNumber(mo_charge,0)%>원</span>입니다.<br />
				<br />
				또한, 추천 부가서비스로는,<br />
				<span style="color:#ff015a; font-weight:bold;"><%=service_nm%></span>를 권해드립니다.</td>
			</tr>
			<tr>
				<td height="70" colspan="2"><span style="font-size:15px; color:#000000; font-weight:bold;">* 추가서비스 </span></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-top:15px; padding-bottom:15px;">
					<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="163" height="50"><img src="/image/text_0074.jpg" /></td>
						<td width="188"><span style="font-weight:bold; color:#000000"><%=ms_sel1%>회</span></td>
						<td width="161"><img src="/image/text_0079.jpg" /></td>
						<td width="188"><span style="font-weight:bold; color:#000000">상담신청</span></td>
					</tr>
					<tr>
						<td height="50"><img src="/image/text_0075.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000"><%If ms_sel2 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td><img src="/image/text_0080.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000"><%If ms_sel3 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
					</tr>
					<tr>
						<td height="50"><img src="/image/text_0076.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000"><%If ms_sel4 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td><img src="/image/text_0081.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000"><%If ms_sel5 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
					</tr>
					<tr>
						<td height="50"><img src="/image/text_0077.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000">상담신청</span></td>
						<td><img src="/image/text_0082.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000">상담신청</span></td>
					</tr>
					<tr>
						<td height="50"><img src="/image/text_0078.jpg" /></td>
						<td><span style="font-weight:bold; color:#000000"><%If ms_sel6 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="60" colspan="2"><img src="/image/img_0010.jpg" width="770" height="7" /></td>
			</tr>
			<tr>
				<td width="66" bgcolor="#f6f6f6"><img src="/image/img_0012.jpg" width="72" height="68" /></td>
				<td width="704" bgcolor="#f6f6f6" style="font-size:15px; color:#000000; font-weight:bold;"><div align="center">산모님의 산후조리서비스 최종적인 예상비용은 <span style="color:#ff015a; font-weight:bold;"> <%=FormatNumber(ms_total,0)%>원</span>입니다.</div></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-bottom:50px; padding-top:30px;"><div align="right"><a href="./member_service.asp?<%=strParam%>"><img src="/image/bt_0031.jpg" border="0" /></a></div></td>
			</tr>		
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript">
	var txtImg = jQuery(".txtImg");
	function fncSetbar(num, val){
		if (num ==0){
			if (val > 40){ val = 40; }
			val = val * 7.5;
		}else{
			if (val > 200){ val = 200; }
			val = val * 1.5;
		}
		txtImg.eq(num).attr({"width":val});
	}

	jQuery(document).ready(function(){
		fncSetbar(0, "<%=ms_txt1%>");
		fncSetbar(1, "<%=ms_txt2%>");
		fncSetbar(2, "<%=ms_txt3%>");
		fncSetbar(3, "<%=ms_txt4%>");
	});
</script>
</html>
