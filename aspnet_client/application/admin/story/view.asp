<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim CFlag, cateCode, sNumber
CFlag = Request("CFlag")
cateCode = Request("cateCode")
sNumber = Request("sNumber")

If CFlag = "" Then CFlag = "G" 

Dim menuCode, menuCode2, menuTitle
menuCode = "40000"
If CFlag = "G" Then 
   menuCode2 = "A"
   menuTitle = "사용자스토리커뮤니티"
ElseIf CFlag = "S" Then 
   menuCode2 = "B"
   menuTitle = "공식스토리커뮤니티"
End If 

   Dim Useq,AID,sText,sSource,hit,noticeNum,category,cateName,NickName,replyNum,fileNum,regDate
   sQuery = "select * "
   sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
   sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
   sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber) as replyNum"
   sQuery = sQuery & " from tb_StoryCommunityList A" 
   sQuery = sQuery & " where sNumber = '"&sNumber&"' " 
   Set oRS = oDb.Execute(sQuery)

   Useq		 = oRs("Useq")
   AID		 = oRs("AID")
   sText	 = oRs("sText")
   sSource	 = oRs("sSource")
   hit		 = oRs("hit")
   noticeNum = oRs("noticeNum")
   category	 = oRs("category")
   cateName  = oRs("CateName")
   NickName  = oRs("NickName")
   replyNum  = oRs("replyNum")
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

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>-스토리 상세보기</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-스토리 상세보기</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reply"/>
		<input type="hidden" name="CFlag" value="<%=CFlag%>"/>
		<input type="hidden" name="cateCode" value="<%=cateCode%>"/>
        <input type="hidden" name="sNumber" value="<%=sNumber%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>-기본정보.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=cateName%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사용자 또는 운영자</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=NickName%> / <%=AID%></span>
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
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">출처</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<%=sSource%>
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
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">댓글수</label></th>
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
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td>
							<% If fileNum <> 0 then%>
							<div class="inner_cell">				
								<%
									sQuery = " select * from tb_StoryFileinfo where sNumber = '"&sNumber&"' "
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
								<%=sText%>
							</div>
						</td>
					</tr>
					
					</tbody>
				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>


            <h3 class="tit_pulisher">댓글리스트</h3>
			<fieldset>
			    <table class="tbl_comm">
				<caption class="screen_hide"><%=menuTitle%> 댓글</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">seq</div></th>
					<th scope="col"><div class="inner_cell">아이디</div></th>
					<th scope="col"><div class="inner_cell">내용</div></th>
                    <th scope="col"><div class="inner_cell">등록일</div></th>
					<th scope="col"><div class="inner_cell">기능</div></th>
				</tr>
				</thead>
				<tbody>
<%
sQuery = " SELECT * , (select emailID from tb_UserInfo where Useq = A.Useq) as UserID FROM tb_StoryCommentList A where sNumber = '"&sNumber&"' and useYN ='Y' " 
Set oRS = oDb.Execute(sQuery)

Dim i , lineMod, lineTag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("tSeq")%></div></td>
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

			</fieldset>

			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <a href="list.asp?CFlag=<%=CFlag%>&cateCode=<%=cateCode%>" class="btn_cancel">목록가기</a>
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
<script type="text/javascript">
    function formChk()
    {
        
		  var frm = document.write_form;
		  
		  if(no_value('category')) return error_msg('category','분류 선택해주세요.');
		  if(no_value('sText')) return error_msg('sText','내용을 입력해주세요.');

		  frm.submit();


    }

	function no_value(inputName){
	value = eval('document.write_form.'+inputName).value.replace(/\s/g,"");
	if(!value) return 1;
	}

	function error_msg(inputName, msg) {
	alert(msg);
	eval('document.write_form.'+inputName).focus();
	}


</script>
<% 	call sDbClose() %>
