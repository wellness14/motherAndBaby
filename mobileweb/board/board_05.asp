<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode1 = "" Then menuCode1 = "50000" 
If menuCode2 = "" Then menuCode2 = "E"

%> 
<!DOCTYPE html>
<html>
<head>
	<!--#include virtual="/mobileweb/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
        <!----------------------------------------- 메뉴바시작 ----------------------------------------->
  		<div id="mnav" class="menu">
        <!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
		</div>
        <!----------------------------------------- 본문 ----------------------------------------->        
<%
	brd_id = "EVENT"

'--------------------------------------------------------------------------
'	이벤트 리스트 호출
	strSql = "SELECT "
	strSql = strSql & "		BA_IDX "
	strSql = strSql & "		,BA_TITLE "
	strSql = strSql & "		,BA_SEC_FLG "
	strSql = strSql & "		,BA_STD_SDT "
	strSql = strSql & "		,BA_STD_EDT "
	strSql = strSql & "		,BA_FILE_NM "
	strSql = strSql & "		,BA_FILE_PATH "
	strSql = strSql & "FROM MO_BRD_EVENT WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' AND BA_FILE_PATH !='' "
	strSql = strSql & "ORDER BY BA_IDX DESC "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrEventList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
%>      
		<div id="mcontainer">


		<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td style="padding-top:0px;"><img src="/mobileweb/html/images/sub04_subtitle05.jpg" width="360" /></td>
				</tr>
				<tr>
					<td height="6px;"><!--img src="/mobileweb/html/images/text_0055.jpg" width="143" height="22" /--></td>
				</tr>
			</table>

			<table id="eventArea" width="360">
			<tr>
		<%
			Dim strEventList : strEventList = ""
			Dim strImg : strImg = ""
			Dim strTxt : strTxt = ""
			Dim arrFilePath : arrFilePath = Null
			If IsArray(arrEventList) Then 
				intTotalCnt = UBound(arrEventList,2)
				For num = 0 To intTotalCnt
				'------------------------------------------------
				'	이미지 영역
					idx			= Trim(arrEventList(0,num))
					title		= Trim(arrEventList(1,num))
					sdate		= Replace(arrEventList(3,num),"-",".")
					edate		= Replace(arrEventList(4,num),"-",".")
					file_path	= arrEventList(6,num)
					If file_path <> "" Then arrFilePath = Split(file_path,"||")

					If num <> 0 And num Mod 3 = 0 Then 
						strEventList = strEventList & "</tr><tr>"
					End If 

					strEventList =  strEventList & "<td width='116' height='200' style='background-color:#f4f4f4;'><img src='/upload_file/file/"& arrFilePath(0) &"' width='116' height='88' border='0' onclick=fncView('N','"& idx &"',''); style='cursor:pointer;'/>"
					strEventList =  strEventList & "<p id='event_text_000'><class='event_text'>"& title &"<br />"
					strEventList =  strEventList & "<span class='event_text_1'>"& sdate &"~"& edate &"</span></p></td>"
				'------------------------------------------------
				Next 
				response.Write strEventList
			End If 
		%>
			</tr>
			</table>


			
		</td>
	</tr>
	</table>
	<script type="text/javascript" src="/mobileweb/Common/js/jquery/jquery.pager.js"></script>
	<script type="text/javascript">
		jQuery('#brdPager').setPager_info('<%=page%>','<%=strPathInfo%>?x=','<%=intTotalCnt%>','<%=intPreCP%>','<%=intCP%>','<%=intNextCP%>', { nppg : '<%=page_size%>'});
	</script>
        </div>
         <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->
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