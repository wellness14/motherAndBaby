<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����û
'�� �� �� : service_ins.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
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

		/*���������*/
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
'	���� ���� ȣ��   
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

'	���� ���� ȣ��
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


	'	��� �Ҹ�ǰ ȣ��
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME, MO_CONSUMABLES_CATEGORY from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='M' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MO_CONSUMABLES_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	��� �Ҹ�ǰ ����
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='S' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_sub = Rs.getRows()
	End If 
	Call RSClose(Rs)


'-----------------------------------------------------------------------------
'	��� ��ǰ ȣ��
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
					<div class="linemap">�����غ��̺� > ȸ������ > <strong>����û</strong></div>
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
								�����غ��̺� �˰� �� ��� <br/>
								<input type="radio" name="know" value="������õ" <%If InStr(arrList(1,0),"������õ") > 0 Then%>checked<%End If%> valid="E|A=��û���񽺸� ������ �ּ���"/> ������õ&nbsp;&nbsp;
								<input type="radio" name="know" value="���ͳݰ˻�" <%If InStr(arrList(1,0),"���ͳݰ˻�") > 0 Then%>checked<%End If%>/> ���ͳݰ˻�&nbsp;&nbsp;
								<input type="radio" name="know" value="��ΰ���õ" <%If InStr(arrList(1,0),"��ΰ���õ") > 0 Then%>checked<%End If%>/> ��ΰ���õ&nbsp;&nbsp;
								<input type="radio" name="know" value="������" <%If InStr(arrList(1,0),"������") > 0 Then%>checked<%End If%>/> ������&nbsp;&nbsp; 
								<input type="radio" name="know" value="��Ÿ" <%If InStr(arrList(1,0),"��Ÿ") > 0 Then%>checked<%End If%>/> ��Ÿ&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q2</th>
				<%
					arrPhone = Split(arrList(3,0),"-")
				%>
							<td>�̸� : <input type="text" name="name" class="textarea" size="10" value="<%=arrList(2,0)%>"/> <span style="margin-left:20px;"> </span>
								��ȭ��ȣ : 
								<select name="phone_1" valid="E|A=��ȭ��ȣ�� ������ �ּ���">
									<option value="">����</option>
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
								<input type="text" name="phone_2" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
								-
								<input type="text" name="phone_3" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
			   	<%
					arrHp = Split(arrList(4,0),"-")
				%>	
								<span style="margin-left:20px;"> </span>�ڵ��� ��ȣ :

								<select name="hp_1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
									<option value="">����</option>
									<option value="010"<%=fncSetSelectBox("010",arrHp(0))%>>010</option>
									<option value="011"<%=fncSetSelectBox("011",arrHp(0))%>>011</option>
									<option value="016"<%=fncSetSelectBox("016",arrHp(0))%>>016</option>
									<option value="017"<%=fncSetSelectBox("017",arrHp(0))%>>017</option>
									<option value="018"<%=fncSetSelectBox("018",arrHp(0))%>>018</option>
									<option value="019"<%=fncSetSelectBox("019",arrHp(0))%>>019</option>
								</select>
								-
								<input type="text" name="hp_2" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
								-
								<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
								</td>
						</tr>
						<tr>
							<th>Q3</th>
							<td>�����ּ� : 
								<input type="text"  id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(5,0),3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
								-
								<input type="text"  id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="<%=RIGHT(arrList(5,0),3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
								&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>

								<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="<%=arrList(6,0)%>" onClick="fncOpenZip();" valid="E|A=�ּҸ� �Է��� �ּ���"/>
								<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(7,0)%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
							</td>
						</tr>
 
						<tr>
							<th>Q4</th>	
							<td>�и������� : 
								<select name="childbirth_y" valid="E|A=�и��������� ������ �ּ���">
									<option value="">��</option>
								<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Left(childbirth,4))%>><%=num%></option>
								<% Next %>
								</select>
								<select name="childbirth_m" valid="E|A=�и��������� ������ �ּ���">
									<option value="">��</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>��</option>
								<% Next %>
								</select>
								<select name="childbirth_d" valid="E|A=�и��������� ������ �ּ���">
									<option value="">��</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>��</option>
								<% Next %>
								</select>
							 
								<span style="margin-left:20px;"> </span> ���񽺽ǽ� ������ : 
								<select name="serviceDt_y" valid="E|A=���񽺽��� �������� ������ �ּ���">
									<option value="">��</option>
								<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,Left(service_s,4))%>><%=num%></option>
								<% Next %>
								</select>
								<select name="serviceDt_m" valid="E|A=���񽺽��� �������� ������ �ּ���">
									<option value="">��</option>
								<% For num=1 To 12 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,service_sm)%>><%=num%>��</option>
								<% Next %>
								</select>
								<select name="serviceDt_d" valid="E|A=���񽺽��� �������� ������ �ּ���">
									<option value="">��</option>
								<% For num=1 To 31 %>
									<option value="<%=num%>" <%=fncSetSelectBox(num,service_sd)%>><%=num%>��</option>
								<% Next %>
								</select>
							</td>
						</tr>
						<tr>
							<th>Q5</th>	
							<td>
								<input type="radio" name="Q5" value="�ʻ��" <%=fncSetCheckBox(exp_type,"�ʻ��")%> onclick="check()" /> �ʻ��&nbsp;&nbsp;
								<input type="radio" name="Q5" value="����" <%=fncSetCheckBox(exp_type,"����")%> onclick="check()" /> ���� &nbsp;&nbsp;
								<select name="Q5_De" >
									<option value="1">1��</option>
									<option value="2">2��</option>
									<option value="3">3��</option>
									<option value="4">4��</option>
									<option value="5">5��</option>
									<option value="6">6��</option>
									<option value="7">7��</option>
									<option value="8">8��</option>
									<option value="9">9��</option>
								</select>
								���� <input type="text" name="age" class="textarea" size="5" value="<%=arrList(12,0)%>"/>
								<span style="margin-left:20px;"></span>�и����� : 
								<input type="text" name="bm_type" class="textarea" size="10" value="<%=arrList(13,0)%>"/>
							</td>
						</tr>
						<tr>
							<th>Q6</th>	
							<td>���������� <span style="margin-left:30px;"></span>
								<input type="radio" name="Q6" value="�̿����" <%=fncSetCheckBox(arrList(14,0),"�̿����")%> onclick="check_Q6();"/> �̿����&nbsp;&nbsp;
								<input type="radio" name="Q6" value="�̿���" <%=fncSetCheckBox(arrList(14,0),"�̿���")%> onclick="check_Q6();" valid="E|A=������ �̿뿩�θ� ������ �ּ���"/> �̿���
									<input type="text"  name="Q6_week"  class="textarea" size="5" maxlength="3" value="<%=arrList(15,0)%>"/>��
							</td>
						</tr>
						<tr>
							<th>Q7</th>
							<td> ���Ͻô� ���� ���α׷��� �����Դϱ�?<br/>
							 ������ ��±��� : 
								<input type="checkbox" name="Q7" value="VIP���α׷�" <%If InStr(arrList(16,0),"VIP���α׷�") > 0 Then%>checked<%End If%>/> VIP���α׷�&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="�����̾����α׷�" <%If InStr(arrList(16,0),"�����̾����α׷�") > 0 Then%>checked<%End If%>/> �����̾����α׷�&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="���������α׷�" <%If InStr(arrList(16,0),"���������α׷�") > 0 Then%>checked<%End If%> valid="E|A=��û���񽺸� ������ �ּ���"/> ���������α׷�&nbsp;&nbsp;
							<br/> ���߰������α׷� : 
								<input type="checkbox" name="Q7" value="�����̺����α׷�" <%If InStr(arrList(16,0),"�����̺����α׷�") > 0 Then%>checked<%End If%> /> �����̺����α׷�&nbsp;&nbsp; 
								<input type="checkbox" name="Q7" value="��ŷ��" <%If InStr(arrList(16,0),"��ŷ��") > 0 Then%>checked<%End If%>/> ��ŷ��(��/��)
								<input type="checkbox" name="Q7" value="��������" <%If InStr(arrList(16,0),"��������") > 0 Then%>checked<%End If%>/> ��������(��/��)&nbsp;&nbsp; 
								<input type="checkbox" name="Q7" value="35���̻�" <%If InStr(arrList(16,0),"35���̻�") > 0 Then%>checked<%End If%>/> 35���̻�(��)&nbsp;&nbsp;
								<input type="checkbox" name="Q7" value="��ü��" <%If InStr(arrList(16,0),"��ü��") > 0 Then%>checked<%End If%>/> ��ü��(��)&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q8</th>
							<td>���� ������ ����ٰ� ���� ���� �� � ���� �̿��� ���Ͻʴϱ�?<br/>
								<input type="radio" name="service_work" value="�����5��" <%=fncSetCheckBox(arrList(17,0),"�����5��")%>/> �����5��&nbsp;&nbsp;
								<input type="radio" name="service_work" value="�����6��" <%=fncSetCheckBox(arrList(17,0),"�����6��")%>/> �����6��&nbsp;&nbsp;
								<input type="radio" name="service_work" value="����" <%=fncSetCheckBox(arrList(17,0),"����")%>/> ����&nbsp;&nbsp;
								<input type="radio" name="service_work" value="�����" <%=fncSetCheckBox(arrList(17,0),"�����")%>/> �����
								(<input type="text" name="service_work_add_1" size="3" maxlength="3" value="<%=arrList(18,0)%>"/>��)+����(<input type="text" name="service_work_add_2" size="3" maxlength="3" value="<%=arrList(19,0)%>"/>��)
							</td>
						</tr>
						<tr>
							<th>Q9</th>
							<td>
								���İ����� ���񽺴� �� �ָ� ���Ͻʴϱ�? <br/>
								<input type="radio" name="service_week" value="1��" <%=fncSetCheckBox(arrList(20,0),"1��")%> /> 1��&nbsp;&nbsp;
								<input type="radio" name="service_week" value="2��" <%=fncSetCheckBox(arrList(20,0),"2��")%> /> 2��&nbsp;&nbsp;
								<input type="radio" name="service_week" value="3��" <%=fncSetCheckBox(arrList(20,0),"3��")%> /> 3��&nbsp;&nbsp;
								<input type="radio" name="service_week" value="4��" <%=fncSetCheckBox(arrList(20,0),"4��")%> /> 4��&nbsp;&nbsp; 
								<input type="radio" name="service_week" value="��Ÿ" <%=fncSetCheckBox(arrList(20,0),"��Ÿ")%> /> ��Ÿ&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q10</th>
							<td> �߰����� ����<br/>
								<input type="checkbox" name="add_fam1" value="������" <%If InStr(arrList(21,0),"������") > 0 Then%>checked<%End If%>/> ������ 
								(<input type="text" name="add_fam1_1" size="3" maxlength="3" value="<%=arrList(22,0)%>"/>��) &nbsp&nbsp
								<input type="checkbox" name="add_fam2" value="����" <%If InStr(arrList(23,0),"����") > 0 Then%>checked<%End If%>/> ���� 
								(<input type="text" name="add_fam2_1" size="3" maxlength="3" value="<%=arrList(24,0)%>"/>��)&nbsp&nbsp
								<input type="checkbox" name="add_fam3" value="�ֵ���" <%If InStr(arrList(25,0),"�ֵ���") > 0 Then%>checked<%End If%>/> �ֵ��� &nbsp&nbsp
								<input type="checkbox" name="add_fam4" value="�θ��" <%If InStr(arrList(27,0),"�θ��") > 0 Then%>checked<%End If%>/> �θ�� 
								(<input type="text" name="add_fam4_1" size="3" maxlength="3" value="<%=arrList(28,0)%>"/>��)&nbsp&nbsp
								<input type="checkbox" name="add_fam5" value="��Ÿ" <%If  arrList(29,0) <> "" Then%>checked<%End If%>/> ��Ÿ 

								<%
									If arrList(29,0) = "" then
								%>
								(<input type="text" name="add_fam5_1" id="add_fam5_1" value="��)�ô���" size="20" maxlength="20"  />
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
									<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value=""/>��)
								<%else%>
									<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value="<%=arrList(30,0)%>"/>��)
								<%End if%>
							</td>
						</tr>
						<tr>
							<th>Q11</th>
							<td>
								� ������ �����縦 ���Ͻʴϱ�? (�������� ���� �־����� �����Դϱ�?) <br/>
								<input type="checkbox" name="service_type_1" value="��������" <%If InStr(arrList(31,0),"��������") > 0 Then%>checked<%End If%>/> ��������&nbsp;&nbsp;
								<input type="checkbox" name="service_type_2" value="���ĺ���" <%If InStr(arrList(32,0),"���ĺ���") > 0 Then%>checked<%End If%>/> ���ĺ���&nbsp;&nbsp;
								<input type="checkbox" name="service_type_3" value="�Ż��ƺ���" <%If InStr(arrList(33,0),"�Ż��ƺ���") > 0 Then%>checked<%End If%>/> �Ż��ƺ���&nbsp;&nbsp;
								<input type="checkbox" name="service_type_4" value="�Ļ��غ�" <%If InStr(arrList(34,0),"�Ļ��غ�") > 0 Then%>checked<%End If%>/> �Ļ��غ�&nbsp;&nbsp; 
								<input type="checkbox" name="service_type_5" value="��������" <%If InStr(arrList(35,0),"��������") > 0 Then%>checked<%End If%>/> ��������&nbsp;&nbsp;
								<input type="checkbox" name="service_type_6" value="ū���̺���" <%If InStr(arrList(36,0),"ū���̺���") > 0 Then%>checked<%End If%>/> ū���̺���&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<th>Q12</th>
							<td> ��,���� ��ǰ����(�ú� ���κδ�)<br/>
							1) �����    <select name="product_1"   class="textarea" style="height:35px;">
											<option value="">����</option>
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
											<option value="">����</option>											 
											<option value="6����" <%=fncSetSelectBox("6����",arrList(58,0))%>>6����</option>
											<option value="3����" <%=fncSetSelectBox("3����",arrList(58,0))%>>3����</option>
											<option value="1����" <%=fncSetSelectBox("1����",arrList(58,0))%>>1����</option>
											<option value="2��" <%=fncSetSelectBox("2��",arrList(58,0))%>>2��</option>
										 </select>
										-->
										 <select name="product_2"   class="textarea" style="height:35px;">
											<option value="">����</option>
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
									<input type="text" name="product_week" size="3" maxlength="3" value="<%=arrList(39,0)%>"/> ��
									<input type="text" name="product_price" size="10" maxlength="10" value="<%=arrList(40,0)%>"/> ��
									 <span style="margin-left:20px;"></span>
										2) �����&nbsp&nbsp<select name="Q12_Y">
												<option value="">��</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(out_Day,4))%>><%=num%></option>
												<% Next %>
												</select>
												<select name="Q12_M" >
													<option value="">��</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,out_Daym)%>><%=num%>��</option>
												<% Next %>
												</select>
												<select name="Q12_D" >
													<option value="">��</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,out_Daymd)%>><%=num%>��</option>
												<% Next %>
												</select>  &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q13</th>
							<td> ���Ÿ����� -  ���� <input type="text" name="massage1" size="10" maxlength="10" value="<%=arrList(42,0)%>"/> ȸ &nbsp&nbsp
										   ���� <input type="text" name="massage2" size="10" maxlength="10" value="<%=arrList(43,0)%>"/> ȸ &nbsp&nbsp 
										   �߰� <input type="text" name="massage3" size="10" maxlength="10" value="<%=arrList(44,0)%>"/> ȸ &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q14</th>
							<td> �湮��ȣ�� -  
											���� <input type="text" name="Q14_1" size="10" maxlength="10" value="<%=arrList(45,0)%>"/> ȸ &nbsp&nbsp
											���� <input type="text" name="Q14_2" size="10" maxlength="10" value="<%=arrList(46,0)%>"/> ȸ &nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>Q15</th>
							<td> �ҵ����� &nbsp&nbsp
								<select name="Q15_Y" >
									<option value="">����</option>
									<option value="Y" <%=fncSetSelectBox("Y",arrList(47,0))%>>��û��</option>
									<option value="N" <%=fncSetSelectBox("N",arrList(47,0))%>>��û����</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>Q16</th>
							<td> ��꼱������ 
											<select name="Q16_gift"   class="textarea" style="height:35px;">
											<option value="">����</option>
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
										   �ù��� <select name="Q16_Y">
													<option value="">��</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(gift_choice_send,4))%>><%=num%></option>
												<% Next %>						
												</select>
												<select name="Q16_M" >
													<option value="">��</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_choice_sendm)%>><%=num%>��</option>
												<% Next %>						
												</select>
												<select name="Q16_D">
													<option value="">��</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_choice_sendmd)%>><%=num%>��</option>
												<% Next %>
												</select>&nbsp&nbsp
												�������̺� <input type="checkbox" name="Q16_baby" <%If InStr(arrList(50,0),"Y") > 0 Then%>checked<%End If%> value="Y"/> 
							</td>
						</tr>
						<tr>
							<th>Q17</th>
							<td> ��꼱���ڽ� �ù��� <select name="Q17_Y">
											<option value="">��</option>
												<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,Left(gift_box_send1,4))%>><%=num%></option>
												<% Next %>						
												</select>
												<select name="Q17_M" >
													<option value="">��</option>
												<% For num=1 To 12 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_box_sendm)%>><%=num%>��</option>
												<% Next %>						
												</select>
												<select name="Q17_D">
													<option value="">��</option>
												<% For num=1 To 31 %>
													<option value="<%=num%>" <%=fncSetSelectBox(num,gift_box_sendmd)%>><%=num%>��</option>
												<% Next %>
												</select>&nbsp&nbsp
							</td>
						</tr>
						<tr>
							<th>���</th>	
							<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=��� �Է��� �ּ���"><%=arrList(52,0)%></textarea></td>
						</tr>
						<!--tr>
							<th>����</th>
							<td>
								<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
									<option value="">����</option>
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
									<option value="">����</option>
								</select>
							</td>
						</tr-->
						<tr>
							<th>��Ÿ</th>	
							<td>
								�����,���ֽð� <input type="text" name="in_out_time" size="20" maxlength="20" value="<%=arrList(54,0)%>"/>&nbsp&nbsp
								���ϼ��� <input type="text" name="holliday_pay" size="20" maxlength="20" value="<%=arrList(55,0)%>"/>&nbsp&nbsp
								�޽Ľð� <input type="text" name="break_time" size="20" maxlength="20" value="<%=arrList(56,0)%>"/>&nbsp&nbsp
								Ȩ������ ���Կ���<input type="checkbox" name="homepage_join_Y" <%If InStr(arrList(57,0),"Y") > 0 Then%>checked<%End If%> value="Y"/>
							</td>
						</tr>
						</thead>
						</table>
						</form>
						<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
							<tr>
								<td align="center">
									<input type="button" value="�� ��" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
									<input type="button" value="�� ��" class="button" onClick="history.back(-1);">
								</td>
							</tr>  
						</table>
					</div>
				</div>
			</body>
<%
else
%>
<!-- �ű� ��� -->
<body>
	<div id="container">
		<div class="consultRequestHeader">
			<p class="h2">
				<i class="fa fa-cloud" aria-hidden="true"></i>
				<strong>������ �������</strong>
				<i class="fa fa-cloud" aria-hidden="true"></i>
			</p>
			<p class="small">���Բ� �ش��ϴ� �κ��� üũ���ּ���. �������� ��㿡 ������ �˴ϴ�.</p>
		</div>
		<div class="write">
			<form id="oFrm" name="oFrm" method="post">
					<div class="consultRequestCont">
						<div class="q1">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>������</strong></div>
							<span>�̸�</span>
							<input type="text" placeholder="������ �Է����ּ���.">
							<span>�ڵ���</span>
							<input type="text" placeholder="��) 010-1234-5678">
							<span>��ȭ��ȣ</span>
							<input type="text" placeholder="��) 02-1234-5678">
							<span class="addr">�ּ�</span><a href="#">�ּ�ã��</a>
							<input type="radio" name="addr"><label for="addr" class="myhome">����</label>
							<input type="radio" name="addr"><label for="addr" class="momhome">ģ������</label>
							<input type="radio" name="addr"><label for="addr" class="anothermomhome">�ô�����</label>
							<input type="text" placeholder="�ּ�ã�� ��ư�� Ŭ�����ּ���." class="addr01">
							<input type="text">
							<div class="dateLeft">
								<span>�и�������</span>
								<input type="text">
							</div>
							<div class="dateRight">
								<span>��꿹����</span>
								<input type="text">
							</div>
							
							<div class="left">
								<span class="delivery">�и�����</span><br/>
								<input type="radio" name="natal">
								<label for="natal" class="nature">�ڿ��и�</label>
								<input type="radio">
								<label for="natal" name="natal">��������</label>
							</div>
							<div class="right">
								<span>�Ʊ⼺��</span><br/>
								<input type="radio" name="sex">
								<label for="sex" class="sex">����</label>
								<input type="radio" name="sex">
								<label for="sex">����</label>
							</div>
							<label>�ֵ��� : </label>
							<input type="text" class="twins">��
							<label class="weight">ü�� : </label>
							<input type="text" class="weight">kg
							<label class="natalhospital">�и����� : </label>
							<input type="text" class="natalhospital">
						</div>
						<div class="q2">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>���α׷�</strong></div>
							<span class="carecenter">����������</span><br/>
							<input type="radio">
							<label for="" class="nope">�ƴϿ�</label>
							<input type="radio">
							<label for="">�� - </label>
							������ �ԼұⰣ<input type="text" class="term">�� / 
							<label for="">������������ :</label>
							<input type="text" class="centername">
							<span>���񽺽ǽ� ������</span><br/>
							<input type="text" class="excuteday"><br/>
							<span>���Ͻô� ���� ���α׷��� �����Դϱ�?</span><br/>
							<span class="career">�� ������ ��±���</span><br/>
							<input type="radio" class="vip"><label for="" class="mr">VIP</label>
							<input type="radio"><label for="" class="mr">�����̾�</label>
							<input type="radio"><label for="">������</label><br/>
							<span class="voucher">�� �ٿ�ó</span><br/>
							<input type="radio" class="typea"><label for="" class="mr">A-����</label>
							<input type="radio"><label for="" class="mr">A-����</label>
							<input type="radio"><label for="" class="mr">A-����</label>
							<input type="radio"><label for="" class="mr">A-����</label>
							<input type="radio"><label for="" class="mr">B-����</label>
							<input type="radio"><label for="" class="mr">B-����</label>
							<input type="radio"><label for="" class="mr">B-����</label>
							<input type="radio"><label for="">B-����</label><br/>
							<span class="focus">�� ���߰������α׷�</span><br/>
							<input type="checkbox" class="first">�����̺�</input>
							[<input type="radio"><label for="">�����</label>
							<input type="radio"><label for="">����</label>]<br/>
							<input type="checkbox" class="first">��ŷ��</input>
							[<input type="radio"><label for="">�����</label>
							<input type="radio"><label for="">����</label>]<br/>
							<input type="checkbox" class="first">������������ ������</input>
							[<input type="radio"><label for="">�����</label>
							<input type="radio"><label for="">����</label>]<br/>
							<input type="checkbox" class="first">35���̻� [�����]</input><br/>
							<input type="checkbox" class="first">��ü�� [�����]</input><br/>
							<span class="whatservice">���� ���� �� ����ٰ� ���ּ����� � ���� �̿��� ���Ͻʴϱ�?</span><br/>
							<input type="radio"><label for="" class="mr">�����5��</label><input type="radio"><label for="" class="mr">�����6��</label>
							<input type="radio"><label for="" class="mr">����5��</label><input type="radio"><label for="" class="mr">����6��</label>
							<input type="radio"><label for="">����</label><input type="text" class="small">��/<input type="text" class="small">�� + <label for="">�����</label><input type="text" class="small">��/<input type="text" class="small">��
							<span class="whatweek">���İ����� ���񽺴� �� �ָ� ���Ͻʴϱ�?</span><br/>
							<input type="radio"><label for="" class="whatweek">1��</label>
							<input type="radio"><label for="" class="whatweek">2��</label>
							<input type="radio"><label for="" class="whatweek">3��</label>
							<input type="radio"><label for="" class="whatweek">4��</label>
							<input type="radio">��Ÿ(<input type="text" class="small">)��<br/>
							
							<span class="anotherFam">�߰���������</span><br/>
							<input type="checkbox">�ʻ�
							<input type="checkbox">���
							������(<input type="text" class="small">��), ����(<input type="text" class="small">��), �θ��(<input type="text" class="small">��), ��Ÿ(<input type="text" class="small">��), �ݷ�����(<input type="text" class="small">����)<br/>
							<label for="">�߰��ݾ� : </label>
							<input type="text" class="addGold">��<br/>
							<span class="whatTendency">������� �����縦 ���Ͻʴϱ�?(�������� ���� �־����� �����Դϱ�?)</span><br/>
							<input type="checkbox"><label for="" class="mr">�Ż��ƺ���</label>
							<input type="checkbox"><label for="" class="mr">��������</label>
							<input type="checkbox"><label for="" class="mr">���ĺ���</label>
							<input type="checkbox"><label for="" class="mr">�Ļ��غ�</label>
							<input type="checkbox"><label for="" class="mr">��������</label>
							<input type="checkbox"><label for="" class="mr">ū���̺���</label>
							<input type="checkbox"><label for="">�ֵ���</label>
						</div>
						<div class="q3">
							<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>��Ÿ</strong></div>
							<span class="select">��,���� ��ǰ����(�ù�� ���κδ�)</span><br/>
							�����
							<select name="" id="">
								<option value="">����</option>
								<option value="">�޵��������</option>
								<option value="">�޵����Ƽ��</option>
							</select>
							<select name="" id="">
								<option value="">����</option>
								<option value="">�����ϼҸ�ǰ - �̱�</option>
								<option value="">�����ϼҸ�ǰ - ����</option>
								<option value="">��Ƽ���Ҹ�ǰ - �̱�</option>
								<option value="">��Ƽ���Ҹ�ǰ - ����</option>
							</select>
							<input type="text" class="small">��<input type="text" class="won">��<br/>
							�����<input type="text" class="josa"><br/>
							<span class="massage">���긶����</span><br/>
							<label for="">����</label><input type="text" class="small1">ȸ
							<label for="" class="ml">����</label><input type="text" class="small1">ȸ
							<label for="" class="ml">�߰�</label><input type="text" class="small1">ȸ<br/>
							<span class="massage">�湮��ȣ��</span><br/>
							<label for="">����</label><input type="text" class="small1">ȸ
							<label for="" class="ml">����</label><input type="text" class="small1">ȸ<br/>
							<span class="massage">�ҵ�����</span><br/>
							<input type="radio"><label for="">�̽�û</label>
							<input type="radio"><label for="">��û</label>
							<br/>
							<span>��꼱������</span>
							<select name="" id="">
								<option value="">����</option>
								<option value="">���ڳ� 500</option>
								<option value="">���ڳ� 1500</option>
								<option value="">����غ� �μ�</option>
								<option value="">����غ� ��Ǫ</option>
								<option value="">����غ� ����</option>
								<option value="">�����ý�</option>
								<option value="">�帲��Ŷ -���ָ���</option>
								<option value="">�帲��Ŷ -Ʈ������</option>
								<option value="">�����ҹ���</option>
								<option value="">���巹�� ������Ʈ</option>
								<option value="">���巹�� ���۹�</option>
								<option value="">���巹�� ������</option>
								<option value="">���巹�� ����ų�</option>
								<option value="">�������̼�Ʈ</option>
								<option value="">���̵�ο���</option>
								<option value="">�����м�����</option>
								<option value="">�����޵� ����е�</option>
								<option value="">���������2�ܰ�</option>
								<option value="">������ �Ѹ�ī</option>
								<option value="">��Ź��3��</option>
								<option value="">�������</option>
								<option value="">���ܳ� ���̷μ�</option>
								<option value="">���� �μ����Ŀ��</option>
								<option value="">���� ������̾���</option>
								<option value="">���͵鷯 �ӽΰ�</option>
								<option value="">���͵鷯 ��Ʈ�ѷ����</option>
								<option value="">���͵鷯 ��Ʈ�ѷ���ũ</option>
								<option value="">�Ƶ� �ӽ�������</option>
								<option value="">�Ƶ� �ӽ�����Ʈ</option>
								<option value="">�Ƶ� ��ε�����</option>
								<option value="">�Ƶ� ��θ��</option>
								<option value="">�Ƶ� ����Ǿƶ�</option>
								<option value="">�Ƶ� ������������</option>
								<option value="">�Ƶ� ������í��</option>
								<option value="">������ ��ũ���� </option>
								<option value="">������ ��</option>
								<option value="">������ �Ʊ�켧�׸���</option>
								<option value="">����</option>
								<option value="">��ŻƮ����ũ</option>
								<option value="">����150mm 2�Ѻ��</option>
								<option value="">����150mm 2����ũ</option>
								<option value="">����240 ��ũ��ũ</option>
								<option value="">����240 ���̱׸�</option>
								<option value="">ü�����̺� �������</option>
								<option value="">ü�����̺� ������ũ</option>
								<option value="">ü�߰�</option>
								<option value="">�ֽ���</option>
							</select>
							<span class="deliverydate">�ù���</span>
							<input type="text" class="small2">�������̺�<input type="checkbox"><br/>
							<span>��꼱���ڽ� �ù���</span>
							<input type="text" class="delidate"><br/>
							<span class="massage">�ϰ������</span><br/>
							<textarea name="" id="" cols="30" rows="10"></textarea><br/>
							<span class="massage">������ ����</span><br/>
							<input type="checkbox">
							<label for="" class="mr">�����, ���ֽð�</label>
							<input type="checkbox">
							<label for="" class="mr">���ϼ���</label>
							<input type="checkbox">
							<label for="" class="mr">�޽Ľð�</label>
							<input type="checkbox">
							<label for="">Ȩ������ ���Կ���</label><br/><br/><br/><br/>
							
							<span class="massage">��Ÿ</span><br/>
							<label class="etc">�����</label>(<input type="text" class="small4">)<br/>
							<label class="etc">�Ѿ�</label>(<input type="text" class="small4">)<br/>
							<label class="etc">�ܱ�</label>(<input type="text" class="small4">)<br/>
							<label class="etc">�߰���</label>(<input type="text" class="small4">)
						</div>
						<div class="btnwrap">
							<a href="#" class="save">����</a>
							<a href="#" class="cancel">���</a>
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
<!-- 					�����غ��̺� �˰� �� ��� <br/> -->
<!-- 					<input type="radio" name="know" value="������õ" valid="E|A=��û���񽺸� ������ �ּ���"/> ������õ&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="���ͳݰ˻�"/> ���ͳݰ˻�&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="��ΰ���õ"/> ��ΰ���õ&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="know" value="������"/> ������&nbsp;&nbsp;  -->
<!-- 					<input type="radio" name="know" value="��Ÿ"/> ��Ÿ&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q2</th> -->
<!-- 				<td>�̸� : <input type="text" name="name" class="textarea" size="10" value=""/> <span style="margin-left:20px;"> </span> -->
<!-- 					��ȭ��ȣ :  -->
<!-- 					<select name="phone_1" valid="E|A=��ȭ��ȣ�� ������ �ּ���"> -->
<!-- 						<option value="">����</option> -->
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
<!-- 					<input type="text" name="phone_2" size="5" maxlength="4" value="" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/> -->
<!-- 					- -->
<!-- 					<input type="text" name="phone_3" size="5" maxlength="4" value="" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/> -->
<!-- 					 -->
<!-- 					<span style="margin-left:20px;"> </span>�ڵ��� ��ȣ : -->
<!--  -->
<!-- 					<select name="hp_1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���"> -->
<!-- 						<option value="">����</option> -->
<!-- 						<option value="010">010</option> -->
<!-- 						<option value="011">011</option> -->
<!-- 						<option value="016">016</option> -->
<!-- 						<option value="017">017</option> -->
<!-- 						<option value="018">018</option> -->
<!-- 						<option value="019">019</option> -->
<!-- 					</select> -->
<!-- 					- -->
<!-- 					<input type="text" name="hp_2" size="5" maxlength="4" value="" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/> -->
<!-- 					- -->
<!-- 					<input type="text" name="hp_3" size="5" maxlength="4" value="" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/> -->
<!-- 					</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q3</th> -->
<!-- 				<td>�����ּ� :  -->
<!-- 					<input type="text"  id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="" valid="E|A=�����ȣ�� �Է��� �ּ���"/> -->
<!-- 					- -->
<!-- 					<input type="text"  id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="" valid="E|A=�����ȣ�� �Է��� �ּ���"/> -->
<!-- 					&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/> -->
<!--  -->
<!-- 					<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="" onClick="fncOpenZip();" valid="E|A=�ּҸ� �Է��� �ּ���"/> -->
<!-- 					<input type="text" name="addr_2" class="textarea" size="35" value="" valid="E|A=���ּҸ� �Է��� �ּ���"/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q4</th>	 -->
<!-- 				<td>�и������� :  -->
<!-- 					<select name="childbirth_y" valid="E|A=�и��������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 						<option value="<%=num%>" ><%=num%></option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="childbirth_m" valid="E|A=�и��������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=1 To 12 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>��</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="childbirth_d" valid="E|A=�и��������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=1 To 31 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>��</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 				  -->
<!-- 					<span style="margin-left:20px;"> </span> ���񽺽ǽ� ������ :  -->
<!-- 					<select name="serviceDt_y" valid="E|A=���񽺽��� �������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=Year(DateAdd("yyyy",3,Date())) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 						<option value="<%=num%>"><%=num%></option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="serviceDt_m" valid="E|A=���񽺽��� �������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=1 To 12 %> -->
<!-- 						<option value="<%=num%>" ><%=num%>��</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 					<select name="serviceDt_d" valid="E|A=���񽺽��� �������� ������ �ּ���"> -->
<!-- 						<option value="">��</option> -->
<!-- 					<% For num=1 To 31 %> -->
<!-- 						<option value="<%=num%>"><%=num%>��</option> -->
<!-- 					<% Next %> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q5</th>	 -->
<!-- 				<td id="Q5_add_2"> -->
<!-- 					<input type="radio" name="Q5" value="�ʻ��" onclick="check()" /> �ʻ��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="Q5" value="����" onclick="check()" /> ���� &nbsp;&nbsp; -->
<!-- 					<select name="Q5_De" > -->
<!-- 						<option value="1">1��</option> -->
<!-- 						<option value="2">2��</option> -->
<!-- 						<option value="3">3��</option> -->
<!-- 						<option value="4">4��</option> -->
<!-- 						<option value="5">5��</option> -->
<!-- 						<option value="6">6��</option> -->
<!-- 						<option value="7">7��</option> -->
<!-- 						<option value="8">8��</option> -->
<!-- 						<option value="9">9��</option> -->
<!-- 					</select> -->
<!-- 					���� <input type="text" name="age" class="textarea" size="5" value=""/> -->
<!-- 					<span style="margin-left:20px;"></span>�и����� :  -->
<!-- 				    <input type="text" name="bm_type" class="textarea" size="10" value=""/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q6</th>	 -->
<!-- 				<td>���������� <span style="margin-left:30px;"></span> -->
<!-- 					<input type="radio" name="Q6" value="�̿����" onclick="check_Q6();"/> �̿����&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="Q6" value="�̿���"  onclick="check_Q6();" /> �̿��� -->
<!-- 					<input type="text"	 name="Q6_week"  class="textarea" size="5" maxlength="3" value=""/>�� -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q7</th> -->
<!-- 				<td> ���Ͻô� ���� ���α׷��� �����Դϱ�?<br/> -->
<!-- 				 ������ ��±��� :  -->
<!-- 					<input type="checkbox" name="Q7" value="VIP���α׷�"/> VIP���α׷�&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="�����̾����α׷�"/> �����̾����α׷�&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="���������α׷�" valid="E|A=��û���񽺸� ������ �ּ���"/> ���������α׷�&nbsp;&nbsp; -->
<!-- 				<br/> ���߰������α׷� :  -->
<!-- 					<input type="checkbox" name="Q7" value="�����̺����α׷�"/> �����̺����α׷�&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="Q7" value="��ŷ��"/> ��ŷ��(��/��) -->
<!-- 					<input type="checkbox" name="Q7" value="��������"/> ��������(��/��)&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="Q7" value="35���̻�"/> 35���̻�(��)&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="Q7" value="��ü��"/> ��ü��(��)&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q8</th> -->
<!-- 				<td>���� ������ ����ٰ� ���� ���� �� � ���� �̿��� ���Ͻʴϱ�?<br/> -->
<!-- 					<input type="radio" name="service_work" value="�����5��"/> �����5��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="�����6��"/> �����6��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="����"/> ����&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_work" value="�����"/> ����� -->
<!-- 					(<input type="text" name="service_work_add_1" size="3" maxlength="3" value=""/>��)+����(<input type="text" name="service_work_add_2" size="3" maxlength="3" value=""/>��) -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q9</th> -->
<!-- 				<td> -->
<!-- 					���İ����� ���񽺴� �� �ָ� ���Ͻʴϱ�? <br/> -->
<!-- 					<input type="radio" name="service_week" value="1��"/> 1��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="2��"/> 2��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="3��"/> 3��&nbsp;&nbsp; -->
<!-- 					<input type="radio" name="service_week" value="4��"/> 4��&nbsp;&nbsp;  -->
<!-- 					<input type="radio" name="service_week" value="��Ÿ"/> ��Ÿ&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q10</th> -->
<!-- 				<td> �߰����� ����<br/> -->
<!-- 					<input type="checkbox" name="add_fam1" value="������"/> ������ (<input type="text" name="add_fam1_1" size="3" maxlength="3" value=""/>��) &nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam2" value="����"/> ���� (<input type="text" name="add_fam2_1" size="3" maxlength="3" value=""/>��)&nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam3" value="�ֵ���"/> �ֵ��� &nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam4" value="�θ��"/> �θ�� (<input type="text" name="add_fam4_1" size="3" maxlength="3" value=""/>��)&nbsp&nbsp -->
<!-- 					<input type="checkbox" name="add_fam5" value="��Ÿ"/> ��Ÿ  -->
<!-- 					(<input type="text" name="add_fam5_1" id="add_fam5_1" value="��)�ô���" size="20" maxlength="20"  /> -->
<!-- 					<input type="text" name="add_fam5_2" id="add_fam5_2" size="3" maxlength="3" value=""/>��) -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q11</th> -->
<!-- 				<td> -->
<!-- 					� ������ �����縦 ���Ͻʴϱ�? (�������� ���� �־����� �����Դϱ�?) <br/> -->
<!-- 					<input type="checkbox" name="service_type_1" value="��������"/> ��������&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_2" value="���ĺ���"/> ���ĺ���&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_3" value="�Ż��ƺ���"/> �Ż��ƺ���&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_4" value="�Ļ��غ�"/> �Ļ��غ�&nbsp;&nbsp;  -->
<!-- 					<input type="checkbox" name="service_type_5" value="��������"/> ��������&nbsp;&nbsp; -->
<!-- 					<input type="checkbox" name="service_type_6" value="ū���̺���"/> ū���̺���&nbsp;&nbsp; -->
<!-- 				</td> -->
<!-- 			</tr> -->

<!--
���� �ּ���Ʈ



<tr>
				 	<select name="pdt_no"   class="textarea" style="height:35px;">
						<option value=""selected>����</option>
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
<!-- 				<td> ��,���� ��ǰ����(�ú� ���κδ�)<br/> -->
<!-- 				1) �����		<select name="product_1"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">����</option> -->
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

					<!-- ���� �ּ���Ʈ <select name="product_1_month"   class="textarea" style="height:35px;">
								<option value="">����</option>
								<option value="6����">6����</option>
								<option value="3����">3����</option>
								<option value="1����">1����</option>
								<option value="2��">2��</option>
					 </select>-->


<!-- 					 <select name="product_2"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">����</option> -->
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
<!-- 						<input type="text" name="product_week" size="3" maxlength="3" value=""/> �� -->
<!-- 						<input type="text" name="product_price" size="10" maxlength="10" value=""/> �� -->
<!-- 						 <span style="margin-left:20px;"></span> -->
<!-- 							2) �����&nbsp&nbsp<select name="Q12_Y"> -->
<!-- 									<option value="">��</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q12_M"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q12_D"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>  &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q13</th> -->
<!-- 				<td> ���Ÿ����� -  ���� <input type="text" name="massage1" size="10" maxlength="10" value=""/> ȸ &nbsp&nbsp -->
<!-- 							   ���� <input type="text" name="massage2" size="10" maxlength="10" value=""/> ȸ &nbsp&nbsp  -->
<!-- 							   �߰� <input type="text" name="massage3" size="10" maxlength="10" value=""/> ȸ &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q14</th> -->
<!-- 				<td> �湮��ȣ�� -   -->
<!-- 								���� <input type="text" name="Q14_1" size="10" maxlength="10" value=""/> ȸ &nbsp&nbsp -->
<!-- 							    ���� <input type="text" name="Q14_2" size="10" maxlength="10" value=""/> ȸ &nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q15</th> -->
<!-- 				<td> �ҵ����� &nbsp&nbsp -->
<!-- 					<select name="Q15_Y" > -->
<!-- 						<option value="">����</option> -->
<!-- 						<option value="Y">��û��</option> -->
<!-- 						<option value="N">��û����</option> -->
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->

		<!--  ���� �ּ���Ʈ 
			<tr>
				<th>��ǰ��</th>
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
<!-- 				<td> ��꼱������  -->
<!-- 								<select name="Q16_gift"   class="textarea" style="height:35px;"> -->
<!-- 								<option value="">����</option> -->
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
 
				
						<!--	���� �ּ���Ʈ<input type="text" name="Q16_gift" size="20" maxlength="20" value=""/>&nbsp&nbsp   -->



<!-- 							   �ù��� <select name="Q16_Y"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q16_M"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q16_D"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>&nbsp&nbsp -->
<!-- 									�������̺� <input type="checkbox" name="Q16_baby" value="Y"/>  -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>Q17</th> -->
<!-- 				<td> ��꼱���ڽ�  -->
<!-- 							   �ù��� <select name="Q17_Y"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %> -->
<!-- 										<option value="<%=num%>"><%=num%></option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q17_M" > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 12 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select> -->
<!-- 									<select name="Q17_D"  > -->
<!-- 										<option value="">��</option> -->
<!-- 									<% For num=1 To 31 %> -->
<!-- 										<option value="<%=num%>"><%=num%>��</option> -->
<!-- 									<% Next %> -->
<!-- 									</select>&nbsp&nbsp -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>���</th>	 -->
<!-- 				<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=��� �Է��� �ּ���"></textarea></td> -->
<!-- 			</tr> -->



			<!--tr>  �����ּ���Ʈ
				<th>����</th>
				<td>
					<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
						<option value="">����</option>
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
						<option value="">����</option>
					</select>
				</td>
			</tr-->


<!-- 			<tr> -->
<!-- 				<th>��Ÿ</th>	 -->
<!-- 				<td> -->
<!-- 					�����,���ֽð� <input type="text" name="in_out_time" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					���ϼ��� <input type="text" name="holliday_pay" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					�޽Ľð� <input type="text" name="break_time" size="20" maxlength="20" value=""/>&nbsp&nbsp -->
<!-- 					Ȩ������ ���Կ���<input type="checkbox" name="homepage_join_Y" value="Y"/> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			</thead> -->
<!-- 			</table> -->
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="�� ��" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" class="button" onClick="history.back(-1);">
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
$(this).val() == '' ? $(this).val('��)�ô���') : $(this).val() = $(this).val();
});
 

 


</script>
</html>
 <!--
<form name=frm method=post>
<input type=radio name="r1" value="��üȸ��" onclick="check()">����1
<input type=radio name="r1" value="�κ�ȸ��" onclick="check()">����2<BR>






<input type="text" id="text_field" value='�Է� �� ����' />

<script>
$('#text_field').focus(function(){
$(this).val('');
}).blur(function(){
$(this).val() == '' ? $(this).val('�Է� �� ����') : $(this).val() = $(this).val();
});
</script> - See more at: http://blogtoday.tistory.com/entry/input-%EB%B0%95%EC%8A%A4-%ED%85%8D%EC%8A%A4%ED%8A%B8-%ED%81%B4%EB%A6%AD%EC%8B%9C-%EC%82%AC%EB%9D%BC%EC%A7%80%EA%B2%8C#sthash.f3C87Bb2.dpuf









 -->