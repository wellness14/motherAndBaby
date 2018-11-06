<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/include/asp/dbcon.asp"-->
<!--#include virtual="/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("ADVOLTS")


Dim menuCode, menuCode2
menuCode = "10000"
menuCode2 = "B"

%>

<!DOCTYPE html>
<html>
<head>
    <!--#include virtual="/include/common/admin_head.asp"-->
</head>
<body>
    <div id="advoltsIndex">
        <a href="#advoltsBody" rel="bookmark">본문 바로가기</a>
        <a href="#advoltsGnb" rel="bookmark">메뉴 바로가기</a>
    </div>
    <div id="advoltsWrap" class="publisher_type1">
    <!--#include virtual="/include/common/admin_top_menu.asp"-->

    <hr class="hide">
    <div id="advoltsContent" class="cont_regist" role="main">
		<!--#include virtual="/include/common/admin_left_menu.asp"-->

	<div id="mArticle">
    
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<h3 class="tit_pulisher">광고주 계정 관리</h3>
		<br/>
		<form method="post" action="process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Useq"/>
			<h4 class="screen_out">광고주 정보  리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sponsor_writer.asp">광고주 기본 정보 생성</a>
				</span>
				<!--span class="btn_publisher"><button type="submit" id="delete_btn" class="inner_btn">삭제</button></span-->
			</div>
			<p class="screen_hide">아래 테이블은 운영자의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">광고주 목록 표</caption>
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
					<th class="fst" scope="col">
						<div class="inner_cell">
							<label for="checkAll" class="screen_out">전체선택</label>
							<input type="checkbox" id="checkAll" class="inp_comm inp_all">
							광고주코드
						</div>
					</th>
					<th scope="col"><div class="inner_cell">구분</div></th>
					<th scope="col"><div class="inner_cell">회사명</div></th>
					<th scope="col"><div class="inner_cell">대표자</div></th>
					<th scope="col"><div class="inner_cell">사업자번호</div></th>
					<th scope="col"><div class="inner_cell">대표이메일</div></th>
					<th scope="col"><div class="inner_cell">전화번호</div></th>
					<th scope="col"><div class="inner_cell">캠페인(대기|진행|종료)</div></th>
					<th scope="col"><div class="inner_cell">등록일</div></th>
					<th scope="col"><div class="inner_cell">기능</div></th>
				</tr>
				</thead>
				<tbody>
<%

   sQuery = "SELECT * From tb_SponsorInfo where UseYN <> 'D'" 
   squery = sQuery & " order by regDate desc"
   Set oRS = oDb.Execute(sQuery)


Dim i , TypeName, edit_tag, lineMod, lineTag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

edit_tag = "<a href='sponsor_view.asp?sponCode="&oRs("shopCode")&"' style='color:#396BD2'>상세보기</a>"

If oRs("shopType") = "C" Then TypeName = "법인사업자"
If oRs("shopType") = "P" Then TypeName = "일반"
If oRs("shopType") = "I" Then TypeName = "개인사업자"

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

%>
					<tr<%=lineTag%> height="10">
						<td class="fst" height="10">
							<div class="inner_cell td_align1">
								<input type="checkbox" id="checkTitle<%=i%>" class="inp_comm" name="adUnitId" value="<%=oRs("shopCode")%>">
								<label for="checkTitle1" class="lab_comm"><span class="name"><%=oRs("shopCode")%></span></label>
							</div>
						</td>
						<td><div class="inner_cell"><%=TypeName%></div></td>
						<td><div class="inner_cell"><%=oRs("CName")%></div></td>
						<td><div class="inner_cell"><%=oRs("Ceo")%></div></td>
						<td><div class="inner_cell"><%=oRs("CNumber")%></div></td>
						<td><div class="inner_cell"><%=oRs("CEmail")%></div></td>
						<td><div class="inner_cell"><%=oRs("CTel")%></div></td>
                        <td><div class="inner_cell">7건</div></td> 
						<td><div class="inner_cell"><%=oRs("RegDate")%></div></td> 
						<td>
						    <div class="inner_cell">
							  <%=edit_tag%>
							</div>
						</td>
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
			<li><span class="txt_num">1</span> 광고주 정보 등록을 선택하여 정보 입력 및 마스터 계정을 등록해주세요.</li>
			<li><span class="txt_num">2</span> 광고주 마스터 계정 등록 후, 광고주 계정으로 로그인 후에, 광고주 운영자 아이디를 생성하실 수 있습니다. </li>
			</ul>
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>
