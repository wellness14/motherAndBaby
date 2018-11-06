<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode2 = "A" Then linkNum = "1"
	If menuCode2 = "B" Then linkNum = "2"
	If menuCode2 = "C" Then linkNum = "3"
	If menuCode2 = "D" Then linkNum = "4"
	If menuCode2 = "E" Then linkNum = "5"

	If  menuCode2 = "C" Then brd_id = "CONSULT"
    If  menuCode2 = "D" Then brd_id = "PRAISE"

	If menuCode2 = "C" Then
		tit = "<span style=""color:#ed587a;"">1:1문의</span> <span style=""color:#919194;"">하기</span>"
	ElseIf menuCode2 = "D" Then
		tit = "<span style=""color:#ed587a;"">칭찬</span> <span style=""color:#919194;"">하기</span>"
	End If

	'-----------------------------------------------------------------------------
	'	데이터 확인
		brd_tbl = "dbo.MO_BRD_"& brd_id &" "
	'-----------------------------------------------------------------------------

	'-----------------------------------------------------------------------------
	'	게시판 생성여부 확인
		strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			If Rs(0) = "N" Then 
				response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.2');history.back(-1);</script>"
				response.End 
			End If 
		End If 
		Call DBClose(Rs)
	'-----------------------------------------------------------------------------

	'-----------------------------------------------------------------------------
	'	게시판 기본 셋팅 정보 추출
		strSql = "SELECT "
		strSql = strSql & "		BM_BRD_TYPE "
		strSql = strSql & "		,BM_BRD_ID "
		strSql = strSql & "		,BM_SEC_FLG "
		strSql = strSql & "		,BM_FILE_CNT "
		strSql = strSql & "	FROM MO_BRD_MAS WITN(NOLOCK) "
		strSql = strSql & "	WHERE BM_BRD_ID='"& brd_id &"' AND BM_CNLKBN='N' AND BM_USE_FLG='Y' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			brd_type	= Rs("BM_BRD_TYPE")
			brd_sec		= Rs("BM_SEC_FLG")
			file_cnt	= Rs("BM_FILE_CNT")
		Else 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.1');history.back(-1);</script>"
			response.End 
		End If 
		Call DBClose(RS)
	'-----------------------------------------------------------------------------

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

		'페이지 Default Query String
		strDftUrl = "menuCode1=" & menuCode1
		strDftUrl = strDftUrl & "&menuCode2=" & menuCode2
		strDftUrl = strDftUrl & "&brd_id=" & brd_id
		strDftUrl = strDftUrl & "&brd_type=" & brd_type
		strDftUrl = strDftUrl & "&brd_sec=" & brd_sec
		strDftUrl = strDftUrl & "&file_cnt=" & file_cnt


		'페이지 값을 더한 Query String
		strLnkUrl = strDftUrl & "&page=" & page
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>

	<!-- 전환페이지 설정 -->
	<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
	<script type="text/javascript"> 
	var _nasa={};
	_nasa["cnv"] = wcs.cnv("5","10"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
	</script> 
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="">
		<div>
			<img src="/mobileweb/html/images/sub04_subtitle0<%=linkNum%>.jpg" />
		</div>

		<div style="background-color:#F6F6F6;" class="tal pb50 pl20 mt10">
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<div class="pt20">
				<img src="/mobileweb/html/images/text_0011.jpg" style="width:74px; height:20px;" />
				<input type="text" name="mem_nm" class="textarea" size="18" valid="E|M=10|A=성명을 입력해 주세요"/>
			</div>
			
			<% If brd_sec = "A" Or brd_sec = "Y" Then %>
			<div class="mt20">
				<img src="/mobileweb/html/images/text_0009.jpg" style="width:74px; height:20px;" />
				<input type="text" name="pw" class="textarea" size="18" valid="E|N|M=10|T=비밀번호|A=비밀번호를 입력해 주세요"/>
			</div>
			<% End If %>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0999.jpg" style="width:74px; height:20px;" />
				<input type="text" name="email" class="textarea" size="18" valid="E|M=60|A=연락처/이메일을 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0085.png" style="width:64px; height:21px; margin-right:10px;" />
				<select name="local" onChange="fncSetPart(this.value);" valid="E|A=지점을 선택해 주세요" style="height:35px;">
					<option value="">지역</option>
				<%
					If IsArray(arrLocal) Then 
						For num = 0 To UBound(arrLocal,2)
				%>
					<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
				<%
						Next 
					End If 
				%>
				</select>
				<select id="part" name="part" valid="E|A=지점을 선택해 주세요" style="height:35px;">
					<option value="">지점</option>
				</select>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0036.jpg" style="width:53px; height:19px; margin-right:21px;" />
				<input type="text" name="title" class="textarea" size="18" valid="E|M=200|A=제목을 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0038.jpg" style="width:53px; height:19px; margin-right:21px;" />
				<textarea name="content" class="textarea13" style="width:70%; height:150px;" valid="E|M=3000|A=내용을 입력해 주세요"></textarea>
			</div>
			</form>
		</div>
	</div>

	<div class="mt20" style="width:100%;">
		<img src="/mobileweb/html/images/bt_0013.jpg" style="width:150px; height:40px;" border="0" id="btnSubmit" style="cursor:pointer;"/>
		<img src="/mobileweb/html/images/bt_0002.jpg" style="width:150px; height:40px;" border="0" onClick="history.back(-1);" style="cursor:pointer;"/>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

<script type="text/javascript" src="/mobileweb/common/js/ajax_common.js"></script>
<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
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
		"action" : "./board_sql.asp?<%=strLnkUrl%>"
	});
</script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/mobileweb/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>

</html>