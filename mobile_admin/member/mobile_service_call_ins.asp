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
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
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

%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>����û</strong></div>
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
				<td>
				<%
					Mbirth = Mid(arrList(3,0),5,2)
					If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
					Dbirth = Right(arrList(3,0),2)
					If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
				%>
					<select name="Ybirth" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(3,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="Mbirth" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="Dbirth" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
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
					<input type="text" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(6,0),3)%>" valid="E|A=������ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(6,0),3)%>" valid="E|A=������ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_1" class="textarea" size="60" value="<%=arrList(7,0)%>" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(8,0)%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
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
				<td>
				<%
					Mchildbirth = Mid(arrList(12,0),5,2)
					If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
					Dchildbirth = Right(arrList(12,0),2)
					If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
				%>
					<select name="childbirth_y" valid="E|A=��꿹������ ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(12,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="childbirth_m" valid="E|A=��꿹������ ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="childbirth_d" valid="E|A=��꿹������ ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>���񽺽��� ������</th>	
				<td>
				<%
					MserviceDt = Mid(arrList(13,0),5,2)
					If MserviceDt < 10 Then MserviceDt = Right(MserviceDt,1)
					DserviceDt = Right(arrList(13,0),2)
					If DserviceDt < 10 Then DserviceDt = Right(DserviceDt,1)
				%>
					<select name="serviceDt_y" valid="E|A=���񽺽��� �������� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(13,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="serviceDt_m" valid="E|A=���񽺽��� �������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,MserviceDt)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="serviceDt_d" valid="E|A=���񽺽��� �������� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,DserviceDt)%>><%=num%>��</option>
					<% Next %>
					</select>
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
		"action" : "/info/info_01_sql.asp?<%=strLnkUrl%>"
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