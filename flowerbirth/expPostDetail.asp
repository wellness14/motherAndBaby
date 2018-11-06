<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	page = fncRequest("page")
	ba_idx = fncRequest("ba_idx")

	strSql = ""
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_MEM_NM "
	strSql = strSql & "			,BA_TITLE "
	strSql = strSql & "			,BA_CONTENT "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT "
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL) BA_LOCAL_NM "
	strSql = strSql & "			,ISNULL((SELECT TOP 1 BA_IDX FROM MO_BRD_PRAISE WHERE BA_DPH = 1 AND BA_CNLKBN='N' AND BA_IDX < '"& ba_idx &"' ORDER BY BA_SEQ DESC, BA_IDX DESC), 0) PREV_IDX "
	strSql = strSql & "			,ISNULL((SELECT TOP 1 BA_IDX FROM MO_BRD_PRAISE WHERE BA_DPH = 1 AND BA_CNLKBN='N' AND BA_IDX > '"& ba_idx &"'ORDER BY BA_SEQ, BA_IDX), 0) NEXT_IDX "
	strSql = strSql & "			,ROW_NUMBER() OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_PRAISE WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_IDX='"& ba_idx &"' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		mem_nm = Rs("BA_MEM_NM")
		title = Rs("BA_TITLE")
		content = Re_sqlFilter(Rs("BA_CONTENT"))
		content = Replace(content, Chr(10), "<br>")
		sec_flg = Rs("BA_SEC_FLG")
		reg_dt = Replace(Left(Rs("BA_REG_DT"), 10), "-", ".")
		ba_local_nm = Rs("BA_LOCAL_NM")

		If Not ba_local_nm = "본사" Then
			ba_local_nm = ba_local_nm & "지사"
		End If

		prev_idx = Rs("PREV_IDX")
		next_idx = Rs("NEXT_IDX")
	End If 
	Call RSClose(Rs)
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<title>마더앤베이비 산후도우미 소개</title>
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

	function expPostDetail(ba_idx, title) {
		if (ba_idx == 0) {
			alert(title + "글이 없습니다.");
			return false;
		}

		$("#ba_idx").val(ba_idx);
		$("#frm").attr("action", "expPostDetail.asp");
		$("#frm").submit();
	}

	function expPost() {
		$("#frm").attr("action", "expPost.asp");
		$("#frm").submit();
	}
</script>

</head>
<body>
<form name="frm" id="frm" class="frm" method="post">
	<input type="hidden" name="page" id="page" value="<%=page%>" />
	<input type="hidden" name="ba_idx" id="ba_idx" value="<%=ba_idx%>" />
</form>

<div class="contentWrap bg">
	<a href="#">
		<p>
			<strong>[<%=ba_local_nm%>]</strong><%=title%>
		</p>
		<span class="name"><%=mem_nm%></span><span class="date"><%=reg_dt%></span>
	</a>
	<div class="content">
		<p>
			<%=content%>
		</p>
		<ul>
			<li>
				<a onclick="expPost();" style="cursor:pointer;">
					<i class="fa fa-list" aria-hidden="true"></i><br/>
					목록
				</a>
			</li>
			<li>
				<a onclick="expPostDetail('<%=prev_idx%>', '이전');" style="cursor:pointer;">
					<i class="fa fa-chevron-left" aria-hidden="true"></i><br/>
					이전
				</a>
			</li>
			<li>
				<a onclick="expPostDetail('<%=next_idx%>', '다음');" style="cursor:pointer;">
					<i class="fa fa-chevron-right" aria-hidden="true"></i><br/>
					다음
				</a>
			</li>
		</ul>
	</div>
</div>
</body>
</html>