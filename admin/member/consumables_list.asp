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

 
	'��ϻ�ǰ ����Ʈ

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

'---------------------------------------------------------------------------

	strTable = "    from	MO_CONSUMABLES       "
	
'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "

	'strWhere = "   WHERE  "

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
	strSql = strSql & " ;SELECT *	"
 
	strSql = strSql & " FROM 		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			MO_CONSUMABLES_SEQ,   "
	strSql = strSql & "			MO_CONSUMABLES_NAME,   "
	strSql = strSql & "			MO_CONSUMABLES_CATEGORY,   "
	strSql = strSql & "			MO_CONSUMABLES_PRICE,   "
	strSql = strSql & "			MO_CONSUMABLES_USE_YN,   "
	strSql = strSql & "			MO_CONSUMABLES_GUBUN   "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CONSUMABLES_SEQ desc) ROWNUM   "
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
 <script> </script>
 <!--
<%
	'-----------------------------------------------------------------------------

 
'	�԰���� ȣ��
	strSql = " select MD_GIFT_SEQ, MD_GIFT_EA from MO_RESERVATION_GIFT_NOW_EA "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		in_MD_GIFT_SEQ = Rs(0)
		arrProdt_in_ea = Rs(1)
		arrIn = Rs.getRows()
	End If 
	Call RSClose(Rs)

'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	��� ���� ȣ��
	strSql = " select MD_GIFT_SEQ, MD_GIFT_OUT_EA from MO_RESERVATION_GIFT_OUT "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		out_MD_GIFT_SEQ = Rs(0)
		arrProdt_out_ea = Rs(1)
		arrOut = Rs.getRows()
	End If 
	Call RSClose(Rs)
 
'-----------------------------------------------------------------------------

%>
 -->
 
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>�Ҹ�ǰ ����</strong></div>

 
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				�� �� : 
				<select name="smode" class="box">
					<option value="">�˻� ����</option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>ȸ��ID</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>ȸ����</option>
				</select>
				<input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">�� ��</a> <span style="margin-left:20px;">
				</span>

				<a onClick="location.href='./consumables_list.asp';" style="cursor:pointer;" class="button">�Ҹ�ǰ ���</a>
				<!--a onClick="location.href='./reservation_gift_out_list.asp';" style="cursor:pointer;" class="button">��� ��Ȳ</a>
				<a onClick="location.href='./reservation_gift_now_list.asp';" style="cursor:pointer;" class="button">�԰� ��Ȳ</a-->
				<span style="margin-left:20px;"></span>
				<span style="margin-left:20px;">
					<a onClick="location.href='./consumables_ins.asp'" style="cursor:pointer;" class="button">�Ҹ�ǰ ���</a>
				</span>
				<!--span style="margin-left:20px;">
					<a onClick="location.href='./reservation_gift_out_ins.asp'" style="cursor:pointer;" class="button">�����</a>
				</span-->
				<span style="margin-left:20px;">
					<!--a onClick="location.href='./reservation_gift_now_ins.asp'" style="cursor:pointer;" class="button">�����</a-->
				</span>
			</div>
			</form>
			<br /> 
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			 
			<col />
			<col width="20%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
				<th>��ȣ</th>
				<th>�Ҹ�ǰ��</th>
				<th>ǰ��</th>
				<th>���ް�</th>
				<th>ǰ���뿩��</th>
				<th>�Ҹ�ǰ����</th>
			</tr>
			</thead>
			<tbody>
<%

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx				= arrList(0,num)
			pdt_name		= arrList(1,num)
			category		= arrList(2,num)
			price			= arrList(3,num)
			use_yn			= arrList(4,num)
			somo_gubun		= arrList(5,num)
 
%>
			<tr onclick="location.href='./consumables_ins.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=pdt_name%><br></td>
				<td><%=category%></td>
				<td><%=price%></td>				
				<td><%If use_yn = "Y" Then%>�����<%Else%>������<%End If%></td>
				<td><%If somo_gubun = "M" Then%>���� �Ҹ�ǰ<%Else%>���� �Ҹ�ǰ<%End If%></td>
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