<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
response.charset = "utf-8"
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
%>
<!-- #include virtual = "/mobile/common/asp/Fundef.asp" -->
<!-- #include virtual = "/mobile/common/asp/RSexec.asp" -->
	<option value="">지점</option>
<%
	local = fncRequest("local")
	localCd = fncRequest("localCd")
	If local <> "" Then 
		strSql = " SELECT CC_COMM_CD,CC_KOR_NM2 FROM ( "
		strSql = strSql & " 	SELECT CC_COMM_CD,CC_KOR_NM2, REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
		strSql = strSql & " 	FROM MO_COMM_CD WITH(NOLOCK) "
		strSql = strSql & " 	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
		strSql = strSql & " ) T1 "
		strSql = strSql & " WHERE KOR_NM = '"& local &"' "
		strSql = strSql & " ORDER BY CC_COMM_CD ASC "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	End If 

	If IsArray(arrList) Then 
		For num = 0 To UBound(arrList,2)
%>
			
			<option value="<%=arrList(0,num)%>" <%If localCd = arrList(0,num) Then%>selected<%End If%>><%=arrList(1,num)%></option>
<%
		Next 
	End If 
%>
	