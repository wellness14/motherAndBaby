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

		strTable = " FROM MO_CONSUMABLES WITH(NOLOCK) "
	 
		strWhere = " WHERE MO_CONSUMABLES_SEQ = '"& idx &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "       MO_CONSUMABLES_SEQ "
		strSql = strSql & ",      MO_CONSUMABLES_NAME "
		strSql = strSql & ",      MO_CONSUMABLES_CATEGORY "
		strSql = strSql & ",      MO_CONSUMABLES_PRICE "
		strSql = strSql & ",      MO_CONSUMABLES_USE_YN "
		strSql = strSql & ",      MO_CONSUMABLES_GUBUN "

		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MO_CONSUMABLES_SEQ DESC) ROWNUM "
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
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>�Ҹ�ǰ ����</strong></div>
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
				<th>�Ҹ�ǰ��</th>
				<td>
					<input type="text" id="P_name" name="P_name" size="20" value="<%=arrList(1,0)%>" valid="E|M=10|A=�Ҹ�ǰ���� �Է����ּ���">
				</td>
			</tr>
			<tr>
				<th>ǰ��</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">����</option>
						<option value="6����"<%=fncSetSelectBox("6����",arrList(2,0))%>>6����</option>
						<option value="3����"<%=fncSetSelectBox("3����",arrList(2,0))%>>3����</option>
						<option value="1����"<%=fncSetSelectBox("1����",arrList(2,0))%>>1����</option>
						<option value="2��"<%=fncSetSelectBox("2��",arrList(2,0))%>>2��</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���ް�</th>
				<td>
					<input type="text" id="price" name="price" size="20" value="<%=arrList(3,0)%>" valid="E|M=10|A=���ް��� �Է�">
				</td>
			</tr>
			 
			<tr>
				<th>ǰ���뿩��</th>
				<td>
					<select name="use_yn"  id="use_yn" valid="E|A=��뿩�θ� �Է����ּ���">
						<option value="">����</option>
						<option value="Y"<%=fncSetSelectBox("Y",arrList(4,0))%>>Y</option>
						<option value="N"<%=fncSetSelectBox("N",arrList(4,0))%>>N</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>�Ҹ�ǰ ����</th>
				<td>
					<select name="somo_gubun"  id="somo_gubun" valid="E|A=��뿩�θ� �Է����ּ���">
						<option value="">����</option>
						<option value="M" <%=fncSetSelectBox("M",arrList(5,0))%>>���� �Ҹ�ǰ(�޵��������, �޵����Ƽ��)</option>
						<option value="S" <%=fncSetSelectBox("S",arrList(5,0))%>>���� �Ҹ�ǰ(�����ϼҸ�ǰ, ��Ƽ���Ҹ�ǰ)</option>
					</select>
				</td>
			</tr>	
			<!--tr>
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
			</trx>
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
			</tr-->>
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
				<th>�Ҹ�ǰ��</th>
				<td>
					<input type="text" id="P_name" name="P_name" size="20" value="" valid="E|M=10|A=�Ҹ�ǰ���� �Է����ּ���">
				</td>
			</tr>
			<tr>
				<th>ǰ��</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">����</option>
						<option value="6����">6����</option>
						<option value="3����">3����</option>
						<option value="1����">1����</option>
						<option value="2��">2��</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>���ް�</th>
				<td>
					<input type="text" id="price" name="price" size="20" value="" valid="E|M=10|A=���ް��� �Է����ּ���">
				</td>
			</tr>
			<!--tr>
				<th>������ �Ҹ�ǰ</th>
				<td>
					<select name="somo_1"  id="somo_1">
						<option value="">����</option>
						<option value="�̱�">�̱�</option>
						<option value="����">����</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>��Ƽ���Ҹ�ǰ</th>
				<td>
					<select name="somo_2"  id="somo_2">
						<option value="">����</option>
						<option value="�̱�">�̱�</option>
						<option value="����">����</option>
					</select>
				</td>
			</tr-->
			<tr>
				<th>ǰ���뿩��</th>
				<td>
					<select name="use_yn"  id="use_yn" valid="E|A=��뿩�θ� �Է����ּ���">
						<option value="">����</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>�Ҹ�ǰ ����</th>
				<td>
					<select name="somo_gubun"  id="somo_gubun" valid="E|A=��뿩�θ� �Է����ּ���">
						<option value="">����</option>
						<option value="M">���� �Ҹ�ǰ(�޵��������, �޵����Ƽ��)</option>
						<option value="S">���� �Ҹ�ǰ(�����ϼҸ�ǰ, ��Ƽ���Ҹ�ǰ)</option>
					</select>
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
			jQuery('#ifrm').attr({'src':'./consumables_sql.asp?mode=delete&idx=<%=idx%>'});
		}
	});


	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./consumables_sql.asp"
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
 

 

          
 


</script>
</html>