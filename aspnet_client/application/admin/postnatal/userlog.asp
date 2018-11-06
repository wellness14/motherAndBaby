<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "20000"
menuCode2 = "A"

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

		<h3 class="tit_pulisher">사용자 산후출산체험로그정보</h3>
		<br/>
		<form method="post" action="user_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Useq"/>
			<h4 class="screen_out">사용자 산후출산 체험 로그리스트</h4>
			<div class="unit_option">
				<!--span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sysop_writer.asp">사용자 등록</a>
				</span-->
			</div>
			<p class="screen_hide">아래 테이블은 산후출산 체험 로그의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">산후출산 체험 로그 목록 표</caption>
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
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">Num</div></th>
					<th scope="col"><div class="inner_cell">사용자코드</div></th>
					<th scope="col"><div class="inner_cell">아이디</div></th>
					<th scope="col"><div class="inner_cell">음력/양력</div></th>
					<th scope="col"><div class="inner_cell">생년월일</div></th>
					<th scope="col"><div class="inner_cell">출산예정일</div></th>
                    <th scope="col"><div class="inner_cell">결혼기념일</div></th>  
                    <th scope="col"><div class="inner_cell">출산경험</div></th>  
					<th scope="col"><div class="inner_cell">첫아이</div></th>  
					<th scope="col"><div class="inner_cell">조리원</div></th>  
					<th scope="col"><div class="inner_cell">분만형태</div></th>  
					<th scope="col"><div class="inner_cell">직장유무</div></th>  
					<th scope="col"><div class="inner_cell">임신기간</div></th>  
					<th scope="col"><div class="inner_cell">키</div></th>  
                    <th scope="col"><div class="inner_cell">임신전몸무게</div></th>   
                    <th scope="col"><div class="inner_cell">현재몸무게</div></th>   
					<th scope="col"><div class="inner_cell">등록일</div></th>   
				</tr>
				</thead>
				<tbody>
<%
   sQuery = "SELECT * , (select emailID from tb_UserInfo where USeq = UCode) as uEmail From tb_postnatalUser_log order by regDate desc"
   Set oRS = oDb.Execute(sQuery)


Dim i, lineMod, lineTag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""


%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("logSeq")%></div></td>
						<td><div class="inner_cell"><%=oRs("UCode")%></div></td>
                        <td><div class="inner_cell"><%=oRs("uEmail")%></div></td>
						<td><div class="inner_cell"><%=oRs("cal")%></div></td>
						<td><div class="inner_cell"><%=oRs("birthday")%></div></td>
						<td><div class="inner_cell"><%=oRs("duedate")%></div></td>
						<td><div class="inner_cell"><%=oRs("wedding")%></div></td>
                        <td><div class="inner_cell"><%=oRs("parous")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("babynum")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("clinic")%></div></td> 
						<td><div class="inner_cell"><%=oRs("delivery")%></div></td>
						<td><div class="inner_cell"><%=oRs("workplace")%></div></td>
						<td><div class="inner_cell"><%=oRs("gperiod")%>주</div></td>
						<td><div class="inner_cell"><%=oRs("stature")%>cm</div></td>
                        <td><div class="inner_cell"><%=oRs("gweight")%>kg</div></td> 
                        <td><div class="inner_cell"><%=oRs("pweight")%>kg</div></td> 
                        <td><div class="inner_cell"><%=oRs("RegDATE")%></div></td> 
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
			<li><span class="txt_num">1</span> 산후출산체험을 작성한 사용자 결과 로그 입니다.</li>
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
