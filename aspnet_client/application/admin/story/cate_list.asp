<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "40000"
menuCode2 = "C"

Dim Cflag  
Cflag	 = request("Cflag")

If Cflag = "" Then Cflag = "S"

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
	<h3 class="tit_pulisher">스토리 커뮤니티 분류 관리 </h3>
		<br/>
		
        <ul class="tab_comm">
		<li<%If Cflag="S" Then%> class="on"<%End if%>><a href="cate_list.asp?Cflag=S" class="link_tab">공식스토리분류</a></li>
		<li<%If Cflag="G" Then%> class="on"<%End if%>><a href="cate_list.asp?Cflag=G" class="link_tab">사용자스토리분류</a></li>
       </ul>

     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<form method="post" action="cate_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Cflag" value="<%=Cflag%>"/>
			<h4 class="screen_out">스토리 커뮤니티 분류 관리</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="cate_writer.asp?Cflag=<%=Cflag%>">분류등록</a>
				</span>
			</div>
			<p class="screen_hide">아래 테이블은 스토리 커뮤니티 분류 관리를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">스토리 커뮤니티 분류 관리 목록</caption>
				<colgroup>
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
					<th scope="col"><div class="inner_cell">분류코드</div></th>
					<th scope="col"><div class="inner_cell">분류명</div></th>
					<th scope="col"><div class="inner_cell">아이콘</div></th>
					<th scope="col"><div class="inner_cell">등록일</div></th> 
					<th scope="col"><div class="inner_cell">사용유무</div></th>  
					<th scope="col"><div class="inner_cell">기능</div></th>   

				</tr>
				</thead>
				<tbody>
<%
   sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = '"&Cflag&"' order by orderNum asc"
   Set oRs = Server.CreateObject("ADODB.Recordset") 
   oRs.Open sQuery,oDb,1

   Dim i , lineMod, lineTag, intCount, edit_tag
   intCount = oRs.recordcount 
      

	i = 1
	Do While Not ( oRs.eof or oRs.bof ) 

	lineMod = i mod 2

	If lineMod = "0" Then lineTag = " class='bg_even'"
	If lineMod = "1" Then lineTag = ""

    edit_tag = "<a href='cate_edit.asp?Cflag="&Cflag&"&cSeq="&oRs("cSeq")&"' style='color:#396BD2'>수정하기</a>"

%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("cSeq")%></div></td>
						<td><div class="inner_cell"><%=oRs("Category")%></div></td>
                        <td><div class="inner_cell"><%=oRs("CName")%></div></td>
						<td><div class="inner_cell">
						    <img src="http://www.mothernbaby.co.kr/upload_application/storyicon/ic_strory_category<%=oRs("iConfile")%>.png" width="40">
							</div>
						</td>
						<td><div class="inner_cell"><%=oRs("regDate")%></div></td>
                        <td><div class="inner_cell"><%=oRs("useYN")%></div></td> 
						<td><div class="inner_cell"><%=edit_tag%></div></td>
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

			<ul class="list_info">
			<li><span class="txt_num">1</span> 공식스토리와 사용자 스토리의 분류 유형을 관리하는 리스트입니다.</li>
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
