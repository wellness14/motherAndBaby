<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"

CALL sChkSession()
sDbOpen("BABYAPP")


Dim menuCode, menuCode2, sponCode
sponCode = request("sponCode")

menuCode = "10000"

If sponCode = "" Then 
	menuCode2 = "A"
Else
	menuCode2 = "B"
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

	<h2 id="babysBody" class="screen_out">운영자 등록</h2>
    <h3 class="tit_pulisher">운영자 새계정 등록</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp" class="form_regist" method="post" name="write_form">
		<input type="hidden" name="sMode" value="sysop_input">
		<input type="hidden" name="sponCode" value="<%=sponCode%>">
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">운영자 정보를 등록합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">운영자 아이디</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="UID" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">영문 + 숫자 4자 이상 ~ 10자 이내</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">비밀번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="passwd" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">영문 + 숫자 4자 이상 ~ 20자 이내</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">비밀번호확인</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="repasswd" id="inpName" class="tf_comm" value="" maxlength="50">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이메일</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Uemail" id="inpName" class="tf_comm" value="" maxlength="50">
								<span class="txt_num" id="text_size">메일 규칙 준수</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이름</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Uname" id="inpName" class="tf_comm" value="" maxlength="50">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Hphone" id="inpName" class="tf_comm" value="" maxlength="50">
								<span class="txt_num" id="text_size">("-"제거후 입력)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">
							<div class="tit_subject">권한</div>
						</th>
						<td>
							<div class="inner_cell">
									<input type="radio" id="flagMaster" class="inp_comm" name="Sysop" value="M" checked>
									<label for="flagMaster">마스터</label>
									<input type="radio" id="flagSysop" class="inp_comm" name="Sysop" value="A" >
									<label for="flagSysop">운영자</label>
													</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">운영자 등록하기</button></span>
					   <a href="sysop_list.asp" class="btn_cancel">취소</a>
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
		  if(no_value('UID')) return error_msg('UID','아이디를 입력해주세요.');
		  if(no_value('passwd')) return error_msg('passwd','패스워드를 입력해주세요');
		  if(no_value('repasswd')) return error_msg('repasswd','패스워드확인를 입력해주세요');
		  if(no_value('Uemail')) return error_msg('Uemail','이메일을 입력해주세요.');
		  if(no_value('Uname')) return error_msg('Uname','이름을 선택해주세요');
          if(no_value('Hphone')) return error_msg('Hphone','전화번호를 선택해주세요');

		  if(!frm.Uemail.value.match(/\S+@\S+\S+\.\S+/)) return error_msg('Uemail','메일 주소를 확인해주세요.');
		  if(frm.passwd.value.length < 4) return error_msg('passwd','4자리 이상의 패스워드를 입력해주세요.');
		  if(frm.repasswd.value != frm.passwd.value ) return error_msg('repasswd','입력한 패스워드가 동일하지 않습니다.');

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
