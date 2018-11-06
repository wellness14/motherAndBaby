<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 

menuCode1 = request("menuCode1") 
menuCode2 = request("menuCode2") 

If menuCode2 = "A" Then linkNum = "1"
If menuCode2 = "B" Then linkNum = "2"
If menuCode2 = "C" Then linkNum = "3"
If menuCode2 = "D" Then linkNum = "4"
If menuCode2 = "E" Then linkNum = "5"

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
	If  menuCode2 = "C" Then brd_id = "CONSULT"
    If  menuCode2 = "D" Then brd_id = "PRAISE"

'-----------------------------------------------------------------------------
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 생성여부 확인
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.2');history.back(-1);</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	게시판 기본 셋팅 정보 추출
	strSql = "SELECT "
	strSql = strSql & "		BM_BRD_TYPE "
	strSql = strSql & "		,BM_BRD_ID "
	strSql = strSql & "		,BM_SEC_FLG "
	strSql = strSql & "		,BM_FILE_CNT "
	strSql = strSql & "	FROM MO_BRD_MAS WITN(NOLOCK) "
	strSql = strSql & "	WHERE BM_BRD_ID='"& brd_id &"' AND BM_CNLKBN='N' AND BM_USE_FLG='Y' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		brd_type	= Rs("BM_BRD_TYPE")
		brd_sec		= Rs("BM_SEC_FLG")
		file_cnt	= Rs("BM_FILE_CNT")
	Else 
		response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.1');history.back(-1);</script>"
		response.End 
	End If 
	Call DBClose(RS)
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	지점 정보 호출
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

	'페이지 Default Query String
	strDftUrl = "menuCode1=" & menuCode1
	strDftUrl = strDftUrl & "&menuCode2=" & menuCode2
	strDftUrl = strDftUrl & "&brd_id=" & brd_id
	strDftUrl = strDftUrl & "&brd_type=" & brd_type
	strDftUrl = strDftUrl & "&brd_sec=" & brd_sec
	strDftUrl = strDftUrl & "&file_cnt=" & file_cnt


	'페이지 값을 더한 Query String
	strLnkUrl = strDftUrl & "&page=" & page
%>
        <div id="mcontainer">


<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="360" style="padding-top:0px;"><img src="/mobileweb/html/images/sub04_subtitle0<%=linkNum%>.jpg" width="360" height="44" /></td>
			</tr>
			<tr>
				<td width="360" height="2"><spacer type="block" /></td>
			</tr>
			<tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
				<td bgcolor="#f6f6f6" style="padding-top:5px; padding-bottom:20px;">
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><img src="/mobileweb/html/images/text_0011.jpg" width="74" /></td>
						<td width="262"><input type="text" name="mem_nm" class="textarea" size="16" valid="E|M=10|A=성명을 입력해 주세요"/></td>
					</tr>
					<% If brd_sec = "A" Or brd_sec = "Y" Then %>
					<tr>
						<td><img src="/mobileweb/html/images/text_0009.jpg" width="74"/></td>
						<td><input type="text" name="pw" class="textarea" size="20" valid="E|N|M=10|T=비밀번호|A=비밀번호를 입력해 주세요"/></td>
					</tr>
					<% End If %>
					<tr>
						<td><img src="/mobileweb/html/images/text_0999.jpg" width="74" /></td>
						<td><input type="text" name="email" class="textarea" size="28" valid="E|M=60|A=이메일을 입력해 주세요"/></td>
					</tr>	
					<tr>
						<td><img src="/mobileweb/html/images/text_0085.png" width="57"/></td>
						<td>
							<select name="local" onChange="fncSetPart(this.value);" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지역</option>
							<%
								If IsArray(arrLocal) Then 
									For num = 0 To UBound(arrLocal,2)
							%>
								<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
							<%
									Next 
								End If 
							%>
							</select>
							<select id="part" name="part" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지점</option>
							</select>
						</td>
					</tr>	
					<!--tr>
						<td><img src="/mobileweb/html/images/text_0035.jpg" width="53" height="19" /></td>
						<td>
							<select name="select6" class="textarea" style="height:35px;">
								<option>지사선택</option>
							</select>
						</td>
					</tr-->
					<tr>
						<td><img src="/mobileweb/html/images/text_0036.jpg" width="52" /></td>
						<td><input type="text" name="title" class="textarea" size="28" valid="E|M=200|A=제목을 입력해 주세요"/></td>
					</tr>
					<!--tr>
						<td><img src="/mobileweb/html/images/text_0037.jpg" width="53" height="19" /></td>
						<td><label>
						<input type="text" name="textfield24" class="textarea" size="35"/>
						&nbsp;&nbsp;<a href="#"><img src="/mobileweb/html/images/bt_0012.jpg" width="107" height="28" border="0" align="absmiddle" /></a></label></td>
					</tr-->
					<tr>
						<td><img src="/mobileweb/html/images/text_0038.jpg" width="52" /></td>
						<td><textarea name="content" class="textarea13" valid="E|M=3000|A=내용을 입력해 주세요"></textarea></td>
					</tr>
					<!--tr>
						<td><img src="/mobileweb/html/images/text_0039.jpg" width="74" height="15" /></td>
						<td><input type="text" name="" class="textarea" size="15"/></td>
					</tr-->
					</table>
				</td>
			</form>
			</tr> 
			<tr>
				<td style="padding-top:20px; padding-bottom:10px;">
					<div align="center" id="btn11"><div class="btn00"><img src="/mobileweb/html/images/bt_0013.jpg" width="110" border="0" id="btnSubmit" style="cursor:pointer;"/></div><div class="btn00"><img src="/mobileweb/html/images/bt_0002.jpg" width="110" border="0" onClick="history.back(-1);" style="cursor:pointer;"/></div></div>
				</td>
			</tr>
			</table>
			<p style="margin-top:20px;">	 
		</td>
	</tr>
	</table>
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
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/mobileweb/common/js/ajax_common.js"></script>
<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./board_sql.asp?<%=strLnkUrl%>"
	});
</script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/mobileweb/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>
</html>
