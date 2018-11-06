<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "70000"
menuCode2 = "A" 


Dim seq, maketName, versionName, versionCode, className, downUrl, popflag, useYN
seq = Request("seq")

sQuery = "SELECT * From tb_Appversion_history  where seq = " & seq
Set oRS = oDb.Execute(sQuery)

maketName			= oRs("maketName")
versionName			= oRs("versionName")
versionCode			= oRs("versionCode")
className				= oRs("className")
downUrl				= oRs("downUrl")
popflag					= oRs("popflag")
useYN					= oRs("useYN")

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
    <h3 class="tit_pulisher">앱버전수정</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form method="post" id="write_form" name="write_form" action="appprocess_db.asp">
		<input type="hidden" name="sMode" value="edit">
		<input type="hidden" name="seq" value="<%=seq%>">

			<fieldset>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">마켓명</label></th>
						<td colspan="3">
							<div class="inner_cell">				
							<select name="marketname">
							  <option value="">마켓 선택</option>
							  <option value="google"<% If maketName = "google" then%> selected<%End if%>>구글</option>
							  <option value="tstore"<% If maketName = "tstore" then%> selected<%End if%>>티스토어</option>
							</select>

							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">버전코드</label></th>
						<td colspan="3">
							<div class="inner_cell">
								<input name="versionCode" type="text" class="tf_comm" value="<%=versionCode%>"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">버전네임</label></th>
						<td colspan="3">
							<div class="inner_cell">
								<input name="versionName" type="text" class="tf_comm" value="<%=versionName%>"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">클래스명</label></th>
						<td colspan="3">
							<div class="inner_cell">
								<input name="className" type="text" class="tf_comm" value="<%=className%>"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">URL</label></th>
						<td colspan="3">
							<div class="inner_cell">
								<input name="downUrl" type="text" class="tf_comm" value="<%=downUrl%>"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">강제유무(팝업)</label></th>
						<td>
							<div class="inner_cell">
								<select name="popupflag">
								  <option value="">강제유무를 선택.</option>
								  <option value="C"<% If popflag = "C" then%> selected<%End if%>>강제</option>
								  <option value="L"<% If popflag = "L" then%> selected<%End if%>>나중에</option>
								 </select>
							</div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">강제유무(팝업)</label></th>
						<td>
							<div class="inner_cell">
								<select name="useYN">
								  <option value="">사용 유무를 선택.</option>
								  <option value="Y"<% If useYN = "Y" then%> selected<%End if%>>적용</option>
								  <option value="N"<% If useYN = "N" then%> selected<%End if%>>미적용</option>
								  </select>
							</div>
						</td>
					</tr>

					

					</tbody>
				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>
            <div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="form_submit();;return false;" class="inner_btn">수정하기</button></span>
					   <a href="appversion.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
		
		
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
function form_submit(){

  var frm = document.write_form;
  if(no_value('marketname')) return error_msg('marketname','마켓 구분자를 선택해주세요');
  if(no_value('versionCode')) return error_msg('versionCode','버전코드을 입력해주세요');
  if(no_value('versionName')) return error_msg('versionName','버전네임을 입력해주세요');
  if(no_value('className')) return error_msg('className','클래스명을 입력해주세요');
  if(no_value('downurl')) return error_msg('downurl','다운로드 주소를 입력해주세요');
  if(no_value('popupflag')) return error_msg('popupflag','강제적용유무를 선택해주세요');
  if(no_value('useYN')) return error_msg('useYN','사용유무를 선택해주세요');

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
