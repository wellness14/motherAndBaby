<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����û
'�� �� �� : service_view.asp
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
<%	
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
			arrList = Rs.getRows()
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
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
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
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>����û</strong></div>
		<div class="write" align="center">
			
			<br />
			<h1>����� ��ϱ�</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>����</th>
				<td><%=arrList(2,0)%></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><%=Left(arrList(3,0),4)%>-<%=Mid(arrList(3,0),5,2)%>-<%=Right(arrList(3,0),2)%></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><%=arrList(4,0)%></td>
			</tr>
			<tr>
				<th>�ڵ�����ȣ</th>
				<td><%=arrList(5,0)%></td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
					(<%=arrList(6,0)%>)&nbsp;<%=arrList(7,0)%>&nbsp;<%=arrList(8,0)%>
				</td>
			</tr>
			<tr>
				<th>�������ֹι�ȣ</th>
				<td><%=arrList(25,0)%>-<%=arrList(26,0)%></td>
			</tr>			
			<tr>
				<th>��û����</th>
				<td><%=Replace(arrList(9,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>�̿�Ⱓ</th>	
				<td><%=arrList(10,0)%></td>
			</tr>
			<tr>
				<th>�̿�����</th>	
				<td><%=arrList(11,0)%></td>
			</tr>
			<tr>
				<th>��꿹����</th>	
				<td><%=Left(arrList(12,0),4)%>-<%=Mid(arrList(12,0),5,2)%>-<%=Right(arrList(12,0),2)%></td>
			</tr>
			<tr>
				<th>���񽺽��� ������</th>	
				<td><%=Left(arrList(13,0),4)%>-<%=Mid(arrList(13,0),5,2)%>-<%=Right(arrList(13,0),2)%></td>
			</tr>
			<tr>
				<th>������ �̿�</th>	
				<td><%=arrList(14,0)%></td>
			</tr>
			<tr>
				<th>������</th>	
				<td><%=arrList(15,0)%></td>
			</tr>
			<tr>
				<th>Ư�̻���</th>	
				<td><%=Replace(arrList(16,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>��������</th>	
				<td><%=Replace(arrList(17,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>���ϷῩ��</th>	
				<td><%=arrList(24,0)%></td>
			</tr>
			<tr>
				<th>��㳻��</th>	
				<td><%=arrList(18,0)%></td>
			</tr>
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="�� ��" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" class="button" onClick="location.href='./mobile_service_list.asp?<%=strLnkUrl%>';">
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
		var btn = jQuery('#btnSubmit');
		var del	= jQuery('#btnDelte');

		btn.click(function(){
			location.href="./mobile_service_ins.asp?idx=<%=intIDX%>&<%=strLnkUrl%>";
		});

		del.click(function(){
			if (confirm("���� �Ͻðڽ��ϱ�?")) {
				jQuery('#ifrm').attr({'src':'/info/info_01_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>
</html>