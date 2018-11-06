<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_ins.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
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
	<!-- 달력 추가 -->
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

		strTable = " FROM MO_BRD_NOTICE WITH(NOLOCK) "
 		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON BA_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE BA_IDX = '"& idx &"' "

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
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_IDX DESC) ROWNUM "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			birthday = Rs(6)
			mode	= "upd" 

			BA_IDX			= Rs(0)	 ' 자동증가
			BA_SEQ			= Rs(1)  '+1
			BA_DPH			= Rs(2)  '1 고정값
			BA_PIDX			= Rs(3)	 '+1
			BA_TYPE			= Rs(4)  '공지
			BA_MEM_ID		= Rs(5)  ' 
			BA_MEM_NM		= Rs(6)  '
			BA_TITLE		= Rs(7)  '제목 
			BA_CONTENT		= Rs(8)  '내용
			BA_SEC_FLG		= Rs(9)		' N 고정값
			BA_SEC_NUM		= Rs(10)	'널
			BA_CNLKBN		= Rs(11)	'삭제구분
			BA_REG_DT		= Rs(12) '등로날짜
			BA_UPD_DT		= Rs(13)  '수정날짜
			BA_IP			= Rs(14) 'IP
			BA_EMAIL		= Rs(15) 
			BA_CNT			= Rs(16) 
			BA_UNI_NM		= Rs(17) '널
			BA_FILE_NM		= Rs(18) '널
			BA_FILE_PATH	= Rs(19) '널
			BA_NOTICE_FLG	= Rs(20) 'M 모바일  

			arrList = Rs.GetRows()

		End If 
		Call DBClose(Rs) : DBClose(Rs1)
	Else 
	'	response.Write "<script type='text/javascript'>history.back(-1);</script>"
	'	response.End 
	End If 
%>
 
 
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong></div>
		<div class="write">
			<br />
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=BA_IDX%>">
			<input type="hidden" name="uId" value="<%=uId%>">
 
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
 
			<tr>
				<th>작성자</th>
				<td><% If BA_MEM_NM <> ""  Then %><%=BA_MEM_NM%> <% Else %><input type="text"	name="ba_uname" id="ba_uname" value="<%=BA_MEM_NM%>"/> <%End If %></td>
			</tr>
			<%If idx <> "" Then %>
			<tr>
				<th>등록일</th>
				<td><% If BA_REG_DT <> ""  Then %><%=BA_REG_DT%> <% Else %> <%End If %></td>
			</tr> 
			<%End if%>
			<tr>
				<th>제목</th>
				<td>
					<input type="text"	name="ba_title" id="ba_title" value="<%=BA_TITLE%>" size="100"/> 
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea	name="notice_content" id="notice_content" style="width:100%; height:200px;"><%=BA_CONTENT%></textarea>
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

<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<!-- 달력추가 시작-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<script> 
$(document).ready(function() {	   
	$( "#datepicker" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		  yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
  }); 
</script>
<!-- 달력추가 끝-->
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnDel	= jQuery('#btnDelte');

	btnDel.click(function(){
		if (confirm("삭제 하시겠습니까?")) {
			jQuery('#ifrm').attr({'src':'./mobile_notice_sql.asp?mode=del&idx=<%=idx%>'});
		}
	});

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./mobile_notice_sql.asp"
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