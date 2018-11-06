<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	CALL sChkSession()
	sDbOpen("BABYAPP")

Dim bbscode,bSeq
bbscode = Request("bbscode")
bSeq = Request("bSeq")

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


   Dim AID,bTitle, bText, bSource, hit, noticeNum, fileNum,regDate
   sQuery = "select * "
   sQuery = sQuery & " ,(select count(-1) from tb_boardFileinfo where bSeq = A.bSeq) as fileNum"
   sQuery = sQuery & " from tb_boardList A" 
   sQuery = sQuery & " where bSeq = '"&bSeq&"' " 
   Set oRS = oDb.Execute(sQuery)

   AID		 = oRs("AID")
   bTitle	 = oRs("bTitle")
   bText	 = oRs("bText")
   bSource	 = oRs("bSource")
   hit		 = oRs("hit")
   noticeNum = oRs("noticeNum")
   fileNum   = oRs("fileNum")
   regDate   = oRs("regDate")


   oRs.close


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
    
    <div ng-controller="mediaListController as ctrl">

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>- 상세보기</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>- 상세보기</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reply"/>
		<input type="hidden" name="bbscode" value="<%=bbscode%>"/>
        <input type="hidden" name="bSeq" value="<%=bSeq%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>-기본정보.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=bbscode%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">운영자</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=AID%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">등록일</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=regDate%></span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">바로가기</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<%=bSource%>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">공지글</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%If noticeNum <> "99" then%>Y<%End if%></span>
							</div>
						</td>
					</tr>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">히트수</label></th>
						<td>
							<div class="inner_cell">
								<span class="txt_num" id="text_size"><%=hit%></span>
							</div>
						</td>
					</tr>
					
					</tbody>
				</table>
			</fieldset>

			<fieldset>
				<p class="screen_hide"><%=menuTitle%>-내용보기.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">제목</label></th>
						<td>
							<div class="inner_cell">				
								<%=bTitle%>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td>
							<% If fileNum <> 0 then%>
							<div class="inner_cell">				
								<%
									sQuery = " select * from tb_boardFileinfo where bSeq = '"&bSeq&"' "
									Set oRS = oDb.Execute(sQuery)

									Do While Not ( oRs.eof or oRs.bof ) 

										Select Case oRs("FType") 
										case "jpg","png", "gif", "bmp"
											Response.write "<img src="""&oRs("FilePath")&"/"&oRs("filename")&""" width=""400"" /> <br/>"
										Case "mp4"
											Response.write "<video controls width=""400""/>"
										    Response.write "<source type=""video/mp4"" src="""&oRs("FilePath")&"/"&oRs("filename")&"""/>"
										    Response.write "</video> <br/>"
										end select
								
								    oRs.MoveNext
									Loop

									oRs.close									
								%>
							</div>
							<% End if%>
							<div class="inner_cell">				
								<%=replace(bText, chr(13)&chr(10), "<br>")	%>
							</div>
						</td>
					</tr>
					
					</tbody>
				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>

			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <a href="list.asp?bbscode=<%=bbscode%>" class="btn_cancel">목록가기</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div>
		
		</div>
	  </div>
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>
