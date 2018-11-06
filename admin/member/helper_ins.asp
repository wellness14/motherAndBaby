<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_ins.asp
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


	hp_seq = fncRequest("hp_seq")   


    If hp_seq <> "" Then
		strTable = " FROM MO_HELPER WITH(NOLOCK) "
	 
		strWhere = " WHERE MD_HELPER_SEQ = '"& hp_seq &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			MD_HELPER_NAME "
		strSql = strSql & "			,MD_HELPER_JUMIN1 "
		strSql = strSql & "			,MD_HELPER_JUMIN2 "
		strSql = strSql & "			,MD_HELPER_HP "
		strSql = strSql & "			,MD_HELPER_PHONE "
		strSql = strSql & "			,MD_HELPER_POST "
		strSql = strSql & "			,MD_HELPER_ADDR1 "
		strSql = strSql & "			,MD_HELPER_ADDR2 "
		strSql = strSql & "			,MD_HELPER_FLG "
		strSql = strSql & "			,MD_HELPER_WORK_FLG "
		strSql = strSql & "			,MD_HELPER_BANK "
		strSql = strSql & "			,MD_HELPER_ACCOUNT "
		strSql = strSql & "			,MD_HELPER_ACCOUNT_NAME "
		strSql = strSql & "			,MD_HELPER_HOPE "
		strSql = strSql & "			,MD_HELPER_NEAR "
		strSql = strSql & "			,MD_HELPER_EDU "
		strSql = strSql & "			,MD_HELPER_DIPLOMA_NO "
		strSql = strSql & "			,MD_HELPER_LICENSE "
		strSql = strSql & "			,MD_HELPER_LICENSE_NO "
		strSql = strSql & "			,MD_HELPER_RELIGION "
		strSql = strSql & "			,MD_HELPER_INSURANCE_FLG "
		strSql = strSql & "			,MD_HELPER_INSURANCE_NO "
		strSql = strSql & "			,MD_HELPER_INSURANCE_START "
		strSql = strSql & "			,MD_HELPER_INSURANCE_END "
		strSql = strSql & "			,MD_HELPER_INSURANCE_NOW_FLG "
		strSql = strSql & "			,MD_HELPER_PICTURE "
		strSql = strSql & "			,MD_HELPER_QUALIFICTION "
		strSql = strSql & "			,MD_HELPER_QnA "
		strSql = strSql & "			,MD_HELPER_LOCAL "
		strSql = strSql & "			,MD_HELPER_SEQ "
		strSql = strSql & "			,MD_HELPER_LICENSE_1 "
		strSql = strSql & "			,MD_HELPER_LICENSE_2 "
		strSql = strSql & "			,MD_HELPER_LICENSE_3 "
		strSql = strSql & "			,MD_HELPER_LICENSE_4 "
		strSql = strSql & "			,MD_HELPER_LICENSE_5 "
		strSql = strSql & "			,MD_HELPER_LICENSE_NO_1 "	
		strSql = strSql & "			,MD_HELPER_LICENSE_NO_2 "
		strSql = strSql & "			,MD_HELPER_LICENSE_NO_3 "
		strSql = strSql & "			,MD_HELPER_LICENSE_NO_4 "
		strSql = strSql & "			,MD_HELPER_LICENSE_NO_5 "      
		strSql = strSql & "			,MD_HELPER_HEALTH "       
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_HELPER_SEQ DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			in_start		= Rs(22)
			in_end			= Rs(23)
			 
			mode	= "upd"
			license1		= Rs(17)
			license_no1		= Rs(18)
			license2		= Rs(30)
			license3		= Rs(31)
			license4		= Rs(32)
			license5		= Rs(33)
			license6		= Rs(34)
			license_no2		= Rs(35)
			license_no3		= Rs(36)
			license_no4		= Rs(37)
			license_no5		= Rs(38)
			license_no6		= Rs(39)
			hp_health		= Rs(40)
			mm_img		= Rs("MD_HELPER_PICTURE")
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)


'---------------------------------------------------------------------------------'
'산모도우미 현재 업무내역

		strTable = " FROM MO_HELPER_SERVICE WITH(NOLOCK) "
	 
		strWhere = " WHERE MD_HELPER_SEQ = '"& hp_seq &"' order by MO_SEQ desc"

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			MR_IDX "
		strSql = strSql & "			,MO_SEQ "
		strSql = strSql & "			,MD_HELPER_COMMENT "
		strSql = strSql & "			,MO_EXTEND "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mem_no		= Rs(0)
			work_no		= Rs(1)
			md_memo		= Rs(2)
			work_no_3		= Rs(3)

			arr_Worklist = Rs.GetRows()
		End If 
		Call DBClose(Rs)




		'산모이름

		strTable = " FROM [MO_RESERVATION] WITH(NOLOCK) "
	 
		strWhere = " WHERE MR_IDX = '"& mem_no &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			MR_MEM_NM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mem_name		= Rs(0)
 
		End If 
		Call DBClose(Rs)


'----------------------------------------------------------------------------------------'

	Else 
	 
	End If 

'-----------------------------------------------------------------------------
'	지점 정보 호출

  If hp_seq <> "" Then

	md_local = arrList(28,0)



 
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
 
 '------달력추가로 수정--------------------------------------------------
	If in_start <> "" Then 
		i_start_m = Mid(arrList(22,0),5,2)
		i_start_d = Right(arrList(22,0),2)
		i_start_ymd = Left(arrList(22,0),4) & "-" & i_start_m & "-" & i_start_d

		If i_start_ymd = "--" Then
			i_start_ymd = ""
		End If
	End If

	If in_end <> "" Then  
		i_end_m = Mid(arrList(23,0),5,2)
		i_end_d = Right(arrList(23,0),2)
		i_end_ymd = Left(arrList(23,0),4) & "-" & i_end_m & "-" & i_end_d

		If i_end_ymd = "--" Then
			i_end_ymd = ""
		End If
	End If
	
'-------달력 추가로 수정----------------------------------------------------




%>


<body>

<%
	If hp_seq <> "" Then
%>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>산모도우미관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			
			<input type="hidden" name="hp_seq" value="<%=hp_seq%>">
			 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>관리사 이름</th>
				<td>
					<input type="text" name="hp_name" class="textarea" size="10" value="<%=arrList(0,0)%>"/>
					<input type="button" class="button" value="서비스이력조회" onclick="fncOpenZip_1();" />
				</td>
			</tr>
			<tr>
				<th>관리사 사진</th>
				<td height="200">
					<input type="button" class="button" onclick="fncOpenPop('<%=hp_seq%>')" value="파일 첨부하기"/>  
					 	<p style="padding-top:10px"><span id="fileNm_<%=hp_seq%>" style="width:10px;">
						<%	If mm_img <> "" Then %>
							<img src="/upload_file/admin/photo/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
						<%	End If %>
						</span><br /></p>
				</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="jumin1" class="textarea" size="6" maxlength="6" value="<%=arrList(1,0)%>"/> - <input type="text" name="jumin2" class="textarea" size="7" maxlength="7" value="<%=arrList(2,0)%>"/></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
				<%
					arrHp = Split(arrList(3,0),"-")
				%>
					<select name="hp_1" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					-
					<input type="text" name="hp_2" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
					-
					<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th>집전화</th>
				<td>
				<%
					arrPhone = Split(arrList(4,0),"-")
				%>
					<select name="phone_1" valid="E|A=전화번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="02" <%=fncSetSelectBox("02",arrPhone(0))%>>02</option>
						<option value="031" <%=fncSetSelectBox("031",arrPhone(0))%>>031</option>
						<option value="032" <%=fncSetSelectBox("032",arrPhone(0))%>>032</option>
						<option value="033" <%=fncSetSelectBox("033",arrPhone(0))%>>033</option>
						<option value="041" <%=fncSetSelectBox("041",arrPhone(0))%>>041</option>
						<option value="042" <%=fncSetSelectBox("042",arrPhone(0))%>>042</option>
						<option value="043" <%=fncSetSelectBox("043",arrPhone(0))%>>043</option>
						<option value="051" <%=fncSetSelectBox("051",arrPhone(0))%>>051</option>
						<option value="052" <%=fncSetSelectBox("052",arrPhone(0))%>>052</option>
						<option value="053" <%=fncSetSelectBox("053",arrPhone(0))%>>053</option>
						<option value="054" <%=fncSetSelectBox("054",arrPhone(0))%>>054</option>
						<option value="055" <%=fncSetSelectBox("055",arrPhone(0))%>>055</option>
						<option value="061" <%=fncSetSelectBox("061",arrPhone(0))%>>061</option>
						<option value="062" <%=fncSetSelectBox("062",arrPhone(0))%>>062</option>
						<option value="063" <%=fncSetSelectBox("063",arrPhone(0))%>>063</option>
						<option value="064" <%=fncSetSelectBox("064",arrPhone(0))%>>064</option>
						<option value="070" <%=fncSetSelectBox("070",arrPhone(0))%>>070</option>
					</select>
					-
					<input type="text" name="phone_2" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=전화번호를 입력해 주세요"/>
					-
					<input type="text" name="phone_3" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=전화번호를 입력해 주세요"/>
				</td>	
			</tr>
			<tr>
				<th>관리사 번호</th>
				<td><input type="text" size="5" readonly value="<%=arrList(29,0)%>"  /></td>
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
			<tr>
				<th>주소</th>
				<td>
					<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(5,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(5,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>   &nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>

					<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="<%=arrList(6,0)%>" onClick="fncOpenZip();" valid="E|A=주소를 입력해 주세요"/>
					<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(7,0)%>" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>도우미 분류</th>
				<td>
					<select name="hp_type" class="textarea" style="height:35px;">
						<option value="" >선택</option>
						<option value="입주" <%=fncSetSelectBox("입주",arrList(8,0))%>>입주</option>
						<option value="출퇴근형" <%=fncSetSelectBox("출퇴근형",arrList(8,0))%>>출퇴근형</option>
						<option value="복합형" <%=fncSetSelectBox("복합형",arrList(8,0))%>>복합형</option>
					</select>
				</td>
			</tr>
			<!--tr>
				<th>희망근무형태</th>
				<td>
					<select name="hope_work" class="textarea" style="height:35px;">
						<option value="" >선택</option>
						<option value="입주" <%=fncSetSelectBox("입주",arrList(9,0))%>>입주</option>
						<option value="출퇴근형" <%=fncSetSelectBox("출퇴근형",arrList(9,0))%>>출퇴근형</option>
						<option value="복합형" <%=fncSetSelectBox("복합형",arrList(9,0))%>>복합형</option>
					</select>
				</td>
			</tr-->
			<tr>
				<th>계좌정보</th>
				<td>
					<select name="bank" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="국민은행" <%=fncSetSelectBox("국민은행",arrList(10,0))%>>국민은행</option>
						<option value="우리은행" <%=fncSetSelectBox("우리은행",arrList(10,0))%>>우리은행</option>
						<option value="외환은행" <%=fncSetSelectBox("외환은행",arrList(10,0))%>>외환은행</option>
						<option value="신한은행" <%=fncSetSelectBox("신한은행",arrList(10,0))%>>신한은행</option>
						<option value="SC제일은행" <%=fncSetSelectBox("SC제일은행",arrList(10,0))%>>SC제일은행</option>
						<option value="하나은행" <%=fncSetSelectBox("하나은행",arrList(10,0))%>>하나은행</option>
						<option value="기업은행" <%=fncSetSelectBox("기업은행",arrList(10,0))%>>기업은행</option>
						<option value="새마을금고" <%=fncSetSelectBox("새마을금고",arrList(10,0))%>>새마을금고</option>
						<option value="농협" <%=fncSetSelectBox("농협",arrList(10,0))%>>농협</option>
						<option value="신협" <%=fncSetSelectBox("신협",arrList(10,0))%>>신협</option>
						<option value="수협" <%=fncSetSelectBox("수협",arrList(10,0))%>>수협</option>
						<option value="광주은행" <%=fncSetSelectBox("광주은행",arrList(10,0))%>>광주은행</option>
						<option value="전북은행" <%=fncSetSelectBox("전북은행",arrList(10,0))%>>전북은행</option>
						<option value="부산은행" <%=fncSetSelectBox("부산은행",arrList(10,0))%>>부산은행</option>
						<option value="씨티은행" <%=fncSetSelectBox("씨티은행",arrList(10,0))%>>씨티은행</option>
						<option value="산업은행" <%=fncSetSelectBox("산업은행",arrList(10,0))%>>산업은행</option>
						<option value="우체국" <%=fncSetSelectBox("우체국",arrList(10,0))%>>우체국</option>
						<option value="대구은행" <%=fncSetSelectBox("대구은행",arrList(10,0))%>>대구은행</option>
						<option value="경남은행" <%=fncSetSelectBox("경남은행",arrList(10,0))%>>경남은행</option>
						<option value="제주은행" <%=fncSetSelectBox("제주은행",arrList(10,0))%>>제주은행</option>
					</select>
					 계좌번호  <input type="text" name="account" class="textarea" size="35" value="<%=arrList(11,0)%>"/> 
					 예금주  <input type="text" name="account_name" class="textarea" size="35" value="<%=arrList(12,0)%>"/>
				 </td>
			</tr>
			<tr>
				<th>희망근무지역</th>
				<td>
					<input type="text" name="hp_hope" class="textarea" size="60" value="<%=arrList(13,0)%>"/>
				</td>
			</tr>
			<tr>
				<th>가까운지하철역</th>
				<td>
					<input type="text" name="hp_near" class="textarea" size="60" value="<%=arrList(14,0)%>"/>
				</td>
			</tr>
			<tr>
				<th>교육수료기관</th>
				<td>
					<input type="text" name="edu_org" class="textarea" size="60" value="<%=arrList(15,0)%>"/>
				</td>
			</tr>
			<tr>
				<th>기수</th>
				<td>
					<input type="text" name="dip_no" class="textarea" size="60" value="<%=arrList(16,0)%>"/>
				</td>
			</tr>
			<tr>
				<th>자격증</th>
				<td>
					<!--select name="license" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="산후도우미" <%=fncSetSelectBox("산후도우미",arrList(17,0))%>> 산후도우미 </option>
						<option value="베이비시터" <%=fncSetSelectBox("베이비시터",arrList(17,0))%>> 베이비시터 </option>
						<option value="간호조무사" <%=fncSetSelectBox("간호조무사",arrList(17,0))%>> 간호조무사 </option>
						<option value="간병인(요양보호사)" <%=fncSetSelectBox("간병인(요양보호사)",arrList(17,0))%>> 간병인(요양보호사) </option>
						<option value="영유아돌보미" <%=fncSetSelectBox("영유아돌보미",arrList(17,0))%>> 영유아돌보미 </option>
						<option value="기타" <%=fncSetSelectBox("기타",arrList(17,0))%>> 기타 </option>
					</select-->
<!--디폴트 = N , 기본 = 1, 심화 = 2 -->
<input type="checkbox" name="license1" value="산후도우미" <%If InStr(license1,"산후도우미") > 0 Then%>checked<%End If%>/> 산후도우미<span style="margin-left:50px;"></span>
<input type="radio" name="license1_gb" value="1" <%=fncSetCheckBox(license_no1,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license1_gb" value="2" <%=fncSetCheckBox(license_no1,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license1_gb" value="N" <%=fncSetCheckBox(license_no1,"N")%>/>없음&nbsp;&nbsp;<br/>

<input type="checkbox" name="license2" value="베이비시터" <%If InStr(license2,"베이비시터") > 0 Then%>checked<%End If%>/> 베이비시터<span style="margin-left:50px;"></span>
<input type="radio" name="license2_gb" value="1" <%=fncSetCheckBox(license_no2,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license2_gb" value="2" <%=fncSetCheckBox(license_no2,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license2_gb" value="N" <%=fncSetCheckBox(license_no2,"N")%>/>없음&nbsp;&nbsp;<br/>

<input type="checkbox" name="license3" value="간호조무사" <%If InStr(license3,"간호조무사") > 0 Then%>checked<%End If%>/> 간호조무사<span style="margin-left:50px;"></span>
<input type="radio" name="license3_gb" value="1" <%=fncSetCheckBox(license_no3,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license3_gb" value="2" <%=fncSetCheckBox(license_no3,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license3_gb" value="N" <%=fncSetCheckBox(license_no3,"N")%>/>없음&nbsp;&nbsp;<br/>

<input type="checkbox" name="license4" value="간병인(요양보호사)" <%If InStr(license4,"간병인(요양보호사)") > 0 Then%>checked<%End If%>/> 간병인(요양보호사)&nbsp;
<input type="radio" name="license4_gb" value="1" <%=fncSetCheckBox(license_no4,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license4_gb" value="2" <%=fncSetCheckBox(license_no4,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license4_gb" value="N" <%=fncSetCheckBox(license_no4,"N")%>/>없음&nbsp;&nbsp;<br/>

<input type="checkbox" name="license5" value="영유아돌보미" <%If InStr(license5,"영유아돌보미") > 0 Then%>checked<%End If%>/> 영유아돌보미<span style="margin-left:38px;"></span>
<input type="radio" name="license5_gb" value="1" <%=fncSetCheckBox(license_no5,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license5_gb" value="2" <%=fncSetCheckBox(license_no5,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license5_gb" value="N" <%=fncSetCheckBox(license_no5,"N")%>/>없음&nbsp;&nbsp;<br/>

<input type="checkbox" name="license6" value="기타" <%If InStr(license6,"기타") > 0 Then%>checked<%End If%>/> 기타<span style="margin-left:85px;"></span>
<input type="radio" name="license6_gb" value="1" <%=fncSetCheckBox(license_no6,"1")%>/>기본&nbsp;&nbsp;
<input type="radio" name="license6_gb" value="2" <%=fncSetCheckBox(license_no6,"2")%>/>심화&nbsp;&nbsp;
<input type="radio" name="license6_gb" value="N" <%=fncSetCheckBox(license_no6,"N")%>/>없음&nbsp;&nbsp;<br/>


				</td>
			</tr>
			<!--tr>
				<th>급수</th>
				<td>
					<select name="license_no" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="기본" <%=fncSetSelectBox("기본",arrList(18,0))%> >기본</option>
						<option value="심화" <%=fncSetSelectBox("심화",arrList(18,0))%> >심화</option>
					</select>
				</td>
			</tr-->
			<!--tr>
				<th>자격사항</th>
				<td><input type="text" name="QUALIFICTION"  class="textarea" size="60" value="<%=arrList(26,0)%>"/></td>
			</tr-->
			<tr>
				<th>종교</th>
				<td>
				<input type="text" name="hp_riligion" class="textarea" size="60" value="<%=arrList(19,0)%>"/>
				</td>
			</tr>
			<tr>
				<th>배상보험가입유무</th>
				<td>
					<select name="INSURANCE_FLG"  class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="Y" <%=fncSetSelectBox("Y",arrList(20,0))%>> 가입</option>
						<option value="N" <%=fncSetSelectBox("N",arrList(20,0))%>> 가입하지않음</option>
					</select>
				
				증권번호 <input type="text" name="INSURANCE_NO" class="textarea" size="35" value="<%=arrList(21,0)%>"/></td>
			</tr>
			<tr>
				<th>건강진단유무</th>
				<td>
					<select name="health_flg" onChange="" class="textarea" style="height:35px;">
						<option value="" selected>선택</option>
						<option value="Y" <%=fncSetSelectBox("Y",arrList(40,0))%>> 건강진단완료</option>
						<option value="N" <%=fncSetSelectBox("N",arrList(40,0))%>> 건강진단미완료</option>
					</select> &nbsp;&nbsp;
			</tr>
			<tr>
				<th>수혜기간</th>
<%
If arrList(22,0) <> "" THEN
%>
				<td> 
				<input type="text" id="datepicker" name="i_start_date" value="<%=i_start_ymd%>"> ~ <input type="text" id="datepicker1" name="i_end_date" value="<%=i_end_ymd%>"> 
				<!--
				<%
					Mbirth = Mid(arrList(22,0),5,2)
					If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
					Dbirth = Right(arrList(22,0),2)
					If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
				%>
					<select name="startY"  >
					<% For num=Year(DateAdd("yyyy",-50,Date())) To Year(DateAdd("yyyy",3,Date())) %>
					
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(22,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="startM"  >
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mbirth)%>><%=num%>월</option>
					<% Next %>
					</select>
					<select name="startD" >
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dbirth)%>><%=num%>일</option>
					<% Next %>
					</select>

					<%
						EMbirth = Mid(arrList(23,0),5,2)
						If EMbirth < 10 Then EMbirth = Right(EMbirth,1)
						EDbirth = Right(arrList(23,0),2)
						If EDbirth < 10 Then EDbirth = Right(EDbirth,1)
					%>

 
					~
					<select name="endY"  >
						<% For num=Year(DateAdd("yyyy",-50,Date())) To Year(DateAdd("yyyy",3,Date())) %>
								<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(23,0),4))%>><%=num%></option>
							<% Next %>
					</select>
					<select name="endM"  >
						<option value="">월</option>
							<% For num=1 To 12 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,EMbirth)%>><%=num%>월</option>
							<% Next %>
					</select>
					<select name="endD"  >
					<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>" <%=fncSetSelectBox(num,EDbirth)%>><%=num%>일</option>
							<% Next %>
					</select> -->
				</td>

				<%
				
				else
				%>

				<td>
				<input type="text" id="datepicker" name="i_start_date" value=""> ~ <input type="text" id="datepicker1" name="i_end_date" value=""> 
				<!--
					<select name="startY" >
					<% For num=Year(DateAdd("yyyy",-50,Date())) To Year(DateAdd("yyyy",3,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
					</select>
					<select name="startM"  >
						<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
					</select>
					<select name="startD"  >
						<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
					</select>
					~
					<select name="endY"  >
						<% For num=Year(DateAdd("yyyy",-50,Date())) To Year(DateAdd("yyyy",3,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
					</select>
					<select name="endM"  >
						<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
					</select>
					<select name="endD"  >
					<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
					</select> -->
				</td>
				<%End if%>
			</tr>
			<tr>
				<th>상태</th>
				<td>
					<select name="INSURANCE_NOW" onChange="" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="W" <%=fncSetSelectBox("W",arrList(24,0))%>> 대기중 </option><!--  Wait Keep Expired  -->
						<option value="K" <%=fncSetSelectBox("K",arrList(24,0))%>> 유지 </option>
						<option value="E" <%=fncSetSelectBox("E",arrList(24,0))%>> 만료 </option>
					</select>
				</td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="QnA"  class="textarea" size="60" value="<%=arrList(27,0)%>"/></td>
			</tr>

			</thead>
			</table>

<%
If uId = "test" Then   
%>
<br/><br/>
			<table border="1" align="center" class="tb_style02">
			<colgroup>
			<col width="3%" />
			<col width="22%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
			</colgroup>
			<thead>
			<tr>
				<th style="text-align:center">번호</th>
				<th style="text-align:center">산모명</th>
				<th style="text-align:center">업무내역</th>
				<th style="text-align:center">산도모우미 비고</th>
				<th style="text-align:center">서비스연장</th>
			</tr>
			</thead>
			<tbody>
<%

	If IsArray(arr_Worklist) Then 
		For num=0 To UBound(arr_Worklist,2)	
			mem_no		= arr_Worklist(0,num)
			work_no		= arr_Worklist(1,num)
			md_memo		= arr_Worklist(2,num)
			work_no_3	= arr_Worklist(3,num)
%>
			<tr align="center">
				<td><%=num+1%></td>
				<td><%=mem_name%></td>
				<td><% If work_no = "0" Then %> 첫번째 <% ElseIf work_no = "1" then%> 두번째 <% ElseIf work_no = "1" then%> 세번째  <% Else %> 네번째 <% End If %></td>
				<td><%=md_memo%></td>
				<td><% If work_no_3 = "0" Then %>  <% ElseIf work_no_3 = "1" then%> 서비스연장1 <% ElseIf work_no_3 = "2" then%> 서비스연장2 <% Else %> 서비스연장3 <% End If %></td>
			</tr>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">현재 작업내역이 없습니다.</td>
			</tr>
<%
	End If
End if
%>



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





<%
	else
%>
<!-- 새 로 등 록 -->





	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>산모도우미관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>관리사 이름</th>
				<td><input type="text" name="hp_name" class="textarea" size="20" value=""/></td>
			</tr>
			<tr>
				<th>관리사 사진</th>
				<td height="200">
					<input type="button" class="button" onclick="fncOpenPop('<%=hp_seq%>')"  value="파일 첨부하기"/>
						<p style="padding-top:10px"><span id="fileNm_<%=hp_seq%>" style="width:10px;">
						<%	If mm_img <> "" Then %>
							<img src="/upload_file/admin/photo/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
						<%	End If %>
					</span><br /></p>
				</td>
			</tr>
			<tr>
				<th>주민번호</th>
				<td><input type="text" name="jumin1" class="textarea" size="6" maxlength="6" value=""/> - <input type="text" name="jumin2" class="textarea" size="7" maxlength="7" value=""/></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td>
					<select name="hp_1" valid="E|A=핸드폰번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="010" >010</option>
						<option value="011" >011</option>
						<option value="016" >016</option>
						<option value="017" >017</option>
						<option value="018" >018</option>
						<option value="019" >019</option>
					</select>
					-
					<input type="text" name="hp_2" size="5" maxlength="4" value="" valid="E|A=핸드폰번호를 입력해 주세요"/>
					-
					<input type="text" name="hp_3" size="5" maxlength="4" value="" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;
				</td>
			</tr>
			<tr>
				<th>집전화</th>
				<td>
					<select name="phone_1" valid="E|A=전화번호를 선택해 주세요">
						<option value="">선택</option>
						<option value="02" >02</option>
						<option value="031" >031</option>
						<option value="032" >032</option>
						<option value="033" >033</option>
						<option value="041" >041</option>
						<option value="042" >042</option>
						<option value="043" >043</option>
						<option value="051" >051</option>
						<option value="052" >052</option>
						<option value="053" >053</option>
						<option value="054" >054</option>
						<option value="055" >055</option>
						<option value="061" >061</option>
						<option value="062">062</option>
						<option value="063">063</option>
						<option value="064">064</option>
						<option value="070">070</option>
					</select>
					-
					<input type="text" name="phone_2" size="5" maxlength="4" value="" valid="E|A=전화번호를 입력해 주세요"/>
					-
					<input type="text" name="phone_3" size="5" maxlength="4" value="" valid="E|A=전화번호를 입력해 주세요"/>
				</td>	
			</tr>
			<tr>
				<th>관리사 번호</th>
				<td></td>
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
			<tr>
				<th>주소</th>
				<td>
					<input type="text"  id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text"  id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="" valid="E|A=우편번호를 입력해 주세요"/>
					&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>

					<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="" onClick="fncOpenZip();" valid="E|A=주소를 입력해 주세요"/>
					<input type="text" name="addr_2" class="textarea" size="35" value="" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>도우미 분류</th>
				<td>
					<select name="hp_type" onChange="" class="textarea" style="height:35px;">
						<option value=""selected>선택</option>
						<option value="입주" >입주</option>
						<option value="출퇴근형" >출퇴근형</option>
						<option value="복합형" >복합형</option>
					</select>
				</td>
			</tr>
			<!--tr>
				<th>희망근무형태</th>
				<td>
					<select name="hope_work" onChange="" class="textarea" style="height:35px;">
						<option value=""selected>선택</option>
						<option value="입주" >입주</option>
						<option value="출퇴근형" >출퇴근형</option>
						<option value="복합형" >복합형</option>
					</select>
				</td>
			</tr-->
			<tr>
				<th>계좌정보</th>
				<td>
					<select name="bank" onChange="" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="국민은행" >국민은행</option>
						<option value="우리은행" >우리은행</option>
						<option value="외환은행"  >외환은행</option>
						<option value="신한은행"  >신한은행</option>
						<option value="SC제일은행"  >SC제일은행</option>
						<option value="하나은행"  >하나은행</option>
						<option value="기업은행"  >기업은행</option>
						<option value="새마을금고"  >새마을금고</option>
						<option value="농협"  >농협</option>
						<option value="신협"  >신협</option>
						<option value="수협"  >수협</option>
						<option value="광주은행" >광주은행</option>
						<option value="전북은행" >전북은행</option>
						<option value="부산은행" >부산은행</option>
						<option value="씨티은행"  >씨티은행</option>
						<option value="산업은행"  >산업은행</option>
						<option value="우체국"  >우체국</option>
						<option value="대구은행"  >대구은행</option>
						<option value="경남은행"  >경남은행</option>
						<option value="제주은행" >제주은행</option>
					</select>
			 
				 계좌번호 <input type="text" name="account" class="textarea" size="35" value=""/> 
				 예금주 <input type="text" name="account_name" class="textarea" size="35" value=""/></td>
			</tr>
			<tr>
				<th>희망근무지역</th>
				<td>
					<input type="text" name="hp_hope" class="textarea" size="60" value=""/>
				</td>
			</tr>
			<tr>
				<th>가까운지하철역</th>
				<td>
					<input type="text" name="hp_near" class="textarea" size="60" value=""/>
				</td>
			</tr>
			<tr>
				<th>교육수료기관</th>
				<td>
					<input type="text" name="edu_org" class="textarea" size="60" value=""/>
				</td>
			</tr>
			<tr>
				<th>기수</th>
				<td>
					<input type="text" name="dip_no" class="textarea" size="60" value=""/>
				</td>
			</tr>
			<tr>
				<th>자격증</th>
				<td>
					<!--select name="license" onChange="" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="산후도우미"> 산후도우미 </option>
						<option value="베이비시터"> 베이비시터 </option>
						<option value="간호조무사"> 간호조무사 </option>
						<option value="간병인(요양보호사)"> 간병인(요양보호사) </option>
						<option value="영유아돌보미"> 영유아돌보미 </option>
						<option value="기타"> 기타 </option>
					</select-->

					<input type="checkbox" name="license1" value="산후도우미" /> 산후도우미&nbsp;&nbsp;
					<span style="margin-left:50px;"></span>
					<input type="radio" name="license1_gb" value="1" />기본&nbsp;&nbsp;
					<input type="radio" name="license1_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license1_gb" value="N" checked/>없음&nbsp;&nbsp;<br/>

					<input type="checkbox" name="license2" value="베이비시터" /> 베이비시터&nbsp;&nbsp;
					<span style="margin-left:50px;"></span>
					<input type="radio" name="license2_gb" value="1" />기본&nbsp;&nbsp;
					<input type="radio" name="license2_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license2_gb" value="N" checked/>없음&nbsp;&nbsp;<br/>

					<input type="checkbox" name="license3" value="간호조무사" /> 간호조무사&nbsp;&nbsp;
					<span style="margin-left:50px;"></span>
					<input type="radio" name="license3_gb" value="1" />기본&nbsp;&nbsp;
					<input type="radio" name="license3_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license3_gb" value="N" checked/>없음&nbsp;&nbsp;<br/> 

					<input type="checkbox" name="license4" value="간병인(요양보호사)" /> 간병인(요양보호사)&nbsp;&nbsp;&nbsp;
					 
					<input type="radio" name="license4_gb" value="1"/>기본&nbsp;&nbsp;
					<input type="radio" name="license4_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license4_gb" value="N" checked/>없음&nbsp;&nbsp;<br/> 

					<input type="checkbox" name="license5" value="영유아돌보미" /> 영유아돌보미&nbsp;&nbsp;
					<span style="margin-left:38px;"></span>
					<input type="radio" name="license5_gb" value="1" />기본&nbsp;&nbsp;
					<input type="radio" name="license5_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license5_gb" value="N" checked/>없음&nbsp;&nbsp;<br/>

					<input type="checkbox" name="license6" value="기타" /> 기타&nbsp;&nbsp; 
					<span style="margin-left:88px;"></span>
					<input type="radio" name="license6_gb" value="1"/>기본&nbsp;&nbsp;
					<input type="radio" name="license6_gb" value="2" />심화&nbsp;&nbsp;
					<input type="radio" name="license6_gb" value="N" checked/>없음&nbsp;&nbsp;<br/>
				</td>
			</tr>
			<!--tr>
				<th>급수</th>
				<td>
					<select name="license_no" onChange="" class="textarea" style="height:35px;">
						<option value="" >선택</option>
						<option value="기본"> 기본</option>
						<option value="심화"> 심화</option>
					</select>
				</td>
			</tr-->
			<!--tr>
				<th>자격사항</th>
				<td><input type="text" name="QUALIFICTION"  class="textarea" size="60" value=""/> </td>
			</tr-->
			<tr>
				<th>종교</th>
				<td><input type="text" name="hp_riligion" class="textarea" size="60" value=""/>				</td>
			</tr> 
			<tr>
				<th>배상보험가입유무</th>
				<td>
					<select name="INSURANCE_FLG" onChange="" class="textarea" style="height:35px;">
						<option value="" selected>선택</option>
						<option value="Y"   > 가입</option>
						<option value="N"  > 가입하지않음</option>
					</select> &nbsp;&nbsp;
				 
				 증권번호 <input type="text" name="INSURANCE_NO" class="textarea" size="35" value=""/></td>
			</tr>
			<tr>
				<th>건강진단유무</th>
				<td>
					<select name="health_flg" onChange="" class="textarea" style="height:35px;">
						<option value="" selected>선택</option>
						<option value="Y"> 건강진단완료</option>
						<option value="N"> 건강진단미완료</option>
					</select> &nbsp;&nbsp;
			</tr>
			<tr>
				<th>수혜기간</th>
				<td>
					<input type="text" id="datepicker" name="i_start_date" value=""> ~ <input type="text" id="datepicker1" name="i_end_date" value=""> 
					<!--
					<select name="startY" >
					<% For num=Year(DateAdd("yyyy",5,Date())) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
					</select>
					<select name="startM"  >
						<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
					</select>
					<select name="startD"  >
						<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
					</select>
					~
					<select name="endY"  >
						<% For num=Year(DateAdd("yyyy",5,Date())) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
					</select>
					<select name="endM"  >
						<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
					</select>
					<select name="endD"  >
					<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
					</select>-->
				</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>
					<select name="INSURANCE_NOW" onChange="" class="textarea" style="height:35px;">
						<option value="">선택</option>
						<option value="W" selected > 대기중</option>
						<option value="Y" selected > 유지</option>
						<option value="N" selected > 만료</option>
					</select>
				</td>
			</tr>

			

			<tr>
				<th>비고</th>
				<td><input type="text" name="QnA"  class="textarea" size="60" value=""/> </td>
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

<%
	End if
%>
</body>


<!--// S : 파일 업로드 함수 모음 -->
<script type="text/javascript">

</script>
<!--// E : 파일 업로드 함수 모음 -->


<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
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
  }); 
</script>
<!-- 달력추가 끝-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');



	btnDel.click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./helper_sql.asp?mode=del&hp_seq=<%=hp_seq%>'});
		}
	});

	btnSubmit.click(function(){

 
	  // 주민등록번호 체크 로직
    /*
	sum=0;
	idNum = new Array(13); //입력값을 위한 배열
	weighNum = new Array(2,3,4,5,6,7,8,9,2,3,4,5); //가중치를 위한 배열
	
	if(document.oFrm.jumin1.value.length!=6||document.oFrm.jumin2.value.length!=7){    //각각 6자리와 7자리의 숫자인지 검사
		alert("올바른 값을 입력하세요");
		return false;
	}
	inputId = document.oFrm.jumin1.value + document.oFrm.jumin2.value;    //두 양식을 하나로 합침

	for(i=0;i<13;i++){
		idNum[i] = inputId.substr(i,1);  //입력된 번호를 하나씩 배열에 할당     //substr함수 - 지정한 위치에서 시작하고 지정한 길이를 갖는 부분 문자열을 반환한다
	}                                                                                                              //sval=string.substr(iStart,iLenght)   문법
	for(i=0;i<12;i++){
		sum +=idNum[i] * weighNum[i];    //입력값과 가중치를 각각 곱해서 합을 구함
	}
	check = 11 - (sum%11);//check를 위한 숫자를 구함

	//document.write(check);
	
	if(check > 9){
		check -=10;
	}
	if(check != idNum[12]){            //체크숫자와 입력값의 마지막 숫자가 다르면 틀린값
		alert("올바른 번호가 아닙니다");
		return false;
	}
	else{
	//	alert("올바른 번호입니다");
	}

*/

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./helper_sql.asp"
	});

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function fncOpenZip(){
		window.open("/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}


	function fncOpenPop(index){
		window.open('/common/inc/Helper_UploadPopup.asp?type=main&imageIndex='+index,'fileUpload_pop','width=496px, height=270px');
		
		//window.open('/common/inc/Helper_UploadPopup.asp?type=main','fileUpload_pop','width=496px, height=270px');
	}

	function previewImageBind(index, imgURL, fileNm) {
		strHtml = "<input type='hidden' name='filePath' value='"+ imgURL +"'/>";
		strHtml += "<img src='/upload_file/admin/photo/"+ imgURL +"' width='<%=width%>' height='<%=height%>'/>";
		jQuery("#fileNm_"+index).html(strHtml)
		  
	}

	function change_classify(){
    var str=document.myform.classify_user.options[document.myform.classify_user.selectedIndex].value ;
    if (str=="직접입력"){
    document.myform.whereSQL.disabled =false;
    }else{
    document.myform.whereSQL.disabled =true;
    }
}

function fncOpenZip_1(){
	
		
	var form = document.oFrm;
	var mo_helper_name1 = form.hp_name.value;


	var width = "725"; 
	var height = "550"; 
	var top = (window.screen.height-height)/2; 
	var left = (window.screen.width-width)/2; 
	var url = "/common/inc/pop_mo_helper_list.asp?mo_helper_name="+mo_helper_name1; 
	var title = "산모도우미 검색"; 
	var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
  window.open(url , title, status);

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