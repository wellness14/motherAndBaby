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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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

		/*고객상담일지*/
		#container .consultRequestHeader{width:100%;height:200px;background-color:#ff9b9b;text-align:center;}
		#container .consultRequestHeader p.h2{padding-top:60px;text-align:center;}
		#container .consultRequestHeader p.h2 strong{color:white;width:100%;font-size:40px;font-weight:bold;}
		#container .consultRequestHeader p.h2 i{font-size:45px;color:white;padding:0 20px;}
		#container .consultRequestHeader p.small{font-size:14px;color:white;padding:10px 0;text-align:center;}

	.consultRequestCont{width:800px;margin:0 auto;}	
	.q1{padding:10px 0;width:100%;}
	.title{font-size: 20px;padding:30px 0 30px 0;}
	.title strong{font-size: 30px;}
	.title i{padding-right:10px;font-size: 28px;}
	.q1 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q1 span.addr{display: inline-block;}
	.q1 input[type="text"],input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q1 input[type="date"]{width:90%;}
	.q1 input[type="radio"]{margin-right:5px;}
	.q1 a{display: inline-block;padding:10px;background-color: pink;text-decoration: none;color:white;margin: 0 20px;box-shadow: 0px 3px 5px rgba(0,0,0,0.3)}
	.q1 input.addr01{margin-top: 10px;margin-bottom: 20px;}
	.q1 .dateLeft{float: left;width:50%;}
	.q1 .dateLeft input{width:80%;}
	.q1 .dateRight{float: right;width:50%;}
	.q1 .dateRight input{width:80%;}
	.q1 input.twins{width:50px;height:30px;text-align: center;}
	.q1 input.weight{width:50px;height:30px;margin-top: 30px;text-align: center;}
	.q1 label{margin-right:20px;}
	.q1 label.weight{margin-left: 100px;}
	.q1 label.natalhospital{margin-left: 65px;}
	.q1 input.natalhospital{width:200px;height: 30px;}
	.q1 span.delivery{margin-bottom: 20px;}
	.q1 label.nature,label.sex{height:40px;display: inline-block;}
	.q1 .left{float: left;width:50%;}
	.q1 .right{float: right;width:50%;}
	.q1 .right span{margin-bottom: 20px;}

	.q2{padding:10px 0;width:100%;}
	.q2 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q2 input[type="radio"],.q2 input[type="checkbox"]{margin-right:5px;}
	.q2 input[type="text"],input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q2 span.carecenter{margin-bottom: 20px;}
	.q2 input.term{width:40px;height:30px;text-align: center;}
	.q2 input.centername{width:330px;}
	.q2 input[type="date"]{margin-top: 20px;}
	.q2 span.career, span.focus, span.voucher{margin: 30px 0 20px 30px;}
	.q2 input.vip{margin-left: 30px;}
	.q2 input.typea{margin-left: 30px;}
	.q2 input.vip{margin-left: 30px;}
	.q2 input.first{margin-left: 30px;margin-bottom: 15px;}
	.q2 span.whatservice{margin-top: 30px;}
	.q2 input.small{width:40px;height:30px;text-align: center;margin-top: 20px;}
	.q2 label.mr{margin-right: 18px;}
	.q2 label.whatweek{margin-right: 18px;}
	.q2 span.whatweek{margin-bottom: 10px;}
	.q2 span.anotherFam{margin-bottom: 20px;}
	.q2 span.whatTendency{margin-bottom: 20px;}
	.q2 input.addGold{width:200px;}
	.q2 input.excuteday{width:200px;}
	.q2 label.nope{margin-right: 20px;}

	.q3{padding-bottom: 50px;}
	.q3 .title{margin-top: 30px;}
	.q3 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q3 input[type="radio"]{margin-right:5px;}
	.q3 input[type="text"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q3 input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:615px;margin:0 0 40px 0;margin-left: 20px;}
	.q3 input.delidate{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:550px;margin:0 0 40px 0;margin-left: 30px;}
	.q3 .select{margin-bottom: 20px;}
	.q3 input.josa{width:200px;margin-left: 20px;}
	.q3 select{width:180px;height:40px;margin-left: 15px;}
	.q3 input.small{width:40px;height:30px;text-align: center;margin-top: 20px;margin-left: 20px;}
	.q3 input.small1{width:40px;height:30px;text-align: center;margin-top: 20px;}
	.q3 input.small2{width:200px;height:30px;text-align: center;margin-top: 20px;margin-right: 20px;}
	.q3 input.small3{width:120px;height:30px;text-align: center;margin-top: 20px;margin-right: 20px;}
	.q3 input.small4{width:120px;height:30px;text-align: center;margin-top: 20px;}
	.q3 input.won{width:120px;height:30px;text-align: center;margin-top: 20px;margin-left: 10px;}
	.q3 span.massage{margin-bottom: 20px;}
	.q3 .ml{margin-left: 30px;}
	.q3 span.deliverydate{margin-left: 20px;margin-top: 30px;}
	.q3 input.delidate{width:200px;}
	.q3 textarea{width:100%;height:200px;margin-bottom: 30px;}
	.q3 .noask{margin-right:20px;}

	.btnwrap{width:300px;margin:0 auto;padding-bottom: 100px;}
	.btnwrap a{display: block;width:100px;height:40px;text-align: center;line-height: 40px;text-decoration: none;box-shadow: 0px 3px 5px rgba(0,0,0,0.3)}
	.btnwrap a.save{float: left;background-color: pink;color:white;}
	.btnwrap a.cancel{float: right;background-color: rgba(0,0,0,0.5);color:white;}

	.mr{margin-right:20px;}
	label.etc{width:70px;display:inline-block;}

	</style>
</head>
<%
	Dim mode : mode = "ins"
	
	intIDX = fncRequest("idx")   
	local = fncRequest("local")   

    If intIDX <> "" Then
		strTable = " FROM MO_SERVICE_CALL WITH(NOLOCK) "

		strWhere = " WHERE MO_CALL_SEQ = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"

			childbirth			= Rs(8)
			service_s			= Rs(9)
			exp_type			= Rs(10)
			out_Day				= Rs(41)
			gift_choice_send	= Rs(49)
			gift_box_send1		= Rs(51)
			md_local			= Rs(54)

			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
	'	response.Write "<script type='text/javascript'>history.back(-1);</script>"
	'	response.End 
	End If 
%>
 
<%


'-----------------------------------------------------------------------------
'	지점 정보 호출   
If intIDX <> "" Then
	'md_local = arrList(54,0)
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

'-----------------------------------------------------------------------------
End If

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


	'	등록 소모품 호출
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME, MO_CONSUMABLES_CATEGORY from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='M' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MO_CONSUMABLES_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	등록 소모품 보조
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='S' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_sub = Rs.getRows()
	End If 
	Call RSClose(Rs)


'-----------------------------------------------------------------------------
'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arr_Gift_Prodt = Rs.getRows()
	End If 
	Call RSClose(Rs)



	If childbirth <> "" Then 
	Mchildbirth = Mid(childbirth,5,2)
	If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
	Dchildbirth = Right(childbirth,2)
	If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
	End If 

	If service_s <> "" Then 
	service_sm = Mid(service_s,5,2)
	If service_sm < 10 Then service_sm = Right(service_sm,1)
	service_sd = Right(service_s,2)
	If service_sd < 10 Then service_sd = Right(service_sd,1)
	End If 

	If out_Day <> "" Then 
	out_Daym = Mid(out_Day,5,2)
	If out_Daym < 10 Then out_Daym = Right(out_Daym,1)
	out_Daymd = Right(out_Day,2)
	If out_Daymd < 10 Then out_Daymd = Right(out_Daymd,1)
	End If 

	If gift_choice_send <> "" Then 
	gift_choice_sendm = Mid(gift_choice_send,5,2)
	If gift_choice_sendm < 10 Then gift_choice_sendm = Right(gift_choice_sendm,1)
	gift_choice_sendmd = Right(gift_choice_send,2)
	If gift_choice_sendmd < 10 Then gift_choice_sendmd = Right(gift_choice_sendmd,1)
	End If 

	If gift_box_send1 <> "" Then 
	gift_box_sendm = Mid(gift_box_send1,5,2)
	If gift_box_sendm < 10 Then gift_box_sendm = Right(gift_box_sendm,1)
	gift_box_sendmd = Right(gift_box_send1,2)
	If gift_box_sendmd < 10 Then gift_box_sendmd = Right(gift_box_sendmd,1)
	End If 

	 
%>
<script>
 
</script>
<%
	If intIDX <> "" Then 
%>

			<body>
				<div id="container">
					<div class="linemap">마더앤베이비 > 회원관리 > <strong>상담신청</strong></div>
					<div class="write">
						<br />
						<form id="oFrm" name="oFrm" method="post">
						<input type="hidden" name="mode" value="<%=mode%>">
						<input type="hidden" name="idx" value="<%=intIDX%>">
						<input type="hidden" name="local" value="<%=grpcd%>">
						<table class="tb_style02">
						<colgroup>
							<col width="5%" /><col />
						</colgroup>
						<thead>
						<tr>
							<th>Q1</th>
							<td>
								마더앤베이비를 알게 된 경로 <br/>
								<input type="radio" name="know" value="지인추천" <%If InStr(arrList(1,0),"지인추천") > 0 Then%>checked<%End If%> valid="E|A=신청서비스를 선택해 주세요"/> 지인추천&nbsp;&nbsp;
								<input type="radio" name="know" value="인터넷검색" <%If InStr(arrList(1,0),"인터넷검색") > 0 Then%>checked<%End If%>/> 인터넷검색&nbsp;&nbsp;
								<input type="radio" name="know" value="블로거추천" <%If InStr(arrList(1,0),"블로거추천") > 0 Then%>checked<%End If%>/> 블로거추천&nbsp;&nbsp;
								<input type="radio" name="know" value="조리원" <%If InStr(arrList(1,0),"조리원") > 0 Then%>checked<%End If%>/> 조리원&nbsp;&nbsp; 
								<input type="radio" name="know" value="기타" <%If InStr(arrList(1,0),"기타") > 0 Then%>checked<%End If%>/> 기타&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q2</th>
				<%
					arrPhone = Split(arrList(3,0),"-")
				%>
							<td>이름 : <input type="text" name="name" class="textarea" size="10" value="<%=arrList(2,0)%>"/> <span style="margin-left:20px;"> </span>
								전화번호 : 
								<select name="phone_1" valid="E|A=전화번호를 선택해 주세요">
									<option value="">선택</option>
									<option value="02"<%=fncSetSelectBox("02",arrPhone(0))%>>02</option>
									<option value="031"<%=fncSetSelectBox("031",arrPhone(0))%>>031</option>
									<option value="032"<%=fncSetSelectBox("032",arrPhone(0))%>>032</option>
									<option value="033"<%=fncSetSelectBox("033",arrPhone(0))%>>033</option>
									<option value="041"<%=fncSetSelectBox("041",arrPhone(0))%>>041</option>
									<option value="042"<%=fncSetSelectBox("042",arrPhone(0))%>>042</option>
									<option value="043"<%=fncSetSelectBox("043",arrPhone(0))%>>043</option>
									<option value="051"<%=fncSetSelectBox("051",arrPhone(0))%>>051</option>
									<option value="052"<%=fncSetSelectBox("052",arrPhone(0))%>>052</option>
									<option value="053"<%=fncSetSelectBox("053",arrPhone(0))%>>053</option>
									<option value="054"<%=fncSetSelectBox("054",arrPhone(0))%>>054</option>
									<option value="055"<%=fncSetSelectBox("055",arrPhone(0))%>>055</option>
									<option value="061"<%=fncSetSelectBox("061",arrPhone(0))%>>061</option>
									<option value="062"<%=fncSetSelectBox("062",arrPhone(0))%>>062</option>
									<option value="063"<%=fncSetSelectBox("063",arrPhone(0))%>>063</option>
									<option value="064"<%=fncSetSelectBox("064",arrPhone(0))%>>064</option>
									<option value="070"<%=fncSetSelectBox("070",arrPhone(0))%>>070</option>
								</select>
								-
								<input type="text" name="phone_2" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=전화번호를 입력해 주세요"/>
								-
								<input type="text" name="phone_3" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=전화번호를 입력해 주세요"/>
			   	<%
					arrHp = Split(arrList(4,0),"-")
				%>	
								<span style="margin-left:20px;"> </span>핸드폰 번호 :

								<select name="hp_1" valid="E|A=핸드폰번호를 선택해 주세요">
									<option value="">선택</option>
									<option value="010"<%=fncSetSelectBox("010",arrHp(0))%>>010</option>
									<option value="011"<%=fncSetSelectBox("011",arrHp(0))%>>011</option>
									<option value="016"<%=fncSetSelectBox("016",arrHp(0))%>>016</option>
									<option value="017"<%=fncSetSelectBox("017",arrHp(0))%>>017</option>
									<option value="018"<%=fncSetSelectBox("018",arrHp(0))%>>018</option>
									<option value="019"<%=fncSetSelectBox("019",arrHp(0))%>>019</option>
								</select>
								-
								<input type="text" name="hp_2" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
								-
								<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
								</td>
						</tr>
						<tr>
							<th>Q3</th>
							<td>자택주소 : 
								<input type="text"  id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(5,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>
								-
								<input type="text"  id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="<%=RIGHT(arrList(5,0),3)%>" valid="E|A=우편번호를 입력해 주세요"/>
								&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>

								<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="<%=arrList(6,0)%>" onClick="fncOpenZip();" valid="E|A=주소를 입력해 주세요"/>
								<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(7,0)%>" valid="E|A=상세주소를 입력해 주세요"/>
							</td>
						</tr>
 
						<tr>
							<th>Q4</th>	
							<td>분만예정일 : 
								<select name="childbirth_y" valid="E|A=분만예정일을 선택해 주세요">
									<option value="">년</option>
								<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Left(childbirth,4))%>><%=num%></option>
								<% Next %>
								</select>
								<select name="childbirth_m" valid="E|A=분만예정일을 선택해 주세요">
									<option value="">월</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>월</option>
								<% Next %>
								</select>
								<select name="childbirth_d" valid="E|A=분만예정일을 선택해 주세요">
									<option value="">일</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>일</option>
								<% Next %>
								</select>
							 
								<span style="margin-left:20px;"> </span> 서비스실시 예정일 : 
								<select name="serviceDt_y" valid="E|A=서비스시작 예정일을 선택해 주세요">
									<option value="">년</option>
								<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Left(service_s,4))%>><%=num%></option>
								<% Next %>
								</select>
								<select name="serviceDt_m" valid="E|A=서비스시작 예정일을 선택해 주세요">
									<option value="">월</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,service_sm)%>><%=num%>월</option>
								<% Next %>
								</select>
								<select name="serviceDt_d" valid="E|A=서비스시작 예정일을 선택해 주세요">
									<option value="">일</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,service_sd)%>><%=num%>일</option>
								<% Next %>
								</select>
							</td>
						</tr>
						<tr>
							<th>Q5</th>	
							<td>
								<input type="radio" name="Q5" value="초산모" <%=fncSetCheckBox(exp_type,"초산모")%> onclick="check()" /> 초산모&nbsp;&nbsp;
								<input type="radio" name="Q5" value="경산모" <%=fncSetCheckBox(exp_type,"경산모")%> onclick="check()" /> 경산모 &nbsp;&nbsp;
								<select name="Q5_De" >
									<option value="1">1명</option>
									<option value="2">2명</option>
									<option value="3">3명</option>
									<option value="4">4명</option>
									<option value="5">5명</option>
									<option value="6">6명</option>
									<option value="7">7명</option>
									<option value="8">8명</option>
									<option value="9">9명</option>
								</select>
								나이 <input type="text" name="age" class="textarea" size="5" value="<%=arrList(12,0)%>"/>
								<span style="margin-left:20px;"></span>분만형태 : 
								<input type="text" name="bm_type" class="textarea" size="10" value="<%=arrList(13,0)%>"/>
							</td>
						</tr>
						<tr>
							<th>Q6</th>	
							<td>산후조리원 <span style="margin-left:30px;"></span>
								<input type="radio" name="Q6" value="이용안함" <%=fncSetCheckBox(arrList(14,0),"이용안함")%> onclick="check_Q6();"/> 이용안함&nbsp;&nbsp;
								<input type="radio" name="Q6" value="이용함" <%=fncSetCheckBox(arrList(14,0),"이용함")%> onclick="check_Q6();" valid="E|A=조리원 이용여부를 선택해 주세요"/> 이용함
									<input type="text"  name="Q6_week"  class="textarea" size="5" maxlength="3" value="<%=arrList(15,0)%>"/>주
							</td>
						</tr>
						<tr>
							<th>Q7</th>
							<td> 원하시는 서비스 프로그램은 무엇입니까?<br/>
							 관리사 경력기준 : 
								<input type="checkbox" name="Q7" value="VIP프로그램" <%If InStr(arrList(16,0),"VIP프로그램") > 0 Then%>checked<%End If%>/> VIP프로그램&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="프리미엄프로그램" <%If InStr(arrList(16,0),"프리미엄프로그램") > 0 Then%>checked<%End If%>/> 프리미엄프로그램&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="베이직프로그램" <%If InStr(arrList(16,0),"베이직프로그램") > 0 Then%>checked<%End If%> valid="E|A=신청서비스를 선택해 주세요"/> 베이직프로그램&nbsp;&nbsp;
							<br/> 집중관리프로그램 : 
								<input type="checkbox" name="Q7" value="프라이빗프로그램" <%If InStr(arrList(16,0),"프라이빗프로그램") > 0 Then%>checked<%End If%> /> 프라이빗프로그램&nbsp;&nbsp; 
								<input type="checkbox" name="Q7" value="워킹맘" <%If InStr(arrList(16,0),"워킹맘") > 0 Then%>checked<%End If%>/> 워킹맘(출/입)
								<input type="checkbox" name="Q7" value="산후조리" <%If InStr(arrList(16,0),"산후조리") > 0 Then%>checked<%End If%>/> 산후조리(출/입)&nbsp;&nbsp; 
								<input type="checkbox" name="Q7" value="35세이상" <%If InStr(arrList(16,0),"35세이상") > 0 Then%>checked<%End If%>/> 35세이상(출)&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="과체중" <%If InStr(arrList(16,0),"과체중") > 0 Then%>checked<%End If%>/> 과체중(출)&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q8</th>
							<td>서비스 내용중 출퇴근과 입주 서비스 중 어떤 서비스 이용을 원하십니까?<br/>
								<input type="radio" name="service_work" value="출퇴근5일" <%=fncSetCheckBox(arrList(17,0),"출퇴근5일")%>/> 출퇴근5일&nbsp;&nbsp;
								<input type="radio" name="service_work" value="출퇴근6일" <%=fncSetCheckBox(arrList(17,0),"출퇴근6일")%>/> 출퇴근6일&nbsp;&nbsp;
								<input type="radio" name="service_work" value="입주" <%=fncSetCheckBox(arrList(17,0),"입주")%>/> 입주&nbsp;&nbsp;
								<input type="radio" name="service_work" value="출퇴근" <%=fncSetCheckBox(arrList(17,0),"출퇴근")%>/> 출퇴근
								(<input type="text" name="service_work_add_1" size="3" maxlength="3" value="<%=arrList(18,0)%>"/>주)+입주(<input type="text" name="service_work_add_2" size="3" maxlength="3" value="<%=arrList(19,0)%>"/>주)
							</td>
						</tr>
						<tr>
							<th>Q9</th>
							<td>
								산후관리사 서비스는 몇 주를 원하십니까? <br/>
								<input type="radio" name="service_week" value="1주" <%=fncSetCheckBox(arrList(20,0),"1주")%> /> 1주&nbsp;&nbsp;
								<input type="radio" name="service_week" value="2주" <%=fncSetCheckBox(arrList(20,0),"2주")%> /> 2주&nbsp;&nbsp;
								<input type="radio" name="service_week" value="3주" <%=fncSetCheckBox(arrList(20,0),"3주")%> /> 3주&nbsp;&nbsp;
								<input type="radio" name="service_week" value="4주" <%=fncSetCheckBox(arrList(20,0),"4주")%> /> 4주&nbsp;&nbsp; 
								<input type="radio" name="service_week" value="기타" <%=fncSetCheckBox(arrList(20,0),"기타")%> /> 기타&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q10</th>
							<td> 추가가족 여부<br/>
								<input type="checkbox" name="add_fam1" value="미취학" <%If InStr(arrList(21,0),"미취학") > 0 Then%>checked<%End If%>/> 미취학 
								(<input type="text" name="add_fam1_1" size="3" maxlength="3" value="<%=arrList(22,0)%>"/>명) &nbsp&nbsp
								<input type="checkbox" name="add_fam2" value="취학" <%If InStr(arrList(23,0),"취학") > 0 Then%>checked<%End If%>/> 취학 
								(<input type="text" name="add_fam2_1" size="3" maxlength="3" value="<%=arrList(24,0)%>"/>명)&nbsp&nbsp
								<input type="checkbox" name="add_fam3" value="쌍둥이" <%If InStr(arrList(25,0),"쌍둥이") > 0 Then%>checked<%End If%>/> 쌍둥이 &nbsp&nbsp
								<input type="checkbox" name="add_fam4" value="부모님" <%If InStr(arrList(27,0),"부모님") > 0 Then%>checked<%End If%>/> 부모님 
								(<input type="text" name="add_fam4_1" size="3" maxlength="3" value="<%=arrList(28,0)%>"/>명)&nbsp&nbsp
								<input type="checkbox" name="add_fam5" value="기타" <%If  arrList(29,0) <> "" Then%>checked<%End If%>/> 기타 

								<%
									If arrList(29,0) = "" then
								%>
								(<input type="text" name="add_fam5_1" id="add_fam5_1" value="예)시누이" size="20" maxlength="20"  />
								<%
									else
								%>
								(<input type="text" name="add_fam5_1" id="add_fam5_1" value="<%=arrList(29,0)%>" size="20" maxlength="20"  />
								<%
									End if
								%>

								<%
									If arrList(30,0) = "" then
								%>
									<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value=""/>명)
								<%else%>
									<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value="<%=arrList(30,0)%>"/>명)
								<%End if%>
							</td>
						</tr>
						<tr>
							<th>Q11</th>
							<td>
								어떤 성향의 관리사를 원하십니까? (관리사의 업무 주안점은 무엇입니까?) <br/>
								<input type="checkbox" name="service_type_1" value="모유수유" <%If InStr(arrList(31,0),"모유수유") > 0 Then%>checked<%End If%>/> 모유수유&nbsp;&nbsp;
								<input type="checkbox" name="service_type_2" value="산후복귀" <%If InStr(arrList(32,0),"산후복귀") > 0 Then%>checked<%End If%>/> 산후복귀&nbsp;&nbsp;
								<input type="checkbox" name="service_type_3" value="신생아보육" <%If InStr(arrList(33,0),"신생아보육") > 0 Then%>checked<%End If%>/> 신생아보육&nbsp;&nbsp;
								<input type="checkbox" name="service_type_4" value="식사준비" <%If InStr(arrList(34,0),"식사준비") > 0 Then%>checked<%End If%>/> 식사준비&nbsp;&nbsp; 
								<input type="checkbox" name="service_type_5" value="가사위생" <%If InStr(arrList(35,0),"가사위생") > 0 Then%>checked<%End If%>/> 가사위생&nbsp;&nbsp;
								<input type="checkbox" name="service_type_6" value="큰아이보육" <%If InStr(arrList(36,0),"큰아이보육") > 0 Then%>checked<%End If%>/> 큰아이보육&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q12</th>
							<td> 유,무료 물품선택(택비 본인부담)<br/>
							1) 유축기    <select name="product_1"   class="textarea" style="height:35px;">
											<option value="">선택</option>
										    <%
												vCnt = UBOUND(arrProdt,2)
													For num = 0 To vCnt
									         %>
											<option value="<%=arrProdt(1,num)%>"  <%If arrList(37,0) = arrProdt(1,num) Then%>selected<%End If%>><%=arrProdt(1,num)%></option>
											<%	 
												 Next 
											%>
										</select>
										<!--
										 <select name="product_1_month"   class="textarea" style="height:35px;">
											<option value="">선택</option>											 
											<option value="6개월" <%=fncSetSelectBox("6개월",arrList(58,0))%>>6개월</option>
											<option value="3개월" <%=fncSetSelectBox("3개월",arrList(58,0))%>>3개월</option>
											<option value="1개월" <%=fncSetSelectBox("1개월",arrList(58,0))%>>1개월</option>
											<option value="2주" <%=fncSetSelectBox("2주",arrList(58,0))%>>2주</option>
										 </select>
										-->
										 <select name="product_2"   class="textarea" style="height:35px;">
											<option value="">선택</option>
										    <%
												vCnt = UBOUND(arrProdt_sub,2)
													For num = 0 To vCnt
									         %>
											<option value="<%=arrProdt_sub(1,num)%>"  <%If arrList(38,0) = arrProdt_sub(1,num) Then%>selected<%End If%>><%=arrProdt_sub(1,num)%></option>
											<%	 
												 Next 
											%>
										 </select>
									<!--<input type="text" name="product_1" size="20" maxlength="20" value="<%=arrList(37,0)%>"/> /
									<input type="text" name="product_2" size="20" maxlength="20" value="<%=arrList(38,0)%>"/> /
									-->
									<input type="text" name="product_week" size="3" maxlength="3" value="<%=arrList(39,0)%>"/> 주
									<input type="text" name="product_price" size="10" maxlength="10" value="<%=arrList(40,0)%>"/> 원
									 <span style="margin-left:20px;"></span>
										2) 조사기&nbsp&nbsp<select name="Q12_Y">
												<option value="">년</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(out_Day,4))%>><%=num%></option>
												<% Next %>
												</select>
												<select name="Q12_M" >
													<option value="">월</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,out_Daym)%>><%=num%>월</option>
												<% Next %>
												</select>
												<select name="Q12_D" >
													<option value="">일</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,out_Daymd)%>><%=num%>일</option>
												<% Next %>
												</select>  &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q13</th>
							<td> 전신마사지 -  산전 <input type="text" name="massage1" size="10" maxlength="10" value="<%=arrList(42,0)%>"/> 회 &nbsp&nbsp
										   산후 <input type="text" name="massage2" size="10" maxlength="10" value="<%=arrList(43,0)%>"/> 회 &nbsp&nbsp 
										   추가 <input type="text" name="massage3" size="10" maxlength="10" value="<%=arrList(44,0)%>"/> 회 &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q14</th>
							<td> 방문간호사 -  
											산전 <input type="text" name="Q14_1" size="10" maxlength="10" value="<%=arrList(45,0)%>"/> 회 &nbsp&nbsp
											산후 <input type="text" name="Q14_2" size="10" maxlength="10" value="<%=arrList(46,0)%>"/> 회 &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q15</th>
							<td> 소독서비스 &nbsp&nbsp
								<select name="Q15_Y" >
									<option value="">선택</option>
									<option value="Y" <%=fncSetSelectBox("Y",arrList(47,0))%>>신청함</option>
									<option value="N" <%=fncSetSelectBox("N",arrList(47,0))%>>신청안함</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>Q16</th>
							<td> 출산선물선택 
											<select name="Q16_gift"   class="textarea" style="height:35px;">
											<option value="">선택</option>
										    <%
												vCnt = UBOUND(arr_Gift_Prodt,2)
													For num = 0 To vCnt
									         %>
											<option value="<%=arr_Gift_Prodt(1,num)%>"  <%If arrList(48,0) = arr_Gift_Prodt(1,num) Then%>selected<%End If%>><%=arr_Gift_Prodt(1,num)%></option>
											<%	 
												 Next 
											%>
										 </select>
							<!--<input type="text" name="Q16_gift" size="20" maxlength="20" value="<%=arrList(48,0)%>"/>-->&nbsp&nbsp
										   택배일 <select name="Q16_Y">
													<option value="">년</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(gift_choice_send,4))%>><%=num%></option>
												<% Next %>						
												</select>
												<select name="Q16_M" >
													<option value="">월</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_choice_sendm)%>><%=num%>월</option>
												<% Next %>						
												</select>
												<select name="Q16_D">
													<option value="">일</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_choice_sendmd)%>><%=num%>일</option>
												<% Next %>
												</select>&nbsp&nbsp
												폴스베이비 <input type="checkbox" name="Q16_baby" <%If InStr(arrList(50,0),"Y") > 0 Then%>checked<%End If%> value="Y"/> 
							</td>
						</tr>
						<tr>
							<th>Q17</th>
							<td> 출산선물박스 택배일 <select name="Q17_Y">
											<option value="">년</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(gift_box_send1,4))%>><%=num%></option>
												<% Next %>						
												</select>
												<select name="Q17_M" >
													<option value="">월</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_box_sendm)%>><%=num%>월</option>
												<% Next %>						
												</select>
												<select name="Q17_D">
													<option value="">일</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_box_sendmd)%>><%=num%>일</option>
												<% Next %>
												</select>&nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>비고</th>	
							<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=비고를 입력해 주세요"><%=arrList(52,0)%></textarea></td>
						</tr>
						<!--tr>
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
						</tr-->
						<tr>
							<th>기타</th>	
							<td>
								출퇴근,입주시간 <input type="text" name="in_out_time" size="20" maxlength="20" value="<%=arrList(54,0)%>"/>&nbsp&nbsp
								휴일수당 <input type="text" name="holliday_pay" size="20" maxlength="20" value="<%=arrList(55,0)%>"/>&nbsp&nbsp
								휴식시간 <input type="text" name="break_time" size="20" maxlength="20" value="<%=arrList(56,0)%>"/>&nbsp&nbsp
								홈페이지 가입여부<input type="checkbox" name="homepage_join_Y" <%If InStr(arrList(57,0),"Y") > 0 Then%>checked<%End If%> value="Y"/>
							</td>
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
<%
else
%>
<!-- 신규 등록 -->
<body>
	<div id="container">
		<div class="consultRequestHeader">
			<p class="h2">
				<i class="fa fa-cloud" aria-hidden="true"></i>
				<strong>고객예약 상담일지</strong>
				<i class="fa fa-cloud" aria-hidden="true"></i>
			</p>
			<p class="small">고객님께 해당하는 부분을 체크해주세요. 디테일한 상담에 도움이 됩니다.</p>
		</div>
		<div class="write">
			<form id="oFrm" name="oFrm" method="post">
					<div class="consultRequestCont">
						<div class="q1">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>고객정보</strong></div>
							<span>이름</span>
							<input type="text" placeholder="성함을 입력해주세요.">
							<span>핸드폰</span>
							<input type="text" placeholder="예) 010-1234-5678">
							<span>전화번호</span>
							<input type="text" placeholder="예) 02-1234-5678">
							<span class="addr">주소</span><a href="#">주소찾기</a>
							<input type="radio" name="addr"><label for="addr" class="myhome">자택</label>
							<input type="radio" name="addr"><label for="addr" class="momhome">친정조리</label>
							<input type="radio" name="addr"><label for="addr" class="anothermomhome">시댁조리</label>
							<input type="text" placeholder="주소찾기 버튼을 클릭해주세요." class="addr01">
							<input type="text">
							<div class="dateLeft">
								<span>분만예정일</span>
								<input type="text">
							</div>
							<div class="dateRight">
								<span>출산예정일</span>
								<input type="text">
							</div>
							
							<div class="left">
								<span class="delivery">분만형태</span><br/>
								<input type="radio" name="natal">
								<label for="natal" class="nature">자연분만</label>
								<input type="radio">
								<label for="natal" name="natal">제왕절개</label>
							</div>
							<div class="right">
								<span>아기성별</span><br/>
								<input type="radio" name="sex">
								<label for="sex" class="sex">남자</label>
								<input type="radio" name="sex">
								<label for="sex">여자</label>
							</div>
							<label>쌍둥이 : </label>
							<input type="text" class="twins">명
							<label class="weight">체중 : </label>
							<input type="text" class="weight">kg
							<label class="natalhospital">분만병원 : </label>
							<input type="text" class="natalhospital">
						</div>
						<div class="q2">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>프로그램</strong></div>
							<span class="carecenter">산후조리원</span><br/>
							<input type="radio">
							<label for="" class="nope">아니오</label>
							<input type="radio">
							<label for="">예 - </label>
							조리원 입소기간<input type="text" class="term">주 / 
							<label for="">산후조리원명 :</label>
							<input type="text" class="centername">
							<span>서비스실시 예정일</span><br/>
							<input type="text" class="excuteday"><br/>
							<span>원하시는 서비스 프로그램은 무엇입니까?</span><br/>
							<span class="career">⊙ 관리사 경력기준</span><br/>
							<input type="radio" class="vip"><label for="" class="mr">VIP</label>
							<input type="radio"><label for="" class="mr">프리미엄</label>
							<input type="radio"><label for="">베이직</label><br/>
							<span class="voucher">⊙ 바우처</span><br/>
							<input type="radio" class="typea"><label for="" class="mr">A-가형</label>
							<input type="radio"><label for="" class="mr">A-나형</label>
							<input type="radio"><label for="" class="mr">A-다형</label>
							<input type="radio"><label for="" class="mr">A-라형</label>
							<input type="radio"><label for="" class="mr">B-가형</label>
							<input type="radio"><label for="" class="mr">B-나형</label>
							<input type="radio"><label for="" class="mr">B-다형</label>
							<input type="radio"><label for="">B-라형</label><br/>
							<span class="focus">⊙ 집중관리프로그램</span><br/>
							<input type="checkbox" class="first">프라이빗</input>
							[<input type="radio"><label for="">출퇴근</label>
							<input type="radio"><label for="">입주</label>]<br/>
							<input type="checkbox" class="first">워킹맘</input>
							[<input type="radio"><label for="">출퇴근</label>
							<input type="radio"><label for="">입주</label>]<br/>
							<input type="checkbox" class="first">산후조리원을 내집에</input>
							[<input type="radio"><label for="">출퇴근</label>
							<input type="radio"><label for="">입주</label>]<br/>
							<input type="checkbox" class="first">35세이상 [출퇴근]</input><br/>
							<input type="checkbox" class="first">과체중 [출퇴근]</input><br/>
							<span class="whatservice">서비스 내용 중 출퇴근과 입주서비스중 어떤 서비스 이용을 원하십니까?</span><br/>
							<input type="radio"><label for="" class="mr">출퇴근5일</label><input type="radio"><label for="" class="mr">출퇴근6일</label>
							<input type="radio"><label for="" class="mr">입주5일</label><input type="radio"><label for="" class="mr">입주6일</label>
							<input type="radio"><label for="">입주</label><input type="text" class="small">주/<input type="text" class="small">일 + <label for="">출퇴근</label><input type="text" class="small">주/<input type="text" class="small">일
							<span class="whatweek">산후관리사 서비스는 몇 주를 원하십니까?</span><br/>
							<input type="radio"><label for="" class="whatweek">1주</label>
							<input type="radio"><label for="" class="whatweek">2주</label>
							<input type="radio"><label for="" class="whatweek">3주</label>
							<input type="radio"><label for="" class="whatweek">4주</label>
							<input type="radio">기타(<input type="text" class="small">)주<br/>
							
							<span class="anotherFam">추가가족여부</span><br/>
							<input type="checkbox">초산
							<input type="checkbox">경산
							미취학(<input type="text" class="small">명), 취학(<input type="text" class="small">명), 부모님(<input type="text" class="small">명), 기타(<input type="text" class="small">명), 반려동물(<input type="text" class="small">마리)<br/>
							<label for="">추가금액 : </label>
							<input type="text" class="addGold">원<br/>
							<span class="whatTendency">어떤성향의 관리사를 원하십니까?(관리사의 업무 주안점은 무엇입니까?)</span><br/>
							<input type="checkbox"><label for="" class="mr">신생아보육</label>
							<input type="checkbox"><label for="" class="mr">모유수유</label>
							<input type="checkbox"><label for="" class="mr">산후복귀</label>
							<input type="checkbox"><label for="" class="mr">식사준비</label>
							<input type="checkbox"><label for="" class="mr">가사위생</label>
							<input type="checkbox"><label for="" class="mr">큰아이보육</label>
							<input type="checkbox"><label for="">쌍둥이</label>
						</div>
						<div class="q3">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>기타</strong></div>
							<span class="select">유,무료 물품선택(택배비 본인부담)</span><br/>
							유축기
							<select name="" id="">
								<option value="">선택</option>
								<option value="">메델라심포니</option>
								<option value="">메델라락티나</option>
							</select>
							<select name="" id="">
								<option value="">선택</option>
								<option value="">심포니소모품 - 싱글</option>
								<option value="">심포니소모품 - 더블</option>
								<option value="">락티나소모품 - 싱글</option>
								<option value="">락티나소모품 - 더블</option>
							</select>
							<input type="text" class="small">주<input type="text" class="won">원<br/>
							조사기<input type="text" class="josa"><br/>
							<span class="massage">전산마사지</span><br/>
							<label for="">산전</label><input type="text" class="small1">회
							<label for="" class="ml">산후</label><input type="text" class="small1">회
							<label for="" class="ml">추가</label><input type="text" class="small1">회<br/>
							<span class="massage">방문간호사</span><br/>
							<label for="">산전</label><input type="text" class="small1">회
							<label for="" class="ml">산후</label><input type="text" class="small1">회<br/>
							<span class="massage">소독서비스</span><br/>
							<input type="radio"><label for="">미신청</label>
							<input type="radio"><label for="">신청</label>
							<br/>
							<span>출산선물선택</span>
							<select name="" id="">
								<option value="">선택</option>
								<option value="">깔리자노 500</option>
								<option value="">깔리자노 1500</option>
								<option value="">누들앤부 로션</option>
								<option value="">누들앤부 샴푸</option>
								<option value="">누들앤부 워시</option>
								<option value="">뉴욕택시</option>
								<option value="">드림블랭킷 -아주르비</option>
								<option value="">드림블랭킷 -트랜퀼리</option>
								<option value="">런던소방차</option>
								<option value="">런드레스 디터전트</option>
								<option value="">런드레스 소퍼백</option>
								<option value="">런드레스 프레쉬</option>
								<option value="">런드레스 컨디셔너</option>
								<option value="">마더케이세트</option>
								<option value="">메이드로오일</option>
								<option value="">모유분석서비스</option>
								<option value="">몰리메드 산모패드</option>
								<option value="">벨라기저귀2단계</option>
								<option value="">본토이 롤링카</option>
								<option value="">세탁망3종</option>
								<option value="">수유쿠션</option>
								<option value="">수잔너 리싱로션</option>
								<option value="">수잔 로션투파우더</option>
								<option value="">수잔 브라운다이애퍼</option>
								<option value="">스와들러 속싸개</option>
								<option value="">스와들러 스트롤러블루</option>
								<option value="">스와들러 스트롤러핑크</option>
								<option value="">아덴 머슬린공룡</option>
								<option value="">아덴 머슬린하트</option>
								<option value="">아덴 뱀부디찰리</option>
								<option value="">아덴 뱀부멜라</option>
								<option value="">아덴 뱀부피아라</option>
								<option value="">아덴 프린세스포지</option>
								<option value="">아덴 프린스챠밍</option>
								<option value="">에르고 다크초코 </option>
								<option value="">에르고 블랙</option>
								<option value="">에르고 아기띠샹그리아</option>
								<option value="">욕조</option>
								<option value="">이탈트라이크</option>
								<option value="">젖병150mm 2팩블루</option>
								<option value="">젖병150mm 2팩핑크</option>
								<option value="">젖병240 다크핑크</option>
								<option value="">젖병240 라이그린</option>
								<option value="">체럽베이비 젖병블루</option>
								<option value="">체럽베이비 젖병핑크</option>
								<option value="">체중계</option>
								<option value="">핫슬링</option>
							</select>
							<span class="deliverydate">택배일</span>
							<input type="text" class="small2">폴스베이비<input type="checkbox"><br/>
							<span>출산선물박스 택배일</span>
							<input type="text" class="delidate"><br/>
							<span class="massage">하고싶은말</span><br/>
							<textarea name="" id="" cols="30" rows="10"></textarea><br/>
							<span class="massage">설명할 사항</span><br/>
							<input type="checkbox">
							<label for="" class="mr">출퇴근, 입주시간</label>
							<input type="checkbox">
							<label for="" class="mr">휴일수당</label>
							<input type="checkbox">
							<label for="" class="mr">휴식시간</label>
							<input type="checkbox">
							<label for="">홈페이지 가입여부</label><br/><br/><br/><br/>
							
							<span class="massage">기타</span><br/>
							<label class="etc">예약금</label>(<input type="text" class="small4">)<br/>
							<label class="etc">총액</label>(<input type="text" class="small4">)<br/>
							<label class="etc">잔금</label>(<input type="text" class="small4">)<br/>
							<label class="etc">추가금</label>(<input type="text" class="small4">)
						</div>
						<div class="btnwrap">
							<a href="#" class="save">저장</a>
							<a href="#" class="cancel">취소</a>
						</div>
					</div>
	



















































<!-- 			<input type="hidden" name="mode" value="<%=mode%>"> -->
<!-- 			<input type="hidden" name="idx" value="<%=intIDX%>"> -->
<!-- 			<input type="hidden" name="local" value="<%=grpcd%>"> -->
<!-- 			<table class="tb_style02"> -->
<!-- 			<colgroup> -->
<!-- 				<col width="5%" /><col /> -->
<!-- 			</colgroup> -->
<!-- 			<thead> -->
<!-- 			<tr> -->
<!-- 				<th>Q1</th> -->
<!-- 				<td> -->
<!-- 					마더앤베이비를 알게 된 경로 <br/> -->
<!-- 					<input type="radio" name="know" value="지인추천" valid="E|A=신청서비스를 선택해 주세요"/> 지인추천&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="인터넷검색"/> 인터넷검색&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="블로거추천"/> 블로거추천&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="조리원"/> 조리원&nbsp;&nbsp;  -->
<!-- 					<input type="radio" name="know" value="기타"/> 기타&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q2</th> -->
<!-- 				<td>이름 : <input type="text" name="name" class="textarea" size="10" value=""/> <span style="margin-left:20px;"> </span> -->
<!-- 					전화번호 :  -->
<!-- 					<select name="phone_1" valid="E|A=전화번호를 선택해 주세요"> -->
<!-- 						<option value="">선택</option> -->
<!-- 						<option value="02">02</option> -->
<!-- 						<option value="031">031</option> -->
<!-- 						<option value="032">032</option> -->
<!-- 						<option value="033">033</option> -->
<!-- 						<option value="041">041</option> -->
<!-- 						<option value="042">042</option> -->
<!-- 						<option value="043">043</option> -->
<!-- 						<option value="051">051</option> -->
<!-- 						<option value="052">052</option> -->
<!-- 						<option value="053">053</option> -->
<!-- 						<option value="054">054</option> -->
<!-- 						<option value="055">055</option> -->
<!-- 						<option value="061">061</option> -->
<!-- 						<option value="062">062</option> -->
<!-- 						<option value="063">063</option> -->
<!-- 						<option value="064">064</option> -->
<!-- 						<option value="070">070</option> -->
<!-- 					</select> -->
<!-- 					- -->
<!-- 					<input type="text" name="phone_2" size="5" maxlength="4" value="" valid="E|A=전화번호를 입력해 주세요"/> -->
<!-- 					- -->
<!-- 					<input type="text" name="phone_3" size="5" maxlength="4" value="" valid="E|A=전화번호를 입력해 주세요"/> -->
<!-- 					 -->
<!-- 					<span style="margin-left:20px;"> </span>핸드폰 번호 : -->
<!--  -->
<!-- 					<select name="hp_1" valid="E|A=핸드폰번호를 선택해 주세요"> -->
<!-- 						<option value="">선택</option> -->
<!-- 						<option value="010">010</option> -->
<!-- 						<option value="011">011</option> -->
<!-- 						<option value="016">016</option> -->
<!-- 						<option value="017">017</option> -->
<!-- 						<option value="018">018</option> -->
<!-- 						<option value="019">019</option> -->
<!-- 					</select> -->
<!-- 					- -->
<!-- 					<input type="text" name="hp_2" size="5" maxlength="4" value="" valid="E|A=핸드폰번호를 입력해 주세요"/> -->
<!-- 					- -->
<!-- 					<input type="text" name="hp_3" size="5" maxlength="4" value="" valid="E|A=핸드폰번호를 입력해 주세요"/> -->
<!-- 					</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q3</th> -->
<!-- 				<td>자택주소 :  -->
<!-- 					<input type="text"  id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="" valid="E|A=우편번호를 입력해 주세요"/> -->
<!-- 					- -->
<!-- 					<input type="text"  id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="" valid="E|A=우편번호를 입력해 주세요"/> -->
<!-- 					&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/> -->
<!--  -->
<!-- 					<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="" onClick="fncOpenZip();" valid="E|A=주소를 입력해 주세요"/> -->
<!-- 					<input type="text" name="addr_2" class="textarea" size="35" value="" valid="E|A=상세주소를 입력해 주세요"/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q4</th>	 -->
<!-- 				<td>분만예정일 :  -->
<!-- 					<select name="childbirth_y" valid="E|A=분만예정일을 선택해 주세요"> -->
<!-- 						<option value="">년</option> -->
<!-- 					<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 						<option value="<%=num%>" ><%=num%></option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="childbirth_m" valid="E|A=분만예정일을 선택해 주세요"> -->
<!-- 						<option value="">월</option> -->
<!-- 					<% For num=1 To 12 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>월</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="childbirth_d" valid="E|A=분만예정일을 선택해 주세요"> -->
<!-- 						<option value="">일</option> -->
<!-- 					<% For num=1 To 31 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>일</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 				  -->
<!-- 					<span style="margin-left:20px;"> </span> 서비스실시 예정일 :  -->
<!-- 					<select name="serviceDt_y" valid="E|A=서비스시작 예정일을 선택해 주세요"> -->
<!-- 						<option value="">년</option> -->
<!-- 					<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 						<option value="<%=num%>"><%=num%></option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="serviceDt_m" valid="E|A=서비스시작 예정일을 선택해 주세요"> -->
<!-- 						<option value="">월</option> -->
<!-- 					<% For num=1 To 12 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>월</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="serviceDt_d" valid="E|A=서비스시작 예정일을 선택해 주세요"> -->
<!-- 						<option value="">일</option> -->
<!-- 					<% For num=1 To 31 %> -->
<!-- 						<option value="<%=num%>"><%=num%>일</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q5</th>	 -->
<!-- 				<td id="Q5_add_2"> -->
<!-- 					<input type="radio" name="Q5" value="초산모" onclick="check()" /> 초산모&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="Q5" value="경산모" onclick="check()" /> 경산모 &nbsp;&nbsp; -->
<!-- 					<select name="Q5_De" > -->
<!-- 						<option value="1">1명</option> -->
<!-- 						<option value="2">2명</option> -->
<!-- 						<option value="3">3명</option> -->
<!-- 						<option value="4">4명</option> -->
<!-- 						<option value="5">5명</option> -->
<!-- 						<option value="6">6명</option> -->
<!-- 						<option value="7">7명</option> -->
<!-- 						<option value="8">8명</option> -->
<!-- 						<option value="9">9명</option> -->
<!-- 					</select> -->
<!-- 					나이 <input type="text" name="age" class="textarea" size="5" value=""/> -->
<!-- 					<span style="margin-left:20px;"></span>분만형태 :  -->
<!-- 				    <input type="text" name="bm_type" class="textarea" size="10" value=""/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q6</th>	 -->
<!-- 				<td>산후조리원 <span style="margin-left:30px;"></span> -->
<!-- 					<input type="radio" name="Q6" value="이용안함" onclick="check_Q6();"/> 이용안함&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="Q6" value="이용함"  onclick="check_Q6();" /> 이용함 -->
<!-- 					<input type="text"	 name="Q6_week"  class="textarea" size="5" maxlength="3" value=""/>주 -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q7</th> -->
<!-- 				<td> 원하시는 서비스 프로그램은 무엇입니까?<br/> -->
<!-- 				 관리사 경력기준 :  -->
<!-- 					<input type="checkbox" name="Q7" value="VIP프로그램"/> VIP프로그램&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="프리미엄프로그램"/> 프리미엄프로그램&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="베이직프로그램" valid="E|A=신청서비스를 선택해 주세요"/> 베이직프로그램&nbsp;&nbsp; -->
<!-- 				<br/> 집중관리프로그램 :  -->
<!-- 					<input type="checkbox" name="Q7" value="프라이빗프로그램"/> 프라이빗프로그램&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="Q7" value="워킹맘"/> 워킹맘(출/입) -->
<!-- 					<input type="checkbox" name="Q7" value="산후조리"/> 산후조리(출/입)&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="Q7" value="35세이상"/> 35세이상(출)&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="과체중"/> 과체중(출)&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q8</th> -->
<!-- 				<td>서비스 내용중 출퇴근과 입주 서비스 중 어떤 서비스 이용을 원하십니까?<br/> -->
<!-- 					<input type="radio" name="service_work" value="출퇴근5일"/> 출퇴근5일&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="출퇴근6일"/> 출퇴근6일&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="입주"/> 입주&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="출퇴근"/> 출퇴근 -->
<!-- 					(<input type="text" name="service_work_add_1" size="3" maxlength="3" value=""/>주)+입주(<input type="text" name="service_work_add_2" size="3" maxlength="3" value=""/>주) -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q9</th> -->
<!-- 				<td> -->
<!-- 					산후관리사 서비스는 몇 주를 원하십니까? <br/> -->
<!-- 					<input type="radio" name="service_week" value="1주"/> 1주&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="2주"/> 2주&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="3주"/> 3주&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="4주"/> 4주&nbsp;&nbsp;  -->
<!-- 					<input type="radio" name="service_week" value="기타"/> 기타&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q10</th> -->
<!-- 				<td> 추가가족 여부<br/> -->
<!-- 					<input type="checkbox" name="add_fam1" value="미취학"/> 미취학 (<input type="text" name="add_fam1_1" size="3" maxlength="3" value=""/>명) &nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam2" value="취학"/> 취학 (<input type="text" name="add_fam2_1" size="3" maxlength="3" value=""/>명)&nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam3" value="쌍둥이"/> 쌍둥이 &nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam4" value="부모님"/> 부모님 (<input type="text" name="add_fam4_1" size="3" maxlength="3" value=""/>명)&nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam5" value="기타"/> 기타  -->
<!-- 					(<input type="text" name="add_fam5_1" id="add_fam5_1" value="예)시누이" size="20" maxlength="20"  /> -->
<!-- 					<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value=""/>명) -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q11</th> -->
<!-- 				<td> -->
<!-- 					어떤 성향의 관리사를 원하십니까? (관리사의 업무 주안점은 무엇입니까?) <br/> -->
<!-- 					<input type="checkbox" name="service_type_1" value="모유수유"/> 모유수유&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_2" value="산후복귀"/> 산후복귀&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_3" value="신생아보육"/> 신생아보육&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_4" value="식사준비"/> 식사준비&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="service_type_5" value="가사위생"/> 가사위생&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_6" value="큰아이보육"/> 큰아이보육&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->

<!--
기존 주석파트



<tr>
				 	<select name="pdt_no"   class="textarea" style="height:35px;">
						<option value=""selected>선택</option>
					<%
						vCnt = UBOUND(arrProdt,2)
							 
							For num = 0 To vCnt
					%>
						<option value="<%=arrProdt(0,num)%>"><%=arrProdt(1,num)%></option>

					<%	 
						 Next 
					%>
					 </select>
-->
<!--   -->
<!-- 			<tr> -->
<!-- 				<th>Q12</th> -->
<!-- 				<td> 유,무료 물품선택(택비 본인부담)<br/> -->
<!-- 				1) 유축기		<select name="product_1"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">선택</option> -->
<!-- 													<% -->
<!-- 									vCnt = UBOUND(arrProdt,2) -->
<!-- 										  -->
<!-- 										For num = 0 To vCnt -->
<!-- 													%> -->
<!-- 								<option value="<%=arrProdt(1,num)%>"><%=arrProdt(1,num)%></option> -->
<!-- 					<%	  -->
<!-- 						 Next  -->
<!-- 					%> -->
<!-- 					 </select> -->

					<!-- 기존 주석파트 <select name="product_1_month"   class="textarea" style="height:35px;">
								<option value="">선택</option>
								<option value="6개월">6개월</option>
								<option value="3개월">3개월</option>
								<option value="1개월">1개월</option>
								<option value="2주">2주</option>
					 </select>-->


<!-- 					 <select name="product_2"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">선택</option> -->
<!-- 								<% -->
<!-- 									vCnt = UBOUND(arrProdt_sub,2) -->
<!-- 										For num = 0 To vCnt -->
<!-- 								%> -->
<!-- 								<option value="<%=arrProdt_sub(1,num)%>"><%=arrProdt_sub(1,num)%></option> -->
<!-- 					<%	  -->
<!-- 						 Next  -->
<!-- 					%> -->
<!-- 					 </select> -->
<!--  -->
<!-- 					  -->
<!-- 						<input type="text" name="product_week" size="3" maxlength="3" value=""/> 주 -->
<!-- 						<input type="text" name="product_price" size="10" maxlength="10" value=""/> 원 -->
<!-- 						 <span style="margin-left:20px;"></span> -->
<!-- 							2) 조사기&nbsp&nbsp<select name="Q12_Y"> -->
<!-- 									<option value="">년</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q12_M"  > -->
<!-- 										<option value="">월</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>월</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q12_D"  > -->
<!-- 										<option value="">일</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>일</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>  &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q13</th> -->
<!-- 				<td> 전신마사지 -  산전 <input type="text" name="massage1" size="10" maxlength="10" value=""/> 회 &nbsp&nbsp -->
<!-- 							   산후 <input type="text" name="massage2" size="10" maxlength="10" value=""/> 회 &nbsp&nbsp  -->
<!-- 							   추가 <input type="text" name="massage3" size="10" maxlength="10" value=""/> 회 &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q14</th> -->
<!-- 				<td> 방문간호사 -   -->
<!-- 								산전 <input type="text" name="Q14_1" size="10" maxlength="10" value=""/> 회 &nbsp&nbsp -->
<!-- 							    산후 <input type="text" name="Q14_2" size="10" maxlength="10" value=""/> 회 &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q15</th> -->
<!-- 				<td> 소독서비스 &nbsp&nbsp -->
<!-- 					<select name="Q15_Y" > -->
<!-- 						<option value="">선택</option> -->
<!-- 						<option value="Y">신청함</option> -->
<!-- 						<option value="N">신청안함</option> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->

		<!--  기존 주석파트 
			<tr>
				<th>상품명</th>
				<td>
					<%
						vCnt = UBOUND(arrProdt,2)
							For num = 0 To vCnt
					%>
					 <%If product = arrProdt(0,num) Then%>
						<input type="text" id="pdt_no" name="pdt_no" size="20" value="<%=arrProdt(1,num)%>" readonly > 
					 <%End If%>  
					<%
							Next 
					%>
				</td>
			</tr>
		-->
			

<!-- 			<tr> -->
<!-- 				<th>Q16</th> -->
<!-- 				<td> 출산선물선택  -->
<!-- 								<select name="Q16_gift"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">선택</option> -->
<!-- 													<% -->
<!-- 									vCnt = UBOUND(arr_Gift_Prodt,2) -->
<!-- 										  -->
<!-- 										For num = 0 To vCnt -->
<!-- 													%> -->
<!-- 								<option value="<%=arr_Gift_Prodt(1,num)%>"><%=arr_Gift_Prodt(1,num)%></option> -->
<!-- 								<% -->
<!-- 									 Next  -->
<!-- 								%> -->
<!-- 								 </select> -->
 
				
						<!--	기존 주석파트<input type="text" name="Q16_gift" size="20" maxlength="20" value=""/>&nbsp&nbsp   -->



<!-- 							   택배일 <select name="Q16_Y"  > -->
<!-- 										<option value="">년</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q16_M"  > -->
<!-- 										<option value="">월</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>월</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q16_D"  > -->
<!-- 										<option value="">일</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>일</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>&nbsp&nbsp -->
<!-- 									폴스베이비 <input type="checkbox" name="Q16_baby" value="Y"/>  -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q17</th> -->
<!-- 				<td> 출산선물박스  -->
<!-- 							   택배일 <select name="Q17_Y"  > -->
<!-- 										<option value="">년</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q17_M" > -->
<!-- 										<option value="">월</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>월</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q17_D"  > -->
<!-- 										<option value="">일</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>일</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>&nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>비고</th>	 -->
<!-- 				<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=비고를 입력해 주세요"></textarea></td> -->
<!-- 			</tr> -->



			<!--tr>  기존주석파트
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
			</tr-->


<!-- 			<tr> -->
<!-- 				<th>기타</th>	 -->
<!-- 				<td> -->
<!-- 					출퇴근,입주시간 <input type="text" name="in_out_time" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					휴일수당 <input type="text" name="holliday_pay" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					휴식시간 <input type="text" name="break_time" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					홈페이지 가입여부<input type="checkbox" name="homepage_join_Y" value="Y"/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			</thead> -->
<!-- 			</table> -->
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
<%
End if
%>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./service_call_sql.asp"
	});
</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">

	var form = document.oFrm;
	var form_id = document.getElementById("oFrm");


	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");

	function fncOpenZip(){
		window.open("/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function check() {
      if(form.Q5[0].checked==true) {		 
		    document.getElementById("Q5_add_1").style.display = "block";
		    document.getElementById("Q5_add_2").style.display = "none";
			// form.age.style.visibility = "hidden";
      }else if(form.Q5[1].checked==true) {
		  document.getElementById("Q5_add_2").style.display = "block";
		  document.getElementById("Q5_add_1").style.display = "none";
		document.form.Q5[1].checked = true; 
		   //	form.age.style.visibility = "visible";
	   }else if(form.Q5[2].checked==true) {
		    document.getElementById("Q5_add_1").style.display = "block";
		    document.getElementById("Q5_add_2").style.display = "none";
			 document.form.Q5[2].checked = true; 
		   //	form.age.style.visibility = "visible";
	   }else if(form.Q5[3].checked==true) {
		  document.getElementById("Q5_add_2").style.display = "block";
		  document.getElementById("Q5_add_1").style.display = "none";
		  document.form.Q5[3].checked = true; 
		   //	form.age.style.visibility = "visible";
	  }
	}

function check_Q6() {
   if(form.Q6[0].checked==true) {		 
		    document.getElementById("Q6_week").style.display = "block";
		    document.getElementById("Q6_week_1").style.display = "none";		 
      }else if(form.Q6[1].checked==true) {
		  document.getElementById("Q6_week").style.display = "none";
		  document.getElementById("Q6_week_1").style.display = "block";
	   }else if(form.Q6[2].checked==true) {
		    document.getElementById("Q6_week").style.display = "block";
		    document.getElementById("Q6_week_1").style.display = "none";
	   }else if(form.Q6[3].checked==true) {
		  document.getElementById("Q6_week").style.display = "none";
		  document.getElementById("Q6_week_1").style.display = "block";
	  }
	}


 
 
 
$('#add_fam5_1').focus(function(){
$(this).val('');
}).blur(function(){
$(this).val() == '' ? $(this).val('예)시누이') : $(this).val() = $(this).val();
});
 

 


</script>
</html>
 <!--
<form name=frm method=post>
<input type=radio name="r1" value="전체회원" onclick="check()">종목1
<input type=radio name="r1" value="부분회원" onclick="check()">종목2<BR>






<input type="text" id="text_field" value='입력 후 엔터' />

<script>
$('#text_field').focus(function(){
$(this).val('');
}).blur(function(){
$(this).val() == '' ? $(this).val('입력 후 엔터') : $(this).val() = $(this).val();
});
</script> - See more at: http://blogtoday.tistory.com/entry/input-%EB%B0%95%EC%8A%A4-%ED%85%8D%EC%8A%A4%ED%8A%B8-%ED%81%B4%EB%A6%AD%EC%8B%9C-%EC%82%AC%EB%9D%BC%EC%A7%80%EA%B2%8C#sthash.f3C87Bb2.dpuf









 -->