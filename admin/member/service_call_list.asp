<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : �ݻ�����
'�� �� �� : service_call_list.asp
'�ۼ����� : 2015/06/22
'�� �� �� : ȫ����
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
<script>
//alert("<%=uId%>");    ���̵�
//alert("<%=grpcd%>"); �׷��ȣ
</script>
<%
'---------------------------------------------------------
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&salign=" & salign
	strDftUrl = strDftUrl & "&smethod=" & smethod
'---------------------------------------------------------

	strTable = " FROM  MO_COUNSELLING_RECORD  WITH(NOLOCK) "
	strWhere = " WHERE MO_SEQ IS NOT NULL "

	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MO_NAME LIKE '%"& sword &"%' "
		End Select 
	End If 

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere

	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		intTotalCnt = Rs1(0)
	End If 

	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			MO_SEQ "
	strSql = strSql & "			,MO_NAME "
	strSql = strSql & "			,MO_PHONE "
	strSql = strSql & "			,MO_CHILD_DATE "
	strSql = strSql & "			,MO_SERVICE_SCHE_DATE "
	strSql = strSql & "			,MO_MANAGER_CAREER "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_SEQ desc) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	'Response.write strSql

	Call DBClose(Rs) : DBClose(Rs1)
%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>��ȭ������</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				�˻� : 
				<select name="smode">
					<option value="">�˻� ����</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>ȸ����</option>
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">�� ��</a>
				<a onClick="location.href='./service_call_list.asp'" class="button">��ü ����Ʈ</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='./service_call_ins.asp'" style="cursor:pointer;" class="button">���</a>
				</span>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="12%" />
			<col width="22%" />
			<col width="22%" />
			<col width="22%" />
			<col width="22%" />
			</colgroup>
			<thead>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
				<th>��꿹����</th>
                <th>���񽺿�����</th>
				<th>��ȭ��ȣ</th>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx = arrList(0, num)
			name = arrList(1,num)
			childbirth = arrList(3, num)
			servicedate = arrList(4, num)
			phone = arrList(2, num)
%>
			<tr onClick="location.href='./service_call_ins.asp?idx=<%=idx%>&local=<%=grpcd%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=name%></td>
				<td><%=childbirth%></td>
				<td><%=servicedate%></td>
                <td><%=phone%></td>
			</tr>
            
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">��ϵ� ������ �����ϴ�.</td>
			</tr>
<%
	End If
%>
			</tbody>
			</table>
			<div id="paging_wrap"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>