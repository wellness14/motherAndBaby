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

Dim pSeq
pSeq = Request("pSeq")


   Dim category, title, shopaddress, tel1, tel2, f_lat, f_lng, useflag
   sQuery = "select * "
   sQuery = sQuery & " ,(select count(-1) from tb_poishopinfo_file where pSeq = A.pSeq) as fileNum"
   sQuery = sQuery & " from tb_poishopinfo A" 
   sQuery = sQuery & " where pSeq = '"&pSeq&"' " 
   Set oRS = oDb.Execute(sQuery)

   category		 = oRs("category")
   title				 = oRs("title")
   shopaddress	 = oRs("shopaddress")
   tel1				 = oRs("tel1")
   tel2				 = oRs("tel2")
   f_lat				 = oRs("f_lat")
   f_lng				 = oRs("f_lng")
   useflag			 = oRs("useflag")


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

	<h2 id="babysBody" class="screen_out">지역정보- 수정(edit)</h2>
    <h3 class="tit_pulisher">지역정보-수정(edit) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="shopprocess_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="edit"/>
		<input type="hidden" name="pSeq" value="<%=pSeq%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">지역정보- 수정(edit)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td>
							<div class="inner_cell">	
							<select name="category">
								<option value="">분류를 선택해주세요.</option>
                                <option value="100001"<%If category="100001" then%> selected<%End if%>>산후조리원</option>
								<option value="100002"<%If category="100002" then%> selected<%End if%>>산후도우미</option>
								<option value="100003"<%If category="100003" then%> selected<%End if%>>모유수유</option>
								<option value="100004"<%If category="100004" then%> selected<%End if%>>산후다이어트</option>
							</select>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">업체명</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="title" id="title" class="tf_comm_L1" value="<%=title%>">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">주소</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="shopaddress" id="shopaddress" class="tf_comm_L1" value="<%=shopaddress%>">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호1</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="tel1" id="tel1" class="tf_comm_s1" value="<%=tel1%>">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전화번호2</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="tel2" id="tel2" class="tf_comm_s1" value="<%=tel2%>">

							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">위도</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="f_lat" id="f_lat" class="tf_comm_L1" value="<%=f_lat%>">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">경도</label></th>
						<td>
							<div class="inner_cell">
								<input type="text" name="f_lng" id="f_lng" class="tf_comm_L1" value="<%=f_lng%>">
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사용변경</label></th>
						<td>
							<div class="inner_cell">
								<select name="useFlag">
                                <option value="Y"<%If useFlag="Y" then%> selected<%End if%>>사용</option>
								<option value="W"<%If useFlag="W" then%> selected<%End if%>>대기</option>
							</select>
							</div>
						</td>
					</tr>
					</tr>
					<% 

					Dim i 
					i = 0 
					sQuery = " select * from tb_poishopinfo_file where pSeq = '"&pSeq&"' order by regDate asc"
					Set oRS = oDb.Execute(sQuery)
                    
					Do While Not ( oRs.eof or oRs.bof ) 

					%>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이미지</label></th>
						<td>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
                                <input type="hidden" name="fileNum" value=<%=oRs("fSeq")%>>
								<span class="txt_num" id="text_size"><a href="http://www.mothernbaby.co.kr<%=oRs("filepath")%>/<%=oRs("Filename")%>" target="_blank">http://www.mothernbaby.co.kr<%=oRs("filepath")%>/<%=oRs("Filename")%></a></span>
							</div>
						</td>
					</tr>
					 <% 
					 i = i + 1
					 oRs.MoveNext
					 Loop
					oRs.close									
					

					For i = i To 2 
					%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">이미지</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
								<input type="hidden" name="fileNum">
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
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">수정하기</button></span>
					   <span class="btn_blue"><button onclick="formDel();return false;" class="inner_btn">완전삭제</button></span>

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
