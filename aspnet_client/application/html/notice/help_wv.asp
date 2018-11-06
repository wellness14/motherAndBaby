<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    
	response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
	sQuery = "select * "
    sQuery = sQuery & " from tb_boardList A" 
    sQuery = sQuery & " where bbscode = '004' and useYN = 'Y' " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    Set oRS = oDb.Execute(sQuery)

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>맘초 도움말</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
<link href='//fonts.googleapis.com/css?family=Noto+Sans' rel='stylesheet' type='text/css'><!-- 웹폰트적용 웹에서는 적용 안되 보임. -->
<link href="/application/html/css/reset.css" type="text/css" rel="stylesheet" />
<link href="/application/html/css/ui.css" type="text/css" rel="stylesheet" />
<script src="/application/html/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="/application/html/js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
</head>
<body class="bg_body">
<div class="wrap">
	<!-- 컨텐츠 -->
	<div class="sub_contents">
		<p class="help_tit">본 서비스와 관련하여 자주 묻는 질문입니다.<br/>기타 자세한 사항은 문의하기를 이용하시기 바랍니다. </p>
		<div id="accordion" class="help_nb">
<%
Do While Not ( oRs.eof or oRs.bof ) 

%>
		  <h3><%=oRs("bTitle")%></h3>
		  <div>
			<p>
			<%=oRs("bText")%> 
			</p>
		  </div>
<% 
       
	   oRs.MoveNext
	   Loop

	   oRs.close
	   Set oRs = Nothing
%>
		</div>
	</div>
	<!-- //컨텐츠 -->
</div>
<script type="text/javascript">
//<![CDATA[
jQuery(function($){
	//아코디언
	$( "#accordion" ).accordion({
		collapsible: true,
		active:false,
		heightStyle:"content"
	});
});
//]]>
</script>
</body>
</html>

<% 	call sDbClose() %>