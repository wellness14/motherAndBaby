<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->

<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
   Dim cateCode
   cateCode = Request("cateCode")
   

   const PAGESIZE = 15          ''''''''''''' 몇개의 레코드를 보여주나
	
	Dim Page               '''''''  현재 페이지
	Dim TotalRecord     '''''''  총 레코드 수
	Dim TotalPage       ''''''''  총 페이지 수
	Dim startpage				'''''''' 스타트 페이지 
	Dim NTOPSIZE
    Dim Temp_Query

	Page = CInt(Request("gotopage"))       ''''' 페이지 설정
	startpage = Request("startpage")
    
	If Page=0 Then   page=1
	If startpage="" Then   startpage=1


    NTOPSIZE = pagesize * (page-1) 


	 ' 전체 레코드 가져오기 
     sQuery = "select  count(-1) as total  from tb_StoryCommunityList A " 
     sQuery = sQuery & " where useYN = 'Y' and Category <> '99999'" 
	 If cateCode <> "" Then sQuery = sQuery & " and  category = '"&cateCode&"' " 

     'Response.write sQuery 
     Set oRS = oDb.Execute(sQuery)

    TotalRecord = oRS("total")
	TotalPage = Int(TotalRecord / PAGESIZE)
    
	'Response.write sQuery

    
	If TotalRecord mod PAGESIZE<>0 Then
		TotalPage = TotalPage + 1
	End If
	
	oRS.Close           '''''''''''''' 한개 쿼리 끝남

    sQuery = "select  top "&PAGESIZE&" * "
    sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
    sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
    sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
    sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber) as replyNum"
    sQuery = sQuery & " from tb_StoryCommunityList A" 
    sQuery = sQuery & " where useYN = 'Y' and Category <> '99999' "
	If cateCode <> "" Then sQuery = sQuery & " and  category = '"&cateCode&"' " 
	sQuery = sQuery & "  and  sNumber not in " 
    sQuery = sQuery & " (SELECT top "&NTOPSIZE&" sNumber from  tb_StoryCommunityList A Where useYN = 'Y' and Category <> '99999' "
	if cateCode <> "" Then sQuery = sQuery & " and  category = '"&cateCode&"' " 
	sQuery = sQuery & " order by noticeNum asc, regDate Desc) " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    'Response.write sQuery 
    Set oRS = oDb.Execute(sQuery)
  
Dim i,number, NickName
i = 0


		Do While Not ( oRs.eof or oRs.bof )
		number = TotalRecord-(PAGESIZE*Page-PAGESIZE)-i
       
	    If ISNULL(oRs("NickName")) Then 
		   NickName = "닉네임없음"
		Else 
           NickName = oRs("NickName")
		End If 
					
%>

				<!-- 1set -->
				<div class="story_box">
					<h4><% If Left(oRs("category"),1) = "1" Then%><%=oRs("AID")%><%else%><%=NickName%><%End if%></h4>
					<p class="date"><%=oRs("regDate")%></p>
					<% If oRs("fileNum") <> 0 Then 
									sQuery = " select * from tb_StoryFileinfo where sNumber = '"&oRs("sNumber")&"' "
									Set RS = oDb.Execute(sQuery)

									Do While Not ( Rs.eof or Rs.bof ) 

										Select Case Rs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<img src="""&Rs("FilePath")&"/"&Rs("filename")&""" alt=""이미지"" />"
										Case "mp4"
											Response.write "<video id=""MY_VIDEO_1"" class=""video-js vjs-default-skin"" controls	preload=""auto"" width=""98%"" poster=""/application/html/img/movie.jpg"" data-setup=""{}"">"
											Response.write " <source src="""&Rs("FilePath")&"/"&Rs("filename")&""" type=""video/mp4"">"
											'Response.write " <p class=""vjs-no-js"">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href=""http://videojs.com/html5-video-support/"" target=""_blank"">supports HTML5 video</a></p>"
										    Response.write "</video>"


											
											'Response.write "<video preload none controls width=""100%"">"
										    'Response.write "<source type=""video/mp4"" src="""&Rs("FilePath")&"/"&Rs("filename")&"""/>"
										    'Response.write "</video> <br/>"
										end select
								
								    Rs.MoveNext
									Loop

									Rs.close									
				     End If %>
					<div class="story_tx">
						<%=oRs("sText")%>
					</div>
					<% If oRs("sSource") <> "" then%><p class="blog_link"><a href="ex<%=oRs("sSource")%>"><%=Left(oRs("sSource"),50)%>..</a></p><% End if%>
					<div class="comment_box">
						<a href="view.asp?cateCode=<%=cateCode%>&sNum=<%=oRs("sNumber")%>"><span class="ico_reply"></span>댓글(<%=oRs("replyNum")%>)</a>
						<a href="javascript:fnshareAdd('http://www.mothernbaby/application/html/story/shareview.asp&sNum=<%=oRs("sNumber")%>');"><span class="ico_share"></span>공유</a>
					</div>
				</div>
				<!-- //1set -->
<%	
i = i + 1
oRs.MoveNext
Loop

oRs.close 

call sDbClose() 

%>