<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "50000" 
If menuCode2 = "" Then menuCode2 = "A"

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
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobile/common/menu/sub_menu.asp"-->	
		</div>
        <!----------------------------------------- 본문 ----------------------------------------->
<%
    brd_id = "NOTICE"

	page = fncRequest("page")
	If page = "" Then page = 1
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

'--------------------------------------------------------------------------
'	공지사항 리스트 호출
	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	strSql = " SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_TYPE "
	strSql = strSql & "			,BA_MEM_NM  "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT	"
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_DPH='1' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrNoticList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
%>
        <div id="mcontainer">
        <td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-top:0px;"><img src="/mobile/html/images/sub04_subtitle01.jpg" width="360"  /></td>
				</tr>
			</table>

			<p style="margin-top:10px;">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="2">
				<tr>
					<td width="30" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
					<td width="290" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
					<td width="40" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
				</tr>
			<%
				If IsArray(arrNoticList) Then 
					For num=0 To UBound(arrNoticList,2)
						intNum		= intTotalCnt - (page-1) * page_size - num
						idx			= Trim(arrNoticList(0,num))
						ba_type		= Trim(arrNoticList(1,num))
						mem_nm		= Trim(arrNoticList(2,num))
						title		= Trim(arrNoticList(3,num))
						sec_flg		= arrNoticList(4,num)
						reg_dt		= Left(arrNoticList(5,num),10)
			%>			
				<tr>
					<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
					<td bgcolor="#ebebeb" style="padding-left:10px;"><a href="#_" onclick="fncView('<%=sec_flg%>','<%=idx%>','<%=intNum%>');" class="bbs_list"><%=title%></a></td>
					<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
				</tr>
            <%
					Next 
				End If 
			%>
			</table>
			<p style="margin-top:20px;">	 	  
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td id="brdPager"></td>
				</tr>
			</table>
			<p style="margin-top:40px;">	  
		</td>
	</tr>
	</table>
    <script type="text/javascript" src="/mobile/Common/js/jquery/jquery.pager.js"></script>
	<script type="text/javascript">
		jQuery('#brdPager').setPager_info('<%=page%>','<%=strPathInfo%>?x=','<%=intTotalCnt%>','<%=intPreCP%>','<%=intCP%>','<%=intNextCP%>', { nppg : '<%=page_size%>'});
	</script>
        </div>
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