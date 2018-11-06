<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<%
	  SearchDong = fncRequest("SearchDong")
%>

	<%
		If SearchDong <> "" Then
			strSql = "SELECT ZM_ZIP_CD, ZM_DO+' '+ZM_GU+' '+ZM_DON+' '+ZM_BUN ZM_ADDR,ZM_DO+' '+ZM_GU+' '+ZM_DON FROM MO_ZIP_MAS WITH(NOLOCK) WHERE ZM_DON LIKE '" & SearchDong &"%' ORDER BY ZM_ZIP_CD"
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then   
				Do Until RS.EOF

	%>
			<a href="#_blank" onclick="fncInputAddr('<%=Left(Rs(0),3)%>','<%=Right(Rs(0),3)%>','<%=Rs(0)%>','<%=Rs(2)%>')" class="post_text"><%=RS(0)%>&nbsp;&nbsp;&nbsp;<%=Replace(Rs(1),SearchDong,"<strong>"&SearchDong&"</strong>")%></a>
			<br />
	<%
					Rs.movenext
				Loop 
			End If 
		End If 
	%>
			
