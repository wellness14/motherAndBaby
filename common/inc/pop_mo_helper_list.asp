<!--#include virtual="/common/menu/head.asp"-->
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
	Function dateConvert(value1, value2)
		If value1 = "" And value2 = "" Then
			dateConvert = "-"
		ElseIf value1 <> "" And value2 = "" Then
			dateConvert = Left(value1, 4) & "-" & Mid(value1, 5, 2) & "-" & Right(value1, 2)
		ElseIf value1 = "" And value2 <> "" Then
			dateConvert = Left(value2, 4) & "-" & Mid(value2, 5, 2) & "-" & Right(value2, 2)
		ElseIf value1 <> "" And value2 <> "" Then
			dateConvert = Left(value1, 4) & "-" & Mid(value1, 5, 2) & "-" & Right(value1, 2) & " ~ " & Left(value2, 4) & "-" & Mid(value2, 5, 2) & "-" & Right(value2, 2)
		End If
	End Function

	Function depositConvert(value1, value2)
		If value1 = "" Then
			depositConvert = "-"
		Else
			value1 = value1 * 0.8

			If value2 <> "베이직" And value2 <> "프리미엄" And value2 <> "VIP" Then
				value1 = value1 + 100000 + 35000 + 70000
			End If

			depositConvert = FormatNumber(Replace(value1, ",", ""), 0)
		End If
	End Function

	Function etcConvert(value1, value2)
		If value1 = "" Then
			etcConvert = "-"
		Else
			value1 = value1 * 0.2

			If value2 <> "베이직" And value2 <> "프리미엄" And value2 <> "VIP" Then
				value1 = value1 + 100000 + 35000 + 70000
			End If

			etcConvert = FormatNumber(Replace(value1, ",", ""), 0)
		End If
	End Function

	Function payConvert(value1, value2, value3)
		If value2 = "" Or value3 = "" Then
			payConvert = "-"
		Else
			mspYear = Left(value2, 4)
			mspDeposit = Replace(value3, ",", "")

			sql = "SELECT MSP_PAY FROM MO_SERVICE_PRICE WHERE MSP_DEPOSIT = '" & mspDeposit & "' AND MSP_START_DATE <= '" & value2 & "' AND ISNULL(MSP_END_DATE, CONVERT(INT, GETDATE(), 112)) >= '" & value2 & "'"

			Set RsPay = DBExec(sql,"main")
			
			mspPay = 0

			If Not RsPay.EOF Then
				mspPay = RsPay(0)
			End If

			Call DBClose(RsPay)  

			If mspPay > 0 Then
				payConvert = FormatNumber(mspPay, 0)
			Else
				payConvert = "-"
			End If
		End If
	End Function

	mo_helper_name		= Trim(fncRequest("mo_helper_name"))
'---------------------------------------------------------
'	Request
'	Dim page_size : page_size = 10 
	page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "mo_helper_name=" & mo_helper_name
'---------------------------------------------------------

	'본사 내용만 보이게 예외처리 - 2016.03.17
	If grpcd = "10000" Then
		grpcd = 1
	End If

	strTable = strTable & " FROM	MO_HELPER  A  LEFT OUTER JOIN MO_HELPER_SERVICE B  ON A.MD_HELPER_SEQ = B.MD_HELPER_SEQ  LEFT OUTER JOIN MO_RESERVATION C  ON B.MR_IDX = C.MR_IDX where MD_HELPER_NAME like '%"& mo_helper_name &"%' and  MD_HELPER_LOCAL='"& grpcd &"'"

	strTable_cnt = strTable_cnt & " FROM MO_HELPER  A  LEFT OUTER JOIN MO_HELPER_SERVICE B  ON A.MD_HELPER_SEQ = B.MD_HELPER_SEQ  LEFT OUTER JOIN MO_RESERVATION C  ON B.MR_IDX = C.MR_IDX where MD_HELPER_NAME like '%"& mo_helper_name &"%' and  MD_HELPER_LOCAL='"& grpcd &"'"
%>
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
	<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
			<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
	<tr>
		<td align="center"><strong><h2>산후도우미 관리사 서비스이력조회</h2></strong></td>
	</tr>
	</table>
	<table class="tb_style02">
		<tr>
			<th style="text-align:center;">관리사명</th>
			<th style="text-align:center;">고객명</th>
			<th style="text-align:center;">서비스명</th>
			<th style="text-align:center;">근로계약기간</th>
			<th style="text-align:center;">임금</th>
			<th style="text-align:center;">소개요금</th>
			<th style="text-align:center;">부가서비스</th>
		</tr>
<%
			strSql = ""
			strSql = strSql & " SELECT COUNT(1) "
			strSql = strSql & strTable_cnt
			'	strSql = strSql & strWhere
			Set Rs1 = DBExec(strSql,"main")
			If Not Rs1.EOF Then 
				intTotalCnt1 = Rs1(0)
			End If 


			strSql = ""
			strSql = strSql & " ;SELECT * FROM ( 					"
			strSql = strSql & " SELECT  *, ROW_NUMBER( ) OVER (ORDER BY  MD_HELPER_NAME ASC) as ROWNUM1  				"
			strSql = strSql & " FROM							"
			strSql = strSql & " (							    "
			strSql = strSql & "	  SELECT						"
			strSql = strSql & "	  A.MD_HELPER_NAME "
			strSql = strSql &" ,  A.MD_HELPER_NEAR						"
			strSql = strSql & "  ,C.MR_MEM_NM				     "
			strSql = strSql & "  ,C.MR_SERVICE			         "
			strSql = strSql & "  ,C.MR_SERVICESDT			     "
			strSql = strSql & "  ,C.MR_SERVICEEDT			     "
			strSql = strSql & "  ,C.MR_PAY_MENT			     "
			strSql = strSql & "  ,C.MR_IDX			     "
			strSql = strSql & "  ,B.MD_HELPER_COMMENT			 "
			strSql = strSql & "  ,A.MD_HELPER_SEQ		      	 "
			strSql = strSql & "  ,A.MD_HELPER_LOCAL	         	 "

			strSql = strSql & strTable
			
			strSql = strSql & "  ) T1 ) T2 "
			strSql = strSql & " 	WHERE MR_IDX IS NOT NULL AND ROWNUM1 > "& startNum &" AND ROWNUM1 <= "& endNum
			strSql = strSql & " 	ORDER BY  MD_HELPER_NAME ASC "

			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then   
				Do Until RS.EOF
				 
	%>
	<tr style="text-align:center;">
		<td><%=Rs(0)%></td>
		<td><a href="/admin/member/member_reser_ins.asp?idx=<%=Rs(7)%>" target="_blank"><%=Rs(2)%></a></td>
		<td><%=Rs(3)%></td>
		<td><%=dateConvert(Rs(4), Rs(5))%></td>
		<td><%=payConvert(Rs(3), Rs(4), Rs(6))%></td>
		<td><%=depositConvert(Rs(6), Rs(3))%></td>
		<td><%=etcConvert(Rs(6), Rs(3))%></td>
	</tr>
<%
				Rs.movenext
			Loop 
		End If 
		Call DBClose(Rs)  
%>
	</table>
	<div id="paging_wrap"></div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt1%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>
