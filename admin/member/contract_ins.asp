<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_ins.asp
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
<!-- �޷� �߰� -->
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
			constract_date	= Rs(13) '�����
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
		'	ȸ�� �⺻���� ��ȸ
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
'	���� ���� ȣ��

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

'-----------------------------------------------------------------------------
'-----------------------------------------------------------------------------
'	���� ���� ȣ��
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
'	������ Ȯ��
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

'------�޷��߰��� ����--------------------------------------------------
	
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

'-------�޷� �߰��� ����----------------------------------------------------



'---------------------------------------------------------------------------------	
%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>�Ӵ��� ��༭</strong></div>
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
				<th>�Ӵ���</th>
				<td><input type="text" id="company" name="company" size="20" value="���Ͻ����ڸ�����" valid="E|A=�Ӵ����� �Է��� �ּ���">
				</td>
			</tr>
			
			<tr>
				<th>�Ӵ��� ����ó</th>
				<td>
					<select name="hp_11" id="hp_11" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
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
					<input type="text" name="hp_22" id="hp_22" size="5" maxlength="4" value="557" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="hp_33" id="hp_33" size="5" maxlength="4" value="3579" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					<input type="text" name="post_11" id="post_11" class="textarea" size="5" maxlength="3" value="138" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_22" id="post_22" class="textarea" size="5" maxlength="3" value="240" valid="E|A=�����ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_11" id="addr_11" class="textarea" size="60" value="����Ư���� ������ ���ﵿ �������� 4��" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_22" id="addr_22" class="textarea" size="35" value="736-38" valid="E|A=���ּҸ� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>������</th>
				<td><input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=customer_nm%>"   onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="�����θ����� ���̵� �˻�" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>ȸ��ID</th>
				<td>
					<input type="text" id="mem_id" name="mem_id" size="20" value="<%=customer_id%>" valid="E|M=10|A=ȸ��ID�� �Է��� �ּ���">
					<!--<input type="button" value="ȸ������ ��ȸ" id="btnMem">-->
				</td>
			</tr>

		<!--	
			<tr>
				<th>������</th>
				<td><input type="text" id="im_cha_name" name="im_cha_name" size="20" value="<%=pay_name%>" valid="E|A=������ ������ �Է��� �ּ���">
				</td>
			</tr>
		-->

			<tr>
				<th>������ ����ó</th>
				<td>
					<select name="hp_1" id="hp_1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
						<option value="">����</option>
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
					<input type="text" name="hp_2" id="hp_2" size="5" maxlength="4" value="<%=customerhp_2%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="hp_3" id="hp_3" size="5" maxlength="4" value="<%=customerhp_3%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>������ �ּ�</th>
				<td>
					<input type="text" name="post_1" id="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(customer_post,3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_2" id="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(customer_post,3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_1" id="addr_1" class="textarea" size="60" value="<%=customer_addr1%>" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_2" id="addr_2" class="textarea" size="35" value="<%=customer_addr2%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
				</td>
			</tr>

			<tr>
				<th>��๰ǰ</th>
				<td><input type="text" id="contract_product" name="contract_product" size="20" value="������ �����" valid="E|A=��๰ǰ�� �Է��� �ּ���">
				</td>
			</tr>
			<tr>
				<th>�����</th>
				<td>
				<input type="text" id="datepicker" name="constract_date" value="<%=constract_date_ymd%>"> 
				<!--
					<select name="contract_date_y"  id="contract_date_y" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(constract_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="contract_date_m"  id="contract_date_m"  valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mbirth)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="contract_date_d"  id="contract_date_d" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dbirth)%>><%=num%></option>
					<% Next %>
					</select>
					-->
				</td>
			</tr>
			<tr>
				<th>��ȭ</th>
				<td>
					<select name="tel_1" id="tel_1" valid="E|A=��ȭ��ȣ�� ������ �ּ���">
						<option value="">����</option>
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
					<input type="text" name="tel_2" id="tel_2" size="5" maxlength="4" value="<%=constract_tel_2%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="tel_3" id="tel_3" size="5" maxlength="4" value="<%=constract_tel_3%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�Ӵ����</th>
				<td><input type="text" id="imda_type" name="imda_type" size="20" value="<%=constract_type%>">
				</td>
			</tr>
			<tr>
				<th>�Աݰ���</th>
				<td>���� <input type="text" id="bank" name="bank" size="20" value="<%=constract_bank%>"> 
					���� <input type="text" id="account" name="account" size="20" value="<%=constract_account%>">
				</td>
			</tr>
			<tr>
				<th>�뿩������</th>
				<td>
				<input type="text" id="datepicker1" name="start_date" value="<%=start_date_ymd%>"> 
				<!--
					<select name="start_date_y"  id="start_date_y" valid="E|A=�뿩���ó������ ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(start_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="start_date_m"  id="start_date_m"  valid="E|A=�뿩���ó������ ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mdate)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="start_date_d"  id="start_date_d" valid="E|A=�뿩���ó������ ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Ddate)%>><%=num%></option>
					<% Next %>
					</select>-->
				</td>
			</tr>
			<tr>
				<th>�뿩������</th>
				<td>
				<input type="text" id="datepicker2" name="end_date" value="<%=end_date_ymd%>"> 
				<!--
					<select name="end_date_y"  id="end_date_y" valid="E|A=�뿩���������� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(end_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="end_date_m"  id="end_date_m"  valid="E|A=�뿩���������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,end_Mdate)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="end_date_d"  id="end_date_d" valid="E|A=�뿩���������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,end_Ddate)%>><%=num%></option>
					<% Next %>
					</select> -->
				</td>
			</tr>
			<tr>
				<th>����� ��ǰ��ȣ</th>
				<td><input type="text" id="product_no" name="product_no" size="20" value="<%=product_no%>">
				</td>
			</tr>
			<tr>
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
			</tr>
			</thead>
			</table>
			


			<div style="margin-left:20px;">
				 
				<h2>��� �Ӵ��ΰ� �������� �Ӵ��� ����� ü���ϰ� �� ������ 2�� �ۼ��Ͽ� �� 1�ξ� �����Ѵ�.</h2>
				<h2>�������</h2>	
				�� �Ӵ� ����� ���Ͻ����ڸ������� �Ӵ��ϰ� <input type="text" id="contract_in_name" name="contract_in_name" size="10" value="<%=contnent_intro%>">�� �����Ͽ� �̷���� ����̴�.<br/><br/>

				<strong><font style="font-weight: bold">1. �Ӵ��� �Ⱓ </font></strong><br/>
				�� ��ǰ�� �Ӵ��� �Ⱓ�� ��ǰ�� �뿩�����Ϸκ��� �뿩�����ϱ����� �Ѵ�.<br/>
				�ּ� �Ӵ��� �Ⱓ�� <input type="text" id="contract_1_term" name="contract_1_term" size="10" value="<%=contnent1%>">�̴�.<br/><br/>
				
				<strong><font style="font-weight: bold">2. �Ӵ�� �� ���ҹ�� </font></strong><br/>
				�� ��ǰ�� �Ӵ��� �⺻ <input type="text" id="contract_2" name="contract_2" size="10" value="<%=contnent2%>">���̸� �������� ���� �뿩�Ⱓ�� �ش��ϴ� �Ӵ�Ḧ �����Ͽ��� �Ѵ�.<br/><br/>
				
				<strong><font style="font-weight: bold">3. ��ġ�� </font></strong><br/>
				�������� ���ÿ� ��ġ�� <input type="text" id="contract_3" name="contract_3" size="10" value="<%=contnent3%>">���� �Ӵ��ο��� �����Ͽ��� �Ѵ�.<br/>
				��, ����� �ؾ� �� �Ӵ�Ⱓ�� ���⿡ ���� ����Ǿ��� ���, �Ӵ����� �����ο��� ��ġ���� ��ȯ�Ѵ�.<br/><br/>
				
				<strong><font style="font-weight: bold">4. �������� �Ǹ� </font></strong><br/>
				�������� ���� ��ǰ�� �뵵 �� ������ �°� �������� ����� �� �ִ�.<br/><br/>

				<strong><font style="font-weight: bold">5. ���ع�� </font></strong><br/>
				���� ��ǰ�� �뿩 ���õ� �� �������� �����Ƿ� ���� �߻��� ��ǰ�� ���, �Ѽյ ���� �������� ���ع���� �ǹ��� ����.<br/><br/>

				<strong><font style="font-weight: bold">6. ��ǰ�� ���� </font></strong><br/>
				��ǰ�� �ε��� �� ��ǰ��ü�� ���� ���ڰ� �߻��� �Ӵ����� ����� ������ �ش�.<br/><br/>

				<strong><font style="font-weight: bold">7. �Ӵ��� ��� �ڵ����� </font></strong><br/>
				�������� �뿩 �����ϱ��� ��ǰ�� ��ȯ���� �ʰų�, ��ȯ�� ��û���� ���� ���, �ּ� �Ӵ����Ⱓ�� �ش��ϴ� �Ⱓ���� �߰��� �Ӵ�������� �����Ǿ� �������� �Ӵ��ο��� �߰� �Ӵ�Ḧ �����ؾ� �ϸ�, �뿩 �����ϵ� �ڵ� ����ȴ�.<br/><br/>

				<strong><font style="font-weight: bold">8. �Ӵ��� ����� �ؾ� </font></strong><br/>
				�������� ������ ���׿� �ش�Ǿ� ��� ������ �Ұ����� ���, �Ӵ����� �� ����� ��ü���� �ؾ��� �� �ִ�.
				1) �Ӵ���� ü���� �߻��� ���, 2) ������ ���������� ������ ���.<br/><br/>

				<strong><font style="font-weight: bold">9. ��ǰ�� ��ȯ �� ��޷� </font></strong><br/>
				���׿� ���� ����� �ؾ� �� �Ӵ� �Ⱓ�� ���� � ���� ����Ǿ��� ��쿡�� �������� ��ü���� ��ǰ�� �Ӵ��ο��� ��ȯ�Ѵ�. �������� Ư���� ��ġ���� ��ǰ�� ��� �Ǵ� �ݳ� �������� �� ȸ�� ������ �湮�� �䱸�Ͽ� ���������� Ư����ġ���� �湮 �� ��� �湮 �����ᰡ �߰��ȴ�.<br/>(����� ��� �� �ݳ� ��û�� �湮������ : ����ù湮 �պ� 10,000��, ��⵵�湮 �պ� 20,000�� ��⵵ �ù�� �պ��ù�� ���δ�)<br/><br/>

				<strong><font style="font-weight: bold">10. ������ �ذ� </font></strong><br/>
				�� ����� ������ �ƴ��� ���� �Ǵ� �� ����� �ؼ��� ���Ͽ� ���ǰ� �߻��� ���� �Ӵ��ΰ� �������� �����Ͽ� �ذ��Ѵ�.<br/><br/>


				<strong><font style="font-weight: bold">11. �Ǹ��� �ǹ��� �絵 </font></strong><br/>
				�� ��࿡ ���� �Ǹ��� �ǹ��� �Ϻ� �Ǵ� ���θ� �ֹ��� ���� ���� Ÿ�ο��� �絵�� �� ����.<br/><br/>

				<strong><font style="font-weight: bold">�������� </font></strong><br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_pay" name="contract_11_pay" size="10" value="<%=contnent4_price%>">  <br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_deposit" name="contract_11_deposit" size="10" value="<%=contnent4_deposit%>">  <br/>
				�Ҹ�ǰ��Ʈ : <input type="text" id="contract_11_set" name="contract_11_set" size="10" value="<%=contnent4_set%>">  <br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_out" name="contract_11_out" size="10" value="<%=contnent4_out_pay%>"> <br/>
				�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  �� :  <input type="text" id="contract_11_total" name="contract_11_total" size="10" value="<%=contnent4_total%>"> ������<input type="text" id="contract_11_pay_man" name="contract_11_pay_man" size="10" value="<%=contnent4_human%>"><br/>

			<span style="margin-left:750px;"> 
			<input type="text" id="contract_11_yy" name="contract_11_yy" size="5" readonly value="<%=NowDate_1%>">�� 
			<input type="text" id="contract_11_yy" name="contract_11_mm" size="3" readonly value="<%=NowDate_2%>">�� 
			<input type="text" id="contract_11_dd" name="contract_11_dd" size="3" readonly value="<%=NowDate_3%>">��</span><br/>
			<span style="margin-left:750px;"></span><br/>
			<span style="margin-left:750px;">������ ����  <input type="text" id="contract_11_name" name="contract_11_name" size="10" value="<%=customer_nm2%>"></span><br/>

			</div> 
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="�� ��" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" class="button" onClick="history.back(-1);">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>


<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<!-- �޷��߰� ����-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<script> 
$(document).ready(function() {	   
	$( "#datepicker" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
		  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	}); 
		$( "#datepicker1" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
		  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	}); 
		$( "#datepicker2" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
		  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	}); 
  }); 
</script>
<!-- �޷��߰� ��-->
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
			alert("ȸ��ID�� �Է��� �ּ���");
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
		if (confirm("���� �Ͻðڽ��ϱ�?")) {
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
	  var title = "��𵵿�� �˻�"; 
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
		var title = "��𵵿�� �˻�"; 
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
		var title = "��𵵿�� �˻�"; 
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
		var title = "��𵵿�� �˻�"; 
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
	  var title = "�̸��˻�"; 
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