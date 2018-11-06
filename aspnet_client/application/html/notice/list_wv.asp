<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->

<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>맘초 공지_뉴스_이벤트</title>
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
<body>


<div class="wrap">
	<!-- 컨텐츠 -->
	<div class="sub_contents">
		<!-- 탭메뉴 -->
		<div id="tabs">
			<div class="tab_ui">
				<ul>
					<li><a href="#tabs-1" >공지</a></li>
					<li><a href="#tabs-2">뉴스</a></li>
					<li><a href="#tabs-3">이벤트</a></li>
				</ul>
			</div>
			<div id="tabs-1" class="tab_list">
				<!-- 공지 -->
<%
    sQuery = "select * "
    sQuery = sQuery & " from tb_boardList A" 
    sQuery = sQuery & " where bbscode = '001' and useYN = 'Y' " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    Set oRS = oDb.Execute(sQuery)
    
	Do While Not ( oRs.eof or oRs.bof ) 
%>
		        <div class="ellipsis">
					<p><a href="view.asp?bbscode=001&bSeq=<%=oRs("bSeq")%>"><%=oRs("bTitle")%></a><% if (cint(datediff("d", oRs("regDate"), date())) < 3) then%><img src="/application/html/img/ico_new.png" alt="new 아이콘"/><%End if%></p> 
					<span><%=Left(oRs("regDate"),10)%></span>
				</div>
<% 
       
	   oRs.MoveNext
	   Loop
	   oRs.close
	 
%>
				<!-- //공지 -->
			</div>
			<div id="tabs-2" class="tab_list">
				<!-- 뉴스 -->
	<%
    sQuery = "select * "
    sQuery = sQuery & " from tb_boardList A" 
    sQuery = sQuery & " where bbscode = '002' and useYN = 'Y' " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    Set oRS = oDb.Execute(sQuery)
    
	Do While Not ( oRs.eof or oRs.bof ) 
%>
				<div class="ellipsis">
					<p><a href="view.asp?bbscode=002&bSeq=<%=oRs("bSeq")%>"><%=oRs("bTitle")%></a><% if (cint(datediff("d", oRs("regDate"), date())) < 7) then%><img src="/application/html/img/ico_new.png" alt="new 아이콘"/><%End if%></p> 
					<span><%=Left(oRs("regDate"),10)%></span>
				</div>
<% 
       
	   oRs.MoveNext
	   Loop
	   oRs.close
	 
%>
				<!-- //뉴스 -->
			</div>
			<div id="tabs-3" class="tab_list">
				<!-- 이벤트 -->
	<%
    sQuery = "select * "
    sQuery = sQuery & " from tb_boardList A" 
    sQuery = sQuery & " where bbscode = '003' and useYN = 'Y' " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    Set oRS = oDb.Execute(sQuery)
    
	Do While Not ( oRs.eof or oRs.bof ) 
%>			
				<div class="event_box">
					<%
					Dim filename
					sQuery = " select top 1 * from tb_boardFileinfo where bSeq = '"&oRs("bSeq")&"' order by regDate asc "
					Set RS = oDb.Execute(sQuery)

					filename = Rs("FilePath")&"/"&Rs("filename")

					Rs.close
					%>

					<a href="#" class="event_img"><img src="<%=filename%>" alt="이미지"/></a>
					<div class="">
						<p><a href="view.asp?bbscode=003&bSeq=<%=oRs("bSeq")%>"><%=oRs("bTitle")%></a></p> 
						<span>기간 : <%=oRs("startDate")%> ~ <%=oRs("endDate")%></span>
					</div>
				</div>
<% 
       
	   oRs.MoveNext
	   Loop
	   oRs.close
	 
%>
		
				</div>
				<!-- //이벤트 -->
			</div>
		</div>
		<!-- //탭메뉴 -->
	</div>
	<!-- //컨텐츠 -->
</div>
<script type="text/javascript">
//<![CDATA[
jQuery(function($){
//탭메뉴
$("#tabs").tabs();
});
//]]>
</script>
</body>
</html>