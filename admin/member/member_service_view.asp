<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ���� ���� ����
'�� �� �� : contact_view.asp
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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strSql = ""
		strSql = strSql & " SELECT * "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & "		INNER JOIN MO_MEM_MAS WITH(NOLOCK) ON MS_MEM_ID = MM_MEM_ID "
		strSql = strSql & "		INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MS_MEM_ID = MD_MEM_ID "
		strSql = strSql & " WHERE MS_IDX = '"& intIDX &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mem_id				= Rs(1)
			mem_nm				= Rs(2)
			ms_birth			= Rs(3)
			ms_childbirth		= Rs(4)
			ms_marry			= Rs(5)
			ms_type1			= Rs(6)
			ms_type2			= Rs(7)
			ms_type3			= Rs(8)
			ms_type4			= Rs(9)
			ms_type5			= Rs(10)
			ms_txt1				= Rs(11)
			ms_txt2				= Rs(12)
			ms_txt3				= Rs(13)
			ms_txt4				= Rs(14)
			ms_sel1				= Rs(15)
			ms_sel2				= Rs(16)
			ms_sel3				= Rs(17)
			ms_sel4				= Rs(18)
			ms_sel5				= Rs(19)
			ms_sel6				= Rs(20)
			ms_total			= Rs(22)
			mo_idx				= Rs(25)
			mo_service			= Rs(33)
			mo_charge			= Rs(34)
			hp					= Rs(44)
			addr1				= Rs(48)
			addr2				= Rs(49)
			
			strSql = " SELECT MS_SERVICE_NM FROM MO_SERVICE_LINK A WITH(NOLOCK) "
			strSql = strSql & " 	INNER JOIN MO_SERVICE_NM B WITH(NOLOCK) ON A.MS_IDX = B.MS_IDX "
			strSql = strSql & " WHERE MO_IDX='"& mo_idx &"' "
			strSql = strSql & " ORDER BY A.MS_IDX ASC "
			Set Rs1 = DBExec(strSql,"main")
			If Not Rs1.EOF Then 
				Do Until Rs1.EOF
					If service_nm <> "" Then service_nm = service_nm & ","
					service_nm = service_nm & Rs1(0)
					Rs1.movenext
				Loop
			End If 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 	  
%>
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
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ�� ���� > <strong>���� ���� ����</strong></div>
		<div class="write">
			
			<br />
			<h1>����� ��ϱ�</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>�ۼ���</th>
				<td><%=mem_nm%>&nbsp;( <%=mem_id%> )</td>
			</tr>
			<tr>
				<th>�ڵ���</th>
				<td><%=hp%></td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td><%=addr1%>&nbsp;<%=addr2%></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><%=Left(ms_birth,4)%>�� <%=Mid(ms_birth,5,2)%>�� <%=Right(ms_birth,2)%>��</td>
			</tr>
			<tr>
				<th>��꿹����</th>
				<td><%=Left(ms_childbirth,4)%>�� <%=Mid(ms_childbirth,5,2)%>�� <%=Right(ms_childbirth,2)%>��</td>
			</tr>
			<tr>
				<th>��ȥ�����</th>
				<td><%=Left(ms_marry,4)%>�� <%=Mid(ms_marry,5,2)%>�� <%=Right(ms_marry,2)%>��</td>
			</tr>
			<tr>
				<th>������</th>	
				<td><%=ms_type1%></td>
			</tr>
			<tr>
				<th>ù��������</th>	
				<td><%=ms_type2%></td>
			</tr>
			<tr>
				<th>�������̿�</th>	
				<td><%=ms_type3%></td>
			</tr>
			<tr>
				<th>�и�����</th>	
				<td><%=ms_type4%></td>
			</tr>
			<tr>
				<th>��������</th>	
				<td><%=ms_type5%></td>
			</tr>
			<tr>
				<th>�����ּ�</th>	
				<td><%=ms_txt1%>��</td>
			</tr>
			<tr>
				<th>Ű</th>	
				<td><%=ms_txt2%>cm</td>
			</tr>
			<tr>
				<th>�ӽ� �� ������</th>	
				<td><%=ms_txt3%>kg</td>
			</tr>
			<tr>
				<th>���� ������</th>	
				<td><%=ms_txt4%>kg</td>
			</tr>
			<tr>
				<th>���� ����</th>	
				<td>������ �ǰ��� ���������� �����غ��̺� �Բ��ϰڽ��ϴ�.<br />
				���Բ��� <span style="color:#ff015a; font-weight:bold;"><%=Replace(mo_service,"||",", ")%></span> ���α׷��� �����Ͻø�, <br />
				<span style="color:#ff015a; font-weight:bold;">���񽺿���� <%=FormatNumber(mo_charge,0)%>��</span>�Դϴ�.<br /><br />
				����, ��õ �ΰ����񽺷δ�,<span style="color:#ff015a; font-weight:bold;"><%=service_nm%></span>�� ���ص帳�ϴ�.</td>
			</tr>
			<tr>
				<th rowspan="9">�߰�����</th>	
				<td>���ĸ����� : <%=ms_sel1%>ȸ</td>
			</tr>
			<tr>
				<td>���̺���� : ����û</td>
			</tr>
			<tr>
				<td>�ѹ���� : <%If ms_sel2 = "Y" Then%>����<%Else%>���þ���<%End If%></td>
			</tr>
			<tr>
				<td>�������������� : <%If ms_sel3 = "Y" Then%>����<%Else%>���þ���<%End If%></td>
			</tr>
			<tr>
				<td>���̾�Ʈ �Ĵܰ��� : <%If ms_sel4 = "Y" Then%>����<%Else%>���þ���<%End If%></td>
			</tr>
			<tr>
				<td>�����м����α׷� : <%If ms_sel5 = "Y" Then%>����<%Else%>���þ���<%End If%></td>
			</tr>
			<tr>
				<td>�Ʊ����û�� : ����û</td>
			</tr>
			<tr>
				<td>����û : ����û</td>
			</tr>
			<tr>
				<td>�Ʊ���̼ҵ� : <%If ms_sel6 = "Y" Then%>����<%Else%>���þ���<%End If%></td>
			</tr>
			<tr>
				<th>���� �ݾ�</th>	
				<td>������ ������������ �������� �������� <span style="color:#ff015a; font-weight:bold;"> <%=FormatNumber(ms_total,0)%>��</span>�Դϴ�.</td>
			</tr>
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<!--input type="button" value="�� ��" id="btnDelte" class="button"-->&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" class="button" onClick="location.href='./member_service.asp?<%=strLnkUrl%>';">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var del	= jQuery('#btnDelte');

		del.click(function(){
			if (confirm("���� �Ͻðڽ��ϱ�?")) {
				jQuery('#ifrm').attr({'src':'/comp/comp_06_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>
</html>