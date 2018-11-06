<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/include/asp/dbcon.asp"-->
<!--#include virtual="/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("ADVOLTS")


Dim menuCode, menuCode2
menuCode = "10000"
menuCode2 = "B"

Dim sponCode
sponCode = request("sponCode")

'광고주 기본정보 불러오기
sQuery = " select top 1 * from tb_SponsorInfo where shopCode = '"&sponCode&"'" 
Set oRS = oDb.Execute(sQuery)

	If oRs.eof Then 
		call sChkMsg("광고주 정보가 존재하지 않습니다","1","")
    Else
        
		Dim SponsorType, ComName, CNumber, CNumber2, Ceo, Ckind, Cgoods, zip1, zip2, address1, address2, Cemail, Ctel, Cfax, filename
		Dim TypeName

		SponsorType		=		oRs("shopType")
		ComName			=		oRs("CName")
		CNumber			=		oRs("CNumber")
		CNumber2		=		oRs("CNumber2")
		Ceo				=		oRs("Ceo")
		Ckind			=		oRs("Ckind")
		Cgoods			=		oRs("Cgoods")
		Zip1			=		oRs("Zip1")
		Zip2			=		oRs("Zip2")
		address1		=		oRs("address1")
		address2		=		oRs("address2")
		Cemail			=		oRs("Cemail")
		Ctel			=		oRs("Ctel")
		Cfax			=		oRs("Cfax")
		filename		=		oRs("filename")

		If SponsorType = "C" Then TypeName = "법인사업자"
        If SponsorType = "P" Then TypeName = "일반"
        If SponsorType = "I" Then TypeName = "개인사업자"



	End If 

oRs.close 


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
		<form action="sponsor_edit.asp"  method="post" name="write_form">
		<input type="hidden" name="sMode" value="sponsor_view">
        <input type="hidden" name="sponCode" value="<%=sponCode%>">
			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide">광고주 정보를 등록합니다.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">구분</label></th>
						<td colspan=3>
							<div class="inner_cell"><%=TypeName%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">회사명/성명</label></th>
						<td colspan=3>
							<div class="inner_cell"><%=ComName%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사업자(주민)번호</label></th>
						<td>
							<div class="inner_cell"><%=CNumber%></div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">법인등록번호</label></th>
						<td>
							<div class="inner_cell"><%=CNumber2%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표자 이름</label></th>
						<td colspan=3>
							<div class="inner_cell"><%=Ceo%></div>
						</td>
					</tr>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">업종</label></th>
						<td>
							<div class="inner_cell"><%=Ckind%></div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">종목</label></th>
						<td>
							<div class="inner_cell"><%=Cgoods%></div>
						</td>
					</tr>
                    <tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">주소</label></th>
						<td colspan=3>
							<div class="inner_cell">
								<%=Zip1%>-<%=Zip2%>&nbsp;<%=address1%><%=address2%>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 이메일</label></th>
						<td colspan=3>
							<div class="inner_cell"><%=Cemail%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 연락처</label></th>
						<td>
							<div class="inner_cell"><%=CTel%></div>
						</td>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">대표 FAX</label></th>
						<td>
							<div class="inner_cell"><%=CFax%></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">사업자등록증</label></th>
						<td colspan=3><div class="inner_cell"><% If filename <> "" then%><a  href="/content/sponsor/<%=filename%>" target="_blank">첨부파일다운로드</a><% End If %></div></td>
					</tr>
					</tbody>
				</table>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <span class="btn_blue"><button onclick="formEdit();return false;" class="inner_btn">광고주 정보 수정</button></span>
				   </span>
				</div>
			</fieldset>

			<h3 class="tit_pulisher">광고주계정</h3>
		<br/>
			<h4 class="screen_out">계정 리스트</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="sysop_writer.asp?sponCode=<%=sponCode%>">운영자등록</a>
				</span>
				<!--span class="btn_publisher"><button type="submit" id="delete_btn" class="inner_btn">삭제</button></span-->
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
<%

   sQuery = "SELECT * From tb_Auth_Admininfo where UseYN <> 'D' and ShopCode = '"&sponCode&"' " 
   squery = sQuery & " order by regDate desc"
   Set oRS = oDb.Execute(sQuery)


Dim i , Auth_Name, edit_tag,del_tag, lineMod, lineTag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

If oRs("AuthFlag") = "S" Then  Auth_Name = "슈퍼마스터" 
If oRs("AuthFlag") = "M" Then  Auth_Name = "마스터" 
If oRs("AuthFlag") = "A" Then  Auth_Name = "운영자" 

If oRs("AuthFlag") <> "S" then  
     edit_tag = "<a href='sysop_edit.asp?Useq="&oRs("Useq")&"&sponCode="&sponCode&"' style='color:#396BD2'>수정하기</a>"
     del_tag = "<a href=""javascript:chk_del('"&oRs("Useq")&"')"" style='color:#396BD2'>삭제하기</a>" 
Else 
    edit_tag = ""
	del_tag = ""
End If 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

%>
					<tr<%=lineTag%>>
						<td class="fst">
							<div class="inner_cell td_align1">
								<input type="checkbox" id="checkTitle<%=i%>" class="inp_comm" name="adUnitId" value="<%=oRs("Useq")%>">
								<label for="checkTitle1" class="lab_comm"><span class="name"><%=oRs("Useq")%></span></label>
							</div>
						</td>
						<td><div class="inner_cell"><%=oRs("Uid")%></div></td>
						<td><div class="inner_cell"><%=oRs("Uemail")%></div></td>
						<td><div class="inner_cell"><%=oRs("Uname")%></div></td>
						<td><div class="inner_cell"><%=oRs("Uhphone")%></div></td>
						<td><div class="inner_cell"><%=oRs("RegDate")%></div></td>
                        <td><div class="inner_cell"><%=oRs("VisitDate")%></div></td> 
						<td><div class="inner_cell"><%=Auth_Name%></div></td> 
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
			<li><span class="txt_num">1</span> 운영자 계정 등록은 마스터 아이디 이상부터 가능합니다.</li>
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
    function formEdit()
    {
        
		  var frm = document.write_form;
		  
		  

		  frm.submit();


    }
   

	function chk_del(delSeq){

	  var frm = document.write_form;
	  
	  if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			
			location.href = "process_db.asp?sMode=sysop_del&Useq="+delSeq+"&sponCode=<%=sponCode%>";

	  }else{   //취소
		return;
	  }
	 
	}

</script>


<% 	call sDbClose() %>
