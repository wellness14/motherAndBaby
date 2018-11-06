<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim menuCode, menuCode2
menuCode = "30000"
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

	<h2 id="babysBody" class="screen_out">출산용품관리- 등록(NEW)</h2>
    <h3 class="tit_pulisher">출산용품관리-등록(NEW) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="goods_process_db.asp"  method="post" name="write_form">
		<input type="hidden" name="sMode" value="reg"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">출산용품관리-- 등록(NEW)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">기간분류</label></th>
						<td>
							<div class="inner_cell">				
								<select name="period">
								<option value="0">그룹 선택 없음</option>
                                <option value="1">임신초기(1~3개월)</option>
								<option value="2">임신중기(4~7개월)</option>
								<option value="3">임신후기(8~10개월)</option>
								<option value="4">산욕기(출산후 6~8주)</option>
								</select>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">품목</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="gTitle" id="gTitle" class="tf_comm_L1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">갯수</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="gNumber" id="gNumber" class="tf_comm_s1">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">TIP & LINK(http://)</label></th>
						<td colspan=3>
                           <% 
						   Dim i 
						   For i = 1 To 10 %>
						   <div class="inner_cell">
								<input type="text" name="TipKeyword" id="TipKeyword" class="tf_comm_s1">
                                <input type="text" name="TipLink" id="TipLink" class="tf_comm_L1">
							</div>
                           <%next%>
						</td>
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
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">등록하기</button></span>
					   <a href="goodslist.asp" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 그룹을 선택하지 않으실 경우, 추후 가져오기를 통해서 배치합니다.</li>
            <li><span class="txt_num">2</span> 갯수는 예) 1~2개 기준을 작성해주시면 됩니다.</li>
            <li><span class="txt_num">3</span> Tip 태그 입력 후, 링크 주소를 입력해주세요. </li>
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
		  
		 
		  if(no_value('gTitle')) return error_msg('gTitle','품목을 입력 해주세요.');
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
