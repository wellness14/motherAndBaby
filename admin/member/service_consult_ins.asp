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
	
	idx = fncRequest("idx")   
    If idx <> "" Then

		strTable = " FROM	MO_APP_SERVICE_CONSULT	WITH(NOLOCK) "
 		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE AS_SEQ = '"& idx &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			* "
'		strSql = strSql & "			,MR_MEM_ID "
'		strSql = strSql & "			,MR_MEM_NM "
'		strSql = strSql & "			,MR_HP "
'		strSql = strSql & "			,MR_CHILDBIRTH "
'		strSql = strSql & "			,ME_TYPE "
'		strSql = strSql & "			,ME_CHILD_GENDER "
'		strSql = strSql & "			,MR_CLINIC "
'		strSql = strSql & "			,MR_CONTENT "
'		strSql = strSql & "			,ME_CNLKBN "
'		strSql = strSql & "			,ME_REG_DT "
'		strSql = strSql & "			,ME_LEVEL "
'		strSql = strSql & "			,ME_REPLY "
'		strSql = strSql & "			,ME_REPLY_CONTENT "
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY AS_SEQ DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			birthday = Rs(6)
			mode	= "upd"
			AS_SEQ				=	Rs(0)
			MR_MEM_ID			=	Rs(1)
			MR_MEM_NM			=	Rs(2)
			AS_CONTENT			=	Rs(3)
			AS_REPLY			=	Rs(4)
			AS_CNLKBN			=	Rs(5)
			AS_REG_DT			=	Rs(6)
			AS_LEVEL			=	Rs(7)
			AS_REPLY_CONTENT	=	Rs(8)

			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 
%>
<% 

 '------�޷��߰��� ����--------------------------------------------------
	If birthday <> ""  Then 
		birth_m = Mid(arrList(4,0),5,2)
		birth_d = Right(arrList(4,0),2)
		birth_ymd = Left(arrList(4,0),4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
'-------�޷� �߰��� ����---------------------------------------------------- 
%>
 
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>ȸ������</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=AS_SEQ%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>ȸ��ID</th>
				<td><%=MR_MEM_ID%></td>
			</tr>
			<tr>
				<th>ȸ����</th>
				<td><% If MR_MEM_NM <> ""  Then %><%=MR_MEM_NM%> <% Else %> <%End If %></td>
			</tr>
			<tr>
				<th>�����</th>
				<td><% If AS_REG_DT <> ""  Then %><%=AS_REG_DT%> <% Else %> <%End If %></td>
			</tr>  
			<tr>
				<th>��㳻��</th>
				<td>
					<textarea	name="as_content" id="as_content" style="width:100%; height:200px;"><%=AS_CONTENT%></textarea>
				</td>
			</tr>
			<tr>
				<th>�亯</th>
				<td>
					<textarea	name="as_reply_content" id="as_reply_content" style="width:100%; height:200px;"><%=AS_REPLY_CONTENT%></textarea>
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
		  yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
		  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
	}); 
  }); 
</script>
<!-- �޷��߰� ��-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');

	btnDel.click(function(){
		if (confirm("���� �Ͻðڽ��ϱ�?")) {
			jQuery('#ifrm').attr({'src':'./service_consult_sql.asp?mode=del&idx=<%=idx%>'});
		}
	});

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./service_consult_sql.asp"
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