<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/include/asp/dbcon.asp"-->
<!--#include virtual="/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("ADVOLTS")


Dim menuCode, menuCode2
menuCode = "10000"
menuCode2 = "A"

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
    
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<h3 class="tit_pulisher">운영자계정</h3>
		<br/>
		<form id="formDel" method="post" action="/ad/adunit/remove">
			<input type="hidden" name="mediaId" value=""/>
			<h4 class="screen_out">운영자 계정 리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sysop_writer.asp">운영자등록</a>
				</span>
				<span class="btn_publisher"><button type="submit" id="delete_btn" class="inner_btn">삭제</button></span>
			</div>
			<p class="screen_hide">아래 테이블은 운영자의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">운영자 목록 표</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th class="fst" scope="col">
						<div class="inner_cell">
							<label for="checkAll" class="screen_out">전체선택</label>
							<input type="checkbox" id="checkAll" class="inp_comm inp_all">
							운영자 번호
						</div>
					</th>
					<th scope="col"><div class="inner_cell">아이디</div></th>
					<th scope="col"><div class="inner_cell">이메일</div></th>
					<th scope="col"><div class="inner_cell">이름</div></th>
					<th scope="col"><div class="inner_cell">전화번호</div></th>
					<th scope="col"><div class="inner_cell">등록일</div></th>
					<th scope="col"><div class="inner_cell">방문일</div></th>
					<th scope="col"><div class="inner_cell">등급</div></th>
					<th scope="col"><div class="inner_cell">기능</div></th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td class="fst">
							<div class="inner_cell td_align1">
								<input type="checkbox" id="checkTitle1" class="inp_comm" name="adUnitId" value="">
								<label for="checkTitle1" class="lab_comm"><span class="name">1000000001</span></label>
							</div>
						</td>
						<td><div class="inner_cell">supermaster</div></td>
						<td><div class="inner_cell">seung.hwa2010@gmail.com</div></td>
						<td><div class="inner_cell">애드볼트슈퍼관리자</div></td>
						<td><div class="inner_cell">010-8756-6683</div></td>
						<td><div class="inner_cell">2014-12-01 19:37:30.503</div></td>
                        <td><div class="inner_cell">2014-12-01 19:37:30.503</div></td> 
						<td><div class="inner_cell">마스터</div></td> 
						<td>
						    <div class="inner_cell">
							  <a href="/ad/adunit/55acZ2iT14110acd523/backupad" style="color:#396BD2">수정하기</a>
							</div>
						</td>
					</tr>
					<tr class="bg_even">
						<td class="fst">
							<div class="inner_cell td_align1">
								<input type="checkbox" id="checkTitle1" class="inp_comm" name="adUnitId" value="">
								<label for="checkTitle1" class="lab_comm"><span class="name">1000000001</span></label>
							</div>
						</td>
						<td><div class="inner_cell">supermaster</div></td>
						<td><div class="inner_cell">seung.hwa2010@gmail.com</div></td>
						<td><div class="inner_cell">애드볼트슈퍼관리자</div></td>
						<td><div class="inner_cell">010-8756-6683</div></td>
						<td><div class="inner_cell">2014-12-01 19:37:30.503</div></td>
                        <td><div class="inner_cell">2014-12-01 19:37:30.503</div></td> 
						<td><div class="inner_cell">마스터</div></td> 
						<td>
						    <div class="inner_cell">
							  <a href="/ad/adunit/55acZ2iT14110acd523/backupad" style="color:#396BD2">수정하기</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>

		<form id="formModifyName" method="post" action="/ad/adunit/modify_name.json">
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<input type="hidden" id="itemId" name="adUnitId"/>
				<input type="hidden" name="name">
			</fieldset>
		</form>

				<div class="paging_comm">
				<span class="inner_pages">
							<span class="btn_comm btn_prev">이전페이지 없음</span>
				
																<em class="link_page">1</em>
											
							<span class="btn_comm btn_next">다음페이지 없음</span>
						</span>
				</div>
			<ul class="list_info">
			<li><span class="txt_num">1</span> 운영자 계정 등록은 마스터 아이디 이상부터 가능합니다.</li>
			</ul>
		<div id="script_popup" class="publisher_layer">
			<div class="inner_publisher_layer inner_publisher_layer2">
				<div class="layer_head">
					<strong class="tit_layer">스크립트</strong>
				</div>
				<div class="btn_guide">
					<span class="bundle_btn">
						<a href="https://github.com/mobilead/mobilead-mweb-sdk" target="_blank" class="btn_publisher">스크립트 가이드</a>
					</span>
				</div>
				<div class="layer_body">
					<pre class="txt_copy desc_reason" cols="50" id="scripttag" readonly></pre>
					<div class="wrap_btn">
						<span class="bundle_btn">
							<span class="btn_blue"><button id="copy-button" type="button" class="inner_btn" data-clipboard-target="scripttag">스크립트 복사</button></span>
							<a href="#none" class="btn_publisher btn_cancel script_popup_close">닫기</a>
						</span>
					</div>
				</div>
				<div class="layer_foot">
					<a href="#" class="btn_comm btn_close script_popup_close">닫기</a>
				</div>
			</div>
		</div>

		<script id="popup_template" type="text/x-jsrender">
			<div id="alert_popup" class="publisher_layer">
				<div class="inner_publisher_layer inner_publisher_layer1">
					<div class="layer_head">
						<strong class="tit_layer">확인</strong>
					</div>
					<div class="layer_body">
						<p>{{:message}}
							{{if errorFields}}
							<br/><em class="emph_g">{{:errorFields}}</em>
							{{/if}}
						</p>
						<div class="wrap_btn">
							<span class="bundle_btn">
								{{if !redirectUrl}}
								<a href="#" class="btn_blue btn_confirm alert_popup_close">확인</a>
								{{else}}
								<a href="{{:redirectUrl}}" class="btn_blue btn_confirm">확인</a>
								{{/if}}
							</span>
						</div>
					</div>
					<div class="layer_foot">
						<a href="#" class="btn_comm btn_close alert_popup_close">닫기</a>
					</div>
				</div>
			</div>
		</script>

		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>
