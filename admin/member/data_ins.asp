<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_ins.asp
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
 	idx = fncRequest("idx")   
	Dim mode : mode = "ins"
 
 
 

	If idx <> "" Then
		mode = "upd"

	
	strTable = " from	MO_DATA   "
	 
	strWhere = " WHERE MO_DATA_SEQ = '"& idx &"' "


	strSql = ""
	strSql = strSql & " SELECT							"
	strSql = strSql & "			MO_DATA_SEQ				"
	strSql = strSql & "		  , MO_DATA_NAME			"
	strSql = strSql & "		  , MO_DATA_CATEGORY		"
	strSql = strSql & "		  , MO_DATA_TERM			"
	strSql = strSql & "		  , MO_DATA_PRICE			"
	strSql = strSql & "		  , MO_DATA_CODE	  "
	strSql = strSql & "		  , ROW_NUMBER( ) OVER (ORDER BY MO_DATA_SEQ DESC) ROWNUM  "

	strSql = strSql & strTable
	strSql = strSql & strWhere
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		mode	= "upd"
		arrList = Rs.GetRows()
		

	End If 
	Call DBClose(Rs) : DBClose(Rs1)
 
 
	Else 
	 
	End If 

'-----------------------------------------------------------------------------
 
%>


<%



If idx <> "" Then

	md_local = arrList(5,0)



 
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


	End IF
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


<%

If idx <> "" Then

%>

<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>������</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="type" value="gift" />
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=idx%>">
 
 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>���� ���α׷���</th>
				<td>
					<select name="ser_program"  id="ser_program">
						<option value="">����</option>
						<option value="������"<%=fncSetSelectBox("������",arrList(1,0))%>>������</option>
						<option value="�����̾�"<%=fncSetSelectBox("�����̾�",arrList(1,0))%>>�����̾�</option>
						<option value="VIP"<%=fncSetSelectBox("VIP",arrList(1,0))%>>VIP</option>
						<option value="�����̺�"<%=fncSetSelectBox("�����̺�",arrList(1,0))%>>�����̺�</option>
						<option value="�ֵ����ɾ�"<%=fncSetSelectBox("�ֵ����ɾ�",arrList(1,0))%>>�ֵ����ɾ�</option>
						<option value="�ٵ����ɾ�"<%=fncSetSelectBox("�ٵ����ɾ�",arrList(1,0))%>>�ٵ����ɾ�</option>
						<option value="��ŷ��"<%=fncSetSelectBox("��ŷ��",arrList(1,0))%>>��ŷ��</option>
						<option value="��ü��"<%=fncSetSelectBox("��ü��",arrList(1,0))%>>��ü��</option>
						<option value="35���̻�"<%=fncSetSelectBox("35���̻�",arrList(1,0))%>>35���̻�</option>
						<option value="������������������"<%=fncSetSelectBox("������������������",arrList(1,0))%>>������������������</option>
						<option value="����İ���"<%=fncSetSelectBox("����İ���",arrList(1,0))%>>����İ���</option>
						<option value="�߰����-����-�����оƵ�"<%=fncSetSelectBox("�߰����-����-�����оƵ�",arrList(1,0))%>>�߰����-����-�����оƵ�</option>
						<option value="�߰����-����-���оƵ�"<%=fncSetSelectBox("�߰����-����-���оƵ�",arrList(1,0))%>>�߰����-����-���оƵ�</option>
						<option value="�߰����-����-�߰�����"<%=fncSetSelectBox("�߰����-����-�߰�����",arrList(1,0))%>>�߰����-����-�߰�����</option>
						<option value="�߰����-�ֵ����ɾ�"<%=fncSetSelectBox("�߰����-�ֵ����ɾ�",arrList(1,0))%>>�߰����-�ֵ����ɾ�</option>
						<option value="�߰����-�ð��ʰ�-������"<%=fncSetSelectBox("�߰����-�ð��ʰ�-������",arrList(1,0))%>>�߰����-�ð��ʰ�-������</option>
						<option value="�߰����-�ð��ʰ�-�����̾�"<%=fncSetSelectBox("�߰����-�ð��ʰ�-�����̾�",arrList(1,0))%>>�߰����-�ð��ʰ�-�����̾�</option>
						<option value="�߰����-�ð��ʰ�-�����̺�"<%=fncSetSelectBox("�߰����-�ð��ʰ�-�����̺�",arrList(1,0))%>>�߰����-�ð��ʰ�-�����̺�</option>
						<option value="�߰����-�ð��ʰ�-VIP"<%=fncSetSelectBox("�߰����-�ð��ʰ�-VIP",arrList(1,0))%>>�߰����-�ð��ʰ�-VIP</option>
						<option value="�߰����-�ð��ʰ�-�ٵ����ɾ�"<%=fncSetSelectBox("�߰����-�ð��ʰ�-�ٵ����ɾ�",arrList(1,0))%>>�߰����-�ð��ʰ�-�ٵ����ɾ�</option>
						<option value="�߰����-���ϱٹ�-������"<%=fncSetSelectBox("�߰����-���ϱٹ�-������",arrList(1,0))%>>�߰����-���ϱٹ�-������</option>
						<option value="�߰����-���ϱٹ�-�����̾�"<%=fncSetSelectBox("�߰����-���ϱٹ�-�����̾�",arrList(1,0))%>>�߰����-���ϱٹ�-�����̾�</option>
						<option value="�߰����-���ϱٹ�-�����̺�"<%=fncSetSelectBox("�߰����-���ϱٹ�-�����̺�",arrList(1,0))%>>�߰����-���ϱٹ�-�����̺�</option>
						<option value="�߰����-���ϱٹ�-VIP"<%=fncSetSelectBox("�߰����-���ϱٹ�-VIP",arrList(1,0))%>>�߰����-���ϱٹ�-VIP</option>
						<option value="�߰����-���ϱٹ�-�ٵ����ɾ�"<%=fncSetSelectBox("�߰����-���ϱٹ�-�ٵ����ɾ�",arrList(1,0))%>>�߰����-���ϱٹ�-�ٵ����ɾ�</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>����Ÿ��</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">����</option>
						<option value="����"<%=fncSetSelectBox("����",arrList(2,0))%>>����</option>
						<option value="����(��6��)"<%=fncSetSelectBox("����(��6��)",arrList(2,0))%>>����(��6��)</option>
						<option value="�����"<%=fncSetSelectBox("�����",arrList(2,0))%>>�����</option>
						<option value="����� + 5��"<%=fncSetSelectBox("����� + 5��",arrList(2,0))%>>�����+5��</option>
						<option value="����� + 6��"<%=fncSetSelectBox("����� + 6��",arrList(2,0))%>>�����+6��</option>
						<option value="����� + ����"<%=fncSetSelectBox("����� + ����",arrList(2,0))%>>����� + ����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���񽺱Ⱓ</th>
				<td>
					<select name="term"  id="term">
						<option value="">����</option>
						<option value="1��"<%=fncSetSelectBox("1��",arrList(3,0))%>>1��</option>
						<option value="2��"<%=fncSetSelectBox("2��",arrList(3,0))%>>2��</option>
						<option value="3��"<%=fncSetSelectBox("3��",arrList(3,0))%>>3��</option>
						<option value="4��"<%=fncSetSelectBox("4��",arrList(3,0))%>>4��</option>
						<option value="����2��+�����2��"<%=fncSetSelectBox("����2��+�����2��",arrList(3,0))%>>����2�� + �����2��</option>
						<option value="1��"<%=fncSetSelectBox("1��",arrList(3,0))%>>1��</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���񽺰���</th>
				<td>
					<input type="text" name="price" value="<%=arrList(4,0)%>" />
				</td>
			</tr>
			<tr>
				<th>�ڵ�</th>
				<td>
					<input type="text" name="code" value="<%=arrList(5,0)%>" />
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


<%
else
%>




<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>���༱������</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="type" value="gift" />
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=idx%>"> 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>���� ���α׷���</th>
				<td>
					<select name="ser_program"  id="ser_program">
						<option value="">����</option>
						<option value="������">������</option>
						<option value="�����̾�">�����̾�</option>
						<option value="VIP">VIP</option>
						<option value="�����̺�">�����̺�</option>
						<option value="�ֵ����ɾ�">�ֵ����ɾ�</option>
						<option value="�ٵ����ɾ�">�ٵ����ɾ�</option>
						<option value="��ŷ��">��ŷ��</option>
						<option value="��ü��">��ü��</option>
						<option value="35���̻�">35���̻�</option>
						<option value="������������������">������������������</option>
						<option value="����İ���">����İ���</option>
						<option value="�߰����-����-�����оƵ�">�߰����-����-�����оƵ�</option>
						<option value="�߰����-����-���оƵ�">�߰����-����-���оƵ�</option>
						<option value="�߰����-����-�߰�����">�߰����-����-�߰�����</option>
						<option value="�߰����-�ֵ����ɾ�">�߰����-�ֵ����ɾ�</option>
						<option value="�߰����-�ð��ʰ�-������">�߰����-�ð��ʰ�-������</option>
						<option value="�߰����-�ð��ʰ�-�����̾�">�߰����-�ð��ʰ�-�����̾�</option>
						<option value="�߰����-�ð��ʰ�-�����̺�">�߰����-�ð��ʰ�-�����̺�</option>
						<option value="�߰����-�ð��ʰ�-VIP">�߰����-�ð��ʰ�-VIP</option>
						<option value="�߰����-�ð��ʰ�-�ٵ����ɾ�">�߰����-�ð��ʰ�-�ٵ����ɾ�</option>
						<option value="�߰����-���ϱٹ�-������">�߰����-���ϱٹ�-������</option>
						<option value="�߰����-���ϱٹ�-�����̾�">�߰����-���ϱٹ�-�����̾�</option>
						<option value="�߰����-���ϱٹ�-�����̺�">�߰����-���ϱٹ�-�����̺�</option>
						<option value="�߰����-���ϱٹ�-VIP">�߰����-���ϱٹ�-VIP</option>
						<option value="�߰����-���ϱٹ�-�ٵ����ɾ�">�߰����-���ϱٹ�-�ٵ����ɾ�</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>����Ÿ��</th>
				<td>
					<select name="cate" id="cate">
						<option value="">����</option>
						<option value="����">����</option>
						<option value="����(��6��)">����(��6��)</option>
						<option value="�����">�����</option>
						<option value="����� + 5��">�����+5��</option>
						<option value="����� + 6��">�����+6��</option>
						<option value="����� + ����">����� + ����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���񽺱Ⱓ</th>
				<td>
					<select name="term" id="term">
						<option value="">����</option>
						<option value="1��">1��</option>
						<option value="2��">2��</option>
						<option value="3��">3��</option>
						<option value="4��">4��</option>
						<option value="����2��+�����2��">����2�� + �����2��</option>
						<option value="1��">1��</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���񽺰���</th>
				<td>
					<input type="text" name="price" value="" />
				</td>
			</tr>
			<tr>
				<th>�ڵ�</th>
				<td>
					<input type="text" name="code" value="" />
				</td>
			</tr>
			<!--tr>
				<th>��ǰ��뿩��</th>
				<td>
					<select name="use_yn"  id="use_yn" valid="E|A=��뿩�θ� �Է����ּ���">
						<option value="">����</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
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
				<th>��ǰ����</th>
				<td height="200">
					<input type="button" class="button" onclick="fncOpenPop('1')"  value="���� ÷���ϱ�"/>
						<p style="padding-top:10px"><span id="fileNm_1" style="width:10px;">
						<%	If mm_img <> "" Then %>
							<img src="/upload_file/admin/photo/gift/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
						<%	End If %>
					</span><br /></p>
				</td>
			</tr-->
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


<%


End if
%>

<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>

<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnMem = jQuery("#btnMem");
	var btnNm = jQuery("#btnNm");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');
 
 
	btnDel.click(function(){
		if (confirm("���� �Ͻðڽ��ϱ�?")) {
			jQuery('#ifrm').attr({'src':'./reservation_gift_sql.asp?mode=delete&idx=<%=idx%>'});
		}
	});


	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./data_sql.asp"
	});


	String.prototype.trim = function(){
    return this.replace(/s+/g," ").replace(/^s*|s*$/g,"");
	}


	
	function fncOpenPop(index){
		window.open('/common/inc/Helper_UploadPopup.asp?type=gift&imageIndex='+index,'fileUpload_pop','width=496px, height=270px');
		
		//window.open('/common/inc/Helper_UploadPopup.asp?type=main','fileUpload_pop','width=496px, height=270px');
	}

	function previewImageBind(index, imgURL, fileNm) {
		strHtml = "<input type='hidden' name='filePath' value='"+ imgURL +"'/>";
		strHtml += "<img src='/upload_file/admin/photo/gift/"+ imgURL +"' width='<%=width%>' height='<%=height%>'/>";
		jQuery("#fileNm_"+index).html(strHtml)
		  
	}
 

 

	function fncOpenZip(){
	
		
	  var form = document.oFrm;
	  var mo_helper_name1 = form.mo_helper_name1.value;


	  var width = "725"; 
	  var height = "550"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1; 
	  var title = "��𵵿�� �˻�"; 
	  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);
	
	//	window.open("/common/inc/pop_mo_helper.asp?mo_helper_name1="+mo_helper_name1,"pop_zipcode","width=625px, height=550px");
	}


	  function fncOpenZip_1(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_1.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_1.asp?mo_helper_name_1="+mo_helper_name1; 
		var title = "��𵵿�� �˻�"; 
		var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}

	 function fncOpenZip_2(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_2.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_2.asp?mo_helper_name_2="+mo_helper_name1; 
		var title = "��𵵿�� �˻�"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}


	  function fncOpenZip_3(){
	
		
		var form = document.oFrm;
		var mo_helper_name1 = form.mo_helper_name_3.value;


		var width = "725"; 
		var height = "550"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/common/inc/pop_mo_helper_3.asp?mo_helper_name_3="+mo_helper_name1; 
		var title = "��𵵿�� �˻�"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}



	function fncOpenName(){
	

	  var form = document.oFrm;
	  var mem_nm = form.mem_nm.value;

	  var width = "500"; 
	  var height = "460"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm; 
	  var title = "�̸��˻�"; 
	  var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

		


	
	//	window.open("/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm,"pop_zipcode","width=480px, height=460px");
	}



 
 
 

          
 


</script>
</html>