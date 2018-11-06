<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "10000"
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
    
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">

		<h3 class="tit_pulisher">사용자 계정</h3>
		<br/>
		<form method="post" action="user_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
            <input type="hidden" name="Useq"/>
			<h4 class="screen_out">사용자 계정 리스트</h4>
			<div class="unit_option">
				<!--span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sysop_writer.asp">사용자 등록</a>
				</span-->
			</div>
			<p class="screen_hide">아래 테이블은 사용자의 정보를 리스트를 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">사용자 목록 표</caption>
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
							사용자 번호
						</div>
					</th>
					<th scope="col"><div class="inner_cell">이메일아이디</div></th>
					<th scope="col"><div class="inner_cell">패스워드</div></th>
					<th scope="col"><div class="inner_cell">휴대폰번호</div></th>
					<th scope="col"><div class="inner_cell">닉네임</div></th>
					<th scope="col"><div class="inner_cell">생년월일</div></th>
					<th scope="col"><div class="inner_cell">지역</div></th>
					<th scope="col"><div class="inner_cell">성별</div></th>
                    <th scope="col"><div class="inner_cell">등록일</div></th>  
                    <th scope="col"><div class="inner_cell">수정일</div></th>  
					<th scope="col"><div class="inner_cell">기능</div></th>
				</tr>
				</thead>
				<tbody>
<%

   sQuery = "SELECT * From tb_UserInfo where useYN <> 'D' " 
   squery = sQuery & " order by regDate desc"
   Set oRS = oDb.Execute(sQuery)


Dim i , edit_tag,del_tag, lineMod, lineTag, sexName
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

     edit_tag = "<a href='user_edit.asp?Useq="&oRs("Useq")&"' style='color:#396BD2'>수정하기</a>"
     del_tag = "<a href=""javascript:chk_del('"&oRs("Useq")&"')"" style='color:#396BD2'>강퇴하기</a>" 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

If oRs("sex") = "M" Then sexName = "여자"
If oRs("sex") = "F" Then sexName = "남자"

%>
					<tr<%=lineTag%>>
						<td class="fst">
							<div class="inner_cell td_align1">
								<input type="checkbox" id="checkTitle<%=i%>" class="inp_comm" name="adUnitId" value="<%=oRs("Useq")%>">
								<label for="checkTitle1" class="lab_comm"><span class="name"><%=oRs("Useq")%></span></label>
							</div>
						</td>
						<td><div class="inner_cell"><%=oRs("emailID")%></div></td>
						<td><div class="inner_cell">암호화</div></td>
						<td><div class="inner_cell"><%=oRs("userPhone")%></div></td>
						<td><div class="inner_cell"><%=oRs("nickName")%></div></td>
						<td><div class="inner_cell"><%=oRs("birth")%></div></td>
                        <td><div class="inner_cell"><%=oRs("localCD")%></div></td> 
                        <td><div class="inner_cell"><%=sexName%></div></td> 
                        <td><div class="inner_cell"><%=oRs("regDate")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("modifyDate")%></div></td> 
						<td>
						    <div class="inner_cell">
							  <%=edit_tag%>&nbsp;<%=del_tag%>
							</div>
						</td>
					</tr>
<% 
       i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
	   Set oRs = Nothing
%>
				</tbody>
			</table>
		</form>

		
				<div class="paging_comm">
				<span class="inner_pages">
							<span class="btn_comm btn_prev">이전페이지 없음</span>
				
																<em class="link_page">1</em>
											
							<span class="btn_comm btn_next">다음페이지 없음</span>
						</span>
				</div>
			<ul class="list_info">
			<li><span class="txt_num">1</span> 어플리케이션을 통해서 가입된 사용자 정보 입니다.</li>
			</ul>
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>
<script type="text/javascript">
function chk_del(delSeq){

  var frm = document.write_form;
  
  if (confirm("정말 탈퇴하시겠습니까??") == true){    //확인
		
		frm.sMode.value = "user_del";
		frm.Useq.value = delSeq; 
		frm.submit();

  }else{   //취소
    return;
  }
 
}
</script>

<% 	call sDbClose() %>
