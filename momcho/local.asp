<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	callback = fncRequest("callback")

	If callback = "" Then
		Response.End
	End If
	
	local = fncRequest("local")

	If local = "area" Then '지점 정보 호출
		strSql = "SELECT '' AS COMM_CD, KOR_NM, ''AS COMM_CD_GUBUN FROM ( "
		strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
		strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
		strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
		strSql = strSql & ") T1 "
		strSql = strSql & "GROUP BY KOR_NM "
	Else '지역 정보 호출
		strSql = " SELECT CC_COMM_CD AS COMM_CD, CC_KOR_NM2 AS KOR_NM, CC_COMM_CD_GUBUN AS COMM_CD_GUBUN FROM ( "
		strSql = strSql & " 	SELECT CC_COMM_CD,CC_KOR_NM2, REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM, CC_COMM_CD_GUBUN "
		strSql = strSql & " 	FROM MO_COMM_CD WITH(NOLOCK) "
		strSql = strSql & " 	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
		strSql = strSql & " ) T1 "
		strSql = strSql & " WHERE KOR_NM = '"& local &"' "
		strSql = strSql & " ORDER BY CC_KOR_NM2 ASC "
	End If

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
	
	Response.write callback & "({list: ["

	If IsArray(arrLocal) Then 
		For num = 0 To UBound(arrLocal,2)
			comm_cd = Trim(arrLocal(0,num))
			kor_nm = Trim(arrLocal(1,num))
			comm_cd_gubun = Trim(arrLocal(2,num))

			If num > 0 Then
				Response.write ","
			End If

			Response.write "{comm_cd: '" & comm_cd & "', kor_nm: '" & kor_nm & "', comm_cd_gubun: '" & comm_cd_gubun & "'}"
		Next 
	End If

	Response.write "]})"
%>