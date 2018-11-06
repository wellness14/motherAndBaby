<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")


Dim menuCode, menuCode2
menuCode = "30000"
menuCode2 = "A"

Dim uSeq, period
uSeq = request("uSeq")
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

		<h3 class="tit_pulisher">사용자 출산용품 체크 상세 정보</h3>
		<br/>
			<h4 class="screen_out">사용자 출산용품 체크 상세 정보</h4>
			<div class="unit_option">
				<span class="btn_publisher btn_create">
					<a class="ico_comm inner_btn" href="userList.asp">사용자 로그 목록</a>
				</span>
			</div>
			<p class="screen_hide">아래 테이블은 사용자 출산용품 체크 상세 정보 제공합니다.</p>
			<table class="tbl_comm">
				<caption class="screen_hide">사용자 출산용품 체크 상세 정보</caption>
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
					<col>
					<col>
					<col>
					<col>
					<col>
					<!--col-->
				</colgroup>
				<thead>
				<tr>
					<th scope="col"><div class="inner_cell">Num</div></th>
					<th scope="col"><div class="inner_cell">유저코드</div></th>
					<th scope="col"><div class="inner_cell">이메일(아이디)</div></th>
					<th scope="col"><div class="inner_cell">제목</div></th>
					<th scope="col"><div class="inner_cell">임신초기(1~3개월)</div></th>
					<th scope="col"><div class="inner_cell">임신중기(4~7개월)</div></th>
                    <th scope="col"><div class="inner_cell">임신후기(8~10개월)</div></th>  
                    <th scope="col"><div class="inner_cell">산욕기(출산후 6~8주)</div></th>  
                   <th scope="col"><div class="inner_cell">체크상태(%)</div></th>  
					<th scope="col"><div class="inner_cell">히트수</div></th>  
					<th scope="col"><div class="inner_cell">추천수</div></th>  
                    <th scope="col"><div class="inner_cell">댓글</div></th>  
					<th scope="col"><div class="inner_cell">등록일</div></th>   
					<th scope="col"><div class="inner_cell">수정일</div></th>   
					<!--th scope="col"><div class="inner_cell">기능</div></th-->   

				</tr>
				</thead>
				<tbody>
<%
   '먼저 등록된 체크 리스트의 수를 가져온다. 
   Dim period_num1, period_num2, period_num3, period_num4, period_num

   sQuery = "select count(-1) as totalCount, period from tb_pregnancyCheckList group by period order by period"
   Set oRS = oDb.Execute(sQuery)
   
   period_num = 0
   Do While Not ( oRs.eof or oRs.bof ) 

        select case oRs("period") 
			Case "1"
             period_num1 = oRs("totalCount")
			Case "2" 
			 period_num2 = oRs("totalCount")
            Case "3" 
			period_num3 = oRs("totalCount")
			Case "4" 
			period_num4 = oRs("totalCount")
		  end Select 
 
    period_num = period_num + oRs("totalCount")

	oRs.MoveNext
	Loop

	oRs.close

   

   
   sQuery = "select * "
   sQuery = sQuery & ",(select top 1 emailID from tb_UserInfo where uSeq = uSeq) as uEmail "
   sQuery = sQuery & ",(select count(-1)  from tb_pregnancyUserCheckInfo where uSeq = uSeq and checkYN = 'Y' and period = '1') as user_num1" 
   sQuery = sQuery & ",(select count(-1)  from tb_pregnancyUserCheckInfo where uSeq = uSeq and checkYN = 'Y' and period = '2') as user_num2" 
   sQuery = sQuery & ",(select count(-1)  from tb_pregnancyUserCheckInfo where uSeq = uSeq and checkYN = 'Y' and period = '3') as user_num3" 
   sQuery = sQuery & ",(select count(-1)  from tb_pregnancyUserCheckInfo where uSeq = uSeq and checkYN = 'Y' and period = '4') as user_num4" 
   sQuery = sQuery & " from tb_pregnancyUserInfo " 
   sQuery = sQuery & " where uSeq = '"&uSeq&"' " 
   Set oRS = oDb.Execute(sQuery)


Dim i , lineMod, lineTag, user_num, user_percent, edit_tag
i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

user_num = oRs("user_num1") + oRs("user_num2") + oRs("user_num3") + oRs("user_num4")
user_percent = FormatNumber((user_num / period_num) * 100, 2) 

     edit_tag = "<a href='userview.asp?Useq="&oRs("Useq")&"' style='color:#396BD2'>상세보기</a>"

%>
					<tr<%=lineTag%>>
						<td><div class="inner_cell"><%=oRs("Seq")%></div></td>
						<td><div class="inner_cell"><%=oRs("uSeq")%></div></td>
                        <td><div class="inner_cell"><%=oRs("uEmail")%></div></td>
						<td><div class="inner_cell"><%=oRs("utitle")%></div></td>
						<td><div class="inner_cell">(<%=oRs("user_num1")%>/<%=period_num1%>)</div></td>
						<td><div class="inner_cell">(<%=oRs("user_num2")%>/<%=period_num2%>)</div></td>
						<td><div class="inner_cell">(<%=oRs("user_num3")%>/<%=period_num3%>)</div></td>
                        <td><div class="inner_cell">(<%=oRs("user_num4")%>/<%=period_num4%>)</div></td> 
                        <td><div class="inner_cell">(<%=user_num%>/<%=period_num%>) <%=user_percent%>%</div></td> 
                        <td><div class="inner_cell"><%=oRs("hit")%></div></td> 
                        <td><div class="inner_cell">0</div></td> 
                        <td><div class="inner_cell">0</div></td> 
						<td><div class="inner_cell"><%=oRs("regDate")%></div></td>
						<td><div class="inner_cell"><%=oRs("modifyDate")%></div></td>
						<!--td><div class="inner_cell"><%=edit_tag%></div></td-->
					</tr>
<% 
       
	   i = i + 1
       oRs.MoveNext
	   Loop

	   oRs.close
%>
				</tbody>
			</table>
		<br/>

		<ul class="tab_comm">
		<li<%If period="1" Then%> class="on"<%End if%>><a href="userview.asp?uSeq=<%=uSeq%>&period=1" class="link_tab">임신초기(1~3개월)</a></li>
		<li<%If period="2" Then%> class="on"<%End if%>><a href="userview.asp?uSeq=<%=uSeq%>&period=2" class="link_tab">임신중기(4~7개월)</a></li>
		<li<%If period="3" Then%> class="on"<%End if%>><a href="userview.asp?uSeq=<%=uSeq%>&period=3" class="link_tab">임신후기(8~10개월)</a></li>
		<li<%If period="4" Then%> class="on"<%End if%>><a href="userview.asp?uSeq=<%=uSeq%>&period=4" class="link_tab">산욕기(출산후 6~8주)</a></li>
       </ul>
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
					<th scope="col"><div class="inner_cell">ORDER</div></th>
					<th scope="col"><div class="inner_cell">품목</div></th>
                    <th scope="col"><div class="inner_cell">TIP</div></th>
					<th scope="col"><div class="inner_cell">갯수</div></th>
					<th scope="col"><div class="inner_cell">선택유무</div></th>
				</tr>
				</thead>
				<tbody>
<% 
Dim intCount, checkYN, kCount, Tipkeyword, y
sQuery = "select * from tb_pregnancyCheckList where period = '"&period&"' order by orderNum asc"
oRs.Open sQuery,oDb,1
intCount = oRs.recordcount  

i = 1
Do While Not ( oRs.eof or oRs.bof ) 

lineMod = i mod 2

If lineMod = "0" Then lineTag = " class='bg_even'"
If lineMod = "1" Then lineTag = ""

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&uSeq&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   Else 
			   checkYN = ""
			   End If 
			   Rs.close

			    'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = "" 
			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
			   Tipkeyword = Tipkeyword & Rs("TipKeyword")
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
						<td><div class="inner_cell"><%=checkYN%></div></td>
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

		<div id="ajax-loading-holder">
			<div id="ajax-loading"></div>
		</div> 
        </div>	 
        

		
		<!--#include virtual="/application/include/common/admin_foot.asp"-->
	</div>
</body>
</html>

<% 	call sDbClose() %>
