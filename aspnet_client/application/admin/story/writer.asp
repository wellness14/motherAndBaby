<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim CFlag, cateCode
CFlag = Request("CFlag")
cateCode = Request("cateCode")
If CFlag = "" Then CFlag = "G" 

Dim menuCode, menuCode2, menuTitle
menuCode = "40000"
If CFlag = "G" Then 
   menuCode2 = "A"
   menuTitle = "사용자스토리커뮤니티"
ElseIf CFlag = "S" Then 
   menuCode2 = "B"
   menuTitle = "공식스토리커뮤니티"
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

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>-스토리 등록(NEW)</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-스토리 등록(NEW) </h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="reg"/>
		<input type="hidden" name="CFlag" value="<%=CFlag%>"/>
		<input type="hidden" name="cateCode" value="<%=cateCode%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>-스토리 등록(NEW)합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">분류</label></th>
						<td>
							<div class="inner_cell">				
								<label for="ChargeIDPlus" class="screen_out">분류를 선택해주세요.</label>
								<select id="category" class="opt_select" name="category">
								<option value=""> # 분류를 선택해주세요. # </option>
								<%
								   sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = '"&CFlag&"' order by orderNum asc"
								   Set oRs = Server.CreateObject("ADODB.Recordset") 
								   oRs.Open sQuery,oDb,1

								   Do While Not ( oRs.eof or oRs.bof ) 
								%>
										<option value="<%=oRs("category")%>" <% If cateCode=oRs("category") then%>selected<%End if%>><%=oRs("CName")%></option>
								<%
								   oRs.MoveNext
								   Loop
								   oRs.close
								%>
								</select>
								<span class="txt_num" id="text_size">(필수, 분류를 꼭 선택해주세요.)</span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">아이디/닉네임</label></th>
						<td>
							<div class="inner_cell">
								<input type="hidden" name="AID" id="AID" class="tf_comm_s2"  value="<%=CID%>">
								<span class="txt_num" id="text_size"><%=CID%></span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<textarea name="sText" id="sText" cols="100" rows="10"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">출처</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="sSource" id="sSource" class="tf_comm_L1">
								<span class="txt_num" id="text_size">http(s)://를 붙여주세요.</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">공지글</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="checkbox" name="noticeNum" id="noticeNum" value="1">
								<span class="txt_num" id="text_size">공지글을 선택해주시면 맨 위로 올라갑니다.</span>
							</div>
						</td>
					</tr>
                    <%
					Dim i 
					For i = 0 To 7 
					%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">파일첨부</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
								<span class="txt_num" id="text_size">(jpg,png, bmp 등로가능)</span>
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
				<p class="screen_hide">광고주 마스터 정보를 등록합니다.</p>
				
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">스토리 등록하기</button></span>
					   <a href="list.asp?CFlag=<%=CFlag%>&cateCode=<%=cateCode%>" class="btn_cancel">취소</a>
				   </span>
				</div>
			</fieldset>
		
		</form>
		
		    <ul class="list_info">
			<li><span class="txt_num">1</span> 포토 / 동영상은 둘중에 하나만 입력하셔야 합니다.</li>
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
		  
		  if(no_value('category')) return error_msg('category','분류 선택해주세요.');
		  if(no_value('sText')) return error_msg('sText','내용을 입력해주세요.');

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
