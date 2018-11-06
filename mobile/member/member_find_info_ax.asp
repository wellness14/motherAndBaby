<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
response.charset = "utf-8"
%>
<!--#include virtual="/mobile/common/asp/RSexec.asp"-->
<!--#include virtual="/mobile/common/asp/FunDef.asp"-->
<!--#include virtual="/mobile/common/inc/member_email_send.asp"-->
<%
	Dim mem_email : mem_email = ""

	intOption	= fncRequest("option")
	mem_nm		= Trim(fncRequest("mem_nm"))
	hp_1		= fncRequest("hp_1")
	hp_2		= Trim(fncRequest("hp_2"))
	hp_3		= Trim(fncRequest("hp_3"))
	mem_id		= Trim(fncRequest("mem_id"))

	If mem_nm = "" Or hp_1 = "" Or hp_2 = "" Or hp_3 = "" Then 
		intMsg = 1
	ElseIf intOption = "pw" And mem_id = "" Then 
		intMsg = 1
	Else 
		hp = hp_1 &"-"& hp_2 &"-"& hp_3

	'--------------------------------------------------------------------------
	'	회원정보 조회
		strSql  = ""
		strSql = strSql & "	SELECT MM_MEM_ID, MD_EMAIL FROM MO_MEM_MAS WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
		strSql = strSql & "	WHERE MM_MEM_NM='"& mem_nm &"' AND MD_HP='"& hp &"' AND MM_DEL_DT IS NULL "
		If intOption = "pw" Then 
		strSql = strSql & "	AND MM_MEM_ID='"& mem_id &"' "
		End If 
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mm_id		= Rs(0)
			mem_email	= Rs(1)
		End If 
		Call RSClose(Rs)
	'--------------------------------------------------------------------------

		If mem_email = "" Then 
			intMsg = 2
		Else 
			If intOption = "id" Then 
				sMailTile	= "[마더앤베이비] 회원 아이디 찾기 메일입니다."
				sContent	= Left(mm_id,Len(mm_id)-2) & "**"
				zRtn = FNC_SEND_EMAIL("마더앤베이비", "mothernbaby@mothernbaby.co.kr", mem_email, mm_id, mem_nm, sMailTile, sContent, "ID")
                if zRtn <> "ok" then
                    intMsg = 9
		        Else
                    intMsg = 3
				End If 
			Else 
				sMailTile = "[마더앤베이비] "& mem_nm &" 회원님의 비밀번호입니다."
				sContent = fncRandom(8,"")

				'임시비밀번호 SMS/메일 발송이후에 MM_PWD 는 암호화 처리
				strSql = "UPDATE MO_MEM_MAS SET MM_MEM_PW = dbo.UF_MD5('"& LCase(sContent) &"'), MM_UPD_DT=getdate()  WHERE MM_MEM_ID='"&TRIM(mm_id)&"' "
				Call DBExec(strSql,"main") : Call DBClose(DBCon)

				zRtn = FNC_SEND_EMAIL("마더앤베이비", "mothernbaby@mothernbaby.co.kr", mem_email, mm_id, mem_nm, sMailTile, sContent, "PWD")
                if zRtn <> "ok" then
                    intMsg = 9
		        Else
                    intMsg = 4
				End If
			End If 
		End If 
	End If 

'--------------------------------------------------------------------------
'	임시 비밀번호 생성
	Function fncRandom( couponLength, couponString ) 
		Const defaultString = "abcdefghijklmnopqrstuvxyz0123456789" 
		Dim nCount, sRet, nNumber, nLength 

		Randomize 'init random 

		If couponString = "" Then 
			couponString = defaultString  
		End If 

		nLength = Len(couponString) 

		For nCount = 1 To couponLength 
			nNumber = Int((nLength * Rnd) + 1) 
			sRet = sRet & Mid( couponString, nNumber, 1 ) 
		Next 
		fncRandom = sRet 
	End Function 
'--------------------------------------------------------------------------
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('등록정보를 다시 확인해 주세요');
			break;
			case(2) :
				alert('일치하는 회원정보가 존재하지 않습니다.');
			break;
			case(3) :
				alert('회원 아이디가 이메일로 발송 되었습니다.');
			break;
			case(4) :
				alert('임시 비밀번호가 이메일로 발송되었습니다.');
			break;
			case(9) :
				alert('이메일 발송에 문제가 있습니다.\n관리자에게 문의 부탁 드립니다.');
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
