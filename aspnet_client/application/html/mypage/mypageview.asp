<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<!--#include virtual="/application/html/include/cookie_include.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
   Dim cateCode, sNum
   cateCode = Request("cateCode")
   sNum = Request("sNum")

   Dim Useq,AID,sText,sSource,hit,noticeNum,category,cateName,NickName,replyNum,fileNum,regDate, LikeNum
   sQuery = "select * "
   sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
   sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
   sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber  and useYN = 'Y') as replyNum"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryLikeList where sNumber = A.sNumber) as LikeNum"

   sQuery = sQuery & " from tb_StoryCommunityList A" 
   sQuery = sQuery & " where sNumber = '"&sNum&"' " 
   Set oRS = oDb.Execute(sQuery)

   If oRs.eof Then 

			Response.Write "<script language='JavaScript'> " &_
                		    "location.href='mypage.asp?UCode="&APPUCODE&"&visitCode="&visitCode&"';" &_
					        "</script>"

   Else 
   
   Useq		 = oRs("Useq")
   AID		 = oRs("AID")
   sText		 = oRs("sText")
   sSource	 = oRs("sSource")
   hit			 = oRs("hit")
   noticeNum = oRs("noticeNum")
   category	 = oRs("category")
   cateName  = oRs("CateName")
   replyNum  = oRs("replyNum")
   LikeNum	= oRs("LikeNum")
   fileNum   = oRs("fileNum")
   regDate   = oRs("regDate")
   
	    If ISNULL(oRs("NickName")) Then 
		   NickName = "닉네임없음"
		Else 
           NickName = oRs("NickName")
		End If 


   oRs.close
   
  End If 

  Dim userOX
  sQuery = "select * from tb_StoryLikeList where sNumber = '"&sNum&"' and uSeq = '"&APPUCODE&"' "
  Set oRS = oDb.Execute(sQuery)
  
  If oRs.eof Then 
	  userOX = "Y"
  Else 
  	  userOX = "X"
  End If 
          
		  oRs.close

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
<script src="/application/html/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="/application/html/js/jquery-ui-1.10.4.min.js" type="text/javascript"></script>
</head>
<body class="bg_body">
<div class="wrap">
<form action="process_db.asp" class="form_regist" method="post" name="write_form">
		<input type="hidden" name="sMode" id="sMode">
        <input type="hidden" name="sNum"  id="sNum" value="<%=sNum%>"/>
        <input type="hidden" name="visitCode"  id="visitCode" value="<%=visitCode%>"/>
        <input type="hidden" name="UCode"  id="UCode" value="<%=UCode%>"/>
        <input type="hidden" name="tSeq" id="tSeq"/>

	<!-- 컨텐츠 -->
	<div class="sub_contents story_view">
		<!-- 1set -->
		<div class="story_box">
			<h4><%=NickName%></h4>
			<p class="date"><%=regDate%></p>
			<div class="story_tx mt10"><%=replace(sText, chr(13)&chr(10), "<br>")	%></div>
			<%
									sQuery = " select * from tb_StoryFileinfo where sNumber = '"&sNum&"' "
									Set oRS = oDb.Execute(sQuery)

									Dim x, uImg
									uImg = ""
									x = 1
									Do While Not ( oRs.eof or oRs.bof ) 

										Select Case oRs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<img src="""&oRs("FilePath")&"/"&oRs("filename")&""" alt=""이미지"" />"
										Case "mp4"
											Response.write "<video id=""MY_VIDEO_1"" class=""video-js vjs-default-skin"" controls	preload=""auto"" width=""98%"" poster=""/application/html/img/movie.jpg"" data-setup=""{}"">"
											Response.write " <source src="""&oRs("FilePath")&"/"&oRs("filename")&""" type=""video/mp4"">"
											'Response.write " <p class=""vjs-no-js"">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href=""http://videojs.com/html5-video-support/"" target=""_blank"">supports HTML5 video</a></p>"
										    Response.write "</video>"

											
											'Response.write "<video controls width=""100%"">"
										    'Response.write "<source type=""video/mp4"" src="""&oRs("FilePath")&"/"&oRs("filename")&"""/>"
										    'Response.write "</video> <br/>"
										end Select
										
										 If x = 1 Then uImg = "http://www.mothernbaby.co.kr"&oRs("FilePath")&"/"&oRs("filename")
								     x = x + 1
								    oRs.MoveNext
									Loop

									oRs.close									
								%>
			<div class="sns_area">
				<div class="sns_box" id="like_Line">
					<span<% If userOX = "X" Then%> class="ov"<%End if%>><a class="btn_Like" id="<%=sNum%>">좋아요</a><%=LikeNum%></span>
					<span><a href="javascript:fnshareAdd('http://www.mothernbaby.co.kr/application/html/story/shareview.asp?sNum=<%=sNum%>','[맘초스토리커뮤니티]<%=NickName%>-<%=Left(sText,20)%>','http://www.mothernbaby.co.kr/upload_application/share/150416_shareimg.jpg');">공유</a></span>
				</div>
				<div class="reg_comment">
                    <% If APPUCODE = Useq Then %><a href="javascript:formDel();"><span class="ico_share"></span>삭제</a><% End if%>

				</div>
			</div>
		</div>
		<!-- //1set -->
	</div>
	<!-- //컨텐츠 -->
	<!-- 댓글 -->
	<div class="relpy_area">
		<div class="relpy_tit">
			<div class="">
				<span class="ico_relpy"></span><em>전체댓글 <span><%=replyNum%></span></em>
			</div>
			<a href="javascript:fncommnetAdd('<%=sNum%>','<%=APPUCODE%>');">댓글쓰기</a>
		</div>
		<!-- 댓글 내용 -->
<%
    Dim i 
	i = 1
	sQuery = " select * ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName from tb_StoryCommentList A where sNumber = '"&sNum&"' and useYN='Y' "
	Set oRS = oDb.Execute(sQuery)

    
	if not(oRs.eof) Then
	Do While Not ( oRs.eof or oRs.bof ) 

%>
		 <div id="reply_line<%=oRs("tSeq")%>">
		<div class="relpy_nb">
			<h5><%=oRs("NickName")%></h5>
			<span class="real_date"><%=oRs("regDATE")%></span>
			<p><%=oRs("tText")%></p>
            <% If APPUCODE = oRs("Useq") Then %><a class="btn_delete" id="<%=oRs("tSeq")%>">댓글삭제</a></a><% End if%>
		</div>
		</div>
<% 
	i = i + 1
	oRs.MoveNext
	Loop
	oRs.close	
	 
	 Else 
%>
      <div class="relpy_nb">
			<p>가장 먼저 좋아요 및 댓글을 남겨보세요..</p>
		</div>
<% End If %>
		<!-- //댓글 내용 -->
	</div>
	</form>
	<!-- //댓글 -->
</div>
</body>
</html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<script type="text/javascript">

function fncommnetAdd(sNumber,Useq){
		   app_comment(sNumber,Useq);
}

 function app_comment(sNumber,Useq){
	 	window.android.comment(sNumber,Useq);
}

function fnshareAdd(link,uText, uImg){
       
	   app_share(link,uText, uImg);
		
}

 function app_share(link,uText, uImg){
 	   window.android.reply(link,uText, uImg);
}


function formDel()
    {
           var frm = document.write_form;
		  frm.sMode.value = "del";
		  frm.submit();
		  
    }



$(function()
{   
	
	var FM = document.getElementById("sMode"); 
	var FN = document.getElementById("sNum"); 
	var FC = document.getElementById("visitCode"); 
	var FU = document.getElementById("UCode"); 

	// 댓글 삭제
	$('.btn_delete').live("click",function(){
	
		var ID = $(this).attr("id");
		
		$.ajax({
				type: "POST",
				url: "ajax_process.asp",
				data: "sMode=del_comment&sNum="+ FN.value + "&visitCode="+ FC.value + "&tSeq="+ ID,
				cache: false,
				success: function(html){
                $("#reply_line"+ID).html('');
				}
	   });

	});

	// 좋아요
	$('.btn_Like').live("click",function(){
	    
		var ID = $(this).attr("id");
		//var data = "sMode=Like&sNum="+ FN.value + "&UCode="+ FU.value 
		//alert(data);

		$.ajax({
				type: "POST",
				url: "ajax_process.asp",
				data: "sMode=Like&sNum="+ FN.value + "&UCode="+ FU.value ,
				cache: false,
				success: function(html){
				$("#like_Line").html('');
                $("#like_Line").append(html);
				}
	   });

	});



   
    


});


</script>
<% 	call sDbClose() %>