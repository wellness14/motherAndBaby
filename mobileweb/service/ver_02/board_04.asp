<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "50000" 
	If menuCode2 = "" Then menuCode2 = "D"

	brd_id = "PRAISE"

	page = fncRequest("page")
	If page = "" Then page = 1

	page_size = 10
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

	'--------------------------------------------------------------------------
	'	칭찬합시다 리스트 호출
		strSql = "SELECT COUNT(BA_IDX) "
		strSql = strSql & "FROM MO_BRD_PRAISE WITH(NOLOCK) "
		strSql = strSql & "WHERE BA_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			intTotalCnt = Rs(0)
		End If 
		Call RSClose(Rs)

		strSql = " SELECT *	"
		strSql = strSql & " FROM		"
		strSql = strSql & " (	 "
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_IDX "
		strSql = strSql & "			,BA_DPH "
		strSql = strSql & "			,BA_PIDX "
		strSql = strSql & "			,BA_MEM_NM  "
		strSql = strSql & "			,BA_TITLE   "
		strSql = strSql & "			,BA_SEC_FLG "
		strSql = strSql & "			,BA_REG_DT	"
		strSql = strSql & "			,RE_CNT = (SELECT COUNT(1) FROM MO_BRD_CONSULT B WHERE B.BA_PIDX=A.BA_IDX AND B.BA_DPH='2') "
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
		strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL) BA_LOCAL_NM	"
		strSql = strSql & "		FROM MO_BRD_PRAISE A WITH(NOLOCK) "
		strSql = strSql & "		WHERE BA_CNLKBN='N' "
		strSql = strSql & "  ) T1 "
		strSql = strSql & " WHERE  "
		strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
	<link rel="stylesheet" type="text/css" href="css/old_mobile.css" />
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
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">칭찬</span><span style="color:#919194;">하기</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div class="mt20"></div>

		<!-- <table border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub04_subtitle04.jpg" /></td>
			</tr>
		</table> -->
		<table border="0" align="right" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:5px; padding-bottom:15px; padding-right:10px;"><div align="right"><a href="./board_write.asp?menuCode1=<%=menuCode1%>&menuCode2=<%=menuCode2%>"><img src="/mobileweb/html/images/bt_0011.jpg" width="110" border="0" /></a></div></td>
			</tr>
		</table>
		<table class="table" style="font-size:10pt;">
			<colgroup>
				<!-- <col width="12%" /> -->
				<col width="20%" />
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<!-- <th style="padding:0px; padding-top:3px; padding-bottom:3px;">번호</th> -->
				<th style="padding:0px; padding-left:3px;  padding-top:3px; padding-bottom:3px;">지사</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">제목</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성자</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성일</th>
			</thead>
			<tbody>
			<%
				If IsArray(arrList) Then 
					For num=0 To UBound(arrList,2)
						intNum		= intTotalCnt - (page-1) * page_size - num
						ba_idx		= Trim(arrList(0,num))
						ba_dph		= Trim(arrList(1,num))
						ba_pidx		= Trim(arrList(2,num))
						mem_nm		= Trim(arrList(3,num))
						title		= Trim(arrList(4,num))
						sec_flg		= arrList(5,num)
						reg_dt		= Left(arrList(6,num),10)
						re_cnt		= arrList(7,num)
						ba_local_nm   = Trim(arrList(9,num))
						re_nm = "답변대기"
						If re_cnt > 0 Or ba_dph = 2 Then 
							re_nm = "답변완료"
						End If 

						If ba_dph = 2 Then 
							ba_idx = ba_pidx
						End If 
			%>
				<tr <% If ba_dph <> "1" Then %> class="active" <% End If %>>
					<!-- <td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=intNum%></td> -->
					<td style="padding:0px; padding-left:3px;  padding-top:3px; padding-bottom:3px;"><%=ba_local_nm%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;" align="left">
						<% If ba_dph <> "1" Then %> <img src="/image/img_0007.jpg" style="width:21px;" align="absmiddle" /> <% End If %>
						<a href="#" onClick="fncView('<%=sec_flg%>','<%=ba_idx%>','<%=intNum%>');"><%=title%></a>
					</td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=mem_nm%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=reg_dt%></td>
				</tr>
			<%
					Next
				End If 
			%>
			</tbody>
		</table>

		<p style="margin-top:20px;"></p>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td id="brdPager"></td>
			</tr>
		</table>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

<form id="ofrm" name="ofrm" method="post" action="board_01_view.asp">
	<input type="hidden" name="menuCode1" value="<%=menuCode1%>">
	<input type="hidden" name="menuCode2" value="<%=menuCode2%>">
	<input type="hidden" id="idx" name="idx" value="">
	<input type="hidden" id="num" name="num" value="">
	<input type="hidden" name="brd_id" value="<%=brd_id%>">
	<input type="hidden" name="sec_flg" value="Y">
</form>

</body>

<script type="text/javascript" src="js/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery('#brdPager').setPager_info('<%=page%>','<%=strPathInfo%>?x=','<%=intTotalCnt%>','<%=intPreCP%>','<%=intCP%>','<%=intNextCP%>', { nppg : '<%=page_size%>'});

	function fncView(flg,idx,num) {
		if (flg == "N") {
			fncFormSubmit(idx,num);
		} else {
			window.open("./board_pop.asp?idx="+ idx +"&num="+ num +"&brd_id=<%=brd_id%>&<%=strParam%>","board_view","width=500px, height=200px");
		}
	}

	function fncFormSubmit(idx,num){
		jQuery("#ofrm").children("input").eq(2).val(idx);
		jQuery("#ofrm").children("input").eq(3).val(num);
		jQuery("#ofrm").submit();
	}
</script>

</html>
