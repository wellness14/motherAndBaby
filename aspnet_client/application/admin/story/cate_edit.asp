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

Dim Cflag, cSeq
Cflag	 = request("Cflag")
cSeq	 = request("cSeq")

Dim Category, cateName,orderNum, iConFile, useYN
sQuery = " SELECT * FROM tb_StoryCategoryList where cSeq = '"&cSeq&"' "
Set oRS = oDb.Execute(sQuery)
   
   Category				=	oRs("Category")
   cateName				=	oRs("CName")
   orderNum				=	oRs("orderNum")
   iConFile				=	oRs("iConFile")
   useYN				=	oRs("useYN")

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

	<h2 id="babysBody" class="screen_out">카테고리 분류 등록</h2>
    <h3 class="tit_pulisher">카테고리 분류 등록</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="cate_process_db.asp" class="form_regist" method="post" name="write_form">
		<input type="hidden" name="sMode" value="edit">
		<input type="hidden" name="Cflag" value="<%=Cflag%>"/>
        <input type="hidden" name="cSeq" value="<%=cSeq%>"/>
        <input type="hidden" name="pNum" value="<%=orderNum%>"/> 
        <input type="hidden" name="Category" value="<%=Category%>"/> 
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
								<option value="0"<% If iConFile = "0" then%> selected<%End if%>>공통</option>
                                <option value="1"<% If iConFile = "1" then%> selected<%End if%>>젖병</option>
								<option value="2"<% If iConFile = "2" then%> selected<%End if%>>아기</option>
								<option value="3"<% If iConFile = "3" then%> selected<%End if%>>엄마</option>
								<option value="4"<% If iConFile = "4" then%> selected<%End if%>>가게</option>
								<option value="5"<% If iConFile = "5" then%> selected<%End if%>>장바구니</option>
								<option value="6"<% If iConFile = "6" then%> selected<%End if%>>넥타이</option>
								</select>
								<span class="txt_num" id="text_size">아이콘이 없는 경우, 디자인 운영자에게 요청하세요.</span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류명</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="CateName" id="CateName" class="tf_comm" value="<%=cateName%>" maxlength="20">
								<span class="txt_num" id="text_size">영문, 숫자, 한글 사용가능 20자 이내</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">노출순위</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="orderNum" id="orderNum" class="tf_comm" value="<%=orderNum%>" maxlength="20">
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
									<input type="radio" id="useYN" class="inp_comm" name="useYN" value="Y" <% If useYN = "Y" then%>checked<%End if%>>
									<label for="useYN">사용</label>
									<input type="radio" id="useYN" class="inp_comm" name="useYN" value="N" <% If useYN = "N" then%>checked<%End if%> >
									<label for="useYN">미사용</label>
													</div>
						</td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">수정하기</button></span>
                       <span class="btn_blue"><button onclick="formDel();return false;" class="inner_btn">완전삭제</button></span> 
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

		  frm.sMode.value = "edit";
		  frm.submit();


    }
    
	function formDel()
    {
        
		  var frm = document.write_form;
		  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		
		  frm.sMode.value = "del";
		  frm.submit();

		  }else{   //취소
		   return;
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
