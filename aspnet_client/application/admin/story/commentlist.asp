<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2, menuTitle
menuCode = "40000"
menuCode2 = "D"
menuTitle = "댓글리스트"

%>

<!DOCTYPE html>
<html>
<head>
    <!--#include virtual="/application/include/common/admin_head.asp"-->
</head>
<body>
    <div id="babysIndex">
        <a href="#babysBody" rel="bookmark">본문 바로가기</a>
        <a href="#babysGnb" rel="bookmark">메뉴 바로가기</a>
    </div>
    <div id="babysWrap" class="publisher_type1">
    <!--#include virtual="/application/include/common/admin_top_menu.asp"-->

    <hr class="hide">
    <div id="babysContent" class="cont_regist" role="main">
		<!--#include virtual="/application/include/common/admin_left_menu.asp"-->

	<div id="mArticle">
        <h3 class="tit_pulisher"><%=menuTitle%></h3>
		<br/>
		<div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<form method="post" action="process_db.asp" name="write_form">
			<input type="hidden" name="sMode" value="comment"/>
			<h4 class="screen_out"><%=menuTitle%>리스트</h4>
			<p class="screen_hide">아래 테이블은 <%=menuTitle%> 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide"><%=menuTitle%> 목록</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col"><div class="inner_cell">스토리분류</div></th>
					<th scope="col"><div class="inner_cell">본문글</div></th>
                    <th scope="col"><div class="inner_cell">등록자</div></th>
					<th scope="col"><div class="inner_cell">내용</div></th>
					<th scope="col"><div class="inner_cell">등록일</div></th>   
					<th scope="col"><div class="inner_cell">기능</div></th>   

				</tr>
				</thead>
				<tbody>
<%
   
  sQuery = " SELECT * " 
  sQuery = sQuery & " , (select emailID from tb_UserInfo where Useq = A.Useq) as UserID " 
  sQuery = sQuery & " , (select sText from tb_StoryCommunityList where sNumber = A.sNumber) as storyTxT " 
  sQuery = sQuery & " , (select Category from tb_StoryCommunityList where sNumber = A.sNumber) as Category "

  sQuery = sQuery & " FROM tb_StoryCommentList A where  useYN ='Y' order by regDate desc" 
   'Response.write sQuery 

   Set oRS = oDb.Execute(sQuery)


Dim i , lineMod, lineTag, CateName
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

  sQuery = " select CName from tb_StoryCategoryList where Category = '"&oRs("Category")&"'"
  Set RS = oDb.Execute(sQuery)

  If Rs.eof Then 
  CateName = "비공개"
  Else 
  CateName = Rs("CName")
  End If 
  Rs.close 

%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("tSeq")%></div></td>
						<td><div class="inner_cell"><%=CateName%></div></td>
                        <td><div class="inner_cell"><%=Left(oRs("storyTxT"),10)%></div></td>
                        <td><div class="inner_cell"><%=oRs("UserID")%></div></td> 
						<td><div class="inner_cell"><%=oRs("tText")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("regDATE")%></div></td> 
						<td><div class="inner_cell">삭제</div></td>
					</tr>
<% 
       
	   i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
	   Set oRs = Nothing
%>
				</tbody>
			</table>
		</form>

		
				<div class="paging_comm">
				<span class="inner_pages">
							<span class="btn_comm btn_prev">이전페이지 없음</span>
				
																<em class="link_page">1</em>
											
							<span class="btn_comm btn_next">다음페이지 없음</span>
						</span>
				</div>
			<ul class="list_info">
			<li><span class="txt_num">1</span> 스토리 커뮤니티에 등록된 댓글 전체 리스트 입니다.</li>
			</ul>
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>
