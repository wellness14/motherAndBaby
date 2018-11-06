<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����û
'�� �� �� : service_list.asp
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

	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.0.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".datepicker").datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-3y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
				  yearRange: 'c-3:c+3', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
				  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
				  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
				  dayNames: ['��','��','ȭ','��','��','��','��'],
				  dayNamesShort: ['��','��','ȭ','��','��','��','��'],
				  dayNamesMin: ['��','��','ȭ','��','��','��','��']
			});

			$(".datepicker").attr("readonly", true);
		});
	</script>
</head>
<%
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 10
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	kind = fncRequest("kind")

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")
	route = fncRequest("route")
	consult_end = fncRequest("consult_end")
	contract_end = fncRequest("contract_end")
	date1 = fncRequest("date1")
	date2 = fncRequest("date2")

	strDftUrl = "kind=" & kind
	strDftUrl = strDftUrl & "&smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&route=" & route
	strDftUrl = strDftUrl & "&consult_end=" & consult_end
	strDftUrl = strDftUrl & "&contract_end=" & contract_end
	strDftUrl = strDftUrl & "&date1=" & date1
	strDftUrl = strDftUrl & "&date2=" & date2
'---------------------------------------------------------

	
	
	
	
	

	strTable = " FROM MO_BRD_SERVICE A WITH(NOLOCK) "
	strWhere = " WHERE MS_CNLKBN='N' "
	
	'If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "

	If grpcd = "1" Then
		admin = true
	End If

	If grpcd <> "" And grpcd <> "1" Then
		'���� ���븸 ���̰� ����ó�� - 2016.03.17
		If grpcd = "10000" Or grpcd = "0" Then
			grpcd = 1
		End If

		strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	End If

	If grpcd = "1" Then
		strWhere = strWhere & " AND (MS_ROUTE IS NOT NULL OR MS_ROUTE != '') "
	End If

	If Not route = "" Then
		strWhere = strWhere & " AND MS_ROUTE = '"& route &"' "
	End If

	If grpcd2 <> "" Then
		strWhere = strWhere & " AND MS_ROUTE = '"& grpcd2 &"' "
	End If

	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MS_MEM_ID LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND MS_MEM_NM LIKE '%"& sword &"%' "
		End Select 
	End If 

	If Not consult_end = "" Then
		strWhere = strWhere & " AND MS_END = '" & consult_end & "' "
	End If

	If Not contract_end = "" Then
		If contract_end = "2��|3�� �̻�" Then
			strWhere = strWhere & " AND MS_CONTRACT IN ('2��', '3�� �̻�') "
		ElseIf contract_end = "�̰��" Then
			strWhere = strWhere & " AND MS_CONTRACT = '' "
		Else
			strWhere = strWhere & " AND MS_CONTRACT = '" & contract_end & "' "
		End If
	End If

	If kind = "1" Then
		If Not date1 = "" Then
			strWhere = strWhere & " AND CONVERT(VARCHAR(10), MS_REG_DT, 121) >= '"& date1 &"' "
		End If

		If Not date2 = "" Then
			strWhere = strWhere & " AND CONVERT(VARCHAR(10), MS_REG_DT, 121) <= '"& date2 &"' "
		End If
	End If

	If kind = "2" Then
		If Not date1 = "" Then
			strWhere = strWhere & " AND CONVERT(VARCHAR(10), MS_CONTRACT_DT, 121) >= '"& date1 &"' "
		End If

		If Not date2 = "" Then
			strWhere = strWhere & " AND CONVERT(VARCHAR(10), MS_CONTRACT_DT, 121) <= '"& date2 &"' "
		End If
	End If

	If kind = "2" Then
		strWhere = strWhere & " AND MS_END = 'Y' "
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
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere & " AND MS_END = 'Y' "
	Set Rs2 = DBExec(strSql,"main")
	If Not Rs2.EOF Then 
		intEndTotalCnt = Rs2(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere & " AND MS_CONTRACT != '' "
	Set Rs3 = DBExec(strSql,"main")
	If Not Rs3.EOF Then 
		intContractTotalCnt = Rs3(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere & " AND MS_CONTRACT = '2��' "
	Set Rs4 = DBExec(strSql,"main")
	If Not Rs4.EOF Then 
		intContractTwoTotalCnt = Rs4(0)
	End If

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere & " AND MS_CONTRACT = '3�� �̻�' "
	Set Rs5 = DBExec(strSql,"main")
	If Not Rs5.EOF Then 
		intContractThreeTotalCnt = Rs5(0)
	End If

	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "	
	strSql = strSql & "			* "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MS_IDX DESC) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	Call DBClose(Rs) : DBClose(Rs1) : DBClose(Rs2) : DBClose(Rs3) : DBClose(Rs4) : DBClose(Rs5)
%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ��� �̺�Ʈ ���� >
			<strong>
				<% If kind = "1" Then %>
					��� ����
				<% End If %>
				<% If kind = "2" Then %>
					��� ��Ȳ
				<% End If %>
			</strong>
		</div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="event_service_list.asp?kind=<%=kind%>">
				<input type="hidden" name="smode" value="2" />
				<table>
					<tr>
						<td>�̸� : </td>
						<td>
							<input type="text" name="sword" style="height:20px;width:216px;" value="<%=sword%>" >
						</td>
						<td rowspan="4" style="padding-left:10px;">
							<a onClick="jQuery('#sFom').submit();" style="cursor:pointer; padding:15px;" class="button">�� ��</a>
							<a onClick="location.href='./event_service_list.asp?kind=<%=kind%>'" style="cursor:pointer; padding:15px;" class="button">��ü ����Ʈ</a>
						</td>
					</tr>
					<tr>
						<% If kind = "1" Then %>
							<td style="padding-top:10px;">��㿩�� : </td>
							<td style="padding-top:10px;">
								<select name="consult_end" style="height:20px;width:216px;">
									<option value="">��ü</option>
									<option value="Y" <%=fncSetSelectBox("Y",consult_end)%>>�Ϸ�</option>
									<option value="N" <%=fncSetSelectBox("N",consult_end)%>>�̿Ϸ�</option>
								</select>
							</td>
						<% End If %>
						<% If kind = "2" Then %>
							<td style="padding-top:10px;">��࿩�� : </td>
							<td style="padding-top:10px;">
								<select name="contract_end" style="height:20px;width:216px;">
									<option value="">��ü</option>
									<option value="�̰��" <%=fncSetSelectBox("�̰��",contract_end)%>>�̰��</option>
									<option value="2��" <%=fncSetSelectBox("2��",contract_end)%>>2��</option>
									<option value="3�� �̻�" <%=fncSetSelectBox("3�� �̻�",contract_end)%>>3�� �̻�</option>
									<option value="2��|3�� �̻�" <%=fncSetSelectBox("2��|3�� �̻�",contract_end)%>>2�� + 3�� �̻�</option>
								</select>
							</td>
						<% End If %>
					</tr>
					<tr>
						<td style="padding-top:10px;">
							<% If kind = "1" Then %>
								����� : 
							<% End If %>
							<% If kind = "2" Then %>
								����� : 
							<% End If %>
						</td>
						<td style="padding-top:10px;">
							<input type="text" name="date1" style="height:20px;width:100px;" value="<%=date1%>" class="datepicker" >
							~
							<input type="text" name="date2" style="height:20px;width:100px;"value="<%=date2%>" class="datepicker" >
						</td>
					</tr>
					<% If admin Then %>
						<tr>
							<td style="padding-top:10px;">
								����û��� : 
							</td>
							<td style="padding-top:10px;">
								<select name="route" style="height:20px;width:216px;">
									<option value="">��ü</option>
									<option value="flowerbirth" <%=fncSetSelectBox("flowerbirth",route)%>>�ɺ������</option>
									<option value="momtalk" <%=fncSetSelectBox("momtalk",route)%>>����</option>
								</select>
							</td>
						</tr>
					<% End If %>
				</table>
				</form>
			</div>
			<br />
			<% If kind = "1" Then %>
				<div style="font-weight:bold; float:right;font-size:15px;padding-right:10px; margin-bottom:10px;">
					����û �Ǽ� : <%=intTotalCnt%>��, ���Ϸ� �Ǽ� : <%=intEndTotalCnt%>��, ���Ϸ� �Ǽ� : <%=intContractTotalCnt%>��
				</div>
			<% End If %>
			<% If kind = "2" Then %>
				<div style="font-weight:bold; float:right;font-size:15px;padding-right:10px; margin-bottom:10px;">
					����ǰ : 2��(<%=intContractTwoTotalCnt%>�� : <%=FormatNumber(intContractTwoTotalCnt * 20000, 0)%>��), 3�� �̻�(<%=intContractThreeTotalCnt%>�� : <%=FormatNumber(intContractThreeTotalCnt * 30000, 0)%>��)
				</div>
			<% End If %>
			<table class="tb_style01">
			<colgroup>
			<% If kind = "1" Then %>
				<col width="5%" />
				<col width="10%" />
				<col width="10%" />
				<col width="20%" />
				<col width="15%" />
				<col width="15%" />
				<col width="20%" />
				<col width="5%" />
			<% End If %>
			<% If kind = "2" Then %>
				<col width="5%" />
				<col width="10%" />
				<col width="10%" />
				<col width="17%" />
				<col width="10%" />
				<col width="15%" />
				<col width="18%" />
				<col width="5%" />
				<col width="5%" />
				<col width="5%" />
			<% End If %>
			</colgroup>
			<thead>
			<tr>
				<th>��ȣ</th>
				<th>�̸�</th>
                <th>��꿹����</th>
                <th>���ּ�</th>
				<th>�ڵ���</th>
				<th>�ۼ���</th>
				<th>��㳻��</th>
				<th>
					<% If kind = "1" Then %>
						���ϷῩ��
					<% End If %>
					<% If kind = "2" Then %>
						���ϷῩ��
					<% End If %>
				</th>
				<% If kind = "2" Then %>
					<th>����ǰ</th>
				<% End If %>
				<% If admin Then %>
					<th>����û���</th>
				<% End If %>
			</tr>
			</thead>
			<tbody>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			mem_id		= arrList(1,num)
			mem_nm		= arrList(2,num)
			childbirth		= arrList(12,num)
			hp			= Trim(arrList(5,num))
			addr1		= arrList(7,num)
			addr2		= arrList(8,num)
			reg_dt		= arrList(22,num)
			'md_local	= arrList(16,num)
            md_local	= arrList(23,num) 
			ms_end      = arrList(24,num)
			ms_content  = arrList(18,num)
			ms_route  = arrList(38,num)
			ms_contract  = arrList(39,num)
			ms_contract_dt  = arrList(40,num)
			
			ms_contract_end = "N"

			If Not ms_contract = "" Then
				ms_contract_end = "Y"
			End If

			ms_route  = Replace(ms_route, "flowerbirth", "�ɺ������")
			ms_route  = Replace(ms_route, "momtalk", "����")

			local_nm	= "" 
			
					'-----------------------------------------------------------------------------
		'	���� ���� ȣ��
			If md_local <> "" Then 
				strSql = "SELECT CC_KOR_NM2 "
				strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
				strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
				Set Rs = DBExec(strSql,"main")
				If Not Rs.EOf Then 
					local_nm = Rs(0)
				End If 
				Call RSClose(Rs)
			End If 
		'-----------------------------------------------------------------------------
%>
			<tr onClick="location.href='./event_service_view.asp?<%=strDftUrl%>&page=<%=page%>&idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<td><%=Left(childbirth,4)%>-<%=Mid(childbirth,5,2)%>-<%=Right(childbirth,2)%></td>
				<td><%=addr1%>&nbsp;<%=addr2%></td>
                <td><%=hp%></td>
				<td><%=reg_dt%></td>
				<td><%=ms_content%></td>
				<td>
					<% If kind = "1" Then %>
						<%=ms_end%>
					<% End If %>
					<% If kind = "2" Then %>
						<%=ms_contract_end%>
					<% End If %>
				</td>
				<% If kind = "2" Then %>
					<td><%=ms_contract%></td>
				<% End If %>
				<% If admin Then %>
					<td><%=ms_route%></td>
				<% End If %>
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
<!-- <script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script> -->
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>