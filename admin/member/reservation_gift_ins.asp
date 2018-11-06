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
 	idx = fncRequest("idx")   
	Dim mode : mode = "ins"
 
 
 

	If idx <> "" Then
		mode = "upd"

		strTable = " FROM MO_RESERVATION_GIFT WITH(NOLOCK) "
	 
		strWhere = " WHERE MD_GIFT_SEQ = '"& idx &"' "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "       MD_GIFT_SEQ "
		strSql = strSql & ",      MD_GIFT_NAME "
		strSql = strSql & ",      MD_GIFT_CATEGORY "
		strSql = strSql & ",      MD_GIFT_USE_YN "
		strSql = strSql & ",      MD_GIFT_LOCAL "
		strSql = strSql & ",      MD_GIFT_LOCAL_DETAIL "
		strSql = strSql & ",      MD_GIFT_PICTURE "

		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_GIFT_SEQ DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode	= "upd"
			mm_img		= Rs("MD_GIFT_PICTURE")
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
%>


<%

If idx <> "" Then

%>

<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>예약선물관리</strong></div>
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
				<th>상품명</th>
				<td>
					<input type="text" id="P_name" name="P_name" size="20" value="<%=arrList(1,0)%>" valid="E|M=10|A=상품명을 입력해주세요">
					 
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">선택</option>
						<option value="Skincare"<%=fncSetSelectBox("Skincare",arrList(2,0))%>>Skincare</option>
						<option value="Babygear"<%=fncSetSelectBox("Babygear",arrList(2,0))%>>Babygear</option>
						<option value="Nursery"<%=fncSetSelectBox("Nursery",arrList(2,0))%>>Nursery</option>
						<option value="Toy"<%=fncSetSelectBox("Toy",arrList(2,0))%>>Toy</option>
						<option value="Living"<%=fncSetSelectBox("Living",arrList(2,0))%>>Living</option>
						<option value="other"<%=fncSetSelectBox("other",arrList(2,0))%>>other</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품사용여부</th>
				<td>
					<select name="use_yn"  id="use_yn" valid="E|A=사용여부를 입력해주세요">
						<option value="">선택</option>
						<option value="Y"<%=fncSetSelectBox("Y",arrList(3,0))%>>Y</option>
						<option value="N"<%=fncSetSelectBox("N",arrList(3,0))%>>N</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>지점</th>
				<td>
					<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
						<option value="">지역</option>
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
						<option value="">지점</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td height="200">
					<input type="button" class="button" onclick="fncOpenPop('1')"  value="파일 첨부하기"/>
						<p style="padding-top:10px"><span id="fileNm_1" style="width:10px;">
						<%	If mm_img <> "" Then %>
							<img src="/upload_file/admin/photo/gift/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
						<%	End If %>
					</span><br /></p>
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
			<input type="hidden" name="idx" value="<%=idx%>">
 
 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>상품명</th>
				<td>
					<input type="text" id="P_name" name="P_name" size="20" value="" valid="E|M=10|A=상품명을 입력해주세요">
					 
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">선택</option>
						<option value="Skincare">Skincare</option>
						<option value="Babygear">Babygear</option>
						<option value="Nursery">Nursery</option>
						<option value="Toy">Toy</option>
						<option value="Living">Living</option>
						<option value="other">other</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품사용여부</th>
				<td>
					<select name="use_yn"  id="use_yn" valid="E|A=사용여부를 입력해주세요">
						<option value="">선택</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>지점</th>
				<td>
					<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
						<option value="">지역</option>
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
						<option value="">지점</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제품사진</th>
				<td height="200">
					<input type="button" class="button" onclick="fncOpenPop('1')"  value="파일 첨부하기"/>
						<p style="padding-top:10px"><span id="fileNm_1" style="width:10px;">
						<%	If mm_img <> "" Then %>
							<img src="/upload_file/admin/photo/gift/<%=mm_img%>" width='<%=width%>' height='<%=height%>'/>
						<%	End If %>
					</span><br /></p>
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
		"action" : "./reservation_gift_sql.asp"
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
	  var mem_nm = form.mem_nm.value;

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



 
 
 

          
 


</script>
</html>