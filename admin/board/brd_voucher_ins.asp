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
'	���� ���� ȣ��
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

 '------�޷��߰��� ����--------------------------------------------------
	
	If birthday <> "" Then 
		birth_m = Mid(arrList(3,0),5,2)
		birth_d = Right(arrList(3,0),2)
		birth_ymd = Left(arrList(3,0),4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	If child_birthday <> "" then
		'��꿹����
		child_m = Mid(arrList(12,0),5,2)
		child_d = Right(arrList(12,0),2)
		child_ymd = Left(arrList(12,0),4) & "-" & child_m & "-" & child_d

		If child_ymd = "--" Then
			child_ymd = ""
		End If
	End If
	
	If service_birthday <> "" then
		'���񽺽�����
		service_sm = Mid(arrList(13,0),5,2)
		service_sd = Right(arrList(13,0),2)
		service_symd = Left(arrList(13,0),4) & "-" & service_sm & "-" & service_sd

		If service_symd = "--" Then
			service_symd = ""
		End If
	End If
	
'-------�޷� �߰��� ����----------------------------------------------------




%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > �Խ��ǰ��� > <strong>�������� ����Ȯ��</strong></div>
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
				<th>����</th>
				<td><input type="text" name="mem_nm" size="20" value="<%=arrList(2,0)%>" valid="E|M=10|A=������ �Է��� �ּ���"></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><input type="text" id="datepicker" name="birth" value="<%=birth_ymd%>"> 
			 
				</td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td>
				<%
					arrPhone = Split(arrList(4,0),"-")
				%>
					<select name="phone_1" valid="E|A=��ȭ��ȣ�� ������ �ּ���">
						<option value="">����</option>
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
					<input type="text" name="phone_2" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="phone_3" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�ڵ�����ȣ</th>
				<td>
				<%
					arrHp = Split(arrList(5,0),"-")
				%>
					<select name="hp_1" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
						<option value="">����</option>
						<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					-
					<input type="text" name="hp_2" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					<input type="text" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(6,0),3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(6,0),3)%>" valid="E|A=�����ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_1" class="textarea" size="60" value="<%=arrList(7,0)%>" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(8,0)%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�������ֹι�ȣ</th>	
				<td>	
					<input type="text" name="jumin1" size="6" maxlength="6"  value="<%=arrList(25,0)%>" > - <input type="text" name="jumin2" size="7" maxlength="7"  value="<%=arrList(26,0)%>"> 
				</td>
			</tr>
			<tr>
				<th>��û����</th>
				<td>	
					<input type="checkbox" name="check1" value="���������α׷�" <%If InStr(arrList(9,0),"���������α׷�") > 0 Then%>checked<%End If%> valid="E|A=��û���񽺸� ������ �ּ���"/> ���������α׷�&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="�����̾����α׷�" <%If InStr(arrList(9,0),"�����̾����α׷�") > 0 Then%>checked<%End If%>/> �����̾����α׷�&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="VIP���α׷�" <%If InStr(arrList(9,0),"VIP���α׷�") > 0 Then%>checked<%End If%>/> VIP���α׷�&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="�����̺����α׷�" <%If InStr(arrList(9,0),"�����̺����α׷�") > 0 Then%>checked<%End If%>/> �����̺����α׷�&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="��ü��" <%If InStr(arrList(9,0),"��ü��") > 0 Then%>checked<%End If%>/> ��ü��&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="��ŷ��" <%If InStr(arrList(9,0),"��ŷ��") > 0 Then%>checked<%End If%>/> ��ŷ��
					<input type="checkbox" name="check1" value="35���̻�" <%If InStr(arrList(9,0),"35���̻�") > 0 Then%>checked<%End If%>/> 35���̻�&nbsp;&nbsp;
					<input type="checkbox" name="check1" value="������������ ������" <%If InStr(arrList(9,0),"������������ ������") > 0 Then%>checked<%End If%>/> ������������ ������&nbsp;&nbsp;<br/>
					<input type="checkbox" name="check1" value="�ٵ���" <%If InStr(arrList(9,0),"�ٵ���") > 0 Then%>checked<%End If%>/> �ٵ���
					<input type="checkbox" name="check1" value="��� �� ����" <%If InStr(arrList(9,0),"��� �� ����") > 0 Then%>checked<%End If%>/> ��� �� ����
					<input type="checkbox" name="check1" value="�ٿ�ó���α׷�" <%If InStr(arrList(9,0),"�ٿ�ó���α׷�") > 0 Then%>checked<%End If%>/> �ٿ�ó���α׷�
				</td>
			</tr>
			<tr>
				<th>�̿�Ⱓ</th>	
				<td>
					<input type="radio" name="radio1" value="1��" <%=fncSetCheckBox("1��",arrList(10,0))%> valid="E|A=�̿�Ⱓ�� ������ �ּ���"/> 1��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="2��" <%=fncSetCheckBox("2��",arrList(10,0))%> /> 2��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="3��" <%=fncSetCheckBox("3��",arrList(10,0))%> /> 3��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="4��" <%=fncSetCheckBox("4��",arrList(10,0))%> /> 4��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="6��" <%=fncSetCheckBox("6��",arrList(10,0))%> /> 6��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="8��" <%=fncSetCheckBox("8��",arrList(10,0))%> /> 8��&nbsp;&nbsp;
					<input type="radio" name="radio1" value="��Ÿ" <%=fncSetCheckBox("��Ÿ",arrList(10,0))%> /> ��Ÿ&nbsp;&nbsp;
					<!--<input type="radio" name="radio1" value="��� �� ����" <%=fncSetCheckBox("��� �� ����",arrList(10,0))%> /> ��� �� ���� -->
				</td>
			</tr>
			<tr>
				<th>�̿�����</th>	
				<td>
					<input type="radio" name="radio2" value="����� ��5��" <%=fncSetCheckBox("����� ��5��",arrList(11,0))%> valid="E|A=�̿����¸� ������ �ּ���"/> ����� ��5��&nbsp;&nbsp;
					<input type="radio" name="radio2" value="����� ��6��" <%=fncSetCheckBox("����� ��6��",arrList(11,0))%> valid="E|A=�̿����¸� ������ �ּ���"/> ����� ��6��&nbsp;&nbsp;
					<input type="radio" name="radio2" value="����" <%=fncSetCheckBox("����",arrList(11,0))%>/> ����&nbsp;&nbsp;
					<input type="radio" name="radio2" value="��� �� ����" <%=fncSetCheckBox("��� �� ����",arrList(11,0))%>/> ��� �� ����
				</td>
			</tr>
			<tr>
				<th>��꿹����</th>	
				<td><input type="text" id="datepicker1" name="child_birth" value="<%=child_ymd%>"> 
		 
				</td>
			</tr>
			<tr>
				<th>���񽺽��� ������</th>	
				<td><input type="text" id="datepicker2" name="service_start" value="<%=service_symd%>"> 
				 
				</td>
			</tr>
			<tr>
				<th>������ �̿�</th>	
				<td>
					<input type="radio" name="radio3" value="�̿���" <%=fncSetCheckBox("�̿���",arrList(14,0))%> valid="E|A=������ �̿뿩�θ� ������ �ּ���"/> �̿���&nbsp;&nbsp;
					<input type="radio" name="radio3" value="�̿����" <%=fncSetCheckBox("�̿����",arrList(14,0))%>/> �̿����
				</td>
			</tr>
			<tr>
				<th>������</th>	
				<td>
					<input type="radio" name="radio4" value="�ʻ��" <%=fncSetCheckBox("�ʻ��",arrList(15,0))%> valid="E|A=�������� ������ �ּ���"/> �ʻ��&nbsp;&nbsp;
					<input type="radio" name="radio4" value="����" <%=fncSetCheckBox("����",arrList(15,0))%>/> ���� 
				</td>
			</tr>
			<tr>
				<th>Ư�̻���</th>	
				<td>
					<input type="checkbox" name="check2" value="�ֵ���" <%If InStr(arrList(16,0),"�ֵ���") > 0 Then%>checked<%End If%> valid="E|A=Ư�̻����� ������ �ּ���"/> �ֵ���&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="�ӽż� �索" <%If InStr(arrList(16,0),"�ӽż� �索") > 0 Then%>checked<%End If%>/> �ӽż� �索 &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="����" <%If InStr(arrList(16,0),"����") > 0 Then%>checked<%End If%>/> ����&nbsp;&nbsp;
					<input type="checkbox" name="check2" value="������" <%If InStr(arrList(16,0),"������") > 0 Then%>checked<%End If%>/> ������ &nbsp;&nbsp;
					<input type="checkbox" name="check2" value="����" <%If InStr(arrList(16,0),"����") > 0 Then%>checked<%End If%>/> ���� 
				</td>
			</tr>
			<tr>
				<th>��������</th>	
				<td>
					<input type="checkbox" name="check3" value="�θ��" <%If InStr(arrList(17,0),"�θ��") > 0 Then%>checked<%End If%> valid="E|A=���������� ������ �ּ���"/> �θ��&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="����" <%If InStr(arrList(17,0),"����") > 0 Then%>checked<%End If%>/> ���� &nbsp;&nbsp;
					<input type="checkbox" name="check3" value="ū���� 1��" <%If InStr(arrList(17,0),"ū���� 1��") > 0 Then%>checked<%End If%>/> ū���� 1��&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="ū���� 2���̻�" <%If InStr(arrList(17,0),"ū���� 2���̻�") > 0 Then%>checked<%End If%>/> ū���� 2���̻�&nbsp;&nbsp;
					<input type="checkbox" name="check3" value="��Ÿ����" <%If InStr(arrList(17,0),"��Ÿ����") > 0 Then%>checked<%End If%>/> ��Ÿ����
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
			<tr>
				<th>���ϷῩ��</th>	
				<td>
					<select name="consulting_end">
						<option value="N" <%=fncSetSelectBox("N",arrList(24,0))%>>�̿Ϸ�</option>
						<option value="Y" <%=fncSetSelectBox("Y",arrList(24,0))%>>�Ϸ�</option>
					</select>

				</td>
			</tr>
			<tr>
				<th>��㳻��</th>	
				<td><textarea name="textarea" style="width:500px;height:200px;" valid="E|A=��㳻���� �Է��� �ּ���"><%=arrList(18,0)%></textarea></td>
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


<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
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
  }); 
</script>
<!-- �޷��߰� ��-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function() {

		if (!checkForm(frm,tar)){ return false }

	//var number=(document.oFrm.jumin1.value)+(document.oFrm.jumin2.value);

//	alert(jumin1);
//    alert(jumin2);
	  // �ֹε�Ϲ�ȣ üũ ����
    
	sum=0;
	idNum = new Array(13); //�Է°��� ���� �迭
	weighNum = new Array(2,3,4,5,6,7,8,9,2,3,4,5); //����ġ�� ���� �迭
	
	if(document.oFrm.jumin1.value.length!=6||document.oFrm.jumin2.value.length!=7){    //���� 6�ڸ��� 7�ڸ��� �������� �˻�
		alert("�ùٸ� ���� �Է��ϼ���");
		return false;
	}
	inputId = document.oFrm.jumin1.value + document.oFrm.jumin2.value;    //�� ����� �ϳ��� ��ħ

	for(i=0;i<13;i++){
		idNum[i] = inputId.substr(i,1);  //�Էµ� ��ȣ�� �ϳ��� �迭�� �Ҵ�     //substr�Լ� - ������ ��ġ���� �����ϰ� ������ ���̸� ���� �κ� ���ڿ��� ��ȯ�Ѵ�
	}                                                                                                              //sval=string.substr(iStart,iLenght)   ����
	for(i=0;i<12;i++){
		sum +=idNum[i] * weighNum[i];    //�Է°��� ����ġ�� ���� ���ؼ� ���� ����
	}
	check = 11 - (sum%11);//check�� ���� ���ڸ� ����

	//document.write(check);
	
	if(check > 9){
		check -=10;
	}
	if(check != idNum[12]){            //üũ���ڿ� �Է°��� ������ ���ڰ� �ٸ��� Ʋ����
		alert("�ùٸ� ��ȣ�� �ƴմϴ�");
		return false;
	}
	else{
	//	alert("�ùٸ� ��ȣ�Դϴ�");
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