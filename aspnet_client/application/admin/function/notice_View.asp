<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	CALL sChkSession()
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2, menuTitle
menuCode = "70000"
menuCode2 = "B"
menuTitle = "PUSH (알림)"

Dim pushSeq 
pushSeq = Request("pushSeq")

Dim Sex, group, keyword
Sex					=		Request("Sex")
group				=		Request("group")
keyword			=		Request("keyword")

If Sex = "" Then Sex = "all"  

sQuery = "Select  * from tb_PushBadge_info where pushSeq = '"&pushSeq&"' "
Set oRS = oDb.Execute(sQuery)

If Not(oRs.eof) Then 
    Dim sendType, title, conTxT, sendResult, imgfilepath, imgfilename, regDate
	sendType			=		oRs("sendType")
	title					=		oRs("title")
	conTxT				=		oRs("conTxT")
	sendResult		=		oRs("sendResult")
    imgfilepath		=		oRs("filepath")
	imgfilename		=		oRs("imgfilename")
	regDate			=		oRs("regDate")


Else 

		call sChkMsg("요청한 정보가 존재하지 않습니다.","2","notice_List.asp")

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

	<h2 id="babysBody" class="screen_out"><%=menuTitle%>-상세보기</h2>
    <h3 class="tit_pulisher"><%=menuTitle%>-상세보기</h3>
		 <h4 class="screen_out">매체유형선택</h4>
		<form method="post" id="write_form" name="write_form" action="notice_View.asp">
		<input type="hidden" name="pushSeq" value="<%=pushSeq%>">
			<fieldset>
				<legend class="screen_out"> 입력폼</legend>
				<p class="screen_hide"><%=menuTitle%>-기본정보.</p>
				<table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전송방식</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=sendType%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">제목</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=title%></span>
							</div>

						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">내용</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=conTxT%></span>
							</div>
						</td>
					</tr>
					<% If sendType = "img" then%>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">전송이미지</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<img src="http://www.mothernbaby.co.kr<%=imgfilepath%>/<%=imgfilename%>" width="50%">
							</div>
						</td>
					</tr>
					<% End If %>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">등록일</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<span class="txt_num" id="text_size"><%=regDate%></span>
							</div>
						</td>
					</tr>
                    
					
					</tbody>
				</table>
			</fieldset>

			<fieldset>
				<div class="unit_option">
					<h3 class="tit_pulisher">전송히스토리 내역</h3>					
				</div>
				<table class="tbl_comm">
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col"><div class="inner_cell">성별검색</div></th>
                    <th scope="col"><div class="inner_cell">키워드검색</div></th>
					<th scope="col"><div class="inner_cell">발송수</div></th>
					<th scope="col"><div class="inner_cell">성공</div></th>
					<th scope="col"><div class="inner_cell">실패</div></th>
                    <th scope="col"><div class="inner_cell">발송일</div></th>  
					<th scope="col"><div class="inner_cell">발송자</div></th>   

				</tr>
				</thead>
<% 
sQuery = "Select  * from tb_PushHistory_info where pushSeq = '"&pushSeq&"' order by regDate desc"
Set oRS = oDb.Execute(sQuery)

i = 1
If Not(oRs.eof) Then 

			Do While Not ( oRs.eof or oRs.bof ) 
%>
				   <tr>
				        <td><div class="inner_cell"><%=i%></div></td>
						<td><div class="inner_cell"><%=oRs("searchArea2")%></div></td>
                        <td><div class="inner_cell"><%=oRs("searchArea3")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("ref_Success") + oRs("ref_fail")%></div></td> 
                        <td><div class="inner_cell"><%=oRs("ref_Success")%></div></td> 
						<td><div class="inner_cell"><%=oRs("ref_fail")%></div></td>
						<td><div class="inner_cell"><%=oRs("regDate")%></div></td>
						<td><div class="inner_cell"><%=oRs("sendCID")%></div></td>
					</tr>
<% 
			i = i + 1
		   oRs.MoveNext
		   Loop

			oRs.close
else%>
				<tr>
						<td colspan="8"><div class="inner_cell"><font color=red>전송된 내역이 없습니다. 검색 후에 전송해 주세요.</font></div></td>

					</tr>
<% End If %>

				</table>
				<div class="wrap_btn">
				</div>
			</fieldset>
            <h3 class="tit_pulisher">전송조건색인</h3>
			<fieldset>
            <table class="tbl_regist">
					<tbody>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">성별</label></th>
						<td colspan=3>
							<div class="inner_cell">				
							<input type=radio name="sex" value="all"<% If Sex = "all" Then%> checked<%End if%>>전체
						    <input type=radio name="sex" value="M"<% If Sex = "M" Then%> checked<%End if%>>남자
                            <input type=radio name="sex" value="F"<% If Sex = "F" Then%> checked<%End if%>>여자
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="inpName" class="lab_comm tit_subject">키워드 검색</label></th>
						<td colspan=3>
							<div class="inner_cell">				
								<select id="group" name="group">
								<option value="">검색그룹선택</option>
								<option value="emailID" <% If group = "emailID" Then%> selected<%End if%>>이메일</option>
								<option value="nickName" <% If group = "nickName" Then%> selected<%End if%>>닉네임</option>
                                <option value="userPhone" <% If group = "userPhone" Then%> selected<%End if%>>휴대번호</option>
								</select>
								<input type="text" name="keyword" id="keyword" class="tf_comm_L1" value="<%=keyword%>">
								<span class="btn_white white"><a href="javascript:form_search();">검색</a></span>
							</div>
						</td>
					</tr>
                    
					
					</tbody>
				</table>
			</fieldset>

<% 
      Dim intCount, numCount, i 
	  
	  
	  If sex = "all" And Group = "" And keyword = "" Then 
	  
		 sQuery = "select top 10 * from tb_UserDeviceInfo B" 
	     sQuery = sQuery & " where pushYN = 'Y' and B.TokenInfo <> ''"


	  Else 
		
        sQuery = "select top 10 * from tb_UserInfo A, tb_UserDeviceInfo B " 
	    sQuery = sQuery & " where A.DeviceID = B. DeviceID "
        sQuery = sQuery & " and B.pushYN = 'Y' and  A.useYN = 'Y'  and B.TokenInfo <> '' "
        If sex <> "all" Then sQuery = sQuery & " and A.sex = '"&Sex&"'"
	    If keyword <> "" Then sQuery = sQuery & " and "&group&" like '%"&keyword&"%' " 

	  End If 

	  Set oRs = Server.CreateObject("ADODB.Recordset") 
	  oRs.Open sQuery,oDb,1

	  intCount = oRs.recordcount 




%>


            <fieldset>
			    <div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="javascript:send_push();">발송하기</a>
				</span>
			    </div>
			    <table class="tbl_comm">
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col"><div class="inner_cell">DeviceID</div></th>
                    <th scope="col"><div class="inner_cell">토큰</div></th>
					<th scope="col"><div class="inner_cell">이메일</div></th>
                    <th scope="col"><div class="inner_cell">닉네임</div></th>
                    <th scope="col"><div class="inner_cell">성별</div></th>
                    <th scope="col"><div class="inner_cell">휴대폰</div></th>
				</tr>
				</thead>
				<tbody>
<%

Dim lineMod, lineTag
Dim useremail, usernickName, userSex, varphone
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

		If sex = "all" And Group = "" And keyword = "" Then 
	  
		  useremail		= "-"
		  usernickName	= "-"
		  userSex			= "-"
		  varphone		= "-"


	  Else 
		
          useremail			= oRs("emailID")
		  usernickName		= oRs("nickName")
		  userSex				= oRs("sex")
          varphone			= oRs("userPhone")

	  End If 

%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=i%></div></td>
						<td><div class="inner_cell"><%=Left(oRs("DeviceID"),15)%></div></td>
                        <td><div class="inner_cell"><%=Left(oRs("TokenInfo"),25)%></div></td>
                        <td><div class="inner_cell"><%=useremail%></div></td> 
						<td><div class="inner_cell"><%=usernickName%></div></td> 
						<td><div class="inner_cell"><%=userSex%></div></td> 
                        <td><div class="inner_cell"><%=varphone%></div></td> 
					</tr>
<% 
       
	   i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
	   Set oRs = Nothing
%>
				
				    <tr>
						<td colspan="7"><div class="inner_cell"><font color="blue">리스트는 최대 10개 만 보여집니다.</font></div></td>
					</tr>
				</tbody>
				</table>

			</fieldset>

			<fieldset>
				<input type="hidden" name="pubUserId" value="pz"/>
				<legend class="screen_out"> 입력폼</legend>
				<div class="wrap_btn">
				   <span class="bundle_btn">
					   <a href="notice_list.asp" class="btn_cancel">목록가기</a>
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
function form_search(){

  
  var frm = document.write_form;
  if(frm.keyword.value != "" ){
        
        if(frm.group.value == "" ){
		 alert("검색그룹을 선택해주세요. ");
		 return;
		}

     }
  frm.action = 'notice_View.asp';
  frm.submit();

}

function send_push(){
 var frm = document.write_form;
  
	  if (confirm("검색된 리스트 정보를 발송하겠습니까?") == true){    //확인
			
			window.open("", "send_push","height=300,width=300,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,top=0,left=0");
	        
			frm.method = 'post';
			frm.target = 'send_push';
			frm.action = 'gcm_push_send.asp';
			frm.submit();
            

			


	  }else{   //취소
		return;
	  }
  
}
</script>
<% 	call sDbClose() %>
