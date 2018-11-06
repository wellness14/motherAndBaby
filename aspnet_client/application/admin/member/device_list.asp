<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "10000"
menuCode2 = "C"

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
    
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<h3 class="tit_pulisher">디바이스정보</h3>
		<br/>
		<form method="post" action="user_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Useq"/>
			<h4 class="screen_out">디바이스정보 리스트</h4>
			<div class="unit_option">
				<!--span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sysop_writer.asp">사용자 등록</a>
				</span-->
			</div>
			<p class="screen_hide">아래 테이블은 디바이스정보의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">디바이스정보 목록 표</caption>
				<colgroup>
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
					<th scope="col"><div class="inner_cell">단말기ID</div></th>
					<th scope="col"><div class="inner_cell">OS</div></th>
					<th scope="col"><div class="inner_cell">모델</div></th>
					<th scope="col"><div class="inner_cell">토큰</div></th>
					<th scope="col"><div class="inner_cell">알림YN</div></th>
                    <th scope="col"><div class="inner_cell">등록일</div></th>  
                    <th scope="col"><div class="inner_cell">수정일</div></th>  
				</tr>
				</thead>
				<tbody>
<%

   sQuery = "SELECT * From tb_UserDeviceInfo order by regDate desc"
   Set oRS = oDb.Execute(sQuery)


Dim i, lineMod, lineTag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""


%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("DeviceSeq")%></div></td>
						<td><div class="inner_cell"><%=oRs("DeviceID")%></div></td>
						<td><div class="inner_cell"><%=oRs("UOS")%></div></td>
						<td><div class="inner_cell"><%=oRs("DeviceModel")%></div></td>
						<td><div class="inner_cell"><%=Left(oRs("TokenInfo"),20)%></div></td>
						<td><div class="inner_cell"><%=oRs("PushYN")%></div></td>
                        <td><div class="inner_cell"><%=oRs("RegDate")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("ModifyDate")%></div></td> 
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
			<li><span class="txt_num">1</span> 어플리케이션을 설치한 사용자의 단말기 모델 정보 입니다.</li>
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
