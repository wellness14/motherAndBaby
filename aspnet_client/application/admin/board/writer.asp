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
    
    <div ng-controller="mediaListController as ctrl">

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>- 등록(NEW)</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-등록(NEW) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reg"/>
		<input type="hidden" name="bbscode" value="<%=bbscode%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>- 등록(NEW)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=menuTitle%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">아이디</label></th>
						<td>
							<div class="inner_cell">
								<input type="hidden" name="AID" id="AID" class="tf_comm_s2"  value="<%=CID%>">
								<span class="txt_num" id="text_size"><%=CID%></span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">제목</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="bTiTle" id="bTiTle" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<textarea name="bText" id="bText" cols="100" rows="10"></textarea>
							</div>
						</td>
					</tr>
					<% If bbscode="003" then%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">시작일</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="startDate" id="startDate" class="tf_comm_1" value="<%=date()%>">
								<span class="txt_num" id="text_size">형식 : 2015-02-25</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">종료일</label></th>
						<td colspan=3>
							<div class="inner_cell">
							<input type="text" name="endDate" id="endDate" class="tf_comm_1" value="<%=date()+30%>">
							<span class="txt_num" id="text_size">형식 : 2015-03-25</span>
							</div>
						</td>
					</tr>
					<%End if%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">바로가기 링크</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="bSource" id="bSource" class="tf_comm_L1">
								<span class="txt_num" id="text_size">http(s)://를 붙여주세요.</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">공지글</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="checkbox" name="noticeNum" id="noticeNum" value="1">
								<span class="txt_num" id="text_size">공지글을 선택해주시면 맨 위로 올라갑니다.</span>
							</div>
						</td>
					</tr>
                    <%
					Dim i 
					For i = 0 To 3 
					%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject"><% If bbscode = "003" And i = 0 then%>썸네일<%Else%>동영상/이미지<%End if%></label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
								<span class="txt_num" id="text_size"><% If bbscode = "003" And i = 0 then%>(jpg,png - 156*128)<%End If%></span>
							</div>
						</td>
					</tr>
					<% Next%>

					</tbody>
				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>

			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">정보를 등록합니다.</p>
				
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">등록하기</button></span>
					   <a href="list.asp?bbscode=<%=bbscode%>" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 파일 첨부시에 맨 상단에 이미지/동영상이 위치 합니다.</li>
			</ul>
		
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
		  
		 
		  if(no_value('bTiTle')) return error_msg('bTiTle','제목을 입력 해주세요.');
		  if(no_value('bText')) return error_msg('bText','내용을 입력 해주세요.');
		   if(frm.bbscode.value =="003")
		  {
	  		  if(no_value('startDate')) return error_msg('startDate','시작일 입력 해주세요.');
		      if(no_value('endDate')) return error_msg('endDate','종료일 입력 해주세요.');
			  if(no_value('mfilename[0]')) return error_msg('mfilename[0]','이벤트 게시판에서는 이벤트 썸네일을 등록해주세요.');

		  }

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
