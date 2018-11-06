<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")

Dim CFlag, cateCode, sNumber
CFlag = Request("CFlag")
cateCode = Request("cateCode")
sNumber = Request("sNumber") 

Dim menuCode, menuCode2, menuTitle
menuCode = "40000"
If CFlag = "G" Then 
   menuCode2 = "A"
   menuTitle = "사용자스토리커뮤니티"
ElseIf CFlag = "S" Then 
   menuCode2 = "B"
   menuTitle = "공식스토리커뮤니티"
End If 

   Dim Useq,AID,sText,sSource,hit,noticeNum,category,cateName,NickName,replyNum,fileNum,regDate
   sQuery = "select * "
   sQuery = sQuery & " ,(select CName from tb_StoryCategoryList where Category = A.Category) as CateName" 
   sQuery = sQuery & " ,(select count(-1) from tb_StoryFileinfo where sNumber = A.sNumber) as fileNum"
   sQuery = sQuery & " ,(select NickName from tb_UserInfo where Useq = A.Useq) as NickName"
   sQuery = sQuery & " ,(select count(-1) from tb_StoryCommentList where sNumber = A.sNumber) as replyNum"
   sQuery = sQuery & " from tb_StoryCommunityList A" 
   sQuery = sQuery & " where sNumber = '"&sNumber&"' " 
   Set oRS = oDb.Execute(sQuery)

   Useq		 = oRs("Useq")
   AID		 = oRs("AID")
   sText	 = oRs("sText")
   sSource	 = oRs("sSource")
   hit		 = oRs("hit")
   noticeNum = oRs("noticeNum")
   category	 = oRs("category")
   cateName  = oRs("CateName")
   NickName  = oRs("NickName")
   replyNum  = oRs("replyNum")
   fileNum   = oRs("fileNum")
   regDate   = oRs("regDate")


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

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>-스토리 수정</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-스토리 수정</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form action="process_db.asp"  ENCTYPE="multipart/form-data" method="post" name="write_form">
		<input type="hidden" name="sMode" value="edit"/>
		<input type="hidden" name="CFlag" value="<%=CFlag%>"/>
		<input type="hidden" name="cateCode" value="<%=cateCode%>"/>
		<input type="hidden" name="sNumber" value="<%=sNumber%>"/>
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>-스토리 수정합니다.</p>
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
										<option value="<%=oRs("category")%>" <% If category=oRs("category") then%>selected<%End if%>><%=oRs("CName")%></option>
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
								<input type="hidden" name="AID" id="AID" class="tf_comm_s2"  value="<%=AID%>">
								<span class="txt_num" id="text_size"><%=AID%></span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<textarea name="sText" id="sText" cols="100" rows="10"><%=sText%></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">출처</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="text" name="sSource" id="sSource" class="tf_comm_L1"  value="<%=sSource%>">
								<span class="txt_num" id="text_size">http(s)://를 붙여주세요.</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">공지글</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="checkbox" name="noticeNum" id="noticeNum" value="1" <% If noticeNum <> 99 then%>checked<%End if%>>
								<span class="txt_num" id="text_size">공지글을 선택해주시면 맨 위로 올라갑니다.</span>
							</div>
						</td>
					</tr>
                    <% 

					Dim i 
					i = 0 
					sQuery = " select * from tb_StoryFileinfo where sNumber = '"&sNumber&"' order by regDate asc"
					Set oRS = oDb.Execute(sQuery)
                    
					Do While Not ( oRs.eof or oRs.bof ) 

					%>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">파일첨부</label></th>
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
					

					For i = i To 7 
					%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">파일첨부</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<input type="file" name="mfilename" class="file_attachment">
								<input type="hidden" name="fileNum">
								<span class="txt_num" id="text_size">(jpg,png, bmp)</span>
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
					   <span class="btn_blue"><button onclick="formChk();return false;" class="inner_btn">스토리 수정하기</button></span>
					   <span class="btn_blue"><button onclick="formDel();return false;" class="inner_btn">완전삭제</button></span>
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
