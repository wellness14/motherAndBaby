<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("BABYAPP")


Dim menuCode, menuCode2,sponCode
sponCode = request("sponCode")

menuCode = "10000"

If sponCode = "" Then 
	menuCode2 = "A"
Else
	menuCode2 = "B"
End If 

Dim Useq, Uid, Uemail, Uname, Uhphone, AuthFlag
Useq =	Request("Useq")

sQuery = "SELECT * FROM tb_auth_admininfo where Useq = '"&Useq&"'"
Set oRS = oDb.Execute(sQuery)

	If oRs.eof Then 
		call sChkMsg("계정정보가 존재하지 않습니다","1","")
    Else

		Uid					= oRs("Uid")
        Uemail				= oRs("Uemail")
		Uname				= oRs("Uname")
		Uhphone			= oRs("Uhphone")
		AuthFlag			= oRs("AuthFlag")

	End If 

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

	<h2 id="babysBody" class="screen_out">운영자 정보수정</h2>
    <h3 class="tit_pulisher">운영자 정보수정</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp" class="form_regist" method="post" name="write_form">
		<input type="hidden" name="sMode" value="sysop_edit">
        <input type="hidden" name="Useq" value="<%=Useq%>">
        <input type="hidden" name="sponCode" value="<%=sponCode%>">
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">운영자 정보를 수정합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">운영자 아이디</label></th>
						<td>
							<div class="inner_cell"><%=Uid%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">비밀번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="passwd" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">정보 수정을 위해서는 운영자 비밀번호를 입력하셔야 합니다.</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이메일</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Uemail" id="inpName" class="tf_comm" value="<%=Uemail%>" maxlength="50">
								<span class="txt_num" id="text_size">메일 규칙 준수</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이름</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Uname" id="inpName" class="tf_comm" value="<%=Uname%>" maxlength="50">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="Hphone" id="inpName" class="tf_comm" value="<%=Uhphone%>" maxlength="50">
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
									<input type="radio" id="flagMaster" class="inp_comm" name="Sysop" value="M" <% If AuthFlag = "M" then%> checked<%End if%>>
									<label for="flagMaster">마스터</label>
									<input type="radio" id="flagSysop" class="inp_comm" name="Sysop" value="A"  <% If AuthFlag = "A" then%> checked<%End if%>>
									<label for="flagSysop">운영자</label>
													</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">운영자 수정하기</button></span>
					   <a href="sysop_list.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>

    <h2 id="babysBody" class="screen_out">비밀번호 변경</h2>
    <h3 class="tit_pulisher">비밀번호 변경</h3>
		 <h4 class="screen_out">비밀번호 변경</h4>
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">비밀번호 정보를 수정합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">기존비밀번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="chkpasswd" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">정보 수정을 위해서는 운영자 비밀번호를 입력하셔야 합니다.</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">새로운 비밀번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="newpasswd" id="inpName" class="tf_comm" value="" maxlength="20">
								<span class="txt_num" id="text_size">영문 + 숫자 4자 이상 ~ 20자 이내</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">확인 비밀번호</label></th>
						<td>
							<div class="inner_cell">
								<input type="password" name="repasswd" id="inpName" class="tf_comm" value="" maxlength="20">
							</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formPass();return false;" class="inner_btn">비밀번호 변경</button></span>
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
		  if(no_value('passwd')) return error_msg('passwd','패스워드를 입력해주세요');
		  if(no_value('Uemail')) return error_msg('Uemail','이메일을 입력해주세요.');
		  if(no_value('Uname')) return error_msg('Uname','이름을 선택해주세요');
          if(no_value('Hphone')) return error_msg('Hphone','전화번호를 선택해주세요');

		  if(!frm.Uemail.value.match(/\S+@\S+\S+\.\S+/)) return error_msg('Uemail','메일 주소를 확인해주세요.');
		  if(frm.passwd.value.length < 4) return error_msg('passwd','4자리 이상의 패스워드를 입력해주세요.');

		  frm.submit();


    }
    
   function formPass(){

	  var frm = document.write_form;
	  if(no_value('chkpasswd')) return error_msg('chkpasswd','기존 패스워드를 입력해주세요');
	  if(no_value('newpasswd')) return error_msg('newpasswd','새로운 패스워드를 입력해주세요');
	  if(no_value('repasswd')) return error_msg('newpasswd','확인패스워드를 입력해주세요');

	  if(frm.newpasswd.value.length < 4) return error_msg('newpasswd','4자리 이상의 새로운 패스워드를 입력해주세요.');
	  if(frm.repasswd.value != frm.newpasswd.value ) return error_msg('newpasswd','입력한 패스워드가 동일하지 않습니다.');

	  frm.sMode.value = "sysop_passwd";
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
