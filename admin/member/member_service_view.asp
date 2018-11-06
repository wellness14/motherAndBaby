<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 나의 맞춤 서비스
'파 일 명 : contact_view.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strSql = ""
		strSql = strSql & " SELECT * "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & "		INNER JOIN MO_MEM_MAS WITH(NOLOCK) ON MS_MEM_ID = MM_MEM_ID "
		strSql = strSql & "		INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MS_MEM_ID = MD_MEM_ID "
		strSql = strSql & " WHERE MS_IDX = '"& intIDX &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mem_id				= Rs(1)
			mem_nm				= Rs(2)
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
			hp					= Rs(44)
			addr1				= Rs(48)
			addr2				= Rs(49)
			
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
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 	  
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
	</style>
</head>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원 관리 > <strong>나의 맞춤 서비스</strong></div>
		<div class="write">
			
			<br />
			<h1>사용자 등록글</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>작성자</th>
				<td><%=mem_nm%>&nbsp;( <%=mem_id%> )</td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><%=hp%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=addr1%>&nbsp;<%=addr2%></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><%=Left(ms_birth,4)%>년 <%=Mid(ms_birth,5,2)%>월 <%=Right(ms_birth,2)%>일</td>
			</tr>
			<tr>
				<th>출산예정일</th>
				<td><%=Left(ms_childbirth,4)%>년 <%=Mid(ms_childbirth,5,2)%>월 <%=Right(ms_childbirth,2)%>일</td>
			</tr>
			<tr>
				<th>결혼기념일</th>
				<td><%=Left(ms_marry,4)%>년 <%=Mid(ms_marry,5,2)%>월 <%=Right(ms_marry,2)%>일</td>
			</tr>
			<tr>
				<th>출산경험</th>	
				<td><%=ms_type1%></td>
			</tr>
			<tr>
				<th>첫아이유무</th>	
				<td><%=ms_type2%></td>
			</tr>
			<tr>
				<th>조리원이용</th>	
				<td><%=ms_type3%></td>
			</tr>
			<tr>
				<th>분만형태</th>	
				<td><%=ms_type4%></td>
			</tr>
			<tr>
				<th>직장유무</th>	
				<td><%=ms_type5%></td>
			</tr>
			<tr>
				<th>현재주수</th>	
				<td><%=ms_txt1%>주</td>
			</tr>
			<tr>
				<th>키</th>	
				<td><%=ms_txt2%>cm</td>
			</tr>
			<tr>
				<th>임신 전 몸무게</th>	
				<td><%=ms_txt3%>kg</td>
			</tr>
			<tr>
				<th>현재 몸무게</th>	
				<td><%=ms_txt4%>kg</td>
			</tr>
			<tr>
				<th>선택 서비스</th>	
				<td>산모님의 건강한 산후조리를 마더앤베이비가 함께하겠습니다.<br />
				산모님께는 <span style="color:#ff015a; font-weight:bold;"><%=Replace(mo_service,"||",", ")%></span> 프로그램이 적합하시며, <br />
				<span style="color:#ff015a; font-weight:bold;">서비스요금은 <%=FormatNumber(mo_charge,0)%>원</span>입니다.<br /><br />
				또한, 추천 부가서비스로는,<span style="color:#ff015a; font-weight:bold;"><%=service_nm%></span>를 권해드립니다.</td>
			</tr>
			<tr>
				<th rowspan="9">추가서비스</th>	
				<td>산후마사지 : <%=ms_sel1%>회</td>
			</tr>
			<tr>
				<td>베이비시터 : 상담신청</td>
			</tr>
			<tr>
				<td>한방관리 : <%If ms_sel2 = "Y" Then%>선택<%Else%>선택안함<%End If%></td>
			</tr>
			<tr>
				<td>모유수유마사지 : <%If ms_sel3 = "Y" Then%>선택<%Else%>선택안함<%End If%></td>
			</tr>
			<tr>
				<td>다이어트 식단관리 : <%If ms_sel4 = "Y" Then%>선택<%Else%>선택안함<%End If%></td>
			</tr>
			<tr>
				<td>모유분석프로그램 : <%If ms_sel5 = "Y" Then%>선택<%Else%>선택안함<%End If%></td>
			</tr>
			<tr>
				<td>아기맞이청소 : 상담신청</td>
			</tr>
			<tr>
				<td>상담신청 : 상담신청</td>
			</tr>
			<tr>
				<td>아기맞이소독 : <%If ms_sel6 = "Y" Then%>선택<%Else%>선택안함<%End If%></td>
			</tr>
			<tr>
				<th>최종 금액</th>	
				<td>산모님의 산후조리서비스 최종적인 예상비용은 <span style="color:#ff015a; font-weight:bold;"> <%=FormatNumber(ms_total,0)%>원</span>입니다.</td>
			</tr>
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<!--input type="button" value="삭 제" id="btnDelte" class="button"-->&nbsp;&nbsp;&nbsp;
						<input type="button" value="목 록" class="button" onClick="location.href='./member_service.asp?<%=strLnkUrl%>';">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var del	= jQuery('#btnDelte');

		del.click(function(){
			if (confirm("삭제 하시겠습니까?")) {
				jQuery('#ifrm').attr({'src':'/comp/comp_06_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>
</html>