<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_list.asp
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
	<script type="text/javascript" src="/common/js/Nwagon.js"></script>
	<script type="text/javascript" src="/common/js/Nwagon_no_vml.js"></script>
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<link type="text/css" rel="stylesheet" href="/admin/common/css/Nwagon.css" />
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
'---------------------------------------------------------

	page_type = fncRequest("pagetype")
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
'---------------------------------------------------------

	startNum = (page-1) * page_size
	endNum = startNum + page_size


'-----------------------------------------------------------------------------------
	Dim NowDate, NowYear, NowMonth, NowDay, NowHour, NowMinute, NowSecond

	'���糯¥
	NowDate = Date()    '2011-07-08

	'���� ��
	NowYear = Year(Date())    '2011

	'���� ��
	NowMonth = Month(Date())    '7
	NowMonth_2 = Month(Date())    '7
	month_1 = month(now) 


	'���� ��
	NowDay = Day(Date())    '8


	startY = fncRequest("startY")   
	startM = fncRequest("startM")   
	startD = fncRequest("startD")   

	endY = fncRequest("endY")   
	endM = fncRequest("endM")   
	endD = fncRequest("endD")  

	s_yyyy = fncRequest("startY")   
	s_mmmm = fncRequest("startM")   
	s_dddd = fncRequest("startD")   

	e_yyyy = fncRequest("endY")   
	e_mmmm = fncRequest("endM")   
	e_dddd = fncRequest("endD")  

	If NowYear <> "" And NowMonth <> ""   Then 
	StartYM = NowYear & fncSetNumber(NowMonth)  
	End If 

	If startY <> "" And startM <> "" And startD <> "" Then 
	StartYMD = startY & fncSetNumber(startM) & fncSetNumber(startD)
	End If 

	If endY <> "" And endM <> "" And endD <> "" Then 
	endYMD = endY & fncSetNumber(endM) & fncSetNumber(endD)
	End If 

	'��ϻ�ǰ ����Ʈ

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

  '---------------------------------------------------------------------

	strTable = "    from	MO_RESERVATION A     "

'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "

	strWhere = "  where MR_CNLKBN='N'   "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MR_MEM_ID='"& sword &"' "
			Case "2" : strWhere = strWhere & "  AND MR_MEM_NM='"& sword &"' "
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
%>

<%
 
	strSql = ""
	strSql = strSql & " ;SELECT  *			      "
	strSql = strSql & " FROM  				      "
	strSql = strSql & " (						  "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			* "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MR_IDX DESC) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) B "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 

		arrList = Rs.GetRows()


	End If 
	Call DBClose(Rs) : DBClose(Rs1)
%> 

<%
'-----------------------------------------------------------------------------

 '-----------------------------------------------------------------------------
'	���� ���� ȣ��

  If hp_seq <> "" Then

	md_local = arrList(28,0)



 
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
%>


<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>������</strong></div>
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="#">
			<table border="1" style="width:100%;">
			<tr height="40">
				<td width="150" align="center">�� ��</td>
				<td>
					<select name="startY" valid="E|A=�⵵�� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_yyyy)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="startM" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="startD" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
				    -
					<select name="endY" valid="E|A=�⵵�� ������ �ּ���">
						<option value="">��</option>
					<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_yyyy)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="endM" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_mmmm)%>><%=num%>��</option>
					<% Next %>
					</select>
					<select name="endD" valid="E|A=���� ������ �ּ���">
						<option value="">��</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,e_dddd)%>><%=num%>��</option>
					<% Next %>
					</select>
				<a onClick="location.href='./data_day_list.asp';" style="cursor:pointer;" class="button">�Ϻ��������</a>
				<a onClick="location.href='./data_month_list.asp';" style="cursor:pointer;" class="button">�����������</a>
				<a onClick="location.href='./data_list.asp';" style="cursor:pointer;" class="button">���񽺺�����</a>
				<a onClick="location.href='./data_add_list.asp';" style="cursor:pointer;" class="button">�߰�������</a>
				</td>
			</tr>
			<tr height="40">
				<td align="center">���񽺺�</td>
					<td>
						<select name="startY" valid="E|A=�⵵�� ������ �ּ���">
							<option value="">����</option>
						 
							<option value=" " <%=fncSetSelectBox(num,s_yyyy)%>><%=num%></option>
						 
						</select>
						<select name="startM" valid="E|A=���� ������ �ּ���">
							<option value="">�̿�����</option>
						<% For num=1 To 12 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
						<% Next %>
						</select>
						<select name="startD" valid="E|A=���� ������ �ּ���">
							<option value="">�̿�Ⱓ</option>
						<% For num=1 To 31 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,s_mmmm)%>><%=num%>��</option>
						<% Next %>
						</select>
				</td>
			</tr>
			<tr> 
				<td height="40" align="center">���纰</td>
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
			 
			
 
			</form>
			</table>
			<br>
			<div align="right"> 
			<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">�� ��</a> 
			</div>
			<br>
			<table class="tb_style01" >
			<colgroup>
			<col width="3%" />
			<col />
			<col width="20%" />
			<col width="15%" />
			<col width="20%" />
			</colgroup>
			<thead>
			<tr>
				<th>��ȣ</th>
				<th>�������α׷�</th>
				<th>����Ÿ��</th>
				<th>�Ⱓ</th>
				<th>����</th>
			</tr>
			</thead>
			<tbody>

<%

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			pdt_name	= arrList(1,num)
			ser_type	= arrList(2,num)
			term		= arrList(3,num)
			price		= arrList(4,num)

%>

			<tr onclick="location.href='./data_ins.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=pdt_name%><br></td>
				<td><%=ser_type%></td>
				<td><%=term%></td>
				<td><%=price%></td>
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
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>