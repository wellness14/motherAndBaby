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

		.pop-layer {display:none; position: absolute; top: 50%; left: 50%; width: 780px; height:auto;  background-color:#fff; border: 5px solid #3571B5; z-index: 10;}	
		.pop-layer .pop-container {padding: 20px 25px;}
		.pop-layer p.ctxt {color: #666; line-height: 25px;}
		.pop-layer .btn-r {width: 100%; margin:10px 0 20px; padding-top: 10px; border-top: 1px solid #DDD; text-align:right;}

		a.cbtn {display:inline-block; height:25px; padding:0 14px 0; border:1px solid #304a8a; background-color:#3f5a9d; font-size:13px; color:#fff; line-height:25px;}	
		a.cbtn:hover {border: 1px solid #091940; background-color:#1f326a; color:#fff;}

	</style>
</head>
 
<%
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
			 
			mr_idx		= Rs(0)
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
			s_happy_call= Rs(35)
			e_happy_call= Rs(36)
			
			product_1					= Rs(37) '����� 
			product_2					= Rs(38) '����� �Ҹ�ǰ
			product_CHOICE_WEEK			= Rs(39) '�Ⱓ
			product_CHOICE_PRICE		= Rs(40) '����
			product_OUT_DAY				= Rs(41) '�����
			product_MASSAGE_BEFORE		= Rs(42) ' ������ ����
			product_MASSAGE_AFTER		= Rs(43) ' ����
			product_MASSAGE_ADD			= Rs(44) ' �߰�
			product_VISIT_NURSE_BEFORE	= Rs(45) ' �湮��ȣ�� ����
			product_VISIT_NURSE_AFTER	= Rs(46) ' ����
			product_SODOK_SERVICE		= Rs(47) ' �ҵ�����
			product_GIFT_CHOICE			= Rs(48) ' ��꼱������
			product_GIFT_CHOICE_SEND	= Rs(49) ' �ù���
			product_GIFT_CHOICE_BABY	= Rs(50) ' �������̺�
			product_GIFT_BOX_SEND		= Rs(51) ' ��꼱���ڽ� �ù���
			product_CONTENT2			= Rs(52) ' ����� �޸� �����ڸ� ��������. -- ������

			massage_mng					= Rs(54) ' ����� �޸� �����ڸ� ��������. -- ������
			massage_hp					= Rs(55) ' ����� �޸� �����ڸ� ��������. -- ������
			visit_nurse_mng				= Rs(56) ' ����� �޸� �����ڸ� ��������. -- ������
			visit_nurse_hp				= Rs(57) ' ����� �޸� �����ڸ� ��������. -- ������
			sodok_mng					= Rs(58) ' ����� �޸� �����ڸ� ��������. -- ������
			sodok_hp					= Rs(59) ' ����� �޸� �����ڸ� ��������. -- ������


			arr_res_List = Rs.GetRows()

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


'---------------------------------------------------------------------------------------------------------
	'	��� ��ǰ ȣ��
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)

	'	��� �Ҹ�ǰ ȣ��
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME, MO_CONSUMABLES_CATEGORY from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='M' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name1 = Rs("MO_CONSUMABLES_NAME")
		arrProdt_main = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	��� �Ҹ�ǰ ����
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='S' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_sub = Rs.getRows()
	End If 
	Call RSClose(Rs)


'----------------------------------------------------------------------------------------------------------
'	������ Ȯ��
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

	If massage_hp <> "" Then 
		arrMHp	= Split(massage_hp,"-")
		MHp_1	= arrMHp(0)
		MHp_2	= arrMHp(1)
		MHp_3	= arrMHp(2)
	End If 
 
	If visit_nurse_hp <> "" Then 
		arrNHp	= Split(visit_nurse_hp,"-")
		Nhp_1	= arrNHp(0)
		Nhp_2	= arrNHp(1)
		Nhp_3	= arrNHp(2)
	End If 

	If sodok_hp <> "" Then 
		arrSHp	= Split(sodok_hp,"-")
		Shp_1	= arrSHp(0)
		Shp_2	= arrSHp(1)
		Shp_3	= arrSHp(2)
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

	If product_OUT_DAY <> "" Then 
		out_Daym = Mid(product_OUT_DAY,5,2)
	If out_Daym < 10 Then out_Daym = Right(out_Daym,1)
		out_Daymd = Right(product_OUT_DAY,2)
	If out_Daymd < 10 Then out_Daymd = Right(out_Daymd,1)
	End If 

	If product_GIFT_CHOICE_SEND <> "" Then 
		gift_choice_sendm = Mid(product_GIFT_CHOICE_SEND,5,2)
	If gift_choice_sendm < 10 Then gift_choice_sendm = Right(gift_choice_sendm,1)
		gift_choice_sendmd = Right(product_GIFT_CHOICE_SEND,2)
	If gift_choice_sendmd < 10 Then gift_choice_sendmd = Right(gift_choice_sendmd,1)
	End If 

	If product_GIFT_BOX_SEND <> "" Then 
		gift_box_sendm = Mid(product_GIFT_BOX_SEND,5,2)
	If gift_box_sendm < 10 Then gift_box_sendm = Right(gift_box_sendm,1)
		gift_box_sendmd = Right(product_GIFT_BOX_SEND,2)
	If gift_box_sendmd < 10 Then gift_box_sendmd = Right(gift_box_sendmd,1)
	End If 


'---------------------------------------------------------------------------------	

 '------�޷��߰��� ����--------------------------------------------------
	'1 �������
	If birth <> "" Then 
		birth_m = Mid(birth,5,2)
		birth_d = Right(birth,2)
		birth_ymd = Left(birth,4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	'2 ��꿹����
	If childbirth <> "" Then 
		childbirth_m = Mid(childbirth,5,2)
		childbirth_d = Right(childbirth,2)
		childbirth_ymd = Left(childbirth,4) & "-" & childbirth_m & "-" & childbirth_d

		If childbirth_ymd = "--" Then
			childbirth_ymd = ""
		End If
	End If
	
	'3 ���� ������
	If serviceSdt <> "" Then 
		serviceS_m = Mid(serviceSdt,5,2)
		serviceS_d = Right(serviceSdt,2)
		serviceS_ymd = Left(serviceSdt,4) & "-" & serviceS_m & "-" & serviceS_d

		If serviceS_ymd = "--" Then
			serviceS_ymd = ""
		End If
	End If
	
	'4 ���� ������
	If serviceEdt <> "" then
		serviceE_m = Mid(serviceEdt,5,2)
		serviceE_d = Right(serviceEdt,2)
		serviceE_ymd = Left(serviceEdt,4) & "-" & serviceE_m & "-" & serviceE_d

		If serviceE_ymd = "--" Then
			serviceE_ymd = ""
		End If
	End If
	
	'5 ��꼱������ �ù���
	If	product_GIFT_CHOICE_SEND <> "" Then 
		product_GIFT_m = Mid(product_GIFT_CHOICE_SEND,5,2)
		product_GIFT_d = Right(product_GIFT_CHOICE_SEND,2)
		product_GIFT_ymd = Left(product_GIFT_CHOICE_SEND,4) & "-" & product_GIFT_m & "-" & product_GIFT_d

		If product_GIFT_ymd = "--" Then
			product_GIFT_ymd = ""
		End If
	End If

		'5 ��꼱���ڽ� �ù���
	If	product_GIFT_BOX_SEND <> "" Then 
		product_GIFT_BOX_m = Mid(product_GIFT_BOX_SEND,5,2)
		product_GIFT_BOX_d = Right(product_GIFT_BOX_SEND,2)
		product_GIFT_BOX_ymd = Left(product_GIFT_BOX_SEND,4) & "-" & product_GIFT_BOX_m & "-" & product_GIFT_BOX_d

		If product_GIFT_BOX_ymd = "--" Then
			product_GIFT_BOX_ymd = ""
		End If
	End If
	
	'6 �����
	If product_OUT_DAY <> "" Then 
		product_OUT_m = Mid(product_OUT_DAY,5,2)
		product_OUT_d = Right(product_OUT_DAY,2)
		product_OUT_ymd = Left(product_OUT_DAY,4) & "-" & product_OUT_m & "-" & product_OUT_d

		If product_OUT_ymd = "--" Then
			product_OUT_ymd = ""
		End If
	End If
	
		'7 payEdt
	If payEdt <> "" Then 
		payEdt_m = Mid(payEdt,5,2)
		payEdt_d = Right(payEdt,2)
		payEdt_ymd = Left(payEdt,4) & "-" & payEdt_m & "-" & payEdt_d

		If payEdt_ymd = "--" Then
			payEdt_ymd = ""
		End If
	End If
	
	'8 serviceSdt_1  ���񽺿��� 1
	If serviceSdt_1 <> "" Then 
		serviceSdt_1_m = Mid(serviceSdt_1,5,2)
		serviceSdt_1_d = Right(serviceSdt_1,2)
		serviceSdt_1_ymd = Left(serviceSdt_1,4) & "-" & serviceSdt_1_m & "-" & serviceSdt_1_d

		If serviceSdt_1_ymd = "--" Then
			serviceSdt_1_ymd = ""
		End If
	End If
	
	'9 serviceEdt_1 ���񽺿���1 ����
	If serviceEdt_1 <> "" Then 
		serviceEdt_1_m = Mid(serviceEdt_1,5,2)
		serviceEdt_1_d = Right(serviceEdt_1,2)
		serviceEdt_1_ymd = Left(serviceEdt_1,4) & "-" & serviceEdt_1_m & "-" & serviceEdt_1_d

		If serviceEdt_1_ymd = "--" Then
			serviceEdt_1_ymd = ""
		End If
	End If
 
	'10 serviceSdt_2 ���񽺿���2 ����
	If serviceSdt_2 <> "" Then 
		serviceSdt_2_m = Mid(serviceSdt_2,5,2)
		serviceSdt_2_d = Right(serviceSdt_2,2)
		serviceSdt_2_ymd = Left(serviceSdt_2,4) & "-" & serviceSdt_2_m & "-" & serviceSdt_2_d

		If serviceSdt_2_ymd = "--" Then
			serviceSdt_2_ymd = ""
		End If
	End If
	
	'11 serviceEdt_2 ���񽺿���2 ����
	If serviceEdt_2 <> "" Then 
		serviceEdt_2_m = Mid(serviceEdt_2,5,2)
		serviceEdt_2_d = Right(serviceEdt_2,2)
		serviceEdt_2_ymd = Left(serviceEdt_2,4) & "-" & serviceEdt_2_m & "-" & serviceEdt_2_d

		If serviceEdt_2_ymd = "--" Then
			serviceEdt_2_ymd = ""
		End If
	End If
	
	'12 ���񽺿��� 3 ����
	If serviceSdt_3 <> "" Then 
		serviceSdt_3_m = Mid(serviceSdt_3,5,2)
		serviceSdt_3_d = Right(serviceSdt_3,2)
		serviceSdt_3_ymd = Left(serviceSdt_3,4) & "-" & serviceSdt_3_m & "-" & serviceSdt_3_d

		If serviceSdt_3_ymd = "--" Then
			serviceSdt_3_ymd = ""
		End If
	End If
	
	'13 ���񽺿��� 3 ����
	If serviceEdt_3 <> "" Then 
		serviceEdt_3_m = Mid(serviceEdt_3,5,2)
		serviceEdt_3_d = Right(serviceEdt_3,2)
		serviceEdt_3_ymd = Left(serviceEdt_3,4) & "-" & serviceEdt_3_m & "-" & serviceEdt_3_d

		If serviceEdt_3_ymd = "--" Then
			serviceEdt_3_ymd = ""
		End If
	End If
	
 
'-------�޷� �߰��� ����----------------------------------------------------


%>
<%

 If intIDX <> "" Then
product =  arr_res_List(0,0)
End if
%>

<script> </script>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>����Ȯ��</strong></div>
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
				<th>ȸ��ID</th>
				<% If uId = "test" Then  %>
				<td>
					<input type="text" id="mem_id" name="mem_id" size="20" value="<%=mem_id%>" valid="E|M=10|A=ȸ��ID�� �Է��� �ּ���">
					<input type="button" value="ȸ������ ��ȸ" id="btnMem"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="button" id="btnNm" value="�ű�ȸ�����(����)" onclick="fncOpenJoin();"  />
				</td>
				<% Else %>
				<td>
					<input type="text" id="mem_id" name="mem_id" size="20" value="<%=mem_id%>" valid="E|M=10|A=ȸ��ID�� �Է��� �ּ���">
					<input type="button" value="ȸ������ ��ȸ" id="btnMem">
				</td>
				<% End if%>
			</tr>
			<tr>
				<th>ȸ����</th>
				<td><input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=mem_nm%>" valid="E|A=ȸ������ �Է��� �ּ���" onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="ȸ���̸� �˻�" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>�������</th>
				<td><input type="text" id="datepicker" name="birth" value="<%=birth_ymd%>"> 
				</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>
					<select name="phone_1" id="phone_1" valid="E|A=��ȭ��ȣ�� ������ �ּ���">
						<option value="">����</option>
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
					<input type="text" id="phone_2" name="phone_2" size="5" maxlength="4" value="<%=phone_2%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" id="phone_3" name="phone_3" size="5" maxlength="4" value="<%=phone_3%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�ڵ�����ȣ</th>
				<td>
					<select name="hp_1" id="hp_1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
						<option value="">����</option>
						<option value="010" <%=fncSetSelectBox("010",hp_1)%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",hp_1)%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",hp_1)%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",hp_1)%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",hp_1)%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",hp_1)%>>019</option>
					</select>
					-
					<input type="text" name="hp_2" id="hp_2" size="5" maxlength="4" value="<%=hp_2%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="hp_3" id="hp_3" size="5" maxlength="4" value="<%=hp_3%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					<input type="text" name="post_1" id="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(post,3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_2" id="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(post,3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_1" id="addr_1" class="textarea" size="60" value="<%=addr_1%>" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_2" id="addr_2" class="textarea" size="35" value="<%=addr_2%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
				</td>
			</tr>	
			<tr>
				<th>��û����</th>
				<td>	
					<input type="checkbox" name="check1" value="������" <%If InStr(service,"������") > 0 Then%>checked<%End If%> valid="E|A=��û���񽺸� ������ �ּ���"/> ������&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="�����̾�" <%If InStr(service,"�����̾�") > 0 Then%>checked<%End If%>/> �����̾�&nbsp;&nbsp;
                    <input type="checkbox" name="check1" value="VIP" <%If InStr(service,"VIP") > 0 Then%>checked<%End If%>/> VIP&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="�����̺�" <%If InStr(service,"�����̺�") > 0 Then%>checked<%End If%>/> �����̺�&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="��ü��" <%If InStr(service,"��ü��") > 0 Then%>checked<%End If%>/> ��ü��&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="��ŷ��" <%If InStr(service,"��ŷ��") > 0 Then%>checked<%End If%>/> ��ŷ��&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="35���̻�" <%If InStr(service,"35���̻�") > 0 Then%>checked<%End If%>/> 35���̻�
					<input type="checkbox" name="check1" value="������������ ����" <%If InStr(service,"������������ ����") > 0 Then%>checked<%End If%>/> ������������ ������&nbsp;&nbsp;</br>
					<input type="checkbox" name="check1" value="�ٵ���" <%If InStr(service,"�ٵ���") > 0 Then%>checked<%End If%>/> �ٵ���&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="��� �� ����" <%If InStr(service,"��� �� ����") > 0 Then%>checked<%End If%>/> ��� �� ����
				</td>
			</tr>
			<tr>
				<th>�̿�Ⱓ</th>	
				<td>
					<input type="radio" name="radio1" value="1��" <%=fncSetCheckBox(period,"1��")%> valid="E|A=�̿�Ⱓ�� ������ �ּ���"/> 1��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="2��" <%=fncSetCheckBox(period,"2��")%> /> 2��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="3��" <%=fncSetCheckBox(period,"3��")%> /> 3��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4��" <%=fncSetCheckBox(period,"4��")%> /> 4��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="6��" <%=fncSetCheckBox(period,"6��")%> /> 6��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="8��" <%=fncSetCheckBox(period,"8��")%> /> 8��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="��Ÿ" <%=fncSetCheckBox(period,"��Ÿ")%> /> ��Ÿ
				</td>
			</tr>
			<tr>
				<th>�̿�����</th>	
				<td>
					<input type="radio" name="radio2" value="����� + 5��" <%=fncSetCheckBox(service_type,"����� + 5��")%> valid="E|A=�̿����¸� ������ �ּ���"/> ����� + 5��&nbsp;&nbsp;
					<input type="radio" name="radio2" value="����� + 6��" <%=fncSetCheckBox(service_type,"����� + 6��")%>/> ����� + 6��&nbsp;&nbsp;
                    <input type="radio" name="radio2" value="����" <%=fncSetCheckBox(service_type,"����")%>/>����&nbsp;&nbsp;
					<input type="radio" name="radio2" value="����� + ����" <%=fncSetCheckBox(service_type,"����� + ����")%>/> ����� + ����&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>��꿹����</th>	
				<td><input type="text" id="datepicker1" name="childbirth_ymd" value="<%=childbirth_ymd%>"> 
 
				</td>
			</tr>
			<tr>
				<th>���񽺽���</th>	
				<td><input type="text" id="datepicker2" name="serviceS_ymd" value="<%=serviceS_ymd%>"> 
	 
				</td>
			</tr>
			<tr>
				<th>���� ������</th>	
				<td><input type="text" id="datepicker3" name="serviceE_ymd" value="<%=serviceE_ymd%>"> 
	 
				</td>
			</tr>
 <% If uId = "wellness14" Then %>


			<tr>
				<th>��꼱������</th>
				<td style="vertical-align:middle;">
					<select name="pdt_no"   class="textarea" style="height:35px;">
						<option value=""selected>����</option>
					<%
						vCnt = UBOUND(arrProdt,2)
							For num = 0 To vCnt
					%>
					 
						<option value="<%=arrProdt(0,num)%>" <%=fncSetSelectBox(num,product_GIFT_CHOICE)%>><%=arrProdt(1,num)%></option>
					<%
						 Next
					%>
					 </select>&nbsp;&nbsp;
						
							 �ù��� <input type="text" id="datepicker4" name="product_GIFT_ymd" value="<%=product_GIFT_ymd%>"> 
							 &nbsp&nbsp
								�������̺� <input type="checkbox" name="Q16_baby" <%If InStr(product_GIFT_CHOICE_BABY,"Y") > 0 Then%>checked<%End If%> value="Y"/> 
				</td>
			</tr>
			<tr>
				<th>��꼱���ڽ� �ù���</th>
				<td> <input type="text" id="datepicker5" name="product_GIFT_BOX_ymd" value="<%=product_GIFT_BOX_ymd%>">  
					 &nbsp&nbsp
				</td>
			</tr>
			<tr>
				<th>��,���� ��ǰ����<br/>(�ú� ���κδ�)</th>
				<td style="vertical-align:middle;">1) �����    <select name="product_1"   class="textarea" style="height:35px;">
								<option value="">����</option>
								<%
									vCnt = UBOUND(arrProdt_main,2)
										For num = 0 To vCnt
								 %>
								<option value="<%=arrProdt_main(1,num)%>"  <%If product_1 = arrProdt_main(1,num) Then%>selected<%End If%>><%=arrProdt_main(1,num)%></option>
								<%	 
									 Next 
								%>
							</select>

							 <select name="product_2"   class="textarea" style="height:35px;">
								<option value="">����</option>
								<%
									vCnt = UBOUND(arrProdt_sub,2)
										For num = 0 To vCnt
								 %>
								<option value="<%=arrProdt_sub(1,num)%>"  <%If product_2 = arrProdt_sub(1,num) Then%>selected<%End If%>><%=arrProdt_sub(1,num)%></option>
								<%	 
									 Next 
								%>
							 </select>

						<input type="text" name="product_week" size="5" maxlength="5" value="<%=product_CHOICE_WEEK%>"/> ��
						<input type="text" name="product_price" size="10" maxlength="10" value="<%=product_CHOICE_PRICE%>"/> ��
						 <span style="margin-left:20px;"></span>
							2) �����&nbsp&nbsp<input type="text" id="datepicker6" name="product_OUT_ymd" value="<%=product_OUT_ymd%>"> 
							 
							</td>
						</tr>
   
						<tr>
							<th>���Ÿ�����</th>
							<td>���� <input type="text" name="massage1" size="10" maxlength="10" value="<%=product_MASSAGE_BEFORE%>"/> ȸ &nbsp&nbsp
								���� <input type="text" name="massage2" size="10" maxlength="10" value="<%=product_MASSAGE_AFTER%>"/> ȸ &nbsp&nbsp 
								�߰� <input type="text" name="massage3" size="10" maxlength="10" value="<%=product_MASSAGE_ADD%>"/> ȸ &nbsp&nbsp
								����� <input type="text" name="massage_mng" size="10" maxlength="10" value="<%=massage_mng%>"/> &nbsp&nbsp
								����ó <select name="massage_hp1" id="massage_hp1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
										<option value="">����</option>
										<option value="010" <%=fncSetSelectBox("010",MHp_1)%>>010</option>
										<option value="011" <%=fncSetSelectBox("011",MHp_1)%>>011</option>
										<option value="016" <%=fncSetSelectBox("016",MHp_1)%>>016</option>
										<option value="017" <%=fncSetSelectBox("017",MHp_1)%>>017</option>
										<option value="018" <%=fncSetSelectBox("018",MHp_1)%>>018</option>
										<option value="019" <%=fncSetSelectBox("019",MHp_1)%>>019</option>
									</select>
									-
									<input type="text" name="massage_hp2" id="massage_hp2" size="5" maxlength="4" value="<%=MHp_2%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
									-
									<input type="text" name="massage_hp3" id="massage_hp3" size="5" maxlength="4" value="<%=MHp_3%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							</td>
						</tr>
						<tr>
							<th>�湮��ȣ��</th>
							<td>���� <input type="text" name="Q14_1" size="10" maxlength="10" value="<%=product_VISIT_NURSE_BEFORE%>"/> ȸ &nbsp&nbsp
								���� <input type="text" name="Q14_2" size="10" maxlength="10" value="<%=product_VISIT_NURSE_AFTER%>"/> ȸ &nbsp&nbsp
								����� <input type="text" name="Q14_mng" size="10" maxlength="10" value="<%=visit_nurse_mng%>"/> &nbsp&nbsp
								����ó <select name="Q14_hp1" id="Q14_hp1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
										<option value="">����</option>
										<option value="010" <%=fncSetSelectBox("010",Nhp_1)%>>010</option>
										<option value="011" <%=fncSetSelectBox("011",Nhp_1)%>>011</option>
										<option value="016" <%=fncSetSelectBox("016",Nhp_1)%>>016</option>
										<option value="017" <%=fncSetSelectBox("017",Nhp_1)%>>017</option>
										<option value="018" <%=fncSetSelectBox("018",Nhp_1)%>>018</option>
										<option value="019" <%=fncSetSelectBox("019",Nhp_1)%>>019</option>
									</select>
									-
									<input type="text" name="Q14_hp2" id="Q14_hp2" size="5" maxlength="4" value="<%=Nhp_2%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
									-
									<input type="text" name="Q14_hp3" id="Q14_hp3" size="5" maxlength="4" value="<%=Nhp_3%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							</td>
						</tr>
						<tr>
							<th>�ҵ�����</th>
							<td><select name="Q15_Y" >
									<option value="">����</option>
									<option value="Y" <%=fncSetSelectBox("Y",product_SODOK_SERVICE)%>>��û��</option>
									<option value="N" <%=fncSetSelectBox("N",product_SODOK_SERVICE)%>>��û����</option>
								</select>
								����� <input type="text" name="Q15_mng" size="10" maxlength="10" value="<%=sodok_mng%>"/> &nbsp&nbsp&nbsp&nbsp
								����ó <select name="Q15_hp1" id="Q15_hp1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
										<option value="">����</option>
										<option value="010" <%=fncSetSelectBox("010",Shp_1)%>>010</option>
										<option value="011" <%=fncSetSelectBox("011",Shp_1)%>>011</option>
										<option value="016" <%=fncSetSelectBox("016",Shp_1)%>>016</option>
										<option value="017" <%=fncSetSelectBox("017",Shp_1)%>>017</option>
										<option value="018" <%=fncSetSelectBox("018",Shp_1)%>>018</option>
										<option value="019" <%=fncSetSelectBox("019",Shp_1)%>>019</option>
									</select>
									-
									<input type="text" name="Q15_hp2" id="Q15_hp2" size="5" maxlength="4" value="<%=Shp_2%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
									-
									<input type="text" name="Q15_hp3" id="Q15_hp3" size="5" maxlength="4" value="<%=Shp_3%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							</td>
						</tr>
						
 <% End If %>

			<tr>
				<th>������ �̿�</th>	
				<td>
					<input type="radio" name="radio3" value="�̿���" <%=fncSetCheckBox(clinic,"�̿���")%> valid="E|A=������ �̿뿩�θ� ������ �ּ���"/> �̿���&nbsp;&nbsp;
					<input type="radio" name="radio3" value="�̿����" <%=fncSetCheckBox(clinic,"�̿����")%>/> �̿����
				</td>
			</tr>
			<tr>
				<th>������</th>	
				<td>
					<input type="radio" name="radio4" value="�ʻ��" <%=fncSetCheckBox(exper,"�ʻ��")%> valid="E|A=�������� ������ �ּ���"/> �ʻ��&nbsp;&nbsp;
					<input type="radio" name="radio4" value="����" <%=fncSetCheckBox(exper,"����")%>/> ���� 
				</td>
			</tr>
			<tr>
				<th>Ư�̻���</th>	
				<td>
					<input type="checkbox" name="check2" value="�ֵ���" <%If InStr(unique,"�ֵ���") > 0 Then%>checked<%End If%> valid="E|A=Ư�̻����� ������ �ּ���"/> �ֵ���&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="�ӽż� �索" <%If InStr(unique,"�ӽż� �索") > 0 Then%>checked<%End If%>/> �ӽż� �索 &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="����" <%If InStr(unique,"����") > 0 Then%>checked<%End If%>/> ����&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="������" <%If InStr(unique,"������") > 0 Then%>checked<%End If%>/> ������&nbsp;&nbsp;
                    <input type="checkbox" name="check2" value="����" <%If InStr(unique,"����") > 0 Then%>checked<%End If%>/> ����
				</td>
			</tr>
			<tr>
				<th>��������</th>	
				<td>
					<input type="checkbox" name="check3" value="�θ��" <%If InStr(family,"�θ��") > 0 Then%>checked<%End If%> valid="E|A=���������� ������ �ּ���"/> �θ��&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="����" <%If InStr(family,"����") > 0 Then%>checked<%End If%>/> ���� &nbsp;&nbsp;
					<input type="checkbox" name="check3" value="ū���� 1��" <%If InStr(family,"ū���� 1��") > 0 Then%>checked<%End If%>/> ū���� 1��&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="ū���� 2���̻�" <%If InStr(family,"ū���� 2���̻�") > 0 Then%>checked<%End If%>/> ū���� 2���̻�&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="��Ÿ����" <%If InStr(family,"��Ÿ����") > 0 Then%>checked<%End If%>/> ��Ÿ����
				</td>
			</tr>

			<tr>
				<th>�����</th>	
				<td>
					<input type="text" name="payment" id="payment" numberonly="true" size="7" maxlength="7" value="<%If payment <> "" Then%><%=FormatNumber(payment,0)%><%End If%>" class="numberic" style="ime-mode:disabled"/> ��
				</td>
			</tr>
			<tr>
				<th>��������</th>	
				<td>
					<input type="radio" name="radio5" value="�������Ա�" <%If InStr(payType,"�������Ա�") > 0 Then%>checked<%End If%>/> �������Ա�&nbsp;&nbsp;
					<input type="radio" name="radio5" value="ī�����" <%If InStr(payType,"ī�����") > 0 Then%>checked<%End If%>/> ī����� &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>���� ����</th>	
				<td>
					<input type="radio" name="radio6" value="�����Ϸ�" <%If InStr(payState,"�����Ϸ�") > 0 Then%>checked<%End If%>/> �����Ϸ�&nbsp;&nbsp;
					<input type="radio" name="radio6" value="����������" <%If InStr(payState,"����������") > 0 Then%>checked<%End If%>/> ���������� &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<th>������</th>	
				<td> <input type="text" id="datepicker7" name="payEdt_ymd" value="<%=payEdt_ymd%>"> 
 
				</td>
			</tr>
			<tr>
				<th>�Ա���</th>
				<td><input type="text" id="pay_name" name="pay_name" size="20" value="<%=pay_name%>">
				</td>
			</tr>
			<tr>
				<th>��ҿ���</th>	
				<td>
					<select name="cancel_yn">				 
						<option value="N" <%=fncSetSelectBox("N",cancel_yn)%> selected>�����������</option>
						<option value="Y" <%=fncSetSelectBox("Y",cancel_yn)%>>�����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>��һ���</th>
				<td><input type="text" id="cancel_reason" name="cancel_reason" size="20" value="<%=cancel_reason%>">
				</td>
			</tr>
			<tr>
				<th>��㳻��</th>	
				<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=��㳻���� �Է��� �ּ���"><%=content%></textarea></td>
			</tr>
			<tr>
				<th>����������</th>	
				<td>
					<select name="s_happy_yn">
						<option value="">����</option>
						<option value="N" <%=fncSetSelectBox("N",s_happy_call)%>>������ �̿Ϸ�</option>
						<option value="Y" <%=fncSetSelectBox("Y",s_happy_call)%>>������ �Ϸ�</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>����������</th>	
				<td>
					<select name="e_happy_yn">	
						<option value="">����</option>
						<option value="N" <%=fncSetSelectBox("N",e_happy_call)%>>������ �̿Ϸ�</option>
						<option value="Y" <%=fncSetSelectBox("Y",e_happy_call)%>>������ �Ϸ�</option>
					</select>
				</td>
			</tr>

<%

 If intTotalCnt >= 1 then
'��𵵿�� ����� ����
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'�ο����ŭ for�� ����
			'	 cul1 = arrTmp(0, i)			'ù��° �÷�
				 cul0 = arrTmp(0, 0)
 

'  MD_HELPER_SEQ ������   ���� 0 �� ��� �̸� ã�� 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where a.MD_HELPER_SEQ = b.MD_HELPER_SEQ  and b.MD_HELPER_SEQ =  '"& cul0 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT, b.MD_HELPER_SEQ "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name				    = Rs(0)
			hp_service_comment		= Rs(1)
'			mo_helper_seq           = Rs(2)

		End If 
	 
		Call RSClose(Rs)
	%>
 
		<%
			next
		end If
	End if
	%>
 
 <!------------------------------------------------���̾� �˾�---------------------------------------->
			<div id="layer1" class="pop-layer">
				<div class="pop-container">
					<div class="pop-conts">
						<!--content //-->
						<p class="ctxt mb20">�����ϱ�<br>
						<hr><br>
							<span style="font-size:20pt;">��������</span>   <%=service%> / <%=period%> / <%=service_type%> <br><br>
							�ٹ������� <input type="text" id="datepicker14" name="start_work" value="<%=birth_ymd%>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							�ٹ������� <input type="text" id="datepicker15" name="end_work" value="<%=birth_ymd%>" /> <br><br>
							�⺻�� <input type="text" name="worker_pay" id="worker_pay" value="" /><br><br>
						<hr>
							<br>
							<span style="font-size:20pt;">�߰��������</span> <br><br>
							�߰������� <input type="text" id="datepicker16" name="add_work_start" value="<%=birth_ymd%>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							�߰������� <input type="text" id="datepicker17" name="add_work_end" value="<%=birth_ymd%>" /> <br><br>
							<div style="margin:10px;border:1px solid #7d7d7d;padding:20px;">
							�� 
							
							
							
							
							
							
							
							
							
							
							
							</div>

							�߰��⺻�� <input type="text" name="add_worker_pay" id="add_worker_pay" value="" /><br><br>
						</p>

						<div class="btn-r">
							<a href="#" class="cbtn">Close</a>
						</div>
						<!--// content-->
					</div>
				</div>
			</div>


			<tr>
				<th>��𵵿�̼���</th>	
				<td>
					<input type="hidden" name="mo_helper_seq1"  id="mo_helper_seq" value="<%=mo_helper_seq%>"/>
					<input type="text"   name="mo_helper_name1" id="mo_helper_name" size="10"  value="<%=hp_name%>"/> 
					<input type="button" class="button" value="��𵵿�� �˻�" onclick="fncOpenZip();" /> &nbsp&nbsp&nbsp&nbsp 
					<input type="button" class="button" value="�����ϱ�" onclick="layer_open('layer1');return false;" />
				</td>
			</tr>
			<tr>
				<th>��𵵿�� ���� ���</th>	
				<td><textarea name="mo_service_comment" id="mo_helper_comment1" style="width:500px;height:100px;"><%=hp_service_comment%></textarea></td>
			</tr>
 

<%
'��𵵿�� ����� ����
 If intTotalCnt >= 2 then
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'�ο����ŭ for�� ����
			'	 cul1 = arrTmp(0, i)			'ù��° �÷�
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
 
	
'  MD_HELPER_SEQ ������   ���� 0 �� ��� �̸� ã�� 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where a.MD_HELPER_SEQ = b.MD_HELPER_SEQ  and b.MD_HELPER_SEQ =  '"& cul1 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT, b.MD_HELPER_SEQ "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_1				    = Rs(0)
	'		mo_helper_seq_1				= Rs(2)

		End If 
	 
		Call RSClose(Rs)

'�ڸ�Ʈ �ҷ�����
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
				<th>���񽺿���1</th>	
				<td> ���������   <input type="text" id="datepicker8" name="serviceSdt_1_ymd" value="<%=serviceSdt_1_ymd%>"> 
				 
				  <span style="padding-left:10px;"></span>����������   <input type="text" id="datepicker9" name="serviceEdt_1_ymd" value="<%=serviceEdt_1_ymd%>"> 
				 
				</td>
			</tr>
			<tr>
				<th>��𵵿�̼���1</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_1"  id="mo_helper_seq_1" value="<%=mo_helper_seq_1%>"/>
					<input type="text"   name="mo_helper_name_1" id="mo_helper_name_1" size="10"  value="<%=hp_name_1%>"/> 
					<input type="button" class="button" value="��𵵿�� �˻�" onclick="fncOpenZip_1();" />&nbsp&nbsp&nbsp&nbsp 
					<input type="button" class="button" value="�����ϱ�" onclick=";" />
				</td>
			</tr>
			<tr>
				<th>��𵵿�� ���� ���1</th>	
				<td><textarea name="mo_service_comment_1" id="mo_helper_comment_1" style="width:500px;height:100px;"><%=hp_service_comment_1%></textarea></td>
			</tr>
	<%
	If intTotalCnt >= 3 then
'��𵵿�� ����� ����
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'�ο����ŭ for�� ����
			'	 cul1 = arrTmp(0, i)			'ù��° �÷�
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
				 cul2 = arrTmp(0, 2)
 
 

'  MD_HELPER_SEQ ������   ���� 0 �� ��� �̸� ã�� 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where a.MD_HELPER_SEQ = b.MD_HELPER_SEQ  and b.MD_HELPER_SEQ =  '"& cul2 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT, b.MD_HELPER_SEQ "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_2				    = Rs(0)
'			mo_helper_seq_2				= Rs(2)
 

		End If 
	 
		Call RSClose(Rs)

		'�ڸ�Ʈ �ҷ�����
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
				<th>���񽺿���2</th>	
				<td>��������� <input type="text" id="datepicker10" name="serviceSdt_2_ymd" value="<%=serviceSdt_2_ymd%>"> 
		 

					<span style="padding-left:10px;"></span>���������� <input type="text" id="datepicker11" name="serviceEdt_2_ymd" value="<%=serviceEdt_2_ymd%>">   
					 
				</td>
			</tr>
			<tr>
				<th>��𵵿�̼���2</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_2"  id="mo_helper_seq_2" value="<%=mo_helper_seq_2%>"/>
					<input type="text"   name="mo_helper_name_2" id="mo_helper_name_2" size="10"  value="<%=hp_name_2%>"/> 
					<input type="button" class="button" value="��𵵿�� �˻�" onclick="fncOpenZip_2();" />&nbsp&nbsp&nbsp&nbsp 
					<input type="button" class="button" value="�����ϱ�" onclick=";" />
				</td>
			</tr>
			<tr>
				<th>��𵵿�� ���� ���2</th>	
				<td><textarea name="mo_service_comment_2" id="mo_helper_comment_2" style="width:500px;height:100px;"><%=hp_service_comment_2%></textarea></td>
			</tr>


	<%
'��𵵿�� ����� ����
 If intTotalCnt >= 4 then
		If IsArray(arrTmp) Then
			For i=0 To UBound(arrTmp, 1) 	'�ο����ŭ for�� ����
			'	 cul1 = arrTmp(0, i)			'ù��° �÷�
				 cul0 = arrTmp(0, 0)
				 cul1 = arrTmp(0, 1)
				 cul2 = arrTmp(0, 2)
				 cul3 = arrTmp(0, 3)

'  MD_HELPER_SEQ ������   ���� 0 �� ��� �̸� ã�� 


		strTable = "  FROM MO_HELPER_SERVICE a, MO_HELPER b "

		strWhere = "  where b.MD_HELPER_SEQ =  '"& cul3 &"' "

		strSql = ""
		strSql = strSql & " SELECT  b.MD_HELPER_NAME, a.MD_HELPER_COMMENT, b.MD_HELPER_SEQ "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			
			hp_name_3				    = Rs(0)
			hp_service_comment_3		= Rs(1)
'			mo_helper_seq_3				= Rs(2)

		End If 
	 
		Call RSClose(Rs)


		'�ڸ�Ʈ �ҷ�����
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
				<th>���񽺿���3</th>	
				<td>��������� <input type="text" id="datepicker12" name="serviceSdt_3_ymd" value="<%=serviceSdt_3_ymd%>"> 
				 
					<span style="padding-left:10px;"></span>����������   <input type="text" id="datepicker13" name="serviceEdt_3_ymd" value="<%=serviceEdt_3_ymd%>"> 
				 
				</td>
			</tr>
			<tr>
				<th>��𵵿�̼���3</th>	
				<td>
					<input type="hidden" name="mo_helper_seq_3"  id="mo_helper_seq_3" value="<%=mo_helper_seq_3%>"/>
					<input type="text"   name="mo_helper_name_3" id="mo_helper_name_3" size="10"  value="<%=hp_name_3%>"/> 
					<input type="button" class="button" value="��𵵿�� �˻�" onclick="fncOpenZip_3();" />&nbsp&nbsp&nbsp&nbsp 
					<input type="button" class="button" value="�����ϱ�" onclick=";" />
				</td>
			</tr>
			<tr>
				<th>��𵵿�� ���� ���3</th>	
				<td><textarea name="mo_service_comment_3" id="mo_helper_comment_3" style="width:500px;height:100px;"><%=hp_service_comment_3%></textarea></td>
			</tr>


			</thead>
			</table>
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
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker1" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker2" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	});
	$( "#datepicker3" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker4" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker5" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker6" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker7" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker8" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker9" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker10" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker11" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker12" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
	$( "#datepicker13" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
		$( "#datepicker14" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
		$( "#datepicker15" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
		$( "#datepicker16" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
	}); 
		$( "#datepicker17" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		  yearRange: 'c-100:c+30' // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
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



	$(function(){

   $('.numberic').keypress(function(event){
       if (event.which && (event.which > 47 && event.which < 58 || event.which == 8)) {
       } else {
          event.preventDefault();
       }
   });   

  //ũ�ҵ�� ime-mode:disabled �����۵� ���������Ƿ� ���Խ����� ó��
   $('.numberic').keyup(function(event){
    $(this).val($(this).val().replace(/[^0-9]/g,''));
   });

});


	btnMem.click(function() {
			mem_id = jQuery("#mem_id").val();
		 
		if (mem_id.length < 1){
			alert("ȸ��ID�� �Է��� �ּ���");
			return;
		}


	<%
	If mem_id <> "" and  mo_helper_name1 <> "" and mo_helper_seq <> "" Then 
	%>

		location.href="./data_res_test_ctm_app.asp?mem_id="+mem_id+"&+mo_helper_name1="+mo_helper_name1+"&mo_helper_seq="+mo_helper_seq;
	<%
	else
	%>
		location.href="./data_res_test_ctm_app.asp?mem_id="+mem_id;
	<%
	end IF
	%>
 

	});

 
	btnDel.click(function(){
		if (confirm("���� �Ͻðڽ��ϱ�?")) {
			if (confirm("������ ���� �Ͻðڽ��ϱ�?")) {
			jQuery('#ifrm').attr({'src':'./data_res_test_ctm_app_sql.asp?mode=delete&idx=<%=intIDX%>'});
			}
		}
	});



   function onlyNumber(){

				if((event.keyCode<48)||(event.keyCode>57))

				   event.returnValue=false;
   }



	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./data_res_test_ctm_app_sql.asp?<%=strLnkUrl%>"
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

 
// �޷��߰�	���� 
		if (mbirth2 < 10){
			mbirth2 = "0" + mbirth2;
		}
		if (mbirth3 < 10){
			mbirth3 = "0" + mbirth3;
		}

		var birth_ymd = mbirth1 + "-" + mbirth2 + "-" + mbirth3;

		jQuery("#datepicker").val(birth_ymd);          
	//	jQuery("#Mbirth1").val(mbirth2);
	//	jQuery("#Dbirth1").val(mbirth3);
// �޷��߰�	����  ��


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

/*
	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}
*/


	function fncOpenJoin(){
	

	  var form = document.oFrm;
	  var mem_nm = form.mem_nm.value;

	  var width = "650"; 
	  var height = "480"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_member_join.asp"; 
	  var title = "ȸ������"; 
	  var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no,scrollbars=yes, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	//	window.open("/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm,"pop_zipcode","width=480px, height=460px");
	}
 

</script>

<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);		//���̾��� id�� temp������ ����
		var bg = temp.prev().hasClass('bg');	//dimmed ���̾ �����ϱ� ���� boolean ����

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg Ŭ������ ������ �Ϲݷ��̾�� �����Ѵ�.
		}

		// ȭ���� �߾ӿ� ���̾ ����.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
		else temp.css('top', '0px');
		if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
		else temp.css('left', '0px');

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'�ݱ�'��ư�� Ŭ���ϸ� ���̾ �������.
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