<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ���� ��� ����
'�� �� �� : main_banner_ins.asp
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
<!-- #include file = "./main_banner_inc.asp"-->
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
		strTable = " FROM MO_MAIN_MAS WITH(NOLOCK) "

		strWhere = " WHERE MM_NUM='"& intNum &"' AND MM_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "			MM_IDX "
		strSql = strSql & "			,MM_NUM "
		strSql = strSql & "			,MM_ORD "
		strSql = strSql & "			,MM_URL "
		strSql = strSql & "			,MM_IMG "
		strSql = strSql & "			,MM_VIEW_FLG "
		strSql = strSql & "			,MM_REG_DT "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			mode		= "upd"
			mm_idx		= Rs("MM_IDX")
			mm_url		= Rs("MM_URL")
			mm_img		= Rs("MM_IMG")
			mm_view_flg	= Rs("MM_VIEW_FLG")
		End If 
		Call RSClose(Rs)
	End If 	
%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ���� ���� > <strong><%=strTitle%></strong></div>
		<div class="write">
			
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="num" value="<%=intNum%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>��ũ</th>
				<td><input type="text" name="strUrl" size="50" value="<%=mm_url%>" valid="E|A=��ũ�� �Է��� �ּ���"></td>
			</tr>
			<tr>
				<th>���⿩��</th>
				<td>
					<input type="radio" name="view_flg" value="Y" <%=fncSetCheckBox(mm_view_flg,"Y")%> valid="E|A=���⿩�θ� ������ �ּ���"> ����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="view_flg" value="N" <%=fncSetCheckBox(mm_view_flg,"N")%>> �����&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
			<tr>
				<th>÷������</th>
				<td>
					<input type="button" value="���� ÷���ϱ�" onclick="fncOpenPop('<%=num%>')" class="button"> 
					<span id="fileNm_<%=num%>" style="width:10px;">
					<%	If mm_img <> "" Then %>
						<img src="/upload_file/main/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
					<%	End If %>
					</span><br />
				</td>
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

<!--// S : ���� ���ε� �Լ� ���� -->
<script type="text/javascript">
	function fncOpenPop(index){
		window.open('/common/inc/Board_UploadPopup.asp?type=main&imageIndex='+index,'fileUpload_pop','width=496px, height=270px')
	}

	function previewImageBind(index, imgURL, fileNm) {
		strHtml = "<input type='hidden' name='filePath' value='"+ imgURL +"'/>";
		strHtml += "<img src='/upload_file/main/"+ imgURL +"' width='<%=width%>' height='<%=height%>'/>";
		jQuery("#fileNm_"+index).html(strHtml)
	}
</script>
<!--// E : ���� ���ε� �Լ� ���� -->

<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
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
		"action" : "<%=urlSql%>"
	});
</script>
</html>