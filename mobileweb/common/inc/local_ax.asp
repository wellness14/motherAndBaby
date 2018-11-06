<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
Response.ContentType = "text/html; charset=UTF-8;"
%>
<!-- #include virtual = "/common/asp/VarDef.asp" -->
<!-- #include virtual = "/common/asp/Fundef.asp" -->
<!-- #include virtual = "/common/asp/RSexec.asp" -->

	<!-- <option value="">지점선택</option> -->
<%
	local = fncRequest("local")
	localCd = fncRequest("localCd")
	If local <> "" Then 
		strSql = " SELECT CC_COMM_CD,CC_KOR_NM2, CC_COMM_CD_GUBUN FROM ( "
		strSql = strSql & " 	SELECT CC_COMM_CD,CC_KOR_NM2, REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM, CC_COMM_CD_GUBUN "
		strSql = strSql & " 	FROM MO_COMM_CD WITH(NOLOCK) "
		strSql = strSql & " 	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
		strSql = strSql & " ) T1 "
		strSql = strSql & " WHERE KOR_NM = '"& local &"' "
		strSql = strSql & " ORDER BY CC_KOR_NM2 ASC "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	End If 

	If IsArray(arrList) Then 
		For num = 0 To UBound(arrList,2)
%>
			
			<option value="<%=arrList(2,num)%>:<%=arrList(0,num)%>" <%If localCd = arrList(0,num) Then%>selected<%End If%>><%=arrList(1,num)%></option>
			 
<%
		Next 
	End If 
%>
	