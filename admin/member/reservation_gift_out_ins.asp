<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_ins.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
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
 	out_seq = fncRequest("out_seq")
	pdt_seq = fncRequest("pdt_seq") 
	Dim mode : mode = "ins"
 

	If out_seq <> "" Then
		mode = "upd"

		strTable = " FROM MO_RESERVATION_GIFT_OUT WITH(NOLOCK) "
	 
		strWhere = " WHERE MD_GIFT_OUT_SEQ = '"& out_seq &"' and MD_GIFT_SEQ =  '"& pdt_seq &"'"

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "       MD_GIFT_SEQ "
		strSql = strSql & ",      MD_GIFT_OUT_SEQ "
		strSql = strSql & ",      MD_GIFT_MEM_ID "
		strSql = strSql & ",      MD_GIFT_OUT_DATE "
		strSql = strSql & ",      MD_GIFT_OUT_EA "

		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_GIFT_SEQ DESC,MD_GIFT_OUT_DATE DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode	= "upd"
			out_date		= Rs(3)
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)
	Else 
	 
	End If 

'-----------------------------------------------------------------------------
 
%>
 
<%
'-----------------------------------------------------------------------------
'	지점 정보 호출
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
'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


 
'-----------------------------------------------------------------------------


	If out_date <> "" Then 
		Mout_date = Mid(out_date,5,2)
		If Mout_date < 10 Then Mout_date = Right(Mout_date,1)
		Dout_date = Right(out_date,2)
		If Dout_date < 10 Then Dout_date = Right(Dout_date,1)
	End If 
%>


<%

If out_seq <> "" Then
product =  arrList(0,0)
%>

<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>예약선물관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="type" value="gift" />
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="out_seq" value="<%=out_seq%>">
			<input type="hidden" name="pdt_seq" value="<%=pdt_seq%>">
	 
 
 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>상품명</th>
				<td>
					<%
						vCnt = UBOUND(arrProdt,2)
						 
							For num = 0 To vCnt
					%>
					 <%If product = arrProdt(0,num) Then%>
					
						<input type="text" id="pdt_no" name="pdt_no" size="20" value="<%=arrProdt(1,num)%>" readonly > 
					 <%End If%>  

					<%
							Next 
					%>
				</td>
			</tr>
			<tr>
				<th>산모 ID</th>
				<td><input type="text" id="mem_id" name="mem_id" size="20" value="<%=arrList(2,0)%>" valid="E|A=회원명을 입력해 주세요" onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="회원이름으로 아이디 검색" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>출고일</th>	
				<td>
					<select name="out_y">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Left(out_date,4))%>><%=num%></option>
					<% Next %>
					</select>
					<select name="out_m">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Mout_date)%>><%=num%></option>
					<% Next %>
					</select>
					<select name="out_d">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>" <%=fncSetSelectBox(num,Dout_date)%>><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>출고수량</th>
				<td>
					<input type="text" id="out_ea" name="out_ea" size="20" value="<%=arrList(4,0)%>" valid="E|M=10|A=수량을 입력해주세요">개
				</td>
			</tr>
			 
			 
			</thead>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>예약선물관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="type" value="gift" />
			<input type="hidden" name="mode" value="<%=mode%>">
			 
 
 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>상품명</th>
				<td>
					<select name="pdt_no"   class="textarea" style="height:35px;">
						<option value=""selected>선택</option>
					<%
						vCnt = UBOUND(arrProdt,2)
							 
							For num = 0 To vCnt
					%>
						<option value="<%=arrProdt(0,num)%>"><%=arrProdt(1,num)%></option>

					<%	 
						 Next 
					%>
					 </select>
					 
				</td>
			</tr>
			<tr>
				<th>산모 ID</th>
				<td><input type="text" id="mem_id" name="mem_id" size="20" value="" valid="E|A=회원명을 입력해 주세요" onkeydown="if(event.keyCode==13) javascript:fncOpenName();">
					<input type="button" id="btnNm" value="회원이름으로 아이디 검색" onclick="fncOpenName();"  />
				</td>
			</tr>
			<tr>
				<th>출고일</th>	
				<td>
					<select name="out_y">
						<option value="">년</option>
					<% For num=Year(DateAdd("yyyy",-1,Date())) To Year(DateAdd("yyyy",3,Date())) %>
						<option value="<%=num%>"><%=num%></option>
					<% Next %>
					</select>
					<select name="out_m">
						<option value="">월</option>
					<% For num=1 To 12 %>
						<option value="<%=num%>"><%=num%></option>
					<% Next %>
					</select>
					<select name="out_d">
						<option value="">일</option>
					<% For num=1 To 31 %>
						<option value="<%=num%>"><%=num%></option>
					<% Next %>
					</select>
				</td>
			</tr>
			<tr>
				<th>출고수량</th>
				<td>
					<input type="text" id="out_ea" name="out_ea" size="20" value="" valid="E|M=10|A=수량을 입력해주세요">개
				</td>
			</tr>
			 
			 
			</thead>
			</table>
			</form>
			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="저 장" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="취 소" class="button" onClick="history.back(-1);">
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
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./reservation_gift_out_sql.asp?mode=delete&out_seq=<%=out_seq%>&pdt_seq=<%=pdt_seq%>'}); 
		}
	});


	btnSubmit.click(function(){

		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./reservation_gift_out_sql.asp"
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
	  var title = "산모도우미 검색"; 
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
		var title = "산모도우미 검색"; 
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
		var title = "산모도우미 검색"; 
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
		var title = "산모도우미 검색"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

	}



	function fncOpenName(){
	

	  var form = document.oFrm;
	  var mem_nm = form.mem_id.value;

	  var width = "500"; 
	  var height = "460"; 
	  var top = (window.screen.height-height)/2; 
	  var left = (window.screen.width-width)/2; 
	  var url = "/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm; 
	  var title = "이름검색"; 
	  var status = "toolbar=no,directories=no,resizable=no,status=no,menubar=no, width="+width+",height="+height+",top="+top+",left="+left; 
	  window.open(url , title, status);

		


	
	//	window.open("/common/inc/pop_mo_MemName.asp?mem_nm="+mem_nm,"pop_zipcode","width=480px, height=460px");
	}
function InputPostInfo(mname, mphpone1, mphpone2, mphpone3, mhp1, mhp2, mhp3, mbirth1, mbirth2, mbirth3, mpost1, mpost2, maddr1, maddr2, mid){
		
		jQuery("#mem_id").val(mid);
	}


 
 
 

          
 


</script>
</html>