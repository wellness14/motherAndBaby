<%@ Language=VBScript %>
<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����� ���� ����
'�� �� �� : user_action.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<%
    level		= unescape(Trim(fncRequest("level")))
    mode		= fncRequest("mode")
    teamId		= fncRequest("teamId")
    userId		= fncRequest("userId")
	userNm		= unescape(fncRequest("userNm"))
	userPw		= unescape(fncRequest("userPw"))

    returnValue = "true"
    SELECT CASE trim(mode)
		CASE "INS"	'�Է�
			strSql = ""
			strSql = strSql & " IF NOT EXISTS (SELECT TOP 1 UL_MEM_ID FROM MO_USER_LIST WITH(NOLOCK) WHERE UL_MEM_ID='"&userId&"') "
			strSql = strSql & " BEGIN " 
			strSql = strSql & " INSERT INTO MO_USER_LIST (UL_MEM_ID,UL_MEM_NM,UL_GRP_CD,UL_LEVEL,UL_REG_DT,UL_USE_YN,UL_PWD)"
			strSql = strSql & " SELECT "
			strSql = strSql & "    '"& userId &"' "
			strSql = strSql & "		,'"& userNm &"' "
			strSql = strSql & "		,'"& teamId &"' "
			strSql = strSql & " 	,'"& level &"' "
			strSql = strSql & " 	,GETDATE() "
			strSql = strSql & " 	,'Y' "
            strSql = strSql & " 	,dbo.UF_MD5('"& userPw &"') "
			strSql = strSql & " END "

		CASE "EDIT"	'����
		    strSql = ""
			strSql = strSql & " UPDATE MO_USER_LIST "
			strSql = strSql & " SET "
			strSql = strSql & "     UL_GRP_CD = '"& teamId &"' "
			strSql = strSql & "     ,UL_LEVEL = '"& level &"' "
			strSql = strSql & "     ,UL_MEM_NM = '"& userNm &"' "
			strSql = strSql & "     ,UL_UPD_DT = getdate() "
			If userPw <> "" Then 
			strSql = strSql & " 	,UL_PWD = dbo.UF_MD5('"& userPw &"') "
			End If 
			strSql = strSql & " WHERE UL_MEM_ID = '"& userId &"' "

		CASE "USE"	'����
			useYN	= fncRequest("useYN")
			useId	= fncRequest("userId")	'���̵�
			
			If useYN = "Y" Then 
				useYN = "N"
			Else 
				useYN = "Y"
			End If 

			strSql = "UPDATE MO_USER_LIST SET UL_USE_YN = '"& useYN &"', "
            strSql = strSql & " UL_UPD_DT = getdate()  WHERE UL_MEM_ID  = '" & useId & "' "

        CASE "PWD" '��й�ȣ ����
            userId = fncRequest("userId")
            prevPwd = fncRequest("prevPwd")
            modifyPwd = LCase(fncRequest("modifyPwd"))

            '��й�ȣ Ȯ��
            strSql = " SELECT dbo.UF_MD5('"&prevPwd&"') inputPwd ,UL_PWD FROM MO_USER_LIST "
            strSql = strSql & " WHERE UL_MEM_ID = '"&userId&"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
                inputPwd = Rs("inputPwd")
                UL_PWD = Rs("UL_PWD")
            end if
            RSClose(Rs)

            returnValue = "false"
            if inputPwd = UL_PWD then
                strSql = " UPDATE MO_USER_LIST SET UL_PWD = dbo.UF_MD5('"&modifyPwd&"') WHERE UL_MEM_ID = '"&userId&"'; "
                returnValue = "true"
            end if
            response.write returnValue
	END SELECT

	If strSql <> "" Then
	    CALL DBExec(strSql, "main") : CALL DBClose(DBCon)
    end if
%>
