<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim bbscode
bbscode = Request("bbscode")

Dim menuCode, menuCode2
menuCode = "20000"
menuCode2 = "B"

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

	<h2 id="babysBody" class="screen_out">지역정보- 등록(NEW)</h2>
    <h3 class="tit_pulisher">지역정보-등록(NEW) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="shopprocess_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reg"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">지역정보- 등록(NEW)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td>
							<div class="inner_cell">	
							<select name="category">
								<option value="">분류를 선택해주세요.</option>
                                <option value="100001">산후조리원</option>
								<option value="100002">산후도우미</option>
								<option value="100003">모유수유</option>
								<option value="100004">산후다이어트</option>
							</select>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">업체명</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="title" id="title" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">주소</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="shopaddress" id="shopaddress" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호1</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="tel1" id="tel1" class="tf_comm_s1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호2</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="tel2" id="tel2" class="tf_comm_s1">

							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">위도</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="f_lat" id="f_lat" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">경도</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="f_lng" id="f_lng" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					</tr>
					<%
					Dim i 
					For i = 0 To 2 
					%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이미지</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
								<span class="txt_num" id="text_size">(jpg,png)</span>
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
					   <a href="shoplist.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 위도 경도 체크 정보 사이트 링크 주소 ( <a href="http://www.uhoon.co.kr/test/602.html" target="_blank">http://www.uhoon.co.kr/test/602.html </a>)</li>
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
		  
		 
		  if(no_value('category')) return error_msg('category','분류을 선택해주세요');
		  if(no_value('title')) return error_msg('title','업체명을 입력 해주세요.');
		  if(no_value('shopaddress')) return error_msg('shopaddress','주소를 입력 해주세요.');
          if(no_value('f_lat')) return error_msg('f_lat','위도를 입력 해주세요.');
		  if(no_value('f_lng')) return error_msg('f_lng','경도를 입력 해주세요.');

		 
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
