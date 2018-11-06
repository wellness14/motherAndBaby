<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "50000" 
If menuCode2 = "" Then menuCode2 = "C"

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
	brd_id = "CONSULT"

	page = fncRequest("page")
	If page = "" Then page = 1
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

'--------------------------------------------------------------------------
'	1:1 상담하기 리스트 호출
	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_CONSULT WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' "
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
	strSql = strSql & "			,BA_DPH "
	strSql = strSql & "			,BA_PIDX "
	strSql = strSql & "			,BA_MEM_NM  "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT	"
	strSql = strSql & "			,RE_CNT = (SELECT COUNT(1) FROM MO_BRD_CONSULT B WHERE B.BA_PIDX=A.BA_IDX AND B.BA_DPH='2') "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_CONSULT A WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
%>
        <div id="mcontainer">
        	<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:0px;"><img src="/mobile/html/images/sub04_subtitle03.jpg" width="360"  /></td>
			</tr>
			</table>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:5px; padding-bottom:15px;"><div align="right"><a href="./board_write.asp?menuCode1=<%=menuCode1%>&menuCode2=<%=menuCode2%>"><img src="/mobile/html/images/bt_0011.jpg" width="110"  border="0" /></a></div></td>
			</tr>
			</table>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="2">
			<tr>
				<td width="30" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
				<td width="210" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
				<td width="40" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
				<td width="40" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
				<td width="35" bgcolor="#979797" class="white_text"><div align="center">처리상태</div></td>
			</tr>
<%
			If IsArray(arrList) Then 
				For num=0 To UBound(arrList,2)
					intNum		= intTotalCnt - (page-1) * page_size - num
					ba_idx		= Trim(arrList(0,num))
					ba_dph		= Trim(arrList(1,num))
					ba_pidx		= Trim(arrList(2,num))
					mem_nm		= Trim(arrList(3,num))
					title		= Trim(arrList(4,num))
					sec_flg		= arrList(5,num)
					reg_dt		= Left(arrList(6,num),10)
					re_cnt		= arrList(7,num)

					re_nm = "답변대기"
					If re_cnt > 0 Or ba_dph = 2 Then 
						re_nm = "답변완료"
					End If 

					If ba_dph = 2 Then 
						ba_idx = ba_pidx
					End If 
%>
		
			<tr>
				<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
				<% If ba_dph = "1" Then %>
				<td bgcolor="#ebebeb" style="padding-left:10px;">
				<% Else %>
				<td height="60" bgcolor="#cccccc" style="padding-left:20px;"><img src="/image/img_0007.jpg" width="20px" heigth="5px" align="absmiddle" />
				<% End If %><a href="#_" onclick="fncView('<%=sec_flg%>','<%=ba_idx%>','<%=intNum%>');" class="bbs_list"><%=title%></a><%If sec_flg <> "N" Then%>&nbsp;<img src="/image/img_0006.png" width="15px" align="absmiddle" /><%End If%>
				</td>
				<td height="60" bgcolor="#ebebeb"><div align="center"><%=mem_nm%></div></td>
				<td height="60" bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
				<td height="60" bgcolor="#ebebeb"><div align="center"><%=re_nm%></div></td>
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
			<p style="margin-top:50px;">    
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

	 <style type="text/css">
     #ViewPop{
	  width:100%; height:80%; background:#ffffff; color:#fff; 
	  position:fixed; top:60px; left:0px; text-align:center; 
	  border:2px solid #000;
	   }
 	 </style>
     <!-- 비밀번호 찾기 레이어 -->                  
     <div id="ViewPop" style="display:none;"></div>


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
     function div1_closeLayer(IdName){
	 var pop = document.getElementById(IdName);
	 pop.style.display = "none";
	}

</script>

</html>