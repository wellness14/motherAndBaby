<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_ins.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
<!-- 달력 추가 -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
<!-- -->


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
<%
	Dim mode : mode = "ins"

	
	intIDX = fncRequest("idx")   
	mem_id = fncRequest("mem_id")
	mo_helper_seq = fncRequest("mo_helper_seq1")
    If intIDX <> "" Then
		strTable = " FROM MO_CONTRACT WITH(NOLOCK) "

		strWhere = " WHERE MO_CONTRACT_SEQ = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			company_name		= Rs(1)
			company_post		= Rs(2)
			company_addr1		= Rs(3)
			company_addr2		= Rs(4)
			company_hp			= Rs(5)
			customer_id			= Rs(6)
			customer_nm			= Rs(7)
			customer_post		= Rs(8)
			customer_addr1		= Rs(9)
			customer_addr2		= Rs(10)
			customer_hp			= Rs(11) 
			product_name	= Rs(12)
			constract_date	= Rs(13) '계약일
			constract_tel	= Rs(14)
			constract_type		= Rs(15)
			constract_bank		= Rs(16)
			constract_account		= Rs(17)
			start_date		= Rs(18)
			end_date		= Rs(19)
			product_no		= Rs(20)
			contnent_intro  = Rs(21)
			contnent1		= Rs(22)
			contnent2		= Rs(23)
			contnent3		= Rs(24)
			contnent4_price	= Rs(25)
			contnent4_deposit	= Rs(26)
			contnent4_set	= Rs(27)
			contnent4_out_pay	= Rs(28)
			contnent4_total	= Rs(29)
			contnent4_human = Rs(30)
			now_date    = Rs(31)
			customer_nm2    = Rs(32)
			customer_local    = Rs(33)
			customer_local_detail    = Rs(34)

			arrList = Rs.GetRows()
 
		End If 
		Call RSClose(Rs)
%>
 
<%
 
'------------------------------------------------------------------------------------------------
 If intIDX <> "" Then
 
 End If
'-----------------------------------------------------------------------------------------------
  
 %>

 
 <%

	Else 
		If mem_id <> "" Then 
		'---------------------------------------------------------------------------------
		'	회원 기본정보 조회
			strSql = ""
			strSql = strSql & "	SELECT MM_MEM_NM,MD_PHONE,MD_HP,MD_BIRTH,MD_POST,MD_ADDR1,MD_ADDR2 "
			strSql = strSql & "	FROM MO_MEM_MAS WITH(NOLOCK) "
			strSql = strSql & "		INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
			strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				mem_nm		= Rs(0)
				phone		= Rs(1)
				hp			= Rs(2)
				birth		= Rs(3)
				post		= Rs(4)
				addr_1		= Rs(5)
				addr_2		= Rs(6)
			End If 
			Call RSClose(Rs)
		'---------------------------------------------------------------------------------
		End If 

	End If 



	'-----------------------------------------------------------------------------
'	지점 정보 호출

  If intIDX <> "" Then

	md_local = arrList(33,0)


 
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_nm = Rs(0)
	End If 
	Call RSClose(Rs)

	End If 

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
'-----------------------------------------------------------------------------
'	지점 정보 호출
	md_local = customer_local_detail
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_nm = Rs(0)
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

'---------------------------------------------------------------------------------
'	데이터 확인
	If company_hp <> "" Then 
		arrcompany_hp	= Split(company_hp,"-")
		company_hp_1		= arrcompany_hp(0)
		company_hp_2		= arrcompany_hp(1)
		company_hp_3		= arrcompany_hp(2)
	End If 

	If customer_hp <> "" Then 
		arrcustomer_Hp	= Split(customer_hp,"-")
		customerhp_1	= arrcustomer_Hp(0)
		customerhp_2	= arrcustomer_Hp(1)
		customerhp_3	= arrcustomer_Hp(2)
	End If 

	If constract_tel <> "" Then 
		arrconstract_tel	= Split(constract_tel,"-")
		constract_tel_1	= arrconstract_tel(0)
		constract_tel_2	= arrconstract_tel(1)
		constract_tel_3	= arrconstract_tel(2)
	End If 







	If constract_date <> "" Then 
		Mbirth = Mid(constract_date,5,2)
		If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
		Dbirth = Right(constract_date,2)
		If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
	End If 


	If start_date <> "" Then 
		Mdate = Mid(start_date,5,2)
		If Mdate < 10 Then Mdate = Right(Mdate,1)
		Ddate = Right(start_date,2)
		If Ddate < 10 Then Ddate = Right(Ddate,1)
	End If 


	If end_date <> "" Then 
		end_Mdate = Mid(end_date,5,2)
		If end_Mdate < 10 Then end_Mdate = Right(end_Mdate,1)
		end_Ddate = Right(end_date,2)
		If end_Ddate < 10 Then end_Ddate = Right(end_Ddate,1)
	End If 






	If childbirth <> "" Then 
		Mchildbirth = Mid(childbirth,5,2)
		If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
		Dchildbirth = Right(childbirth,2)
		If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
	End If 

	If serviceSdt <> "" Then 
		MserviceSdt = Mid(serviceSdt,5,2)
		If MserviceSdt < 10 Then MserviceSdt = Right(MserviceSdt,1)
		DserviceSdt = Right(serviceSdt,2)
		If DserviceSdt < 10 Then DserviceSdt = Right(DserviceSdt,1)
	End If 

	If serviceEdt <> "" Then 
		MserviceEdt = Mid(serviceEdt,5,2)
		If MserviceEdt < 10 Then MserviceEdt = Right(MserviceEdt,1)
		DserviceEdt = Right(serviceEdt,2)
		If DserviceEdt < 10 Then DserviceEdt = Right(DserviceEdt,1)
	End If 

	If payEdt <> "" Then 
		MpayEdt = Mid(payEdt,5,2)
		If MpayEdt < 10 Then MpayEdt = Right(MpayEdt,1)
		DpayEdt = Right(payEdt,2)
		If DpayEdt < 10 Then DpayEdt = Right(DpayEdt,1)
	End If 


	If serviceSdt_1 <> "" Then 
		MserviceSdt_1 = Mid(serviceSdt_1,5,2)
		If MserviceSdt_1 < 10 Then MserviceSdt_1 = Right(MserviceSdt_1,1)
		DserviceSdt_1 = Right(serviceSdt_1,2)
		If DserviceSdt_1 < 10 Then DserviceSdt_1 = Right(DserviceSdt_1,1)
	End If 

	If serviceEdt_1 <> "" Then 
		MserviceEdt_1 = Mid(serviceEdt_1,5,2)
		If MserviceEdt_1 < 10 Then MserviceEdt_1 = Right(MserviceEdt_1,1)
		DserviceEdt_1 = Right(serviceEdt_1,2)
		If DserviceEdt_1 < 10 Then DserviceEdt_1 = Right(DserviceEdt_1,1)
	End If 


	If serviceSdt_2 <> "" Then 
		MserviceSdt_2 = Mid(serviceSdt_2,5,2)
		If MserviceSdt_2 < 10 Then MserviceSdt_2 = Right(MserviceSdt_2,1)
		DserviceSdt_2 = Right(serviceSdt_2,2)
		If DserviceSdt_2 < 10 Then DserviceSdt_2 = Right(DserviceSdt_2,1)
	End If 

	If serviceEdt_2 <> "" Then 
		MserviceEdt_2 = Mid(serviceEdt_2,5,2)
		If MserviceEdt_2 < 10 Then MserviceEdt_2 = Right(MserviceEdt_2,1)
		DserviceEdt_2 = Right(serviceEdt_2,2)
		If DserviceEdt_2 < 10 Then DserviceEdt_2 = Right(DserviceEdt_2,1)
	End If 

	If serviceSdt_3 <> "" Then 
		MserviceSdt_3 = Mid(serviceSdt_3,5,2)
		If MserviceSdt_3 < 10 Then MserviceSdt_3 = Right(MserviceSdt_3,1)
		DserviceSdt_3 = Right(serviceSdt_3,2)
		If DserviceSdt_3 < 10 Then DserviceSdt_3 = Right(DserviceSdt_3,1)
	End If 

	If serviceEdt_3 <> "" Then 
		MserviceEdt_3 = Mid(serviceEdt_3,5,2)
		If MserviceEdt_3 < 10 Then MserviceEdt_3 = Right(MserviceEdt_3,1)
		DserviceEdt_3 = Right(serviceEdt_3,2)
		If DserviceEdt_3 < 10 Then DserviceEdt_3 = Right(DserviceEdt_3,1)
	End If 

	NowDate = Date()    '2011-07-08

		If NowDate <> "" Then 
		arrNowDate	= Split(NowDate,"-")
		NowDate_1		= arrNowDate(0)
		NowDate_2		= arrNowDate(1)
		NowDate_3		= arrNowDate(2)
		End If 

'------달력추가로 수정--------------------------------------------------
	
	If constract_date <> "" Then 
		constract_date_m = Mid(constract_date,5,2)
		constract_date_d = Right(constract_date,2)
		constract_date_ymd = Left(constract_date,4) & "-" & constract_date_m & "-" & constract_date_d

		If constract_date_ymd = "--" Then
			constract_date_ymd = ""
		End If
	End If

	If start_date <> "" then
		start_date_m = Mid(start_date,5,2)
		start_date_d = Right(start_date,2)
		start_date_ymd = Left(start_date,4) & "-" & start_date_m & "-" & start_date_d

		If start_date_ymd = "--" Then
			start_date_ymd = ""
		End If
	End If
	
	If end_date <> "" Then 
		end_date_m = Mid(end_date,5,2)
		end_date_d = Right(end_date,2)
		end_date_ymd = Left(end_date,4) & "-" & end_date_m & "-" & end_date_d

		If end_date_ymd = "--" Then
			end_date_ymd = ""
		End If
	End If 

'-------달력 추가로 수정----------------------------------------------------



'---------------------------------------------------------------------------------	
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>임대차 계약서</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>임대인</th>
				<td><input type="text" id="company" name="company" size="20" value="웰니스인텔리전스" valid="E|A=임대인을 입력해 주세요">
				</td>
			</tr>
			
			<tr>
				<th>임대인 연락처</th>
				<td>
					<select name="hp_11" id="hp_11" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="02">02</option>
						<option value="010" <%=fncSetSelectBox("010",company_hp_1)%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",company_hp_1)%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",company_hp_1)%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",company_hp_1)%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",company_hp_1)%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",company_hp_1)%>>019</option>
						<option value="02" <%=fncSetSelectBox("02",company_hp_1)%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",company_hp_1)%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",company_hp_1)%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",company_hp_1)%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",company_hp_1)%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",company_hp_1)%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",company_hp_1)%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",company_hp_1)%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",company_hp_1)%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",company_hp_1)%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",company_hp_1)%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",company_hp_1)%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",company_hp_1)%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",company_hp_1)%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",company_hp_1)%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",company_hp_1)%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",company_hp_1)%>>070</option>
					</select>
					-
					<input type="text" name="hp_22" id="hp_22" size="5" maxlength="4" value="557" valid="E|A=핸드폰번호를 입력해 주세요"/>
					-
					<input type="text" name="hp_33" id="hp_33" size="5" maxlength="4" value="3579" valid="E|A=핸드폰번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="post_11" id="post_11" class="textarea" size="5" maxlength="3" value="138" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text" name="post_22" id="post_22" class="textarea" size="5" maxlength="3" value="240" valid="E|A=우편번호를 입력해 주세요"/>

					<input type="text" name="addr_11" id="addr_11" class="textarea" size="60" value="서울특별시 강남구 역삼동 혜림빌딩 4층" valid="E|A=주소를 입력해 주세요"/>
					<input type="text" name="addr_22" id="addr_22" class="textarea" size="35" value="736-38" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>임차인</th>
				<td><input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=customer_nm%>"   onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="임차인명으로 아이디 검색" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>회원ID</th>
				<td>
					<input type="text" id="mem_id" name="mem_id" size="20" value="<%=customer_id%>" valid="E|M=10|A=회원ID를 입력해 주세요">
					<!--<input type="button" value="회원정보 조회" id="btnMem">-->
				</td>
			</tr>

		<!--	
			<tr>
				<th>임차인</th>
				<td><input type="text" id="im_cha_name" name="im_cha_name" size="20" value="<%=pay_name%>" valid="E|A=임차인 성명을 입력해 주세요">
				</td>
			</tr>
		-->

			<tr>
				<th>임차인 연락처</th>
				<td>
					<select name="hp_1" id="hp_1" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",customerhp_1)%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",customerhp_1)%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",customerhp_1)%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",customerhp_1)%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",customerhp_1)%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",customerhp_1)%>>019</option>
						<option value="02" <%=fncSetSelectBox("02",customerhp_1)%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",customerhp_1)%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",customerhp_1)%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",customerhp_1)%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",customerhp_1)%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",customerhp_1)%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",customerhp_1)%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",customerhp_1)%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",customerhp_1)%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",customerhp_1)%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",customerhp_1)%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",customerhp_1)%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",customerhp_1)%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",customerhp_1)%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",customerhp_1)%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",customerhp_1)%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",customerhp_1)%>>070</option>
					</select>
					-
					<input type="text" name="hp_2" id="hp_2" size="5" maxlength="4" value="<%=customerhp_2%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
					-
					<input type="text" name="hp_3" id="hp_3" size="5" maxlength="4" value="<%=customerhp_3%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>임차인 주소</th>
				<td>
					<input type="text" name="post_1" id="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(customer_post,3)%>" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text" name="post_2" id="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(customer_post,3)%>" valid="E|A=우편번호를 입력해 주세요"/>

					<input type="text" name="addr_1" id="addr_1" class="textarea" size="60" value="<%=customer_addr1%>" valid="E|A=주소를 입력해 주세요"/>
					<input type="text" name="addr_2" id="addr_2" class="textarea" size="35" value="<%=customer_addr2%>" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>

			<tr>
				<th>계약물품</th>
				<td><input type="text" id="contract_product" name="contract_product" size="20" value="전동식 유축기" valid="E|A=계약물품을 입력해 주세요">
				</td>
			</tr>
			<tr>
				<th>계약일</th>
				<td>
				<input type="text" id="datepicker" name="constract_date" value="<%=constract_date_ymd%>"> 
				<!--
					<select name="contract_date_y"  id="contract_date_y" valid="E|A=계약년월일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(constract_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="contract_date_m"  id="contract_date_m"  valid="E|A=계약년월일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mbirth)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="contract_date_d"  id="contract_date_d" valid="E|A=계약년월일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dbirth)%>><%=num%></option>
					<% Next %>
					</select>
					-->
				</td>
			</tr>
			<tr>
				<th>전화</th>
				<td>
					<select name="tel_1" id="tel_1" valid="E|A=전화번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",constract_tel_1)%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",constract_tel_1)%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",constract_tel_1)%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",constract_tel_1)%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",constract_tel_1)%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",constract_tel_1)%>>019</option>
						<option value="02" <%=fncSetSelectBox("02",constract_tel_1)%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",constract_tel_1)%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",constract_tel_1)%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",constract_tel_1)%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",constract_tel_1)%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",constract_tel_1)%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",constract_tel_1)%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",constract_tel_1)%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",constract_tel_1)%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",constract_tel_1)%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",constract_tel_1)%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",constract_tel_1)%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",constract_tel_1)%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",constract_tel_1)%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",constract_tel_1)%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",constract_tel_1)%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",constract_tel_1)%>>070</option>
					</select>
					-
					<input type="text" name="tel_2" id="tel_2" size="5" maxlength="4" value="<%=constract_tel_2%>" valid="E|A=전화번호를 입력해 주세요"/>
					-
					<input type="text" name="tel_3" id="tel_3" size="5" maxlength="4" value="<%=constract_tel_3%>" valid="E|A=전화번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>임대경유</th>
				<td><input type="text" id="imda_type" name="imda_type" size="20" value="<%=constract_type%>">
				</td>
			</tr>
			<tr>
				<th>입금계좌</th>
				<td>은행 <input type="text" id="bank" name="bank" size="20" value="<%=constract_bank%>"> 
					계좌 <input type="text" id="account" name="account" size="20" value="<%=constract_account%>">
				</td>
			</tr>
			<tr>
				<th>대여개시일</th>
				<td>
				<input type="text" id="datepicker1" name="start_date" value="<%=start_date_ymd%>"> 
				<!--
					<select name="start_date_y"  id="start_date_y" valid="E|A=대여개시년월일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(start_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="start_date_m"  id="start_date_m"  valid="E|A=대여개시년월일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mdate)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="start_date_d"  id="start_date_d" valid="E|A=대여개시년월일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Ddate)%>><%=num%></option>
					<% Next %>
					</select>-->
				</td>
			</tr>
			<tr>
				<th>대여종료일</th>
				<td>
				<input type="text" id="datepicker2" name="end_date" value="<%=end_date_ymd%>"> 
				<!--
					<select name="end_date_y"  id="end_date_y" valid="E|A=대여종료년월일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(end_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="end_date_m"  id="end_date_m"  valid="E|A=대여종료년월일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,end_Mdate)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="end_date_d"  id="end_date_d" valid="E|A=대여종료년월일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,end_Ddate)%>><%=num%></option>
					<% Next %>
					</select> -->
				</td>
			</tr>
			<tr>
				<th>유축기 제품번호</th>
				<td><input type="text" id="product_no" name="product_no" size="20" value="<%=product_no%>">
				</td>
			</tr>
			<tr>
				<th>지점</th>
				<td>
					<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
						<option value="">지역</option>
					<%
						If IsArray(arrLocal) Then 
							For num = 0 To UBound(arrLocal,2)
					%>
						<option value="<%=arrLocal(0,num)%>" <%If local_nm = arrLocal(0,num) Then%>selected<%End If%>><%=arrLocal(0,num)%></option>
					<%
							Next 
						End If 
					%>
					</select>
					<select id="part" name="part" class="textarea" style="height:35px;">
						<option value="">지점</option>
					</select>
				</td>
			</tr>
			</thead>
			</table>
			


			<div style="margin-left:20px;">
				 
				<h2>상기 임대인과 임차인은 임대차 계약을 체결하고 본 서류를 2부 작성하여 각 1부씩 보관한다.</h2>
				<h2>계약조건</h2>	
				본 임대 계약은 웰니스인텔리전스가 임대하고 <input type="text" id="contract_in_name" name="contract_in_name" size="10" value="<%=contnent_intro%>">이 임차하여 이루어진 계약이다.<br/><br/>

				<strong><font style="font-weight: bold">1. 임대차 기간 </font></strong><br/>
				본 제품의 임대차 기간은 제품의 대여개시일로부터 대여만기일까지로 한다.<br/>
				최소 임대차 기간은 <input type="text" id="contract_1_term" name="contract_1_term" size="10" value="<%=contnent1%>">이다.<br/><br/>
				
				<strong><font style="font-weight: bold">2. 임대료 및 지불방법 </font></strong><br/>
				본 제품의 임대료는 기본 <input type="text" id="contract_2" name="contract_2" size="10" value="<%=contnent2%>">원이며 임차인은 계약시 대여기간에 해당하는 임대료를 지불하여야 한다.<br/><br/>
				
				<strong><font style="font-weight: bold">3. 예치금 </font></strong><br/>
				임차인은 계약시에 예치금 <input type="text" id="contract_3" name="contract_3" size="10" value="<%=contnent3%>">원을 임대인에게 지불하여야 한다.<br/>
				단, 계약이 해약 및 임대기간의 만기에 의해 종료되었을 경우, 임대인은 임차인에게 예치금을 반환한다.<br/><br/>
				
				<strong><font style="font-weight: bold">4. 임차인의 권리 </font></strong><br/>
				임차인은 계약된 제품을 용도 및 목적에 맞게 자유로이 사용할 수 있다.<br/><br/>

				<strong><font style="font-weight: bold">5. 손해배상 </font></strong><br/>
				계약된 제품이 대여 개시된 후 임차인의 부주의로 인해 발생한 제품의 멸실, 훼손등에 대해 임차인은 손해배상의 의무를 진다.<br/><br/>

				<strong><font style="font-weight: bold">6. 제품의 보수 </font></strong><br/>
				제품이 인도된 후 제품자체에 의한 하자가 발생시 임대인이 무료로 보수해 준다.<br/><br/>

				<strong><font style="font-weight: bold">7. 임대차 계약 자동연장 </font></strong><br/>
				임차인이 대여 만기일까지 제품을 반환하지 않거나, 반환을 요청하지 않을 경우, 최소 임대차기간에 해당하는 기간동안 추가로 임대차계약이 성립되어 임차인은 임대인에게 추가 임대료를 지불해야 하며, 대여 만기일도 자동 연장된다.<br/><br/>

				<strong><font style="font-weight: bold">8. 임대차 계약의 해약 </font></strong><br/>
				임차인이 다음의 사항에 해당되어 계약 이행이 불가능할 경우, 임대인은 본 계약을 지체없이 해약할 수 있다.
				1) 임대료의 체불이 발생할 경우, 2) 계약시의 인적사항이 상이할 경우.<br/><br/>

				<strong><font style="font-weight: bold">9. 제품의 반환 및 배달료 </font></strong><br/>
				전항에 의한 계약이 해약 및 임대 기간의 만기 등에 의해 종료되었을 경우에는 임차인은 지체없이 제품을 임대인에게 반환한다. 임차인이 특정한 위치까지 제품의 배달 또는 반납 목적으로 본 회사 직원의 방문을 요구하여 본사직원이 특정위치까지 방문 할 경우 방문 수수료가 추가된다.<br/>(유축기 배달 및 반납 요청시 방문수수료 : 서울시방문 왕복 10,000원, 경기도방문 왕복 20,000원 경기도 택배시 왕복택배비 고객부담)<br/><br/>

				<strong><font style="font-weight: bold">10. 이의의 해결 </font></strong><br/>
				본 계약이 정하지 아니한 사항 또는 본 계약의 해석에 대하여 이의가 발생한 때는 임대인과 임차인이 합의하여 해결한다.<br/><br/>


				<strong><font style="font-weight: bold">11. 권리와 의무의 양도 </font></strong><br/>
				본 계약에 따른 권리나 의무의 일부 또는 전부를 쌍방의 합의 없이 타인에게 양도할 수 없다.<br/><br/>

				<strong><font style="font-weight: bold">영수내역 </font></strong><br/>
				대&nbsp; 여&nbsp;&nbsp; 료 :  <input type="text" id="contract_11_pay" name="contract_11_pay" size="10" value="<%=contnent4_price%>">  <br/>
				보&nbsp; 증&nbsp;&nbsp; 금 :  <input type="text" id="contract_11_deposit" name="contract_11_deposit" size="10" value="<%=contnent4_deposit%>">  <br/>
				소모품세트 : <input type="text" id="contract_11_set" name="contract_11_set" size="10" value="<%=contnent4_set%>">  <br/>
				출&nbsp; 장&nbsp;&nbsp; 료 :  <input type="text" id="contract_11_out" name="contract_11_out" size="10" value="<%=contnent4_out_pay%>"> <br/>
				합 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  계 :  <input type="text" id="contract_11_total" name="contract_11_total" size="10" value="<%=contnent4_total%>"> 영수자<input type="text" id="contract_11_pay_man" name="contract_11_pay_man" size="10" value="<%=contnent4_human%>"><br/>

			<span style="margin-left:750px;"> 
			<input type="text" id="contract_11_yy" name="contract_11_yy" size="5" readonly value="<%=NowDate_1%>">년 
			<input type="text" id="contract_11_yy" name="contract_11_mm" size="3" readonly value="<%=NowDate_2%>">월 
			<input type="text" id="contract_11_dd" name="contract_11_dd" size="3" readonly value="<%=NowDate_3%>">일</span><br/>
			<span style="margin-left:750px;"></span><br/>
			<span style="margin-left:750px;">임차인 성명  <input type="text" id="contract_11_name" name="contract_11_name" size="10" value="<%=customer_nm2%>"></span><br/>

			</div> 
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>


<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<!-- 달력추가 시작-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<script> 
$(document).ready(function() {	   
	$( "#datepicker" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
		$( "#datepicker1" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
		$( "#datepicker2" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
  }); 
</script>
<!-- 달력추가 끝-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnMem = jQuery("#btnMem");
	var btnNm = jQuery("#btnNm");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');


	btnMem.click(function() {
			mem_id = jQuery("#mem_id").val();
		 
		if (mem_id.length < 1){
			alert("회원ID를 입력해 주세요");
			return;
		}


	<%
	If mem_id <> ""  Then 
	%>
		location.href="./contract_ins.asp?mem_id="+mem_id;
	<%
	end IF
	%>
 

	});

 
	btnDel.click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./contract_sql.asp?mode=delete&idx=<%=intIDX%>'});
		}
	});


	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./contract_sql.asp?<%=strLnkUrl%>"
	});


	String.prototype.trim = function(){
    return this.replace(/s+/g," ").replace(/^s*|s*$/g,"");
	}




	function InputName_Comment(mname, cmomment,hp_seq){
		jQuery("#mo_helper_name").val(mname);
		jQuery("#mo_helper_comment1").val(cmomment);
		jQuery("#mo_helper_seq").val(hp_seq);
	}


	function InputName_Comment_1(mname, cmomment,hp_seq){
		jQuery("#mo_helper_name_1").val(mname);
		jQuery("#mo_helper_comment_1").val(cmomment);
		jQuery("#mo_helper_seq_1").val(hp_seq);
	}             


	function InputName_Comment_2(mname, cmomment,hp_seq){
		jQuery("#mo_helper_name_2").val(mname);
		jQuery("#mo_helper_comment_2").val(cmomment);
		jQuery("#mo_helper_seq_2").val(hp_seq);
	}


	function InputName_Comment_3(mname, cmomment,hp_seq){
		jQuery("#mo_helper_name_3").val(mname);
		jQuery("#mo_helper_comment_3").val(cmomment);
		jQuery("#mo_helper_seq_3").val(hp_seq);
	}


	function InputPostInfo(mname, mphpone1, mphpone2, mphpone3, mhp1, mhp2, mhp3, mbirth1, mbirth2, mbirth3, mpost1, mpost2, maddr1, maddr2, mid){
		jQuery("#mem_nm").val(mname);

		jQuery("#phone_1").val(mphpone1);
		jQuery("#phone_2").val(mphpone2);
		jQuery("#phone_3").val(mphpone3);

		jQuery("#hp_1").val(mhp1);
		jQuery("#hp_2").val(mhp2);
		jQuery("#hp_3").val(mhp3);

 

		jQuery("#Ybirth1").val(mbirth1);
		jQuery("#Mbirth1").val(mbirth2);
		jQuery("#Dbirth1").val(mbirth3);


		jQuery("#post_1").val(mpost1);
		jQuery("#post_2").val(mpost2);
		jQuery("#addr_1").val(maddr1);
		jQuery("#addr_2").val(maddr2);
		jQuery("#mem_id").val(mid);
	}

	function fncOpenZip(){
	
		
	  var form = document.oFrm;
	  var mo_helper_name1 = form.mo_helper_name1.value;


	  var width = "725"; 
	  var height = "550"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1; 
	  var title = "산모도우미 검색"; 
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);
	
	//	window.open("/common/inc/pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1,"pop_zipcode","width=625px, height=550px");
	}


	  function fncOpenZip_1(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_1.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_1.asp?mo_helper_name_1="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}

	 function fncOpenZip_2(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_2.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_2.asp?mo_helper_name_2="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}


	  function fncOpenZip_3(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_3.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_3.asp?mo_helper_name_3="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}



	function fncOpenName(){
	

	  var form = document.oFrm;
	  var mem_nm = form.mem_nm.value;

	  var width = "500"; 
	  var height = "460"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm; 
	  var title = "이름검색"; 
	  var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

		


	
	//	window.open("/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm,"pop_zipcode","width=480px, height=460px");
	}


 
 

          
 


</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>