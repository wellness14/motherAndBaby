<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "20000"
menuCode2 = "B"

Dim catecode
catecode = request("catecode")
If catecode = "" Then catecode = "100001"

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
     <h3 class="tit_pulisher">산후출산지역정보</h3>
	<br/>
	<ul class="tab_comm">
    <li<%If catecode="100001" Then%> class="on"<%End if%>><a href="shoplist.asp?catecode=100001" class="link_tab">산후조리원</a></li>
	<li<%If catecode="100002" Then%> class="on"<%End if%>><a href="shoplist.asp?catecode=100002" class="link_tab">산후도우미</a></li>
    <li<%If catecode="100003" Then%> class="on"<%End if%>><a href="shoplist.asp?catecode=100003" class="link_tab">모유수유</a></li>
    <li<%If catecode="100004" Then%> class="on"<%End if%>><a href="shoplist.asp?catecode=100004" class="link_tab">산후 다이어트</a></li>
    </ul>
    
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<form method="post" action="user_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Useq"/>
			<h4 class="screen_out">산후출산지역리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="shopwriter.asp">지역정보등록</a>
				</span>
			</div>
			<p class="screen_hide">아래 테이블은 산후출산지역의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">산후출산지역 목록 표</caption>
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
					<col>
					<col>					
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col" width="100"><div class="inner_cell">분류</div></th>
					<th scope="col"><div class="inner_cell">업체명</div></th>
					<th scope="col"><div class="inner_cell">주소</div></th>
					<th scope="col" width="100"><div class="inner_cell">전화번호1</div></th>
					<th scope="col" width="100"><div class="inner_cell">전화번호2</div></th>
                    <th scope="col"><div class="inner_cell">위도</div></th>  
                    <th scope="col"><div class="inner_cell">경도</div></th>  
					<th scope="col"><div class="inner_cell">노출</div></th>  
                    <th scope="col"><div class="inner_cell">히트</div></th>  
					<th scope="col"><div class="inner_cell">등록일</div></th>  
					<th scope="col"><div class="inner_cell">사진수</div></th>  
					<th scope="col"><div class="inner_cell">기능</div></th>  
				</tr>
				</thead>
				<tbody>
<%
   sQuery = "SELECT * ,(select count(-1) from tb_poishopinfo_file where pSeq = A.pSeq) as fileNum From tb_poishopinfo A where category = '"&catecode&"' order by pSeq desc"
   Set oRS = oDb.Execute(sQuery)


Dim i, lineMod, lineTag, cateName
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

If oRs("category") = "100001" Then cateName = "산후조리원"
If oRs("category") = "100002" Then cateName = "산후도우미"
If oRs("category") = "100003" Then cateName = "모유수유"
If oRs("category") = "100004" Then cateName = "산후다이어트"



%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("pSeq")%></div></td>
						<td><div class="inner_cell"><%=cateName%></div></td>
                        <td><div class="inner_cell"><%=oRs("title")%></div></td>
						<td><div class="inner_cell"><%=oRs("shopaddress")%></div></td>
						<td><div class="inner_cell"><%=oRs("tel1")%></div></td>
						<td><div class="inner_cell"><%=oRs("tel2")%></div></td>
						<td><div class="inner_cell"><%=oRs("f_lat")%></div></td>
						<td><div class="inner_cell"><%=oRs("f_lng")%></div></td>
						<td><div class="inner_cell"><%=oRs("useflag")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("hit")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("regDate")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("fileNum")%></div></td> 
                        <td><div class="inner_cell"><a href="shopEdit.asp?pSeq=<%=oRs("pSeq")%>">수정하기</a></div></td> 
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
			<li><span class="txt_num">1</span> 산후출산 결과 확인 후 제공되는 서비스 지역 정보 리스트</li>
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
