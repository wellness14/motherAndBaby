<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : �Խ��� ����
'�� �� �� : brd_ins.asp
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
<!-- #include file = "./brd_inc.asp" -->
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
	Dim sdate : sdate = Date()
	Dim edate : edate = Date()

	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM "& brd_tbl &" WITH(NOLOCK) "

		strWhere = " WHERE BA_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "		BA_DPH "
		strSql = strSql & "		,BA_PIDX "
		strSql = strSql & "		,BA_MEM_ID "
		strSql = strSql & "		,BA_MEM_NM "
		strSql = strSql & "		,BA_TITLE "
		strSql = strSql & "		,BA_CONTENT "
		strSql = strSql & "		,BA_SEC_FLG "
		strSql = strSql & "		,BA_SEC_NUM "		
		strSql = strSql & "		,BA_REG_DT "
		strSql = strSql & "		,BA_EMAIL "
		strSql = strSql & "		,BA_CNT "
		strSql = strSql & "		,BA_FILE_NM "
		strSql = strSql & "		,BA_FILE_PATH "
		If (brd_type = "1" Or brd_type = "5") And Trim(brd_tbl) <> "dbo.MO_BRD_faq" Then 
		strSql = strSql & "		,BA_TYPE "
		strSql = strSql & "		,BA_NOTICE_FLG "    
		End If 
		If brd_type = "2" Then 
		strSql = strSql & "		,BA_LOCAL "
		End If 
		If brd_type = "3" Then
		strSql = strSql & "		,BA_STD_SDT "
		strSql = strSql & "		,BA_STD_EDT "
		End If 
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			mode		= "upd"
			ba_dph		= Rs("BA_DPH")
			ba_pidx		= Rs("BA_PIDX")
			mem_id		= Rs("BA_MEM_ID")
			mem_nm		= Rs("BA_MEM_NM")
			title		= Rs("BA_TITLE")
			content		= Re_sqlFilter(Rs("BA_CONTENT"))
			sec_flg		= Rs("BA_SEC_FLG")
			sec_num		= Rs("BA_SEC_NUM")
			email		= Rs("BA_EMAIL")
			intCnt		= Rs("BA_CNT")
			file_nm		= Rs("BA_FILE_NM")
			file_path	= Rs("BA_FILE_PATH")
			If (brd_type = "1" Or brd_type = "5") And Trim(brd_tbl) <> "dbo.MO_BRD_faq" Then 
			ba_type		= Rs("BA_TYPE")
			ba_notice_flg	= Rs("BA_TYPE")
			End If 	
			If brd_type = "2" Then 
			md_local	= Rs("BA_LOCAL")
			End If 
			If brd_type = "3" Then
			sdate		= Rs("BA_STD_SDT")
			edate		= Rs("BA_STD_EDT")
			End If 
		End If 
		Call RSClose(Rs)
	End If 	

'-----------------------------------------------------------------------------
'	���� ���� ȣ��
	If md_local <> "" Then 
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
%>
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > �Խ��� ���� > <strong><%=brd_nm%></strong></div>
		<div class="write">
			<!--#include file ="./brd_top.asp"-->

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
				<td><input type="text" name="mem_nm" size="20" value="<%=mem_nm%>" valid="E|M=10|A=������ �Է��� �ּ���"></td>
			</tr>
			<tr>
				<th>��������</th>
				<td>
					<select name="notice_flg">
						<option value="">����</option>
						<option value="H"<%=fncSetSelectBox("H",ba_notice_flg)%>>Ȩ����������</option>
						<option value="M"<%=fncSetSelectBox("M",ba_notice_flg)%>>����Ͼ۰���</option>
					</select>
				</td>
			</tr>
			<%If brd_sec = "A" Or brd_sec="Y" Then %>
			<tr>
				<th>��й�ȣ</th>
				<td><input type="password" name="pw" size="20" value="<%=sec_num%>" valid="E|N|M=5|T=��й�ȣ|A=��й�ȣ�� �Է��� �ּ���"></td>
			</tr>
			<% End If %>
			<% If brd_type = "2" Then %>
			<tr>
				<th>����</th>
				<td>
					<select name="local" onchange="fncSetPart(this.value,'');" class="textarea" style="height:35px;">
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
			<% End If %>
			<tr>
				<th>�̸���</th>
				<td><input type="text" name="email" size="50" value="<%=email%>" valid="E|M=30|A=�̸����� �Է��� �ּ���"></td>
			</tr>
			<% If brd_type = "1" Then %>
			<tr>
				<th>�з�</th>
				<td>
					<input type="radio" name="ba_type" value="����" <%=fncSetCheckBox(ba_type,"����")%> valid="E|A=�з��� ������ �ּ���"> ����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ba_type" value="����" <%=fncSetCheckBox(ba_type,"����")%>> ����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ba_type" value="�̺�Ʈ" <%=fncSetCheckBox(ba_type,"�̺�Ʈ")%>> �̺�Ʈ&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
			<% End If %>
			<% If brd_type = "3" Then %>
			<tr>
				<th>�̺�Ʈ �Ⱓ</th>
				<td>
					<input type="text" id="sdate" name="sdate" size="10" value="<%=sdate%>" valid="E|M=20|A=�̺�Ʈ �������� ������ �ּ���"> ~ 
					<input type="text" id="edate" name="edate" size="10" value="<%=edate%>" valid="E|M=20|A=�̺�Ʈ �������� ������ �ּ���">
				</td>
			</tr>	
			<% End If %>
			<% If brd_type = "5" Then %>
			<tr>
				<th>�з�</th>
				<td>
					<input type="radio" name="ba_type" value="����װ���" <%=fncSetCheckBox(ba_type,"����װ���")%> valid="E|A=�з��� ������ �ּ���"> ����װ���&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ba_type" value="����" <%=fncSetCheckBox(ba_type,"����")%>> ����&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ba_type" value="�������� �ٿ�ó" <%=fncSetCheckBox(ba_type,"�������� �ٿ�ó")%>> �������� �ٿ�ó&nbsp;&nbsp;&nbsp;
					<input type="radio" name="ba_type" value="��Ÿ" <%=fncSetCheckBox(ba_type,"��Ÿ")%>> ��Ÿ&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
			<% End If %>
			<tr>
				<th>����</th>
				<td><input type="text" name="title" size="80" value="<%=title%>" valid="E|M=200|A=������ �Է��� �ּ���"></td>
			</tr>
			<tr>
				<th>����</th>	
				<td>
					<textarea name="content" id="content" style="width:100%; height:200px; display:none;"><%=content%></textarea>
				</td>
			</tr>
			<% If file_cnt > 0 Then %>
			<tr>
				<th>÷������</th>
				<td>
				<% 
					Dim arrFileNm : arrFileNm = Null
					If file_nm <> "" Then 
						arrFileNm = Split(file_nm,"||")
						arrFilePath = Split(file_path,"||")
					End If 
					For num=0 To file_cnt - 1
				%>
					<input type="button" value="���� ÷���ϱ�" onclick="fncOpenPop('<%=num%>')" class="button"> 
					<span id="fileNm_<%=num%>" style="width:10px;">
						<% 
							If IsArray(arrFileNm) Then 
								If UBound(arrFileNm) >= num Then 
									If arrFileNm(num) <> "" Then 
						%>
						<input type='hidden' name='fileNm' value='<%=Trim(arrFileNm(num))%>'/>
						<input type='hidden' name='filePath' value='<%=Trim(arrFilePath(num))%>'/>
						<a href="/upload_file/file/<%=Trim(arrFilePath(num))%>" target="_blank"><%=Trim(arrFileNm(num))%></a>
						<% 
									End If 
								End If 
							End If 
						%>
					</span><br />
				<% Next %>
				</td>
			</tr>
			<% End If %>
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


<!--#include virtual="/common/inc/datepicker.asp"-->
<script type="text/javascript">
	jQuery(document).ready(function(){
		// S : ������ ����
		jQuery("#sdate").datepicker({
			defaultDate: new Date(<%=Year(sdate)%>, <%=Month(sdate)%> - 1, <%=Day(sdate)%>),
			showOn: 'focus',
			showAnim: 'fadeIn'
		});
		
		// S : ������ ����
		jQuery("#edate").datepicker({
			defaultDate: new Date(<%=Year(edate)%>, <%=Month(edate)%> - 1, <%=Day(edate)%>),
			showOn: 'focus',
			showAnim: 'fadeIn'
		});
	});
</script>

<!--// S : ���̹� ������ ���� -->
<script type="text/javascript" src="/common/SmartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    try {
        var oEditors = [];
        var ImgPopUrl = '/common/inc/Edit_UploadPopup.asp'; //���� ��ư Ŭ���� ��� �˾�â Url
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "content",
            sSkinURI: "/common/SmartEditor2/SmartEditor2Skin.html?PopUpUrl=" + ImgPopUrl,
            fCreator: "createSEditor2"
        });
    } catch (e) { }
</script>
<!--// E : ���̹� ������ ���� -->

<!--// S : ���� ���ε� �Լ� ���� -->
<script type="text/javascript">
	function fncOpenPop(index){
		window.open('/common/inc/Board_UploadPopup.asp?imageIndex='+index,'fileUpload_pop','width=496px, height=270px')
	}

	function previewImageBind(index, imgURL, fileNm) {
		strHtml = "<input type='hidden' name='fileNm' value='"+ fileNm +"'/>";
		strHtml += "<input type='hidden' name='filePath' value='"+ imgURL +"'/>";
		strHtml += "<a href='/upload_file/file/"+ imgURL +"' target='_blank'>"+ fileNm +"</a>";
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
	
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

        var M_Content = jQuery("#content").val();
        if (M_Content == "") {
            alert("������ �Է��� �ּ���");
            return;
        }

        document.oFrm.content.value = jQuery("#content").val();

		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "<%=urlSql%>?<%=strLnkUrl%>"
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