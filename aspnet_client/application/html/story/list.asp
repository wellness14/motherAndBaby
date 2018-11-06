<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->

<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
    
   Dim cateCode
   cateCode = Request("cateCode")
   

   

%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>맘초 스토리 커뮤니티 리스트</title>
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
//-->
</style>


</head>
<body>
<div class="wrap">
	<!-- 컨텐츠 -->
	<div class="sub_contents story">
		<!-- 탭메뉴 -->
		<div id="tabs">
			<div class="tab_ui">
				<ul>
					<li<% If cateCode = "" Then%> class="ov"<%End if%>><a href="#tabs-1" onclick="location.href='list.asp';">전체</a></li>
					<li<% If Left(cateCode,1) = "1" Then%> class="ov"<%End if%>><a href="#tabs-2" onclick="layer_open('cate1');return false;">스토리플러스</a></li>
					<li<% If Left(cateCode,1) = "2" Then%> class="ov"<%End if%>><a href="#tabs-2" onclick="layer_open('cate2');return false;">분류별</a></li>
				</ul>
			</div>
            <div class="sub_contents story">
			<div id="tabs-1" class="story_nb">
				<!-- 스토리 플러스 -->
<%    
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
     sQuery = sQuery & " where useYN = 'Y' and Category <> '99999' " 
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
    sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber and useYN = 'Y') as replyNum"
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
  
Dim i,number, NickName, varCName
i = 0
if not(oRs.eof) Then
		Do While Not ( oRs.eof or oRs.bof )
		number = TotalRecord-(PAGESIZE*Page-PAGESIZE)-i
       
	    If ISNULL(oRs("NickName")) Then 
		   NickName = "닉네임없음"
		Else 
           NickName = oRs("NickName")
		End If 

         sQuery = "SELECT CName FROM tb_StoryCategoryList where category = '"&oRs("category")&"'"
		 Set RS = oDb.Execute(sQuery)

		 If Not(Rs.eof) Then varCName = ""&Rs("CName")&""
		 Rs.close 
		
					
%>

				<!-- 1set -->
				<div class="story_box">

					<h4><% If Left(oRs("category"),1) = "1" Then%><%=oRs("AID")%><%else%><a href="javascript:fnMove('<%=oRs("Useq")%>','mypage');"><%=NickName%></a><%End if%></h4><%=varCName%>
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
											Response.write "<a href=""view.asp?cateCode="&cateCode&"&sNum="&oRs("sNumber")&"""><img src="""&Rs("FilePath")&"/"&Rs("filename")&""" alt=""이미지"" /></a>"
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
						<a href="view.asp?cateCode=<%=cateCode%>&sNum=<%=oRs("sNumber")%>"><%=oRs("sText")%></a>
					</div>
					<% If oRs("sSource") <> "" then%><p class="blog_link"><a href="ex<%=oRs("sSource")%>"><%=Left(oRs("sSource"),50)%>..</a></p><% End if%>
					<div class="comment_box">
						<a href="view.asp?cateCode=<%=cateCode%>&sNum=<%=oRs("sNumber")%>"><span class="ico_reply"></span>댓글(<%=oRs("replyNum")%>)</a>
						<a href="javascript:fnshareAdd('http:///www.mothernbaby.co.kr/application/html/story/shareview.asp?sNum=<%=oRs("sNumber")%>');"><span class="ico_share"></span>공유</a>
					</div>
				</div>
				<!-- //1set -->
<%	
i = i + 1
oRs.MoveNext
  	Loop
 else	
%>
				<!-- 1set -->
				<div class="story_box">
					<h4>가장 먼저 스토리를 남겨보세요..</h4>
					<p class="date">&nbsp;</p>
				</div>
<% end if%>
				<!-- //1set -->
				<a href="javascript:fnWriteAdd('<%=Request.Cookies("APP")("APPUCODE")%>');" class="btn_write"><img src="/application/html/img/btn_write.png" alt="글쓰기" /></a>
				<!-- //스토리 플러스 -->
			    <!--div id="lastPostsLoader"></div--> 
				<div class="wrdLatest"></div> 
                <input type="hidden" name="pageNo" id="pageNo" value="<%=page%>">
                <input type="hidden" name="totalPage" id="totalPage" value="<%=TotalPage%>">
			 </div>
			<div id="tabs-2" class="cate_layer">
				<!-- 분류별 보기 -->
				<!-- 분류 별 보기 레이어 -->
				<div class="cate_view" id="cate1">
				<%   
				   sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = 'S' order by orderNum asc"
				   Set oRs = Server.CreateObject("ADODB.Recordset") 
				   oRs.Open sQuery,oDb,1

				   Do While Not ( oRs.eof or oRs.bof ) 
				%>
									<a href="list.asp?cateCode=<%=oRs("category")%>"><!-- 활성화 class: sel 추가 -->
										<span class="ico<%=oRs("iConfile")%>"></span><em><%=oRs("CName")%></em>
									</a>
				<% 
					   oRs.MoveNext
					   Loop

					   oRs.close
				%>
				    <div class="">
						<a href="list.asp">전체보기<em></em></a>
					</div>
				</div>
				<div class="cate_view" id="cate2">
					<%   
				   sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = 'G' order by orderNum asc"
				   Set oRs = Server.CreateObject("ADODB.Recordset") 
				   oRs.Open sQuery,oDb,1

				   Do While Not ( oRs.eof or oRs.bof ) 
				%>
									<a href="list.asp?cateCode=<%=oRs("category")%>"><!-- 활성화 class: sel 추가 -->
										<span class="ico<%=oRs("iConfile")%>"></span><em><%=oRs("CName")%></em>
									</a>
				<% 
					   oRs.MoveNext
					   Loop

					   oRs.close
				%>
				    <div class="">
						<a href="list.asp">전체보기<em></em></a>
					</div>
				</div>
				</div>
				<!-- //분류 별 보기 레이어 -->
				<!-- //분류별 보기 -->
			</div>
			 </div>
		</div>
		<!-- //탭메뉴 -->
	</div>
	<!-- //컨텐츠 -->
</div>

<script type="text/javascript">
//<![CDATA[
//상세페이지 레이어 팝업
$(document).mousedown(function(e){
	$(".layerBox").each(function(){
		if( $(this).css('display') == 'block' )
		{
			var l_position = $(this).offset();
			l_position.right = parseInt(l_position.left) + ($(this).width());
			l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());


			if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
				&& ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
			{
			}
			else
			{
				$(this).fadeOut();
			}
		}
	});
	$(".cate_view").each(function(){
		if( $(this).css('display') == 'block' )
		{
			var l_position = $(this).offset();
			l_position.right = parseInt(l_position.left) + ($(this).width());
			l_position.bottom = parseInt(l_position.top) + parseInt($(this).height());


			if( ( l_position.left <= e.pageX && e.pageX <= l_position.right )
				&& ( l_position.top <= e.pageY && e.pageY <= l_position.bottom ) )
			{
			}
			else
			{
				$(this).fadeOut();
			}
		}
	});
});

function layer_open(el){

	var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
	var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	if(bg){
		$('.layerBox .cate_view').fadeIn();
	}else{
		temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
	}

	// 화면의 중앙에 레이어를 띄운다.
	if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-23px');
	else temp.css('top', '0px');

}

jQuery(function($){
//탭메뉴
$("#tabs").tabs();
//더보기 기능
var showChar = 120, //텍스트 수
showtxt = "더보기", 
hidetxt = "닫기"; 
$('.story_tx').each(function() {
	var content = $(this).text();
	if (content.length > showChar) {
		var con = content.substr(0, showChar);
		var hcon = content.substr(showChar, content.length - showChar);
		var txt= con +  '<span class="dots">...</span><span class="morecontent"><span>' + hcon + '</span>&nbsp;&nbsp;<a href="" class="moretxt">' + showtxt + '</a></span>';
		$(this).html(txt);
	}
});
$(".moretxt").click(function() {
	if ($(this).hasClass("tx_more")) {
		$(this).removeClass("tx_more");
		$(this).text(showtxt);
	} else {
		$(this).addClass("tx_more");
		$(this).text(hidetxt);
	}
	$(this).parent().prev().toggle("slow");
	$(this).prev().toggle("slow");
	return false;
});

});
//]]>

function fncommnetAdd(sNumber,Useq){
       app_comment(sNumber,Useq);
		
}

 function app_comment(sNumber,Useq){
	 	window.android.comment(sNumber,Useq);
}

function fnshareAdd(link){
       
	   app_share(link);
		
}

 function app_share(link){
 	   window.android.reply(link);
}

function fnMove(visitCode,Flag){
	   app_Move(visitCode,Flag);
}
 function app_Move(visitCode,Flag){
      window.android.app_Move(visitCode,Flag);
}

// 글쓰기
function fnWriteAdd(UCode){
	   app_WriteAdd(UCode);
		
}
 function app_WriteAdd(UCode){
	    window.android.WriteAdd(UCode);
}

</script>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<script type="text/javascript">


$(document).ready(function (){

	$(window).scroll(function (){
		if($(window).scrollTop() == $(document).height() - $(window).height()){ //최하단의 위치값과 동일여부
		
			 lastPostFunc();
		}
	});

}); 


function lastPostFunc() 
{ 
	var f = document.getElementById("pageNo"); 
	var tt = document.getElementById("totalPage"); 
	f.value = parseInt(f.value) + 1 ; 

    if ( f.value  > tt.value )
    {
		alert('마지막 페이지 입니다');

	}else{
    $('div#lastPostsLoader').html('<img src="ajax_loader_blue_48.gif">'); 
    //$.post("ajax_table.asp?lastID=" + $(".wrdLatest:last").attr("id"),    
    $.post("ajax_table.asp?gotopage="+ f.value + "&<%=(page+1)%>&cateCode=<%=cateCode%>&lastID=" + $(".wrdLatest:last").attr("id"),    

		function(data){ 
			if (data != "") { 
			$(".wrdLatest:last").after(data);            
			} 
			$('div#lastPostsLoader').empty(); 
		});
	}


};


</script>
<script type="text/javascript">
//<![CDATA[
 var swiper = new Swiper('.swiper-container', {
	slidesPerView: 1,
	spaceBetween: 5,
	freeMode: true
});
//]]>
</script>

</body>
</html>
<% 	call sDbClose() %>