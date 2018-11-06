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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>통계관리</strong></div>
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
				<th>서비스 프로그램명</th>
				<td>
					<select name="ser_program"  id="ser_program">
						<option value="">선택</option>
						<option value="베이직"<%=fncSetSelectBox("베이직",arrList(1,0))%>>베이직</option>
						<option value="프리미엄"<%=fncSetSelectBox("프리미엄",arrList(1,0))%>>프리미엄</option>
						<option value="VIP"<%=fncSetSelectBox("VIP",arrList(1,0))%>>VIP</option>
						<option value="프라이빗"<%=fncSetSelectBox("프라이빗",arrList(1,0))%>>프라이빗</option>
						<option value="쌍둥이케어"<%=fncSetSelectBox("쌍둥이케어",arrList(1,0))%>>쌍둥이케어</option>
						<option value="다둥이케어"<%=fncSetSelectBox("다둥이케어",arrList(1,0))%>>다둥이케어</option>
						<option value="워킹맘"<%=fncSetSelectBox("워킹맘",arrList(1,0))%>>워킹맘</option>
						<option value="과체중"<%=fncSetSelectBox("과체중",arrList(1,0))%>>과체중</option>
						<option value="35세이상"<%=fncSetSelectBox("35세이상",arrList(1,0))%>>35세이상</option>
						<option value="산후조리원을내집에"<%=fncSetSelectBox("산후조리원을내집에",arrList(1,0))%>>산후조리원을내집에</option>
						<option value="상담후결정"<%=fncSetSelectBox("상담후결정",arrList(1,0))%>>상담후결정</option>
						<option value="추가비용-가족-미취학아동"<%=fncSetSelectBox("추가비용-가족-미취학아동",arrList(1,0))%>>추가비용-가족-미취학아동</option>
						<option value="추가비용-가족-취학아동"<%=fncSetSelectBox("추가비용-가족-취학아동",arrList(1,0))%>>추가비용-가족-취학아동</option>
						<option value="추가비용-가족-추가가족"<%=fncSetSelectBox("추가비용-가족-추가가족",arrList(1,0))%>>추가비용-가족-추가가족</option>
						<option value="추가비용-쌍둥이케어"<%=fncSetSelectBox("추가비용-쌍둥이케어",arrList(1,0))%>>추가비용-쌍둥이케어</option>
						<option value="추가비용-시간초과-베이직"<%=fncSetSelectBox("추가비용-시간초과-베이직",arrList(1,0))%>>추가비용-시간초과-베이직</option>
						<option value="추가비용-시간초과-프리미엄"<%=fncSetSelectBox("추가비용-시간초과-프리미엄",arrList(1,0))%>>추가비용-시간초과-프리미엄</option>
						<option value="추가비용-시간초과-프라이빗"<%=fncSetSelectBox("추가비용-시간초과-프라이빗",arrList(1,0))%>>추가비용-시간초과-프라이빗</option>
						<option value="추가비용-시간초과-VIP"<%=fncSetSelectBox("추가비용-시간초과-VIP",arrList(1,0))%>>추가비용-시간초과-VIP</option>
						<option value="추가비용-시간초과-다둥이케어"<%=fncSetSelectBox("추가비용-시간초과-다둥이케어",arrList(1,0))%>>추가비용-시간초과-다둥이케어</option>
						<option value="추가비용-휴일근무-베이직"<%=fncSetSelectBox("추가비용-휴일근무-베이직",arrList(1,0))%>>추가비용-휴일근무-베이직</option>
						<option value="추가비용-휴일근무-프리미엄"<%=fncSetSelectBox("추가비용-휴일근무-프리미엄",arrList(1,0))%>>추가비용-휴일근무-프리미엄</option>
						<option value="추가비용-휴일근무-프라이빗"<%=fncSetSelectBox("추가비용-휴일근무-프라이빗",arrList(1,0))%>>추가비용-휴일근무-프라이빗</option>
						<option value="추가비용-휴일근무-VIP"<%=fncSetSelectBox("추가비용-휴일근무-VIP",arrList(1,0))%>>추가비용-휴일근무-VIP</option>
						<option value="추가비용-휴일근무-다둥이케어"<%=fncSetSelectBox("추가비용-휴일근무-다둥이케어",arrList(1,0))%>>추가비용-휴일근무-다둥이케어</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스타입</th>
				<td>
					<select name="cate"  id="cate">
						<option value="">선택</option>
						<option value="입주"<%=fncSetSelectBox("입주",arrList(2,0))%>>입주</option>
						<option value="입주(주6일)"<%=fncSetSelectBox("입주(주6일)",arrList(2,0))%>>입주(주6일)</option>
						<option value="출퇴근"<%=fncSetSelectBox("출퇴근",arrList(2,0))%>>출퇴근</option>
						<option value="출퇴근 + 5일"<%=fncSetSelectBox("출퇴근 + 5일",arrList(2,0))%>>출퇴근+5일</option>
						<option value="출퇴근 + 6일"<%=fncSetSelectBox("출퇴근 + 6일",arrList(2,0))%>>출퇴근+6일</option>
						<option value="출퇴근 + 입주"<%=fncSetSelectBox("출퇴근 + 입주",arrList(2,0))%>>출퇴근 + 입주</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스기간</th>
				<td>
					<select name="term"  id="term">
						<option value="">선택</option>
						<option value="1주"<%=fncSetSelectBox("1주",arrList(3,0))%>>1주</option>
						<option value="2주"<%=fncSetSelectBox("2주",arrList(3,0))%>>2주</option>
						<option value="3주"<%=fncSetSelectBox("3주",arrList(3,0))%>>3주</option>
						<option value="4주"<%=fncSetSelectBox("4주",arrList(3,0))%>>4주</option>
						<option value="입주2주+출퇴근2주"<%=fncSetSelectBox("입주2주+출퇴근2주",arrList(3,0))%>>입주2주 + 출퇴근2주</option>
						<option value="1일"<%=fncSetSelectBox("1일",arrList(3,0))%>>1일</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스가격</th>
				<td>
					<input type="text" name="price" value="<%=arrList(4,0)%>" />
				</td>
			</tr>
			<tr>
				<th>코드</th>
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
				<th>서비스 프로그램명</th>
				<td>
					<select name="ser_program"  id="ser_program">
						<option value="">선택</option>
						<option value="베이직">베이직</option>
						<option value="프리미엄">프리미엄</option>
						<option value="VIP">VIP</option>
						<option value="프라이빗">프라이빗</option>
						<option value="쌍둥이케어">쌍둥이케어</option>
						<option value="다둥이케어">다둥이케어</option>
						<option value="워킹맘">워킹맘</option>
						<option value="과체중">과체중</option>
						<option value="35세이상">35세이상</option>
						<option value="산후조리원을내집에">산후조리원을내집에</option>
						<option value="상담후결정">상담후결정</option>
						<option value="추가비용-가족-미취학아동">추가비용-가족-미취학아동</option>
						<option value="추가비용-가족-취학아동">추가비용-가족-취학아동</option>
						<option value="추가비용-가족-추가가족">추가비용-가족-추가가족</option>
						<option value="추가비용-쌍둥이케어">추가비용-쌍둥이케어</option>
						<option value="추가비용-시간초과-베이직">추가비용-시간초과-베이직</option>
						<option value="추가비용-시간초과-프리미엄">추가비용-시간초과-프리미엄</option>
						<option value="추가비용-시간초과-프라이빗">추가비용-시간초과-프라이빗</option>
						<option value="추가비용-시간초과-VIP">추가비용-시간초과-VIP</option>
						<option value="추가비용-시간초과-다둥이케어">추가비용-시간초과-다둥이케어</option>
						<option value="추가비용-휴일근무-베이직">추가비용-휴일근무-베이직</option>
						<option value="추가비용-휴일근무-프리미엄">추가비용-휴일근무-프리미엄</option>
						<option value="추가비용-휴일근무-프라이빗">추가비용-휴일근무-프라이빗</option>
						<option value="추가비용-휴일근무-VIP">추가비용-휴일근무-VIP</option>
						<option value="추가비용-휴일근무-다둥이케어">추가비용-휴일근무-다둥이케어</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스타입</th>
				<td>
					<select name="cate" id="cate">
						<option value="">선택</option>
						<option value="입주">입주</option>
						<option value="입주(주6일)">입주(주6일)</option>
						<option value="출퇴근">출퇴근</option>
						<option value="출퇴근 + 5일">출퇴근+5일</option>
						<option value="출퇴근 + 6일">출퇴근+6일</option>
						<option value="출퇴근 + 입주">출퇴근 + 입주</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스기간</th>
				<td>
					<select name="term" id="term">
						<option value="">선택</option>
						<option value="1주">1주</option>
						<option value="2주">2주</option>
						<option value="3주">3주</option>
						<option value="4주">4주</option>
						<option value="입주2주+출퇴근2주">입주2주 + 출퇴근2주</option>
						<option value="1일">1일</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>서비스가격</th>
				<td>
					<input type="text" name="price" value="" />
				</td>
			</tr>
			<tr>
				<th>코드</th>
				<td>
					<input type="text" name="code" value="" />
				</td>
			</tr>
			<!--tr>
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
			</tr-->
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