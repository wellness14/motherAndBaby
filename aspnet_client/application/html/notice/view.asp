<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim bbscode,bSeq
bbscode = Request("bbscode")
bSeq = Request("bSeq")


   Dim AID,bTitle, bText, bSource, hit, noticeNum, fileNum,regDate,startDate, endDate
   sQuery = "select * "
   sQuery = sQuery & " ,(select count(-1) from tb_boardFileinfo where bSeq = A.bSeq) as fileNum"
   sQuery = sQuery & " from tb_boardList A" 
   sQuery = sQuery & " where bSeq = '"&bSeq&"' " 
   Set oRS = oDb.Execute(sQuery)

   AID		 = oRs("AID")
   bTitle	 = oRs("bTitle")
   bText	 = oRs("bText")
   bSource	 = oRs("bSource")
   hit		 = oRs("hit")
   noticeNum = oRs("noticeNum")
   fileNum   = oRs("fileNum")
   regDate   = oRs("regDate")
   startDate   = oRs("startDate")
   endDate   = oRs("endDate")


   oRs.close
   
   sQuery = "update tb_boardList set hit = hit + 1 where bSeq = '"&bSeq&"' " 
   oDb.Execute(sQuery)

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>baby 모바일 </title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico"/>
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
		<div class="view_tit">
			<p><%=bTitle%></p>
			<span><% If bbscode="003" Then%>기간 : <%=endDate%> ~ <%=endDate%><%else%><%=Left(regDate,10)%><%End if%> </span>
		</div>
		<div class="view_content">
			                     <%
								    Dim i 
								    i = 1
									sQuery = " select * from tb_boardFileinfo where bSeq = '"&bSeq&"' "
									Set oRS = oDb.Execute(sQuery)

									Do While Not ( oRs.eof or oRs.bof ) 

										If bbscode = "003" And i = 1 Then 

										Else 
										Select Case oRs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<img src="""&oRs("FilePath")&"/"&oRs("filename")&""" /> <br/>"
										Case "mp4"
											Response.write "<video controls width=""100%""/>"
										    Response.write "<source type=""video/mp4"" src="""&oRs("FilePath")&"/"&oRs("filename")&"""/>"
										    Response.write "</video> <br/>"
										end Select
                                        End If  
										
								    i = i + 1
								    oRs.MoveNext
									Loop

									oRs.close									
								%>
			<p><%=replace(bText, chr(13)&chr(10), "<br>")	%></p>
			<%If bSource <> "" then%><br/><p><b>[<a href="ex<%=bSource%>">바로가기</a>]</b></p><%End if%>
		</div>
	</div>
	<!-- //컨텐츠 -->
</div>
</body>
</html>
<% 	call sDbClose() %>