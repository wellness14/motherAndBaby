<%
	uId		= fncRequestCookie("userid")
	grpcd	= fncRequestCookie("usergrpcd")
	If Trim(uId) = "" Then
		response.write "logout"
		response.redirect "/mobile_admin/mobile_index.asp"
		response.end
	End If 

	If uId <> "" Then 
		strSql = " SELECT UL_MEM_ID,UL_GRP_CD FROM MO_USER_LIST WHERE UL_MEM_ID ='"& uId &"' AND UL_USE_YN='Y' "
  		Set Rs = DBExec(strSql,"main")
		If Rs.BOF Or Rs.EOF Then
			response.write "<script type='text/javascript'>alert('아이디를 확인해 주세요');history.back(-1);</script>"
		End If
		CALL RSCLOSE(RS)
	End If 
%>