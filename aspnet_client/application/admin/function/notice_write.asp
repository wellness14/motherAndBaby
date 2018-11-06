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
    
    <div ng-controller="mediaListController as ctrl">

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>- 등록(NEW)</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-등록(NEW) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form method="post" id="write_form" name="write_form" enctype="multipart/form-data" action="notice_process_db.asp">
		<input type="hidden" name="sMode" value="noticeReg">
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>- 등록(NEW)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전송방식</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type=radio name=sendType value="txt" class="radiobox" checked>텍스트형
								<input type=radio name=sendType value="img" class="radiobox">이미지형
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">알림제목</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="title" id="title" class="tf_comm_L1">
								<span class="txt_num" id="text_size">(10자이내, 특수문자사용금지)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">알림내용</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="contxt" id="contxt" class="tf_comm_L1">
								<span class="txt_num" id="text_size">(50자이내, 특수문자사용금지)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표이미지</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="imgFile" class="file_attachment">
								<span class="txt_num" id="text_size">(전송방식을 이미지형으로 선택 시에 가로형 이미지 등록)</span>
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
				<p class="screen_hide">정보를 등록합니다.</p>
				
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="form_submit();return false;" class="inner_btn">등록하기</button></span>
					   <a href="notice_list.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 알림 리스트를 생성 후에, 상세보기에서 사용자 검색 후 발송을 해주세요.</li>
            <li><span class="txt_num">2</span> 전송방식을 이미지형으로 선택한 경우 이미지를 등록해주셔야 합니다.</li>  
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
function form_submit(){

  var frm = document.write_form;
  if(no_value('title')) return error_msg('title','제목을 입력해주세요');
  if(no_value('contxt')) return error_msg('contxt','내용을 입력해주세요');
  
  if(frm.sendType[1].checked == true){
         
	 if(frm.imgFile.value == ""){
         
		alert("전송방식을 이미지형으로 선택한 경우 이미지를 등록해주셔야 합니다.");
		frm.imgFile.focus();
		return;

     }

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
