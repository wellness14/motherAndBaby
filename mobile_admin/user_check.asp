<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%

	DIM USERID,USER_PWD ,LOGIN_TYPE , RE_PATH
	Dim strDomain : strDomain = "mothernbaby.co.kr"

	USERID		= fncRequest("adminID")
	USER_PWD	= fncRequest("adminPWD")

	USERID		= REPLACE( USERID, "'", "")
	USERID		= REPLACE( USERID, "-", "")
	USER_PWD	= REPLACE( REPLACE( USER_PWD, "'", ""), "-", "")

'	com_info	= fncRequestCookie("com_info")

	If USERID <> "" And USER_PWD <> "" Then   '임시 아이디   AND LEN(com_info)=35
		strSql = "SELECT UL_MEM_NM, UL_GRP_CD FROM MO_USER_LIST with(nolock) WHERE UL_MEM_ID = '" & USERID & "' AND UL_USE_YN ='Y'  AND UL_PWD = dbo.UF_MD5('"& USER_PWD &"') "
		SET RS = DBExec(strSql, "main")
		If Not Rs.EOF Then 
			Response.Cookies("CK_USER_INFO") = ""
			Response.Cookies("CK_USER_INFO").Path = "/"
			Response.Cookies("CK_USER_INFO").Domain = strDomain


			Response.Cookies("USERID") = ""
			Response.Cookies("USERID").Path = "/"
'			Response.Cookies("USERID").Domain = strDomain

			Response.Cookies("userid") = USERID
			Response.Cookies("userid").Path = "/"
'			Response.Cookies("userid").Domain = strDomain

			Response.Cookies("username") = TRIM(RS(0))
			Response.Cookies("username").Path = "/"
			Response.Cookies("username").Domain = strDomain

			Response.Cookies("usergrpcd") = TRIM(RS(1))
			Response.Cookies("usergrpcd").Path = "/"
			Response.Cookies("usergrpcd").Domain = strDomain

			
			RE_PATH = "/mobile_admin/member/mobile_member_list.asp"
			
			Response.Redirect RE_PATH  '메인페이지 가기
		End If 
		CALL RSCLOSE(RS)
	End If 
%>
<script type="text/javascript">
<!--
   alert("아이디 / 패스워드를 확인해 주세요.");
   window.top.location.href="/mobile_admin/mobile_index.asp"
//-->
</SCRIPT>