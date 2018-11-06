<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2, bbscode, menuTitle
menuCode = "70000"
menuCode2 = "A" 

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
     <h3 class="tit_pulisher">앱버전관리</h3>
	<br/>
	
     <div ng-controller="mediaListController as ctrl" data-ng-init="ctrl.init()">
	         
			 <table class="tbl_comm">
				<caption class="screen_hide">운영자 목록 표</caption>
				<colgroup>
					<col>
					<col>
					<col>
					<col>
					<col>
					<col>
				</colgroup>
				<thead>
				<tr>
					<th class="fst" scope="col"><div class="inner_cell">NO</div></th>
					<th scope="col"><div class="inner_cell">마켓이름</div></th>
					<th scope="col"><div class="inner_cell">버전네임</div></th>
					<th scope="col"><div class="inner_cell">버전코드</div></th>
					<th scope="col"><div class="inner_cell">클래스명</div></th>
                    <th scope="col"><div class="inner_cell">URL</div></th>
					<th scope="col"><div class="inner_cell">강제</div></th>
                    <th scope="col"><div class="inner_cell">사용</div></th>
					<th scope="col"><div class="inner_cell">날짜</div></th>
					<th scope="col"><div class="inner_cell">기타</div></th>
				</tr>
				</thead>
				<tbody>
<%
sQuery = "SELECT * From tb_Appversion_history order by regDate desc"
Set oRS = oDb.Execute(sQuery)

Dim i , lineMod, lineTag, popName, useName
i = 1

Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

If oRs("popflag") = "L" Then  popName  = "나중에"
If oRs("popflag") = "C" Then  popName  = "<font color=red>강제</font>"

If oRs("useYN") = "Y" Then  useName  = "사용"
If oRs("useYN") = "N" Then  useName  = "<font color=red>미사용</font>"


%>

					<tr<%=lineTag%>>
                    	<td><div class="inner_cell"><%=i%></div></td>  
                        <td><div class="inner_cell"><%=oRs("maketName")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("versionName")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("versionCode")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("className")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("downUrl")%></div></td>    
                        <td><div class="inner_cell"><%=popName%></div></td>    
                        <td><div class="inner_cell"><%=useName%></div></td>    
                        <td><div class="inner_cell"><%=Left(oRs("regDate"),10)%></div></td>
                        <td><div class="inner_cell"><a href="appedit.asp?seq=<%=oRs("seq")%>">수정</a></div></td>						
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

		
				
			
		
		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>