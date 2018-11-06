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
menuCode = "70000"
menuCode2 = "B"
menuTitle = "PUSH(알림)"

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
					<a class="ico_comm inner_btn" href="notice_Write.asp">알림리스트 생성</a>
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
					<th scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col"><div class="inner_cell">구분</div></th>
					<th scope="col"><div class="inner_cell">제목</div></th>
                    <th scope="col"><div class="inner_cell">전송횟수</div></th>
					<th scope="col"><div class="inner_cell">발송건수</div></th>
					<th scope="col"><div class="inner_cell">상태</div></th>
					<th scope="col"><div class="inner_cell">등록일</div></th>
                    <th scope="col"><div class="inner_cell">발송일</div></th>  
					<th scope="col"><div class="inner_cell">등록자</div></th>   
					<th scope="col"><div class="inner_cell">기능</div></th>   

				</tr>
				</thead>
				<tbody>
<%
			Dim sendResult
			Dim i , lineMod, lineTag
			i = 1

			sQuery = "Select  * from tb_PushBadge_info"
            sQuery = sQuery &  " where sendFlag = 'P' " 
			sQuery = sQuery &  " order by regDate desc" 
            Set oRS = oDb.Execute(sQuery)

			Do While Not ( oRs.eof or oRs.bof ) 
			lineMod = i mod 2

			If lineMod = "0" Then lineTag = " class='bg_even'"
			If lineMod = "1" Then lineTag = ""


			If oRs("sendResult") = "W" Then sendResult = "<font color='red'>발송대기</font>"
            If oRs("sendResult") = "S" Then sendResult = "<font color='blue'>조건수립</font>"
            If oRs("sendResult") = "Y" Then sendResult = "<font color='black'>발송완료</font>"

%>

					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("pushSeq")%></div></td>
						<td><div class="inner_cell"><%=oRs("sendType")%></div></td>
                        <td><div class="inner_cell"><%=oRs("title")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("sendTotal")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("sendNum")%></div></td> 
                        <td><div class="inner_cell"><%=sendResult%></div></td> 
                        <td><div class="inner_cell"><%=Left(oRs("regDate"),10)%></div></td> 
						<td><div class="inner_cell"><%=oRs("sendDate")%></div></td>
						<td><div class="inner_cell"><%=oRs("regCID")%></div></td>
						<td><div class="inner_cell"><a href="notice_View.asp?pushSeq=<%=oRs("pushSeq")%>">상세보기</a></div></td>
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
