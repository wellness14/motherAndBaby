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
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,target-densitydpi=medium-dpi,user-scalable=1" />
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
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
	</style>
</head>
<%
	Dim mode : mode = "ins"
	
	mem_id = fncRequest("mem_id")   
    If mem_id <> "" Then
		strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE MM_MEM_ID = '"& mem_id &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			MM_MEM_ID "
		strSql = strSql & "			,MM_MEM_NM "
		strSql = strSql & "			,MM_ENT_DT "
		strSql = strSql & "			,MD_PHONE "
		strSql = strSql & "			,MD_HP "
		strSql = strSql & "			,MD_SEX "
		strSql = strSql & "			,MD_BIRTH "
		strSql = strSql & "			,MD_POST "
		strSql = strSql & "			,MD_ADDR1 "
		strSql = strSql & "			,MD_ADDR2 "
		strSql = strSql & "			,MD_EMAIL "
		strSql = strSql & "			,MD_SNS_FLG "
		strSql = strSql & "			,MD_EMAIL_FLG "
		strSql = strSql & "			,MD_CHILDBIRTH "
		strSql = strSql & "			,MD_CHILD_FLG "
		strSql = strSql & "			,MD_TYPE "
		strSql = strSql & "			,MD_LOCAL "
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MM_ENT_DT DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode	= "upd"
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 

'-----------------------------------------------------------------------------
'	���� ���� ȣ��
	md_local = arrList(16,0)
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
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>ȸ������</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="mem_id" value="<%=arrList(0,0)%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>ȸ��ID</th>
				<td><%=arrList(0,0)%></td>
			</tr>
			<tr>
				<th>ȸ����</th>
				<td><%=arrList(1,0)%></td>
			</tr>
			<tr>
				<th>������</th>
				<td><%=arrList(2,0)%></td>
			</tr>
			<tr>
				<th>��й�ȣ</th>
				<td>
					<input type="text" name="mem_pw" size="35"/>
				</td>
			</tr>
			<tr>
				<th>����</th>
				<td>
					<input type="radio" name="radio1" value="2" <%=fncSetCheckBox("2",arrList(5,0))%> valid="E|A=������ ������ �ּ���"/> ����&nbsp;&nbsp;
					<input type="radio" name="radio1" value="1" <%=fncSetCheckBox("1",arrList(5,0))%>/> ����
				</td>
			</tr>
			<tr>
				<th>�������</th>
				<td>
				<%
					If birth <> "" And Len(birth) >= 8 Then 
						Mbirth = Mid(arrList(6,0),5,2)
						If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
						Dbirth = Right(arrList(6,0),2)
						If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
					End If
				%>
					<select name="Ybirth" valid="E|A=��������� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(6,0),4))%>><%=num%></option>
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
					If IsNull(arrList(3,0)) Or arrList(3,0) = "" Then
						arrList(3,0) = "--"
					End If

					arrPhone = Split(arrList(3,0),"-")
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
					If IsNull(arrList(4,0)) Or arrList(4,0) = "" Then
						arrList(4,0) = "--"
					End If

					arrHp = Split(arrList(4,0),"-")
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
					<input type="text" name="hp_3" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>&nbsp;
					<input type="checkbox" name="check3" value="Y" <%=fncSetCheckBox("Y",arrList(11,0))%>/> SMS ���ŵ���	<br/>
					<a href="tel:<%=arrList(4,0)%>">��ȭ�ɱ�<a/>
				</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					<input type="text" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(7,0),3)%>" valid="E|A=������ȣ�� �Է��� �ּ���"/>
					-
					<input type="text" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(7,0),3)%>" valid="E|A=������ȣ�� �Է��� �ּ���"/>

					<input type="text" name="addr_1" class="textarea" size="30" value="<%=arrList(8,0)%>" valid="E|A=�ּҸ� �Է��� �ּ���"/>
					<input type="text" name="addr_2" class="textarea" size="30" value="<%=arrList(9,0)%>" valid="E|A=���ּҸ� �Է��� �ּ���"/>
				</td>
			</tr>
			<tr>
				<th>�̸���</th>
				<td>
					<input type="text" name="email" class="textarea" size="25" value="<%=arrList(10,0)%>" valid="E|A=�̸��� �ּҸ� �Է��� �ּ���"/>&nbsp;&nbsp;
					<input type="checkbox" name="check4" value="Y" <%=fncSetCheckBox("Y",arrList(12,0))%>/> �̸��� ���ŵ��� 
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
				<th>�и�������</th>
				<td>
			<%
				Mchildbirth = Mid(arrList(13,0),5,2)
				If Mchildbirth <> "" Then 
					If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
					Dchildbirth = Right(arrList(13,0),2)
					If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
			%>
					<select name="childbirth_y">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(13,0),4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="childbirth_m">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="childbirth_d">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>��</option>
					<% Next %>
					</select>
			<%
				End If 
			%>
				</td>
			</tr>	  	  
			<tr>
				<th>ū���� ����</th>
				<td>
					<input type="radio" name="radio3" value="�ʻ�" <%=fncSetCheckBox("�ʻ�",arrList(14,0))%>/> �ʻ�&nbsp;&nbsp;
					<input type="radio" name="radio3" value="1��" <%=fncSetCheckBox("1��",arrList(14,0))%>/> 1��&nbsp;&nbsp;
					<input type="radio" name="radio3" value="2���̻�" <%=fncSetCheckBox("2���̻�",arrList(14,0))%>/> 2���̻�
				</td>
			</tr>	  	  	    	  
			<tr>
				<th>��� ����</th>
				<td>
					<input type="radio" name="radio4" value="�ٿ�ó" <%=fncSetCheckBox("�ٿ�ó",arrList(15,0))%>/> �ٿ�ó&nbsp;&nbsp;
					<input type="radio" name="radio4" value="�Ϲ�" <%=fncSetCheckBox("�Ϲ�",arrList(15,0))%>/> �Ϲ� 
				</td>
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

<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');

	btnDel.click(function(){
		if (confirm("���� �Ͻðڽ��ϱ�?")) {
			jQuery('#ifrm').attr({'src':'./member_sql.asp?mode=del&mem_id=<%=mem_id%>'});
		}
	});

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_sql.asp"
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