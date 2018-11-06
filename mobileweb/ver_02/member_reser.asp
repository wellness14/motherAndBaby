<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 
	menuCode1 = "10000" 
	menuCode2 = "B"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">예약</span> <span style="color:#919194;">확인</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<%
			Dim service_flg : service_flg = True
			dateToday = Replace(Date(),"-","")
			If uid <> "" Then 
				strTable = " FROM MO_RESERVATION WITH(NOLOCK) "

				strWhere = " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& uid &"' "

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
					response.Write "<script type='text/javascript'>alert('예약 내용이 존재하지 않습니다.');location.href='/mobileweb/ver_02/';</script>"
					response.End 
				End If 
				Call RSClose(Rs)
			Else 
				response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='/mobileweb/ver_02/login.asp';</script>"
				response.End 
			End If
		%>

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:13px; padding-bottom:20px; text-align:left;"><img src="/mobileweb/html/images/text_0071.jpg" /></td>
			</tr>  
			<tr>
				<td bgcolor="#eee8ea" style="font-size:12px; padding-top:15px; padding-bottom:15px; padding-left:18px; line-height:20px; text-align:left;"><span style="font-weight:bold; color:#000000;"><%=mem_nm%></span>님의 분만(예정)일은 <span style="font-weight:bold; color:#000000;"><%=date_service(childbirth)%>이며</span>,<br />
				현재 마더앤베이비 <span style="font-weight:bold; color:#000000;"><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></span> <br/>서비스가 <span style="font-weight:bold; color:#000000;"><%If service_flg = True Then%>예약되었습니다<%Else%>종료되었습니다<%End If%>.</span></td>
			</tr>  
		</table>

		<table width="100%" border="0" align="center" cellpadding="5" cellspacing="2" style="padding-bottom:20px;">
			<tr>
				<td style="padding-top:40px; padding-bottom:20px; text-align:left;"><img src="/mobileweb/html/images/text_0072.jpg" /></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#c8b1b9"><div align="center" style="font-size:12px; font-weight:bold; color:#FFFFFF">구분</div></td>
				<td bgcolor="#c8b1b9"><div align="center" style="font-size:12px; font-weight:bold; color:#FFFFFF">내용</div></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:12px; font-weight:bold;"><div align="center">서비스 유형</div></td>
				<td bgcolor="#eee8ea" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></div></td>
			</tr>
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:12px; font-weight:bold;"><div align="center">서비스 기간 </div></td>
				<td bgcolor="#e7dce0" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=date_service(serviceSdt)%> ~ <%=date_service(serviceEdt)%> </div></td>
			</tr>		
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:12px; font-weight:bold;"><div align="center">신청일</div></td>
				<td bgcolor="#eee8ea" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=date_service(reg_dt)%> </div></td>
			</tr>
			
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:12px; font-weight:bold;"><div align="center">선금</div></td>
				<td bgcolor="#e7dce0" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=formatnumber(payment,0)%>원</div></td>
			</tr>
			
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:12px; font-weight:bold;"><div align="center">수단</div></td>
				<td bgcolor="#eee8ea" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=payType%></div></td>
			</tr>
			
			<tr>
				<td height="30" bgcolor="#e7dce0" style="font-size:12px; font-weight:bold;"><div align="center">결재일</div></td>
				<td bgcolor="#e7dce0" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=date_service(payEdt)%></div></td>
			</tr>
			
			<tr>
				<td height="30" bgcolor="#eee8ea" style="font-size:12px; font-weight:bold;"><div align="center">결재여부</div></td>
				<td bgcolor="#eee8ea" style="font-size:12px; font-weight:bold; color:#000000"><div align="left"><%=payState%></div></td>
			</tr>
			
		</table>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>