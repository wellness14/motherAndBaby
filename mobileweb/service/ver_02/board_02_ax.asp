<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

Response.charset = "utf-8"

%>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<%
	intIDX	= fncRequest("idx")
	intType = fncRequest("type")
	If intType = "" Then intType = 0

	Select Case intType
		Case 0 : ba_type = "예약및결제"
		Case 1 : ba_type = "서비스"
		Case 2 : ba_type = "정부지원 바우처"
		Case 3 : ba_type = "기타"
	End Select 

'--------------------------------------------------------------------------
'	FAQ 상담하기 리스트 호출
	strSql  = ""
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_TYPE "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_CONTENT   "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_FAQ A WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_TYPE='"& ba_type &"' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
%>
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)
			idx			= Trim(arrList(0,num))
			ba_type		= Trim(arrList(1,num))
			title		= Trim(arrList(2,num))
			content		= Trim(arrList(3,num))
%>
	<table border="0" align="center" cellpadding="0" cellspacing="0">
	<tr align="left">
	    <td width="5"></td> 
		<td width="34" valign="top" style="padding-top:10px;"><img src="/image/img_0003.jpg" style="width:20px; height:20px;" /></td>
		<td width="316" style="padding-top:10px; padding-bottom:10px;" class="titleArea" style="cursor:pointer;"><%=title%></td>
	    <td width="5"></td> 
	</tr>
	<tr>
		<td colspan="4"><img src="/image/img_0005.jpg" height="1" /></td>
	</tr>
	<tr align="left" class="txtArea" <%If intIDX <> idx Then%>style="display:none;"<%End If%>>
		<td width="5"></td>
		<td width="34" valign="top" style="padding-top:10px;"><img src="/image/img_0004.jpg" style="width:20px; height:20px;" /></td>
		<td width="316" style="padding-top:10px; padding-bottom:10px;"><%=content%></td>
		<td width="5"></td>
	</tr>
	<tr class="lineArea" <%If intIDX <> idx Then%>style="display:none;"<%End If%>>
		<td colspan="4"><img src="/image/img_0005.jpg" height="1" /></td>
	</tr>
	</table>
	<!-- <div style="text-align:left; border-bottom:1px solid #eeeeee; min-height:40px; height:auto; width:100%; line-height:20px;" class="titleArea">
		<img src="/image/img_0003.jpg" style="width:20px; height:20px;" />
		<%=title%>
	</div>

	<div style="text-align:left; border-bottom:1px solid #eeeeee; min-height:40px; height:auto; width:100%; <%If intIDX <> idx Then%>display:none;<%End If%>" class="txtArea">
		<img src="/image/img_0004.jpg" style="width:20px; height:20px;" />
		<%=content%>
	</div> -->
<%
		Next 
	End If
%>	
	<script type="text/javascript">
		var title = jQuery('.titleArea');
		var content = jQuery('.txtArea');
		var line = jQuery('.lineArea');
		jQuery(document).ready(function(){
			title.click(function(){
				num = title.index(this);
				content.hide();
				line.hide();

				content.eq(num).show();
				line.eq(num).show();
			});
		});
	</script>