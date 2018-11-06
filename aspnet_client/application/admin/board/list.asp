<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	CALL sChkSession()
	sDbOpen("BABYAPP")

Dim bbscode
bbscode = Request("bbscode")

Dim menuCode, menuCode2, menuTitle,FlagCode
menuCode = "50000"
If bbscode = "001" Then 
   menuCode2 = "A"
   menuTitle = "공지사항"
ElseIf bbscode = "002" Then 
   menuCode2 = "B"
   menuTitle = "뉴스"
ElseIf bbscode = "003" Then 
   menuCode2 = "B"
   menuTitle = "이벤트"
ElseIf bbscode = "004" Then 
   menuCode2 = "B"
   menuTitle = "도움말"
ElseIf bbscode = "005" Then 
   menuCode2 = "B"
   menuTitle = "서비스 소개"

End If 

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
			<input type="hidden" name="sMode"/>
			<h4 class="screen_out"><%=menuTitle%>리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="writer.asp?bbscode=<%=bbscode%>">게시판 글 등록(NEW)</a>
				</span>
			</div>
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
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">Number</div></th>
					<th scope="col"><div class="inner_cell">분류코드</div></th>
					<th scope="col"><div class="inner_cell">사용자</div></th>
                    <th scope="col"><div class="inner_cell">제목</div></th>
					<th scope="col"><div class="inner_cell">내용</div></th>
					<th scope="col"><div class="inner_cell">썸네일</div></th>
					<th scope="col"><div class="inner_cell">히트</div></th>
                    <th scope="col"><div class="inner_cell">공지</div></th>  
					<th scope="col"><div class="inner_cell">등록일</div></th>   
					<th scope="col"><div class="inner_cell">기능</div></th>   

				</tr>
				</thead>
				<tbody>
<%
   
   sQuery = "select * "
   sQuery = sQuery & " ,(select count(-1) from tb_boardFileinfo where bSeq = A.bSeq) as fileNum"
   sQuery = sQuery & " from tb_boardList A" 
   sQuery = sQuery & " where bbscode = '"&bbscode&"' and useYN = 'Y' " 
   sQuery = sQuery & " order by noticeNum asc, regDate Desc"
   'Response.write sQuery 

   Set oRS = oDb.Execute(sQuery)


Dim i , lineMod, lineTag, edit_tag, view_tag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

edit_tag = "<a href='edit.asp?bbscode="&bbscode&"&bSeq="&oRs("bSeq")&"' style='color:#396BD2'>수정하기</a>"
view_tag = "<a href='view.asp?bbscode="&bbscode&"&bSeq="&oRs("bSeq")&"' style='color:#396BD2'>상세보기</a>"



%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("bSeq")%></div></td>
						<td><div class="inner_cell"><%=oRs("bbscode")%></div></td>
                        <td><div class="inner_cell"><%=oRs("AID")%></div></td> 
                        <td><div class="inner_cell"><%=Left(oRs("bTitle"),20)%></div></td> 
                        <td><div class="inner_cell"><%=Left(oRs("bText"),50)%></div></td> 
                        <td><div class="inner_cell"><%=oRs("fileNum")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("hit")%></div></td> 
						<td><div class="inner_cell"><%=oRs("noticeNum")%></div></td>
						<td><div class="inner_cell"><%=oRs("regDate")%></div></td>
						<td><div class="inner_cell"><%=view_tag%> | <%=edit_tag%></div></td>
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
			<li><span class="txt_num">1</span> <%=menuTitle%> 리스트 입니다.</li>
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
