<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"

CALL sChkSession()
sDbOpen("BABYAPP")


Dim menuCode, menuCode2, sponCode
sponCode = request("sponCode")

menuCode = "40000"
menuCode2 = "C"

Dim Cflag
Cflag	 = request("Cflag")

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

	<h2 id="babysBody" class="screen_out">카테고리 분류 등록</h2>
    <h3 class="tit_pulisher">카테고리 분류 등록</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="cate_process_db.asp" class="form_regist" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reg">
		<input type="hidden" name="Cflag" value="<%=Cflag%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">카테고리 분류를 등록합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류 아이콘 선택</label></th>
						<td>
							<div class="inner_cell">				
								<label for="ChargeIDPlus" class="screen_out">아이콘을 선택해주세요.</label>
								<select id="icon" class="opt_select" name="icon">
								<option value=""> # 아이콘을 선택해주세요 # </option>
								<option value="0">공통</option>
                                <option value="1">젖병</option>
								<option value="2">아기</option>
								<option value="3">엄마</option>
								<option value="4">가게</option>
								<option value="5">장바구니</option>
								<option value="6">넥타이</option>
								</select>
								<span class="txt_num" id="text_size">아이콘이 없는 경우, 디자인 운영자에게 요청하세요.</span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류명</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="CateName" id="CateName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">영문, 숫자, 한글 사용가능 20자 이내</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">노출순위</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="orderNum" id="orderNum" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">(1단위로 입력 하세요.)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="tit_subject">사용유무</div>
						</th>
						<td>
							<div class="inner_cell">
									<input type="radio" id="useYN" class="inp_comm" name="useYN" value="Y" checked>
									<label for="useYN">사용</label>
									<input type="radio" id="useYN" class="inp_comm" name="useYN" value="N" >
									<label for="useYN">미사용</label>
													</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">등록하기</button></span>
					   <a href="cate_list.asp?Cflag=<%=Cflag%>" class="btn_cancel">취소</a>
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
		  if(no_value('icon')) return error_msg('icon','아이콘을 선택해주세요.');
		  if(no_value('CateName')) return error_msg('CateName','분류명을 입력해주세요');
		  if(no_value('orderNum')) return error_msg('orderNum','노출순위를 입력해주세요');

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
