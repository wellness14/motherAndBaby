<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim CFlag, cateCode
CFlag = Request("CFlag")
cateCode = Request("cateCode")
If CFlag = "" Then CFlag = "G" 

Dim menuCode, menuCode2, menuTitle,FlagCode
menuCode = "40000"
If CFlag = "G" Then 
   menuCode2 = "A"
   menuTitle = "사용자스토리커뮤니티"
   FlagCode = "2"
ElseIf CFlag = "S" Then 
   menuCode2 = "B"
   menuTitle = "공식스토리커뮤니티"
   FlagCode = "1"
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
		<ul class="tab_comm">
		<li<%If cateCode = "" then%> class="on"<%End if%>><a href="list.asp?CFlag=<%=CFlag%>&cateCode=" class="link_tab">전체</a></li>
<%
   sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = '"&CFlag&"' order by orderNum asc"
   Set oRs = Server.CreateObject("ADODB.Recordset") 
   oRs.Open sQuery,oDb,1

   Do While Not ( oRs.eof or oRs.bof ) 
%>
		<li<%If cateCode = oRs("Category") then%> class="on"<%End if%>><a href="list.asp?CFlag=<%=CFlag%>&cateCode=<%=oRs("Category")%>" class="link_tab"><%=oRs("CName")%></a></li>
<%
   oRs.MoveNext
   Loop
   oRs.close
%>
        </ul>

     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<form method="post" action="process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
			<h4 class="screen_out"><%=menuTitle%>리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="writer.asp?CFlag=<%=CFlag%>&cateCode=<%=cateCode%>">스토리등록(NEW)</a>
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
					<col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">Number</div></th>
					<th scope="col"><div class="inner_cell">분류코드</div></th>
					<th scope="col"><div class="inner_cell">사용자</div></th>
                    <th scope="col"><div class="inner_cell">운영자</div></th>
					<th scope="col"><div class="inner_cell">내용</div></th>
					<th scope="col"><div class="inner_cell">첨부파일</div></th>
					<th scope="col"><div class="inner_cell">히트</div></th>
                    <th scope="col"><div class="inner_cell">댓글</div></th>  
                    <th scope="col"><div class="inner_cell">공지</div></th>  
					<th scope="col"><div class="inner_cell">등록일</div></th>   
					<th scope="col"><div class="inner_cell">기능</div></th>   

				</tr>
				</thead>
				<tbody>
<%
   
   sQuery = "select * "
   sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
   sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber and useYN = 'Y') as replyNum"
   sQuery = sQuery & " from tb_StoryCommunityList A" 
   sQuery = sQuery & " where left(category,1) = '"&FlagCode&"' and useYN = 'Y' " 
   If cateCode <> "" Then sQuery = sQuery & " and category = '"&cateCode&"' " 
   sQuery = sQuery & " order by noticeNum asc, regDate Desc"
   'Response.write sQuery 

   Set oRS = oDb.Execute(sQuery)


Dim i , lineMod, lineTag, edit_tag, view_tag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

edit_tag = "<a href='edit.asp?Cflag="&Cflag&"&cateCode="&cateCode&"&sNumber="&oRs("sNumber")&"' style='color:#396BD2'>수정하기</a>"
view_tag = "<a href='view.asp?Cflag="&Cflag&"&cateCode="&cateCode&"&sNumber="&oRs("sNumber")&"' style='color:#396BD2'>상세보기</a>"



%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("sNumber")%></div></td>
						<td><div class="inner_cell"><%=oRs("CateName")%></div></td>
                        <td><div class="inner_cell"><%=oRs("NickName")%></div></td> 
						<td><div class="inner_cell"><%=oRs("AID")%></div></td> 
                        <td><div class="inner_cell"><%=Left(oRs("sText"),30)%><% If oRs("sSource") <> "" then%><br/><br/><a href="<%=oRs("sSource")%>"><%=Left(oRs("sSource"),30)%></a><% End if%></div></td> 
                        <td><div class="inner_cell"><%=oRs("fileNum")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("hit")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("replyNum")%></div></td> 
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
			<li><span class="txt_num">1</span> 스토리 커뮤니티 리스트 입니다.</li>
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
