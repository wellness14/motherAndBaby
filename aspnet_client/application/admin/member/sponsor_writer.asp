<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/include/asp/dbcon.asp"-->
<!--#include virtual="/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("ADVOLTS")


Dim menuCode, menuCode2
menuCode = "10000"
menuCode2 = "B"

%>

<!DOCTYPE html>
<html>
<head>
    <!--#include virtual="/include/common/admin_head.asp"-->
</head>
<body>
    <div id="advoltsIndex">
        <a href="#advoltsBody" rel="bookmark">본문 바로가기</a>
        <a href="#advoltsGnb" rel="bookmark">메뉴 바로가기</a>
    </div>
    <div id="advoltsWrap" class="publisher_type1">
    <!--#include virtual="/include/common/admin_top_menu.asp"-->

    <hr class="hide">
    <div id="advoltsContent" class="cont_regist" role="main">
		<!--#include virtual="/include/common/admin_left_menu.asp"-->
	<div id="mArticle">
    
    <div ng-controller="mediaListController as ctrl">

	<h2 id="advoltsBody" class="screen_out">광고주 기본 정보 생성</h2>
    <h3 class="tit_pulisher">광고주 기본 정보 </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="sponsor_default">
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">광고주 정보를 등록합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">구분</label></th>
						<td colspan=3>
							<div class="inner_cell">
									<input type="radio" id="SponsorType" class="inp_comm" name="SponsorType" value="C" checked>
									<label for="flagMaster">법인사업자</label>
									<input type="radio" id="SponsorType" class="inp_comm" name="SponsorType" value="I" >
									<label for="flagSysop">개인사업자</label>
									<input type="radio" id="SponsorType" class="inp_comm" name="SponsorType" value="P" >
									<label for="flagSysop">일반</label>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">회사명/성명</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="CName" id="inpName" class="tf_comm" value="" maxlength="50">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사업자(주민)번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="CNumber" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">("-"제외후 입력)</span>
							</div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">법인등록번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="CNumber2" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">("-"제외후 입력)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표자 이름</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="Ceo" id="inpName" class="tf_comm_s2"  value="" maxlength="20">
							</div>
						</td>
					</tr>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">업종</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Ckind" id="inpName" class="tf_comm" value="" maxlength="50">
							</div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">종목</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Cgoods" id="inpName" class="tf_comm" value="" maxlength="50">
							</div>
						</td>
					</tr>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">주소</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="zip1" id="inpName" class="tf_comm_s1" value="" maxlength="3">
								<input type="text" name="zip2" id="inpName" class="tf_comm_s1" value="" maxlength="3">
								<input type="text" name="address1" id="inpName" class="tf_comm" value="">
                                <input type="text" name="address2" id="inpName" class="tf_comm" value="">
								<span class="txt_num" id="text_size">우편번호/주소/상세주소 입력 </span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 이메일</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="Cemail" id="inpName" class="tf_comm" value="" maxlength="50">
								<span class="txt_num" id="text_size">메일 규칙 준수</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 연락처</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Ctel" id="inpName" class="tf_comm" value="" maxlength="50">
								<span class="txt_num" id="text_size">("-"제외후 입력)</span>
							</div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 FAX</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Cfax" id="inpName" class="tf_comm" value="" maxlength="50">
								<span class="txt_num" id="text_size">("-"제외후 입력)</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사업자등록증</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="filename" class="file_attachment">
								<span class="txt_num" id="text_size">(jpg, pdf 등록가능)</span>
							</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>

		<h2 id="advoltsBody" class="screen_out">광고주 마스터 계정 생성</h2>
        <h3 class="tit_pulisher">광고주 마스터 계정 생성</h3>
		 <h4 class="screen_out">광고주 마스터</h4>
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">광고주 마스터 정보를 등록합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">마스터 아이디</label></th>
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
					<input type="hidden" name="Sysop" value="M">
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">광고주 등록하기</button></span>
					   <a href="sponsor_list.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 광고주 기본 정보를 등록 후에, 광고주 마스터 운영 아이디를 등록해주세요.</li>
			</ul>
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div>
		
		</div>
	  </div>

        

		
		<!--#include virtual="/include/common/admin_foot.asp"-->
	</div>
</body>
</html>
<script type="text/javascript">
    function formChk()
    {
        
		  var frm = document.write_form;
		  
		  if(no_value('CName')) return error_msg('CName','회사명을 입력해주세요.');
		  if(no_value('CNumber')) return error_msg('CNumber','사업자번호 또는 주민번호을 입력해주세요.');
		  if(no_value('Ceo')) return error_msg('Ceo','대표자명을 입력해주세요.');
		  if(no_value('Cemail')) return error_msg('Cemail','대표이메일을 입력해주세요.');
		  
		  if(no_value('UID')) return error_msg('UID','아이디를 입력해주세요.');
		  if(no_value('passwd')) return error_msg('passwd','패스워드를 입력해주세요');
		  if(no_value('repasswd')) return error_msg('repasswd','패스워드확인를 입력해주세요');
		  if(no_value('Uemail')) return error_msg('Uemail','이메일을 입력해주세요.');
		  if(no_value('Uname')) return error_msg('Uname','이름을 선택해주세요');
          if(no_value('Hphone')) return error_msg('Hphone','전화번호를 선택해주세요');

          if(!frm.Cemail.value.match(/\S+@\S+\S+\.\S+/)) return error_msg('Cemail','대표 이메일 주소를 확인해주세요.');
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
