<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "30000"
menuCode2 = "B"

Dim period
period = request("period") 

If period = "" Then period = "1"


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

		<h3 class="tit_pulisher">출산용품관리</h3>
		<br/>
		<ul class="tab_comm">
		<li<%If period="1" Then%> class="on"<%End if%>><a href="goodsList.asp?period=1" class="link_tab">임신초기(1~3개월)</a></li>
		<li<%If period="2" Then%> class="on"<%End if%>><a href="goodsList.asp?period=2" class="link_tab">임신중기(4~7개월)</a></li>
		<li<%If period="3" Then%> class="on"<%End if%>><a href="goodsList.asp?period=3" class="link_tab">임신후기(8~10개월)</a></li>
		<li<%If period="4" Then%> class="on"<%End if%>><a href="goodsList.asp?period=4" class="link_tab">산욕기(출산후 6~8주)</a></li>
		<li<%If period="0" Then%> class="on"<%End if%>><a href="goodsList.asp?period=0" class="link_tab">비그룹 목록</a></li>
       </ul>
		<form method="post" action="goods_process_db.asp" name="write_form">
			<input type="hidden" name="sMode"/>
			<h4 class="screen_out">출산용품관리</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="goodswriter.asp">출산용품 등록</a>
                </span>
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="javascript:orderList('<%=period%>');">순서변경</a>
				</span>
				<% If period <> "0" Then %>
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="javascript:listexport('<%=period%>');">내보내기</a>
				</span>
                <span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="javascript:listImport('<%=period%>');">가져오기</a>
				</span>
				<% End if%>
			</div>
			<p class="screen_hide">아래 테이블은 스마트출산용품체크 정보 리스트를 제공합니다.</p>
		<table class="tbl_comm">
				<caption class="screen_hide">산후출산용품목록및체크로그</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>		
					<col>		
				</colgroup>
				<thead>
				<tr>
					<th scope="col" width="5%"><div class="inner_cell">ORDER</div></th>
					<th scope="col"><div class="inner_cell">품목</div></th>
                    <th scope="col"><div class="inner_cell">TIP</div></th>
					<th scope="col" width="10%"><div class="inner_cell">갯수</div></th>
					<th scope="col" width="10%"><div class="inner_cell">기능</div></th>
				</tr>
				</thead>
				<tbody>
<% 
Dim intCount, kCount, Tipkeyword, TipLink, y, i 
Dim lineMod, lineTag
sQuery = "select * from tb_pregnancyCheckList where period = '"&period&"' order by orderNum asc"
Set oRs = Server.CreateObject("ADODB.Recordset") 
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword, TLink from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Set Rs = Server.CreateObject("ADODB.Recordset") 
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   If Rs("TLink") <> "" Then 
			     TipLink = "<a href="""&Rs("TLink")&""" target=""_blank"">"&Rs("TipKeyword")&"</a>"
               Else 
                 TipLink = Rs("TipKeyword")
			   End If 
			   
			   Tipkeyword = Tipkeyword & TipLink
               

			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  



%>
			        <tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("orderNum")%></div></td>
						<td><div class="inner_cell"><%=oRs("gTitle")%></div></td>
                        <td><div class="inner_cell"><%=Tipkeyword%></div></td>
                        <td><div class="inner_cell"><%=oRs("gNumber")%></div></td>
						<td><div class="inner_cell"><a href="goodsedit.asp?cNum=<%=oRs("cNum")%>">수정 및 삭제하기</a></div></td>
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



			<ul class="list_info">
			<li><span class="txt_num">1</span> [출산용품등록] 신규 출산용품 정보를 등록합니다.</li>
            <li><span class="txt_num">2</span> [가져오기]비그룹 목록 내에 포함된 품목을 해당 기간으로 가져오기 설정합니다.</li>
            <li><span class="txt_num">3</span> [내보내기]현재 그룹의 품목을 비그룹 목록으로 내보내기 설정합니다.</li>
            <li><span class="txt_num">3</span> [순서변경]현재 그룹의 품목 순서를 재정의 합니다.</li>
			</ul>
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>
<script language="javaScript">
function listImport(period){
	
	var popup = window.open("Searchpopup.asp?period="+period+"&iType=import", "listImport","height=600,width=820,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,top=0,left=0");
	popup.focus();

}
function listexport(period){
	
	var popup = window.open("Searchpopup.asp?period="+period+"&iType=export", "listImport","height=600,width=820,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,top=0,left=0");
	popup.focus();

}

function orderList(period){
	
	var popup = window.open("Orderpopup.asp?period="+period, "orderList","height=600,width=820,toolbar=no,menubar=no,location=no,scrollbars=no,resizable=no,top=0,left=0");
	popup.focus();

}

</script>
<% 	call sDbClose() %>
