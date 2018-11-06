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
    If intIDX <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

		strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			birthday = Rs(3)
			child_birthday = Rs(12)
			service_birthday = Rs(13)

			mode = "upd"
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 

'-----------------------------------------------------------------------------
'	지점 정보 호출
	md_local = arrList(23,0)
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
	
	If birthday <> "" Then 
		birth_m = Mid(arrList(3,0),5,2)
		birth_d = Right(arrList(3,0),2)
		birth_ymd = Left(arrList(3,0),4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	If child_birthday <> "" then
		'출산예정일
		child_m = Mid(arrList(12,0),5,2)
		child_d = Right(arrList(12,0),2)
		child_ymd = Left(arrList(12,0),4) & "-" & child_m & "-" & child_d

		If child_ymd = "--" Then
			child_ymd = ""
		End If
	End If
	
	If service_birthday <> "" then
		'서비스시작일
		service_sm = Mid(arrList(13,0),5,2)
		service_sd = Right(arrList(13,0),2)
		service_symd = Left(arrList(13,0),4) & "-" & service_sm & "-" & service_sd

		If service_symd = "--" Then
			service_symd = ""
		End If
	End If
	
'-------달력 추가로 수정----------------------------------------------------




%>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 게시판관리 > <strong>정부지원 예약확인</strong></div>
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
				<th>성명</th>
				<td><input type="text" name="mem_nm" size="20" value="<%=arrList(2,0)%>" valid="E|M=10|A=성명을 입력해 주세요"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="text" id="datepicker" name="birth" value="<%=birth_ymd%>"> 
			 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
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
				<th>핸드폰번호</th>
				<td>
				<%
					arrHp = Split(arrList(5,0),"-")
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
					<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(6,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>
					-
					<input type="text" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(6,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>

					<input type="text" name="addr_1" class="textarea" size="60" value="<%=arrList(7,0)%>" valid="E|A=주소를 입력해 주세요"/>
					<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(8,0)%>" valid="E|A=상세주소를 입력해 주세요"/>
				</td>
			</tr>
			<tr>
				<th>관리사주민번호</th>	
				<td>	
					<input type="text" name="jumin1" size="6" maxlength="6"  value="<%=arrList(25,0)%>" > - <input type="text" name="jumin2" size="7" maxlength="7"  value="<%=arrList(26,0)%>"> 
				</td>
			</tr>
			<tr>
				<th>신청서비스</th>
				<td>	
					<input type="checkbox" name="check1" value="베이직프로그램" <%If InStr(arrList(9,0),"베이직프로그램") > 0 Then%>checked<%End If%> valid="E|A=신청서비스를 선택해 주세요"/> 베이직프로그램&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="프리미엄프로그램" <%If InStr(arrList(9,0),"프리미엄프로그램") > 0 Then%>checked<%End If%>/> 프리미엄프로그램&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="VIP프로그램" <%If InStr(arrList(9,0),"VIP프로그램") > 0 Then%>checked<%End If%>/> VIP프로그램&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="프라이빗프로그램" <%If InStr(arrList(9,0),"프라이빗프로그램") > 0 Then%>checked<%End If%>/> 프라이빗프로그램&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="과체중" <%If InStr(arrList(9,0),"과체중") > 0 Then%>checked<%End If%>/> 과체중&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="워킹맘" <%If InStr(arrList(9,0),"워킹맘") > 0 Then%>checked<%End If%>/> 워킹맘
					<input type="checkbox" name="check1" value="35세이상" <%If InStr(arrList(9,0),"35세이상") > 0 Then%>checked<%End If%>/> 35세이상&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="산후조리원을 내집에" <%If InStr(arrList(9,0),"산후조리원을 내집에") > 0 Then%>checked<%End If%>/> 산후조리원을 내집에&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="다둥이" <%If InStr(arrList(9,0),"다둥이") > 0 Then%>checked<%End If%>/> 다둥이
					<input type="checkbox" name="check1" value="상담 후 결정" <%If InStr(arrList(9,0),"상담 후 결정") > 0 Then%>checked<%End If%>/> 상담 후 결정
					<input type="checkbox" name="check1" value="바우처프로그램" <%If InStr(arrList(9,0),"바우처프로그램") > 0 Then%>checked<%End If%>/> 바우처프로그램
				</td>
			</tr>
			<tr>
				<th>이용기간</th>	
				<td>
					<input type="radio" name="radio1" value="1주" <%=fncSetCheckBox("1주",arrList(10,0))%> valid="E|A=이용기간을 선택해 주세요"/> 1주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="2주" <%=fncSetCheckBox("2주",arrList(10,0))%> /> 2주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="3주" <%=fncSetCheckBox("3주",arrList(10,0))%> /> 3주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4주" <%=fncSetCheckBox("4주",arrList(10,0))%> /> 4주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="6주" <%=fncSetCheckBox("6주",arrList(10,0))%> /> 6주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="8주" <%=fncSetCheckBox("8주",arrList(10,0))%> /> 8주&nbsp;&nbsp;
					<input type="radio" name="radio1" value="기타" <%=fncSetCheckBox("기타",arrList(10,0))%> /> 기타&nbsp;&nbsp;
					<!--<input type="radio" name="radio1" value="상담 후 결정" <%=fncSetCheckBox("상담 후 결정",arrList(10,0))%> /> 상담 후 결정 -->
				</td>
			</tr>
			<tr>
				<th>이용형태</th>	
				<td>
					<input type="radio" name="radio2" value="출퇴근 주5일" <%=fncSetCheckBox("출퇴근 주5일",arrList(11,0))%> valid="E|A=이용형태를 선택해 주세요"/> 출퇴근 주5일&nbsp;&nbsp;
					<input type="radio" name="radio2" value="출퇴근 주6일" <%=fncSetCheckBox("출퇴근 주6일",arrList(11,0))%> valid="E|A=이용형태를 선택해 주세요"/> 출퇴근 주6일&nbsp;&nbsp;
					<input type="radio" name="radio2" value="입주" <%=fncSetCheckBox("입주",arrList(11,0))%>/> 입주&nbsp;&nbsp;
					<input type="radio" name="radio2" value="상담 후 결정" <%=fncSetCheckBox("상담 후 결정",arrList(11,0))%>/> 상담 후 결정
				</td>
			</tr>
			<tr>
				<th>출산예정일</th>	
				<td><input type="text" id="datepicker1" name="child_birth" value="<%=child_ymd%>"> 
		 
				</td>
			</tr>
			<tr>
				<th>서비스시작 예정일</th>	
				<td><input type="text" id="datepicker2" name="service_start" value="<%=service_symd%>"> 
				 
				</td>
			</tr>
			<tr>
				<th>조리원 이용</th>	
				<td>
					<input type="radio" name="radio3" value="이용함" <%=fncSetCheckBox("이용함",arrList(14,0))%> valid="E|A=조리원 이용여부를 선택해 주세요"/> 이용함&nbsp;&nbsp;
					<input type="radio" name="radio3" value="이용안함" <%=fncSetCheckBox("이용안함",arrList(14,0))%>/> 이용안함
				</td>
			</tr>
			<tr>
				<th>출산경험</th>	
				<td>
					<input type="radio" name="radio4" value="초산모" <%=fncSetCheckBox("초산모",arrList(15,0))%> valid="E|A=출산경험을 선택해 주세요"/> 초산모&nbsp;&nbsp;
					<input type="radio" name="radio4" value="경산모" <%=fncSetCheckBox("경산모",arrList(15,0))%>/> 경산모 
				</td>
			</tr>
			<tr>
				<th>특이사항</th>	
				<td>
					<input type="checkbox" name="check2" value="쌍둥이" <%If InStr(arrList(16,0),"쌍둥이") > 0 Then%>checked<%End If%> valid="E|A=특이사항을 선택해 주세요"/> 쌍둥이&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="임신성 당뇨" <%If InStr(arrList(16,0),"임신성 당뇨") > 0 Then%>checked<%End If%>/> 임신성 당뇨 &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="부종" <%If InStr(arrList(16,0),"부종") > 0 Then%>checked<%End If%>/> 부종&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="고혈압" <%If InStr(arrList(16,0),"고혈압") > 0 Then%>checked<%End If%>/> 고혈압 &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="없음" <%If InStr(arrList(16,0),"없음") > 0 Then%>checked<%End If%>/> 없음 
				</td>
			</tr>
			<tr>
				<th>가족사항</th>	
				<td>
					<input type="checkbox" name="check3" value="부모님" <%If InStr(arrList(17,0),"부모님") > 0 Then%>checked<%End If%> valid="E|A=가족사항을 선택해 주세요"/> 부모님&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="남편" <%If InStr(arrList(17,0),"남편") > 0 Then%>checked<%End If%>/> 남편 &nbsp;&nbsp;
					<input type="checkbox" name="check3" value="큰아이 1명" <%If InStr(arrList(17,0),"큰아이 1명") > 0 Then%>checked<%End If%>/> 큰아이 1명&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="큰아이 2명이상" <%If InStr(arrList(17,0),"큰아이 2명이상") > 0 Then%>checked<%End If%>/> 큰아이 2명이상&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="기타가족" <%If InStr(arrList(17,0),"기타가족") > 0 Then%>checked<%End If%>/> 기타가족
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
			<tr>
				<th>상담완료여부</th>	
				<td>
					<select name="consulting_end">
						<option value="N" <%=fncSetSelectBox("N",arrList(24,0))%>>미완료</option>
						<option value="Y" <%=fncSetSelectBox("Y",arrList(24,0))%>>완료</option>
					</select>

				</td>
			</tr>
			<tr>
				<th>상담내용</th>	
				<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=상담내용을 입력해 주세요"><%=arrList(18,0)%></textarea></td>
			</tr>
			</thead>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>


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
		  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	}); 
	$( "#datepicker1" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	}); 
	$( "#datepicker2" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
	}); 
  }); 
</script>
<!-- 달력추가 끝-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function() {

		if (!checkForm(frm,tar)){ return false }

	//var number=(document.oFrm.jumin1.value)+(document.oFrm.jumin2.value);

//	alert(jumin1);
//    alert(jumin2);
	  // 주민등록번호 체크 로직
    
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

		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "/info/info_01_voucher_sql.asp?<%=strLnkUrl%>"
	});
</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>