<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
    Dim menuCode, menuCode2
	menuCode = "00000"
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
					<th scope="col"><div class="inner_cell">컬럼명</div></th>
					<th scope="col"><div class="inner_cell">타입</div></th>
					<th scope="col"><div class="inner_cell">길이</div></th>
					<th scope="col"><div class="inner_cell">디폴트</div></th>
				</tr>
				</thead>
				<tbody>
<%
sQuery = "select column_name, data_type, character_maximum_length, column_default from information_schema.columns where table_name = 'tb_UserDeviceInfo'"
Set oRS = oDb.Execute(sQuery)

Dim i , lineMod, lineTag
i = 1

Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""



%>

					<tr<%=lineTag%>>
                    	<td><div class="inner_cell"><%=i%></div></td>  
                        <td><div class="inner_cell"><%=oRs("column_name")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("data_type")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("character_maximum_length")%></div></td>    
                        <td><div class="inner_cell"><%=oRs("column_default")%></div></td>    
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
