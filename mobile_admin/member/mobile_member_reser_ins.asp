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
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
	<link rel="stylesheet" type="text/css" href="/mobile_admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/mobile_admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:360px;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}





		.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 410px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
		.pop-layer .pop-container {padding: 20px 25px;}
		.pop-layer p.ctxt {color: #666; line-height: 25px;}
		.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}
	
		a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
		a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}
	</style>
</head>
<%

page_name		= fncRequest("page_name")

 
	Dim mode : mode = "ins"

	
	intIDX = fncRequest("idx")   
	mem_id = fncRequest("mem_id")
	mo_helper_seq = fncRequest("mo_helper_seq1")
    If intIDX <> "" Then
		strTable = " FROM MO_RESERVATION WITH(NOLOCK) "

		strWhere = " WHERE MR_CNLKBN='N' AND MR_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
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
			serviceSdt_1= Rs(26)
			serviceEdt_1= Rs(27)
			serviceSdt_2= Rs(28)
			serviceEdt_2= Rs(29)
			serviceSdt_3= Rs(30)
			serviceEdt_3= Rs(31)
			pay_name    = Rs(32)
			cancel_yn   = Rs(33)
			cancel_reason= Rs(34)
		End If 
		Call RSClose(Rs)
%>


 

<%




'------------------------------------------------------------------------------------------------
 If intIDX <> "" Then


	  'SELECT MD_HELPER_SEQ   FROM MO_HELPER_SERVICE    where MR_IDX = '537'
	
		strTable = "  FROM MO_HELPER_SERVICE  "

		strWhere = "  where MR_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & " SELECT MD_HELPER_SEQ  "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			rs_mo_helper_seq				    = Rs(0)
		'	arrList = Rs.getRows()
			arrTmp = Rs.GetRows() 	
		 

		End If 
	 
		Call RSClose(Rs)


		strSql = ""
		strSql = strSql & " SELECT COUNT(1) "
		strSql = strSql & "  FROM MO_HELPER_SERVICE  "
		strSql = strSql & "  where MR_IDX = '"& intIDX &"' "
		Set Rs1 = DBExec(strSql,"main")
		If Not Rs1.EOF Then 
			intTotalCnt = Rs1(0)
		End If 





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

'---------------------------------------------------------------------------------
'	데이터 확인
	If phone <> "" Then 
		arrPhone	= Split(phone,"-")
		phone_1		= arrPhone(0)
		phone_2		= arrPhone(1)
		phone_3		= arrPhone(2)
	End If 

	If hp <> "" Then 
		arrHp	= Split(hp,"-")
		hp_1	= arrHp(0)
		hp_2	= arrHp(1)
		hp_3	= arrHp(2)
	End If 

	If birth <> "" Then 
		Mbirth = Mid(birth,5,2)
		If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
		Dbirth = Right(birth,2)
		If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
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

	

'---------------------------------------------------------------------------------	
%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>예약확인</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<input type="hidden" name="page_name" value="<%=page_name%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>회원ID</th>
				<td>
					<input type="text" id="mem_id" name="mem_id" size="20" value="<%=mem_id%>" valid="E|M=10|A=회원ID를 입력해 주세요">
					<input type="button" value="회원정보 조회" id="btnMem">
				</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=mem_nm%>" valid="E|A=회원명을 입력해 주세요" onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="회원이름 검색" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<select name="Ybirth"  id="Ybirth1" valid="E|A=생년월일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(birth,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="Mbirth"  id="Mbirth1"  valid="E|A=생년월일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mbirth)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="Dbirth"  id="Dbirth1" valid="E|A=생년월일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dbirth)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<select name="phone_1" id="phone_1" valid="E|A=전화번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="02" <%=fncSetSelectBox("02",phone_1)%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",phone_1)%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",phone_1)%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",phone_1)%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",phone_1)%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",phone_1)%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",phone_1)%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",phone_1)%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",phone_1)%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",phone_1)%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",phone_1)%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",phone_1)%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",phone_1)%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",phone_1)%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",phone_1)%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",phone_1)%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",phone_1)%>>070</option>
					</select>
					-
					<input type="text" id="phone_2" name="phone_2" size="5" maxlength="4" value="<%=phone_2%>" valid="E|A=전화번호를 입력해 주세요"/>
					-
					<input type="text" id="phone_3" name="phone_3" size="5" maxlength="4" value="<%=phone_3%>" valid="E|A=전화번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
					<select name="hp_1" id="hp_1" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",hp_1)%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",hp_1)%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",hp_1)%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",hp_1)%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",hp_1)%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",hp_1)%>>019</option>
					</select>
					-
					<input type="text" name="hp_2" id="hp_2" size="5" maxlength="4" value="<%=hp_2%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
					-
					<input type="text" name="hp_3" id="hp_3" size="5" maxlength="4" value="<%=hp_3%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="post_1" id="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(post,3)%>" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text" name="post_2" id="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(post,3)%>" valid="E|A=우편번호를 입력해 주세요"/><br/>

					<input type="text" name="addr_1" id="addr_1" class="textarea" size="30" value="<%=addr_1%>" valid="E|A=주소를 입력해 주세요"/><br/>
					<input type="text" name="addr_2" id="addr_2" class="textarea" size="30" value="<%=addr_2%>" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>	
			<tr>
				<th>신청서비스</th>
				<td>	
					<input type="checkbox" name="check1" value="베이직" <%If InStr(service,"베이직") > 0 Then%>checked<%End If%> valid="E|A=신청서비스를 선택해 주세요"/> 베이직&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="프리미엄" <%If InStr(service,"프리미엄") > 0 Then%>checked<%End If%>/> 프리미엄&nbsp;&nbsp;
                    <input type="checkbox" name="check1" value="VIP" <%If InStr(service,"VIP") > 0 Then%>checked<%End If%>/> VIP&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="프라이빗" <%If InStr(service,"프라이빗") > 0 Then%>checked<%End If%>/> 프라이빗&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="과체중" <%If InStr(service,"과체중") > 0 Then%>checked<%End If%>/> 과체중&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="워킹맘" <%If InStr(service,"워킹맘") > 0 Then%>checked<%End If%>/> 워킹맘&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="35세이상" <%If InStr(service,"35세이상") > 0 Then%>checked<%End If%>/> 35세이상
					<input type="checkbox" name="check1" value="산후조리원을 내집" <%If InStr(service,"산후조리원을 내집") > 0 Then%>checked<%End If%>/> 산후조리원을 내집에&nbsp;&nbsp;</br>
					<input type="checkbox" name="check1" value="다둥이" <%If InStr(service,"다둥이") > 0 Then%>checked<%End If%>/> 다둥이&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="상담 후 결정" <%If InStr(service,"상담 후 결정") > 0 Then%>checked<%End If%>/> 상담 후 결정
				</td>
			</tr>
			<tr>
				<th>이용기간</th>	
				<td>
					<input type="radio" name="radio1" value="1주" <%=fncSetCheckBox(period,"1주")%> valid="E|A=이용기간을 선택해 주세요"/> 1주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="2주" <%=fncSetCheckBox(period,"2주")%> /> 2주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="3주" <%=fncSetCheckBox(period,"3주")%> /> 3주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4주" <%=fncSetCheckBox(period,"4주")%> /> 4주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4주" <%=fncSetCheckBox(period,"6주")%> /> 6주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4주" <%=fncSetCheckBox(period,"8주")%> /> 8주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="6주" <%=fncSetCheckBox(period,"기타")%> /> 기타
				</td>
			</tr>
			<tr>
				<th>이용형태</th>	
				<td>
					<input type="radio" name="radio2" value="출퇴근 + 5일" <%=fncSetCheckBox(service_type,"출퇴근 + 5일")%> valid="E|A=이용형태를 선택해 주세요"/> 출퇴근 + 5일&nbsp;&nbsp;
					<input type="radio" name="radio2" value="출퇴근 + 6일" <%=fncSetCheckBox(service_type,"출퇴근 + 6일")%>/> 출퇴근 + 6일&nbsp;&nbsp;
                    <input type="radio" name="radio2" value="입주" <%=fncSetCheckBox(service_type,"입주")%>/>입주&nbsp;&nbsp;
					<input type="radio" name="radio2" value="출퇴근 + 입주" <%=fncSetCheckBox(service_type,"출퇴근 + 입주")%>/> 출퇴근 + 입주&nbsp;&nbsp;
                    
				</td>
			</tr>
			<tr>
				<th>출산예정일</th>	
				<td>

					<select name="childbirth_y" valid="E|A=출산예정일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",2,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(childbirth,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="childbirth_m" valid="E|A=출산예정일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="childbirth_d" valid="E|A=출산예정일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스시작</th>	
				<td>
					<select name="serviceSdt_y" valid="E|A=서비스시작일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceSdt,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="serviceSdt_m" valid="E|A=서비스시작일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceSdt)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="serviceSdt_d" valid="E|A=서비스시작일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceSdt)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스 종료일</th>	
				<td>
					<select name="serviceEdt_y" valid="E|A=서비스종료일을 선택해 주세요">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceEdt,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="serviceEdt_m" valid="E|A=서비스종료일을 선택해 주세요">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceEdt)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="serviceEdt_d" valid="E|A=서비스종료일을 선택해 주세요">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceEdt)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>조리원 이용</th>	
				<td>
					<input type="radio" name="radio3" value="이용함" <%=fncSetCheckBox(clinic,"이용함")%> valid="E|A=조리원 이용여부를 선택해 주세요"/> 이용함&nbsp;&nbsp;
					<input type="radio" name="radio3" value="이용안함" <%=fncSetCheckBox(clinic,"이용안함")%>/> 이용안함
				</td>
			</tr>
			<tr>
				<th>출산경험</th>	
				<td>
					<input type="radio" name="radio4" value="초산모" <%=fncSetCheckBox(exper,"초산모")%> valid="E|A=출산경험을 선택해 주세요"/> 초산모&nbsp;&nbsp;
					<input type="radio" name="radio4" value="경산모" <%=fncSetCheckBox(exper,"경산모")%>/> 경산모 
				</td>
			</tr>
			<tr>
				<th>특이사항</th>	
				<td>
					<input type="checkbox" name="check2" value="쌍둥이" <%If InStr(unique,"쌍둥이") > 0 Then%>checked<%End If%> valid="E|A=특이사항을 선택해 주세요"/> 쌍둥이&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="임신성 당뇨" <%If InStr(unique,"임신성 당뇨") > 0 Then%>checked<%End If%>/> 임신성 당뇨 &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="부종" <%If InStr(unique,"부종") > 0 Then%>checked<%End If%>/> 부종&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="고혈압" <%If InStr(unique,"고혈압") > 0 Then%>checked<%End If%>/> 고혈압&nbsp;&nbsp;
                    <input type="checkbox" name="check2" value="없음" <%If InStr(unique,"없음") > 0 Then%>checked<%End If%>/> 없음
				</td>
			</tr>
			<tr>
				<th>가족사항</th>	
				<td>
					<input type="checkbox" name="check3" value="부모님" <%If InStr(family,"부모님") > 0 Then%>checked<%End If%> valid="E|A=가족사항을 선택해 주세요"/> 부모님&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="남편" <%If InStr(family,"남편") > 0 Then%>checked<%End If%>/> 남편 &nbsp;&nbsp;
					<input type="checkbox" name="check3" value="큰아이 1명" <%If InStr(family,"큰아이 1명") > 0 Then%>checked<%End If%>/> 큰아이 1명&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="큰아이 2명이상" <%If InStr(family,"큰아이 2명이상") > 0 Then%>checked<%End If%>/> 큰아이 2명이상&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="기타가족" <%If InStr(family,"기타가족") > 0 Then%>checked<%End If%>/> 기타가족
				</td>
			</tr>

			<tr>
				<th>예약금</th>	
				<td>
					<input type="text" name="payment" size="7" maxlength="7" value="<%If payment <> "" Then%><%=FormatNumber(payment,0)%><%End If%>"/> 원
				</td>
			</tr>
			<tr>
				<th>결제수단</th>	
				<td>
					<input type="radio" name="radio5" value="무통장입금" <%If InStr(payType,"무통장입금") > 0 Then%>checked<%End If%>/> 무통장입금&nbsp;&nbsp;
					<input type="radio" name="radio5" value="카드결제" <%If InStr(payType,"카드결제") > 0 Then%>checked<%End If%>/> 카드결제 &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>결제 상태</th>	
				<td>
					<input type="radio" name="radio6" value="결제완료" <%If InStr(payState,"결제완료") > 0 Then%>checked<%End If%>/> 결제완료&nbsp;&nbsp;
					<input type="radio" name="radio6" value="결제진행중" <%If InStr(payState,"결제진행중") > 0 Then%>checked<%End If%>/> 결제진행중 &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>결제일</th>	
				<td>
					<select name="payEdt_y">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(payEdt,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="payEdt_m">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MpayEdt)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="payEdt_d">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DpayEdt)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>입금자</th>
				<td><input type="text" id="pay_name" name="pay_name" size="20" value="<%=pay_name%>">
				</td>
			</tr>
			<tr>
				<th>취소여부</th>	
				<td>
					<select name="cancel_yn">				 
						<option value="N" <%=fncSetSelectBox("N",cancel_yn)%> selected>취소하지않음</option>
						<option value="Y" <%=fncSetSelectBox("Y",cancel_yn)%>>취소함</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>취소사유</th>
				<td><input type="text" id="cancel_reason" name="cancel_reason" size="20" value="<%=cancel_reason%>">
				</td>
			</tr>
			<tr>
				<th>상담내용</th>	
				<td><textarea name="textarea" style="width:230px;height:200px;" valid="E|A=상담내용을 입력해 주세요"><%=content%></textarea></td>
			</tr>

<%

 If intTotalCnt >= 1 then
'산모도우미 밸류값 유지
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'로우수만큼 for문 실행
			'	 cul1 = arrTmp(0, i)			'첫번째 컬럼
				 cul0 = arrTmp(0, 0)
 

'  MD_HELPER_SEQ 쿼리로   연장 0 인 사람 이름 찾기 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where b.MD_HELPER_SEQ =  '"& cul0 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name				    = Rs(0)
			hp_service_comment		= Rs(1)

		End If 
	 
		Call RSClose(Rs)
	%>

		<%
			next
		end If
	End if
	%>
 

			<tr>
				<th>산모도우미선택</th>	
				<td>
					<input type="hidden" name="mo_helper_seq1"  id="mo_helper_seq" value="<%=mo_helper_seq%>"/>
					<input type="text"   name="mo_helper_name1" id="mo_helper_name" size="10"  value="<%=hp_name%>"/> 
					<input type="button" class="button" value="산모도우미 검색" onclick="fncOpenZip();" />
					<!--<a href="#" class="btn-example" onclick="layer_open('layer1');return false;">예제-1 보기</a>-->
					<div id="layer1" class="pop-layer">
						<div class="pop-container">
							<div class="pop-conts">
								<!--content //-->
								<p class="ctxt mb20">Thank you.<br>
									Your registration was submitted successfully.<br>
									Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
									Hope to see you soon!
								</p>

								<div class="btn-r">
									<a href="#" class="cbtn">Close</a>
								</div>
								<!--// content-->
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th>산모도우미<br/> 서비스 비고</th>	
				<td><textarea name="mo_service_comment" id="mo_helper_comment1" style="width:230px;height:100px;"><%=hp_service_comment%></textarea></td>
			</tr>
 

<%
'산모도우미 밸류값 유지
 If intTotalCnt >= 2 then
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'로우수만큼 for문 실행
			'	 cul1 = arrTmp(0, i)			'첫번째 컬럼
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
 
	
'  MD_HELPER_SEQ 쿼리로   연장 0 인 사람 이름 찾기 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where b.MD_HELPER_SEQ =  '"& cul1 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_1				    = Rs(0)

		End If 
	 
		Call RSClose(Rs)

'코멘트 불러오기
		strTable = "  FROM MO_HELPER_SERVICE  "

		strWhere = "  where MD_HELPER_SEQ =  '"& cul1 &"' "

		strSql = ""
		strSql = strSql & " SELECT  MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_service_comment_1				    = Rs(0)

		End If 
	 
		Call RSClose(Rs)

	%>

	<%
			next
		end If
	End if
	%>
			<tr>
				<th>서비스연장1</th>	
				<td> 연장시작일   
					<select name="extend_1_sy">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceSdt_1,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_1_sm">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceSdt_1)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_1_sd">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceSdt_1)%>><%=num%></option>
					<% Next %>
					</select> 				
				  <span style="padding-left:10px;"></span><br/>연장종료일   
					<select name="extend_1_ey">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceEdt_1,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_1_em">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceEdt_1)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_1_ed">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceEdt_1)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>산모도우미선택1</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_1"  id="mo_helper_seq_1" value="<%=mo_helper_seq_1%>"/>
					<input type="text"   name="mo_helper_name_1" id="mo_helper_name_1" size="10"  value="<%=hp_name_1%>"/> 
					<input type="button" class="button" value="산모도우미 검색" onclick="fncOpenZip_1();" />
				</td>
			</tr>
			<tr>
				<th>산모도우미<br/> 서비스 비고1</th>	
				<td><textarea name="mo_service_comment_1" id="mo_helper_comment_1" style="width:230px;height:100px;"><%=hp_service_comment_1%></textarea></td>
			</tr>

 
	<%
	If intTotalCnt >= 3 then
'산모도우미 밸류값 유지
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'로우수만큼 for문 실행
			'	 cul1 = arrTmp(0, i)			'첫번째 컬럼
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
				 cul2 = arrTmp(0, 2)
 
 

'  MD_HELPER_SEQ 쿼리로   연장 0 인 사람 이름 찾기 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where b.MD_HELPER_SEQ =  '"& cul2 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_2				    = Rs(0)
 

		End If 
	 
		Call RSClose(Rs)

		'코멘트 불러오기
		strTable = "  FROM MO_HELPER_SERVICE  "

		strWhere = "  where MD_HELPER_SEQ =  '"& cul2 &"' "

		strSql = ""
		strSql = strSql & " SELECT  MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_service_comment_2				    = Rs(0)

		End If 
	 
		Call RSClose(Rs)
	%>

		<%
			next
		end If
	End if
	%>


			<tr>
				<th>서비스연장2</th>	
				<td>연장시작일
					<select name="extend_2_sy">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceSdt_2,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_2_sm">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceSdt_2)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_2_sd">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceSdt_2)%>><%=num%></option>
					<% Next %>
					</select>

					<span style="padding-left:10px;"></span><br/>연장종료일   
					<select name="extend_2_ey">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceEdt_2,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_2_em">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceEdt_2)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_2_ed">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceEdt_2)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>산모도우미선택2</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_2"  id="mo_helper_seq_2" value="<%=mo_helper_seq_2%>"/>
					<input type="text"   name="mo_helper_name_2" id="mo_helper_name_2" size="10"  value="<%=hp_name_2%>"/> 
					<input type="button" class="button" value="산모도우미 검색" onclick="fncOpenZip_2();" />
				</td>
			</tr>
			<tr>
				<th>산모도우미<br/> 서비스 비고2</th>	
				<td><textarea name="mo_service_comment_2" id="mo_helper_comment_2" style="width:230px;height:100px;"><%=hp_service_comment_2%></textarea></td>
			</tr>


	<%
'산모도우미 밸류값 유지
 If intTotalCnt >= 4 then
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'로우수만큼 for문 실행
			'	 cul1 = arrTmp(0, i)			'첫번째 컬럼
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
				 cul2 = arrTmp(0, 2)
				 cul3 = arrTmp(0, 3)

'  MD_HELPER_SEQ 쿼리로   연장 0 인 사람 이름 찾기 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where b.MD_HELPER_SEQ =  '"& cul3 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_3				    = Rs(0)
			hp_service_comment_3		= Rs(1)

		End If 
	 
		Call RSClose(Rs)


		'코멘트 불러오기
		strTable = "  FROM MO_HELPER_SERVICE  "

		strWhere = "  where MD_HELPER_SEQ =  '"& cul3 &"' "

		strSql = ""
		strSql = strSql & " SELECT  MD_HELPER_COMMENT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_service_comment_3				    = Rs(0)

		End If 
	 
		Call RSClose(Rs)



	%>

	<%
			next
		end If
	End if
	%>
			<tr>
				<th>서비스연장3</th>	
				<td>연장시작일
					<select name="extend_3_sy">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceSdt_3,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_3_sm">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceSdt_3)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_3_sd">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceSdt_3)%>><%=num%></option>
					<% Next %>
					</select>
					<span style="padding-left:10px;"></span><br/>연장종료일   
					<select name="extend_3_ey">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(serviceEdt_3,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_3_em">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceEdt_3)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="extend_3_ed">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceEdt_3)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>산모도우미선택3</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_3"  id="mo_helper_seq_3" value="<%=mo_helper_seq_3%>"/>
					<input type="text"   name="mo_helper_name_3" id="mo_helper_name_3" size="10"  value="<%=hp_name_3%>"/> 
					<input type="button" class="button" value="산모도우미 검색" onclick="fncOpenZip_3();" />
				</td>
			</tr>
			<tr>
				<th>산모도우미<br/> 서비스 비고3</th>	
				<td><textarea name="mo_service_comment_3" id="mo_helper_comment_3" style="width:230px;height:100px;"><%=hp_service_comment_3%></textarea></td>
			</tr>


			</thead>
			</table>
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
	If mem_id <> "" and  mo_helper_name1 <> "" and mo_helper_seq <> "" Then 
	%>

		location.href="./mobile_member_reser_ins.asp?mem_id="+mem_id+"&+mo_helper_name1="+mo_helper_name1+"&mo_helper_seq="+mo_helper_seq;
	<%
	else
	%>
		location.href="./mobile_member_reser_ins.asp?mem_id="+mem_id;
	<%
	end IF
	%>
 

	});

 
	btnDel.click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./member_reser_sql.asp?mode=delete&idx=<%=intIDX%>'});
		}
	});


	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_reser_sql.asp?<%=strLnkUrl%>&page_name=<%=page_name%>"
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


	  var width = "360"; 
	  var height = "450"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/mobile_pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1; 
	  var title = "산모도우미 검색"; 
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);
	
	//	window.open("/common/inc/pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1,"pop_zipcode","width=625px, height=550px");
	}


	  function fncOpenZip_1(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_1.value;


		var width = "360"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/mobile_pop_mo_helper_1.asp?mo_helper_name_1="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}

	 function fncOpenZip_2(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_2.value;


		var width = "360"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/mobile_pop_mo_helper_2.asp?mo_helper_name_2="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}


	  function fncOpenZip_3(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_3.value;


		var width = "360"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/mobile_pop_mo_helper_3.asp?mo_helper_name_3="+mo_helper_name1; 
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}



	function fncOpenName(){
	

	  var form = document.oFrm;
	  var mem_nm = form.mem_nm.value;

	  var width = "360"; 
	  var height = "460"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/mobile_pop_mo_MemName.asp?mem_nm="+mem_nm; 
	  var title = "이름검색"; 
	  var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

		


	
	//	window.open("/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm,"pop_zipcode","width=480px, height=460px");
	}

 

</script>
<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>
</html>