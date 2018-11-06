<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	page_size = 10

	page = fncRequest("page")

	If page = "" Then page = 1

	startNum = (page-1) * page_size

	endNum = startNum + page_size

	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_PRAISE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_DPH = 1 AND BA_CNLKBN='N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	total_page = intTotalCnt / page_size
	total_page = -(Int(-(total_page)))

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
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL_DETAIL) BA_LOCAL_NM2		"
	strSql = strSql & "		FROM MO_BRD_PRAISE A WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_DPH = 1 AND BA_CNLKBN='N' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.getRows()
	End If 
	Call RSClose(Rs)
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<title>마더앤베이비 산후도우미 체험후기</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>
	
</style>
<script src="js/jquery-1.11.3.min.js"></script>
<script>
	window.onload = function() {
        // post our message to the parent
        window.parent.postMessage(
            // get height of the content
            document.body.scrollHeight
            // set target domain
            ,"*"
        )
    };

	$(document).ready(function(){

	});

	function expPostDetail(ba_idx) {
		$("#ba_idx").val(ba_idx);
		$("#frm").attr("action", "expPostDetail.asp");
		$("#frm").submit();
	}

	function pageMove(page) {
		if (page == 0) {
			alert("이전 페이지가 없습니다.");
			return false;
		}

		if (page > $("#total_page").val()) {
			alert("다음 페이지가 없습니다.");
			return false;
		}

		$("#page").val(page);
		$("#frm").attr("action", "expPost.asp");
		$("#frm").submit();
	}
</script>

</head>
<body>
<form name="frm" id="frm" class="frm" method="post">
	<input type="hidden" name="page" id="page" value="<%=page%>" />
	<input type="hidden" name="total_page" id="total_page" value="<%=total_page%>" />
	<input type="hidden" name="ba_idx" id="ba_idx" />
</form>

<div class="contentWrap">
	<%
		If IsArray(arrList) Then 
			For num=0 To UBound(arrList,2)
				ba_idx = Trim(arrList(0,num))
				mem_nm = Trim(arrList(3,num))
				title = Trim(arrList(4,num))
				reg_dt = Replace(Left(arrList(6,num),10), "-", ".")
				ba_local_nm = Trim(arrList(9,num))

				If Not ba_local_nm = "본사" Then
					ba_local_nm = ba_local_nm & "지사"
				End If
	%>
				<a onclick="expPostDetail(<%=ba_idx%>);" style="cursor:pointer;">
					<p>
						<strong>[<%=ba_local_nm%>]</strong><%=title%>
					</p>
					<span class="name"><%=mem_nm%></span><span class="date"><%=reg_dt%></span>
				</a>
	<%
			Next
		End If
	%>
	<!-- <span class="lazyload">
		<i class="fa fa-angle-double-down" aria-hidden="true"></i>
	</span> -->
	<ul>
		<li>
			<a onclick="pageMove(<%=page - 1%>);" style="cursor:pointer;">이전</a>
		</li>
		<li>
			<strong class="color"><%=page%></strong> / <%=total_page%>
		</li>
		<li>
			<a onclick="pageMove(<%=page + 1%>);" style="cursor:pointer;">다음</a>
		</li>
	</ul>
</div>
</body>
</html>