<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "50000" 
	If menuCode2 = "" Then menuCode2 = "E"

	brd_id = "EVENT"

	'--------------------------------------------------------------------------
	'	이벤트 리스트 호출
		strSql = "SELECT "
		strSql = strSql & "		BA_IDX "
		strSql = strSql & "		,BA_TITLE "
		strSql = strSql & "		,BA_SEC_FLG "
		strSql = strSql & "		,BA_STD_SDT "
		strSql = strSql & "		,BA_STD_EDT "
		strSql = strSql & "		,BA_FILE_NM "
		strSql = strSql & "		,BA_FILE_PATH "
		strSql = strSql & "FROM MO_BRD_EVENT WITH(NOLOCK) "
		strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' AND BA_FILE_PATH !='' "
		strSql = strSql & "ORDER BY BA_IDX DESC "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrEventList = Rs.getRows()
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
				<span style="color:#ed587a;">이벤트</span> <span style="color:#919194;"></span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div class="mt20"></div>

		<!-- <div style="text-align:left; margin-bottom:20px;">
			<img src="/mobileweb/html/images/sub04_subtitle05.jpg" />
		</div> -->

		<table style="text-align:left;">
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
		<%
			Dim strEventList : strEventList = ""
			Dim strImg : strImg = ""
			Dim strTxt : strTxt = ""
			Dim arrFilePath : arrFilePath = Null
			If IsArray(arrEventList) Then 
				intTotalCnt = UBound(arrEventList,2)
				For num = 0 To intTotalCnt
				'------------------------------------------------
				'	이미지 영역
					idx			= Trim(arrEventList(0,num))
					title		= Trim(arrEventList(1,num))
					sdate		= Replace(arrEventList(3,num),"-",".")
					edate		= Replace(arrEventList(4,num),"-",".")
					file_path	= arrEventList(6,num)
					If file_path <> "" Then arrFilePath = Split(file_path,"||")

		%>
				<tr>
					<td rowspan="2"><img src='/upload_file/file/<%=arrFilePath(0)%>' border='0' onclick="fncView('N','<%=idx%>','');" style='cursor:pointer;'/></td>
					<td style="padding-left:10px; font-weight:bold;"><%=title%></td>
				</tr>
				<tr>
					<td style="padding-left:10px; color:#aaaaaa;"><%=sdate%> ~ <%=edate%></td>
				</tr>
				<tr height="1">
					<td colspan="2"><hr/></td>
				</tr>
		<%
				Next
			End If 
		%>
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

<script type="text/javascript">
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
