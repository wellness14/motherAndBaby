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

	page_size = 10

	page = fncRequest("page")

	If page = "" Then page = 1

	startNum = (page-1) * page_size

	endNum = startNum + page_size

	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_PRAISE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_DPH = 1 AND BA_CNLKBN='N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	total_page = intTotalCnt / page_size
	total_page = -(Int(-(total_page)))

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
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL) BA_LOCAL_NM	"
	strSql = strSql & "			,(SELECT CC_KOR_NM2 FROM MO_COMM_CD WHERE CC_COMM_CD = BA_LOCAL_DETAIL) BA_LOCAL_NM2		"
	strSql = strSql & "		FROM MO_BRD_PRAISE A WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_DPH = 1 AND BA_CNLKBN='N' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.getRows()
	End If 
	Call RSClose(Rs)

	Response.write callback & "({totalCount: " & intTotalCnt & ", totalPage: " & total_page & ", currentPage: " & page & ", list: ["
	
	If IsArray(arrList) Then 
		For num = 0 To UBound(arrList,2)
			ba_idx = Trim(arrList(0,num))
			mem_nm = Trim(arrList(3,num))
			title = Trim(arrList(4,num))
			reg_dt = Replace(Left(arrList(6,num),10), "-", ".")
			ba_local_nm = Trim(arrList(9,num))
			
			If num > 0 Then
				Response.write ","
			End If

			Response.write "{ba_idx: " & ba_idx & ", ba_local_nm: '" & ba_local_nm & "', mem_nm: '" & mem_nm & "', title: '" & title & "', reg_dt: '" & reg_dt & "'}"
		Next
	End If

	Response.write "]})"
%>