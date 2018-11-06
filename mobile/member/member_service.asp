<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 
menuCode1 = "10000" 
menuCode2 = "B"

%>
<!DOCTYPE html>
<html>
<head>
	    <!--#include virtual="/mobile/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobile/common/menu/top_all_menu.asp"-->	
        </div>
         <div id="mnav" class="menu">
			<!--#include virtual="/mobile/common/menu/sub_menu.asp"-->	
        </div>
        <!----------------------------------------- 본문 ----------------------------------------->
<%
	If uId <> "" Then 
		strSql = ""
		strSql = strSql & " SELECT MS_IDX, MO_SERVICE, MS_TOTAL, MS_REG_DT "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & " WHERE MS_MEM_ID = '"& uId &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
		arrList = Empty
	End If 
%>
         <div id="mcontainer10">
		<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="360" style="padding-top:0;"><img src="/mobile/html/images/sub70.jpg" width="360"  /></td>
			</tr> 
			<tr>
				<td width="360" ><a href="/mobile/service/service_03.asp?menuCode1=30000&menuCode2=B"><img src="/mobile/html/images/text_0084.jpg" width="360" /></a></td>
			</tr>       
			</table>
			<table width="360" style="padding-left:12px;" border="0" align="center" cellpadding="0" cellspacing="2" >

			<tr>
				<td width="40" height="34" bgcolor="#979797" class="white_text8"><div align="center">번호</div></td>
				<td width="80" bgcolor="#979797" class="white_text8"><div align="center">작성일</div></td>
				<td width="230" bgcolor="#979797" class="white_text8"><div align="center">추천서비스 및 기간 </div></td>
				<td width="90" bgcolor="#979797" class="white_text8"><div align="center">예상금액</div></td>
			</tr>
		<%
			If IsArray(arrList) Then 
				intTotalCnt = UBound(arrList,2) + 1
				For num=0 To UBound(arrList,2)
					intIDX	= arrList(0,num)
					service	= Replace(Trim(arrList(1,num)),"||",", ")
					total	= FormatNumber(arrList(2,num),0)
					reg_dt	= Replace(Left(arrList(3,num),10),"-",".")
		%>
			<tr>
				<td height="34" bgcolor="#ebebeb" style="font-size:12px;"><div align="center"><%=intTotalCnt - num%></div></td>
				<td bgcolor="#ebebeb" style="font-size:12px;" ><div align="center"><%=reg_dt%></div></td>
				<td bgcolor="#ebebeb" style="padding-left:10px; font-size:12px;"><a href="./member_service_view.asp?idx=<%=intIDX%>&<%=strParam%>" class="bbs_list"><%=service%></a></td>
				<td bgcolor="#ebebeb" style="font-size:12px;"><div align="center" style="font-weight:bold; color:#000000"><%=total%>원</div></td>
			</tr>
		<%
				Next 
			End If 
		%>
			</table>
		</td>
	</tr>
	</table>
      <!--#include virtual="/mobile/common/menu/foot_menu.asp"-->	 
	</div> 
</body>       
<script>
	$('document').ready(function(){
    $('.menu').fixedMenu();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){			   
		$(".ani-bg").animate({
			marginTop:"75px"       
		}, 0 );	
	});
</script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				// Define any icon actions before calling the toolbar
				$('.toolbar-icons a').on('click', function( event ) {
					event.preventDefault();
				});
				$('#normal-button-bottom').toolbar({content: '#user-options', position: 'bottom'});
			});
</script>
</html>