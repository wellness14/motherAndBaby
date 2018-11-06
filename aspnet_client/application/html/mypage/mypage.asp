<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<!--#include virtual="/application/html/include/cookie_include.asp"-->
<%
   
   response.charset = "utf-8"
   sDbOpen("BABYAPP")

	
   Dim listType, varListOnOf, vargallOnOf
   listType = Request("listType")

   If listType = "" Then listType = "list"
   
   If listType = "list" Then 
      
	  varListOnOf = " ov"
      vargallOnOf = ""

   ElseIf listType = "gall" Then 
      
	  varListOnOf = ""
      vargallOnOf = " ov"

   End If 

  
'사용자의 정보를 가져온다, 배경이미지, 프로필 이미지, 닉네임, 생년월일 등
Dim userName, birth
sQuery = "Select * from tb_UserInfo where Useq = '"&visitCode&"' " 
Set oRS = oDb.Execute(sQuery)

	If oRs.eof Then 
	   userName = "None"
	   birth = "None" 
	Else 
	  userName = oRs("nickName")
	  birth = oRs("birth")
	End If 

oRs.close 

' 사용자의 프로필 이미지 및 배경 이미지를 가져오자 
Dim user_profile, user_bg 
sQuery = "Select  Top 1 * from tb_UserFileinfo where Useq = '"&visitCode&"' and useYN = 'Y' and fileZone='profile' order by regDate desc" 
Set oRS = oDb.Execute(sQuery)

If oRs.eof Then 
       user_profile  = "http://mothernbaby.co.kr/upload_application/userProfile/profile_img.png"
Else 
       user_profile =  oRs("FilePath")&"/"&oRs("filename") 
End If 

sQuery = "Select  Top 1 * from tb_UserFileinfo where Useq = '"&visitCode&"' and useYN = 'Y' and fileZone='BG'  order by regDate desc" 
Set oRS = oDb.Execute(sQuery)

If oRs.eof Then 
       user_bg  = "http://mothernbaby.co.kr/upload_application/userProfile/bg_mypage.png"
Else
       user_bg =  oRs("FilePath")&"/"&oRs("filename") 
End If 
   

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
<link href="/application/html/css/reset2.css" type="text/css" rel="stylesheet" />
<link href="/application/html/css/ui2.css" type="text/css" rel="stylesheet" />
<link href="/application/html/css/swiper.min.css" type="text/css" rel="stylesheet" />
<script src="/application/html/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="/application/html/js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
<script src="/application/html/js/swiper.min.js" type="text/javascript"></script>
<style type="text/css">
<!--
.swiper-container {width:100%; margin:1.250em auto; overflow:visible;}
.swiper-slide {text-align:center;font-size:18px;background:#fff;display:-webkit-box;display:-ms-flexbox;display:-webkit-flex;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-box-align:center;-ms-flex-align:center;-webkit-align-items:center;align-items:center; background:#eee;}
.my_page_top {width:100%; min-height:11.875em; background:url("<%=user_bg%>") no-repeat 50% 50%; background-size:cover;}
//-->
</style>
</head>
<body>
<div class="wrap">
	<!-- 헤더 -->
	<!--div class="header">
		<!-- 헤더 타이틀 -->
		<!--h2 class="ico_side ico_side2"><a href="#">마이페이지</a></h2-->
		<!-- //헤더 타이틀 -->
	<!--/div-->
	<!-- //헤더 -->
	<!-- 컨텐츠 -->

<%
	const PAGESIZE = 16          ''''''''''''' 몇개의 레코드를 보여주나
	
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
     sQuery = sQuery & " where useYN = 'Y' " 
     If UCode <> visitCode Then sQuery = sQuery & " and Category <> '99999' " 
	 sQuery = sQuery & " and Useq = '"&visitCode&"' " 
     'Response.write sQuery 
     Set oRS = oDb.Execute(sQuery)

    TotalRecord = oRS("total")
	TotalPage = Int(TotalRecord / PAGESIZE)
    
	'Response.write sQuery

    
	If TotalRecord mod PAGESIZE<>0 Then
		TotalPage = TotalPage + 1
	End If
	
	oRS.Close           '''''''''''''' 한개 쿼리 끝남




%>

   
	<div class="my_page_area">
		<div class="my_page_top" id="phptoBg"></div>
		<a href="javascript:fnPhotoAdd('<%=UCode%>','profile');"><img src="<%=user_profile%>" alt="" class="my_photo"/></a>
		<div class="mypage_info">
			<div class="my_name">
				<p><%=userName%></p>
				<span><%=Replace(birth,"-",".")%></span>
			</div>
			<div class="my_list">
				<ul class="">
					<li class="my_mu1"><% If UCode = visitCode Then %><a href="javascript:fnMove('<%=UCode%>','postnatal');"><%else%><a href="/application/html/pregnancy/view.asp?UCode=<%=visitCode%>"><%End If%>출산용품체크</a></li>
					<% If UCode = visitCode Then %><li class="my_mu2"><a href="javascript:fnMove('<%=UCode%>','pregnancy');">산후조리체험</a></li><% End if%>
					<% If UCode = visitCode Then %><li class="my_mu3"><a href="javascript:fnMove('<%=UCode%>','setting');">계정</a></li><% End if%>
				</ul>
			</div>
		</div>
		<ul class="cont_story">
			<li><%=TotalRecord%>개의 스토리</li>
			<li class="t_right">
				<a href="mypage.asp?UCode=<%=UCode%>&visitCode=<%=visitCode%>&listType=gall" class="gall<%=vargallOnOf%>">갤러리형</a><!-- 활성화 ov -->
				<a href="mypage.asp?UCode=<%=UCode%>&visitCode=<%=visitCode%>&listType=list" class="list<%=varListOnOf%>">리스트형</a>
			</li>
		</ul>
	</div>

	<div class="sub_contents story">
		<div class="story_nb">
<% If listType = "gall" Then %><div class="gall_thumb"><%End if%>        
<%
    sQuery = "select  top "&PAGESIZE&" * "
    sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
    sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
    sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
    sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber and useYN = 'Y') as replyNum"
    sQuery = sQuery & " ,(select count(-1) from tb_StoryLikeList where sNumber = A.sNumber) as LikeNum"
    sQuery = sQuery & " from tb_StoryCommunityList A" 
    sQuery = sQuery & " where useYN = 'Y' "
	If UCode <> visitCode Then sQuery = sQuery & " and Category <> '99999' "
	sQuery = sQuery & " and Useq = '"&visitCode&"' " 
	sQuery = sQuery & "  and  sNumber not in " 
    sQuery = sQuery & " (SELECT top "&NTOPSIZE&" sNumber from  tb_StoryCommunityList A Where useYN = 'Y' "
	If UCode <> visitCode Then sQuery = sQuery & " and Category <> '99999' "
   sQuery = sQuery & " and Useq = '"&visitCode&"' " 
	sQuery = sQuery & " order by noticeNum asc, regDate Desc) " 
    sQuery = sQuery & " order by noticeNum asc, regDate Desc"
    'Response.write sQuery 
    Set oRS = oDb.Execute(sQuery)
  
Dim i,number, NickName
i = 0
if not(oRs.eof) Then
		Do While Not ( oRs.eof or oRs.bof )
		number = TotalRecord-(PAGESIZE*Page-PAGESIZE)-i
       
	    If ISNULL(oRs("NickName")) Then 
		   NickName = "닉네임없음"
		Else 
           NickName = oRs("NickName")
		End If 

		'좋아요 체크 

		 Dim userOX
		 sQuery = "select * from tb_StoryLikeList where sNumber = '"&oRs("sNumber")&"' and uSeq = '"&APPUCODE&"' "
         Set RS = oDb.Execute(sQuery)

          If Rs.eof Then 
			  userOX = "Y"
		  Else 
			  userOX = "X"
		  End If 
          
		  Rs.close


					
%>

<% If listType = "list" Then %>			   
			   <div class="story_box">
				<h4><% If Left(oRs("category"),1) = "1" Then%><%=oRs("AID")%><%else%><%=NickName%><%End if%></h4>
				<p class="date"><%=oRs("regDate")%></p>
				<!-- 이미지 슬라이드 -->
				<% If oRs("fileNum") <> 0 Then 
							If oRs("fileNum") > 1 Then 
									Response.write "<div class=""swiper-container"">"
										Response.write "<div class=""swiper-wrapper"">"
							End If 
			 
									sQuery = " select * from tb_StoryFileinfo where sNumber = '"&oRs("sNumber")&"' "
									Set RS = oDb.Execute(sQuery)

									Do While Not ( Rs.eof or Rs.bof ) 

										If oRs("fileNum") > 1 Then Response.write "<div class=""swiper-slide"">"
										Select Case Rs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<a href=""mypageview.asp?uCode="&uCode&"&visitCode="&visitCode&"&sNum="&oRs("sNumber")&"""><img src="""&Rs("FilePath")&"/"&Rs("filename")&""" alt=""이미지"" /></a>"
										Case "mp4"
											Response.write "<video id=""MY_VIDEO_1"" class=""video-js vjs-default-skin"" controls	preload=""auto"" width=""98%"" poster=""/application/html/img/movie.jpg"" data-setup=""{}"">"
											Response.write " <source src="""&Rs("FilePath")&"/"&Rs("filename")&""" type=""video/mp4"">"
										    Response.write "</video>"
										end Select
										
										If oRs("fileNum") > 1 Then Response.write "</div>"
								
								    Rs.MoveNext
									Loop

									Rs.close			
						
						
							If oRs("fileNum") > 1 Then   
												Response.write "</div>"
										Response.write "</div>"
							End If 
				
					 End If 
				%> 
				<!-- //이미지 슬라이드 -->
				<div class="story_tx">
					<a href="mypageview.asp?uCode=<%=uCode%>&visitCode=<%=visitCode%>&sNum=<%=oRs("sNumber")%>"><%=oRs("sText")%></a>
				</div>
				<div class="count_num">
					<a href="mypageview.asp?UCode=<%=UCode%>&visitCode=<%=visitCode%>&sNum=<%=oRs("sNumber")%>" class="ico_good<%If userOX="X"  then%> ov<%End if%>"><span></span><%=oRs("LikeNum")%></a>
					<a href="mypageview.asp?UCode=<%=UCode%>&visitCode=<%=visitCode%>&sNum=<%=oRs("sNumber")%>" class="ico_comment"><span></span><%=oRs("replyNum")%></a>
					<!--a href="javascript:fnshareAdd('http://www.mothernbaby.co.kr/application/html/story/shareview.asp?sNum=<%=oRs("sNumber")%>');"><span></span>공유</a-->
				</div>
			</div>
<% ElseIf listType = "gall" Then 

				 If oRs("fileNum") <> 0 then
								    sQuery = " select top 1 * from tb_StoryFileinfo where sNumber = '"&oRs("sNumber")&"' "
									Set RS = oDb.Execute(sQuery)

									Do While Not ( Rs.eof or Rs.bof ) 

										If oRs("fileNum") > 1 Then Response.write "<div class=""swiper-slide"">"
										Select Case Rs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<a href=""mypageview.asp?UCode="&UCode&"&visitCode="&visitCode&"&sNum="&oRs("sNumber")&"""><img src="""&Rs("FilePath")&"/"&Rs("filename")&""" alt=""이미지"" /></a>"
										Case "mp4"
											Response.write "<a href=""mypageview.asp?UCode="&UCode&"&visitCode="&visitCode&"&sNum="&oRs("sNumber")&"""><img src=""/application/html/img/movie.jpg"" alt=""동영상"" /></a>"
										end Select
										
										If oRs("fileNum") > 1 Then Response.write "</div>"
								
								    Rs.MoveNext
									Loop

									Rs.close

				 
				 Response.write ""
				 Else 
                 Response.write "<a href=""mypageview.asp?sNum="&oRs("sNumber")&"&UCode="&UCode&"&visitCode="&visitCode&""" class=""bg_white""><span>"&left(oRs("sText"),16)&"..</span></a>"
				 End If 

End if%>
			<!-- //리스트형 -->
<%	
    i = i + 1
    oRs.MoveNext
  	Loop
    
	If listType = "gall" Then Response.write "</div>" 
 else	
%>

			<!-- 리스트형 -->
			<div class="story_box">
					<h4>마이페이지에 스토리 글을 남겨보세요.</h4>
					<p class="date">&nbsp;</p>
			</div>
			<!-- //리스트형 -->
<% end if%>
			
            <% If UCode = visitCode Then %><a href="javascript:fnWriteAdd('<%=UCode%>');" class="btn_write"><img src="/application/html/img/btn_write.png" alt="글쓰기" /></a><% End if%>

		</div>
	</div>
	<!-- //컨텐츠 -->
</div>
<script type="text/javascript">
//<![CDATA[
 var swiper = new Swiper('.swiper-container', {
	slidesPerView: 1,
	spaceBetween: 5,
	freeMode: true
});
//]]>


$("#phptoBg").click(function() { 
  
  app_photoAdd('<%=UCode%>','BG');

}); 


// 이미지 업로드 하기 (배경 및 프로필) 
function fnPhotoAdd(UCode,PFlag){
	   app_photoAdd(UCode,PFlag);
}
 function app_photoAdd(UCode,PFlag){
      window.android.PhotoAdd(UCode,PFlag);
}


// 글쓰기
function fnWriteAdd(UCode){
       app_WriteAdd(UCode);
		
}
 function app_WriteAdd(UCode){
	    window.android.WriteAdd(UCode);
}

// 메뉴 이동
function fnMove(UCode,Flag){
	   app_Move(UCode,Flag);
}
 function app_Move(UCode,Flag){
      window.android.app_Move(UCode,Flag);
}

function fnshareAdd(link){
       
	   app_share(link);
		
}
 function app_share(link){
 	   window.android.reply(link);
}

</script>
</body>
</html>
<% 	call sDbClose() %>