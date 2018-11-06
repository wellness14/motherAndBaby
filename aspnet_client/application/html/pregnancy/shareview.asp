<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim uCode
uCode = request("uCode")

%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>산후용품체크리스트</title>
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
<body>
<div class="wrap">
	<!-- 헤더 -->
	<div class="header">
		<!-- 헤더 타이틀 -->
		<h2 class="bu_arrow"><a href="#">스마트 출산 용품 체크</a></h2>
		<!-- //헤더 타이틀 -->
	</div>
	<!-- //헤더 -->
	<!-- 컨텐츠 -->
   
   <% 
   sQuery = "select * "
   sQuery = sQuery & ",(select top 1 nickname from tb_UserInfo where uSeq = A.uSeq) as nickname "
   sQuery = sQuery & " from tb_pregnancyUserInfo A " 
   sQuery = sQuery & " where uSeq = '"&uCode&"' " 
   Set oRS = oDb.Execute(sQuery)

   If oRs.eof then 

   Else 
     
	 Dim nickname, utitle,regDate 
	 nickname = oRs("nickname")
	 utitle = oRs("utitle")
	 regDate = oRs("regDate")

   End If 
   
   oRs.close 
   %>
   
	<div class="smartBox">
		<p><%=utitle%></p>
		<span class="smartName"><%=nickname%>&nbsp;[<%=regDate%>] </span>
		<div class="">
			<a href="#" class="btn_comd">추천 클릭</a><!--span>01</span-->
		</div>
	</div>
	<div class="smartTab">
		<ul class="">
			<li><a href="#smartNb1">초기</a></li>
			<li><a href="#smartNb2">중기</a></li>
			<li><a href="#smartNb3">후기</a></li>
			<li><a href="#smartNb4">산욕기</a></li>
		</ul>
		<div id="smartNb1" class="smartContent">
			<!-- 탭내용 -->
			<table>
				<caption>스마트 테이블</caption>
				<thead>
					<tr>
						<th style="width:55%;"><span>용품</span></th>
						<th><span>필요개수</span></th>
						<th><span>체크</span></th>
					</tr>
				</thead>
				<tbody>
<% 
Dim i , lineMod, lineTag
Dim intCount, checkYN, kCount, Tipkeyword, y, checkName
sQuery = "select * from tb_pregnancyCheckList where period = '1' order by orderNum asc"
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&uCode&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   checkName = "<span></span>"
			   Else 
			   checkYN = ""
			   checkName = ""
			   End If 
			   Rs.close

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   Tipkeyword = Tipkeyword & Rs("TipKeyword")
			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  

%>

					
					<tr>
						<td><%=oRs("gTitle")%> <br/><%=Tipkeyword%> </td>
						<td><%=oRs("gNumber")%></td>
						<td><%=checkName%></td>
					</tr>
<% 
       i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
%>
				</tbody>
			</table>
			<!-- //탭내용 -->
		</div>
		<div id="smartNb2" class="smartContent">
			<!-- 탭내용 -->
			<table>
				<caption>스마트 테이블</caption>
				<thead>
					<tr>
						<th style="width:55%;"><span>용품</span></th>
						<th><span>필요개수</span></th>
						<th><span>체크</span></th>
					</tr>
				</thead>
				<tbody>
<% 
sQuery = "select * from tb_pregnancyCheckList where period = '2' order by orderNum asc"
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&uCode&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   checkName = "<span></span>"
			   Else 
			   checkYN = ""
			   checkName = ""
			   End If 
			   Rs.close

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   Tipkeyword = Tipkeyword & Rs("TipKeyword")
			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  

%>

					
					<tr>
						<td><%=oRs("gTitle")%> <br/><%=Tipkeyword%> </td>
						<td><%=oRs("gNumber")%></td>
						<td><%=checkName%></td>
					</tr>
<% 
       i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
%>
				</tbody>
			</table>
			<!-- //탭내용 -->
		</div>
		<div id="smartNb3" class="smartContent">
			<!-- 탭내용 -->
			<table>
				<caption>스마트 테이블</caption>
				<thead>
					<tr>
						<th style="width:55%;"><span>용품</span></th>
						<th><span>필요개수</span></th>
						<th><span>체크</span></th>
					</tr>
				</thead>
				<tbody>
<% 
sQuery = "select * from tb_pregnancyCheckList where period = '3' order by orderNum asc"
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&uCode&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   checkName = "<span></span>"
			   Else 
			   checkYN = ""
			   checkName = ""
			   End If 
			   Rs.close

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   Tipkeyword = Tipkeyword & Rs("TipKeyword")
			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  

%>

					
					<tr>
						<td><%=oRs("gTitle")%> <br/><%=Tipkeyword%> </td>
						<td><%=oRs("gNumber")%></td>
						<td><%=checkName%></td>
					</tr>
<% 
       i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
%>
				</tbody>
			</table>
			<!-- //탭내용 -->
		</div>
		<div id="smartNb4" class="smartContent">
			<!-- 탭내용 -->
			<table>
				<caption>스마트 테이블</caption>
				<thead>
					<tr>
						<th style="width:55%;"><span>용품</span></th>
						<th><span>필요개수</span></th>
						<th><span>체크</span></th>
					</tr>
				</thead>
				<tbody>
<% 
sQuery = "select * from tb_pregnancyCheckList where period = '3' order by orderNum asc"
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&uCode&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   checkName = "<span></span>"
			   Else 
			   checkYN = ""
			   checkName = ""
			   End If 
			   Rs.close

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   Tipkeyword = Tipkeyword & Rs("TipKeyword")
			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  

%>

					
					<tr>
						<td><%=oRs("gTitle")%> <br/><%=Tipkeyword%> </td>
						<td><%=oRs("gNumber")%></td>
						<td><%=checkName%></td>
					</tr>
<% 
       i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
%>
				</tbody>
			</table>
			<!-- //탭내용 -->
		</div>
	</div>
	<!-- //컨텐츠 -->
</div>
<script type="text/javascript">
//<![CDATA[
jQuery(function($){
	$(".smartTab").tabs();
});
//]]>
</script>
</body>
</html>