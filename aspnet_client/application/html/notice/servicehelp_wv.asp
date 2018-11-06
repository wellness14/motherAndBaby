<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    
	response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
	sQuery = "select top 1 * "
	sQuery = sQuery & " ,(select count(-1) from tb_boardFileinfo where bSeq = A.bSeq) as fileNum"
    sQuery = sQuery & " from tb_boardList A" 
    sQuery = sQuery & " where bbscode = '005' and useYN = 'Y' " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    Set oRS = oDb.Execute(sQuery)

	If oRs.eof Then 

	Else 
   
	   Dim AID,bTitle, bText, bSource, hit, noticeNum, fileNum,regDate,bSeq

	   AID		 = oRs("AID")
	   bTitle	 = oRs("bTitle")
	   bText	 = oRs("bText")
	   bSource	 = oRs("bSource")
	   hit		 = oRs("hit")
	   noticeNum = oRs("noticeNum")
	   fileNum   = oRs("fileNum")
	   regDate   = oRs("regDate")
	   bSeq        = oRs("bSeq")


	End If 

	oRs.close 

	sQuery = "update tb_boardList set hit = hit + 1 where bSeq = '"&bSeq&"' " 
    oDb.Execute(sQuery)


%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>맘초 서비스 소개</title>
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
<body class="bg_body">
<div class="wrap">
	<!-- 컨텐츠 -->
	<div class="sub_contents">
		<div class="service_view">
			<p><!--%=bTitle%--></p>
			                    <%
									sQuery = " select * from tb_boardFileinfo where bSeq = '"&bSeq&"' "
									Set oRS = oDb.Execute(sQuery)

									Do While Not ( oRs.eof or oRs.bof ) 

										Select Case oRs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<img src="""&oRs("FilePath")&"/"&oRs("filename")&""" width=""400"" /> <br/>"
										Case "mp4"
											Response.write "<video controls width=""400""/>"
										    Response.write "<source type=""video/mp4"" src="""&oRs("FilePath")&"/"&oRs("filename")&"""/>"
										    Response.write "</video> <br/>"
										end select
								
								    oRs.MoveNext
									Loop

									oRs.close									
								%>
			<p><%=replace(bText, chr(13)&chr(10), "<br>")	%></p>
		</div>
	</div>
	<!-- //컨텐츠 -->
</div>
</body>
</html>

<% 	call sDbClose() %>