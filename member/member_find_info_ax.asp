<%
Response.AddHeader "Cache-Control", "no-cache"
Response.AddHeader "Expires", "0"
Response.AddHeader "Pragma", "no-cache"
Response.ContentType = "text/html; charset=euc-kr"
%>
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/member_email_send.asp"-->
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
	'	ȸ������ ��ȸ
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
				sMailTile	= "[�����غ��̺�] ȸ�� ���̵� ã�� �����Դϴ�."
				sContent	= Left(mm_id,Len(mm_id)-2) & "**"
				zRtn = FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", mem_email, mm_id, mem_nm, sMailTile, sContent, "ID")
                if zRtn <> "ok" then
                    intMsg = 9
		        Else
                    intMsg = 3
				End If 
			Else 
				sMailTile = "[�����غ��̺�] "& mem_nm &" ȸ������ ��й�ȣ�Դϴ�."
				sContent = fncRandom(8,"")

				'�ӽú�й�ȣ SMS/���� �߼����Ŀ� MM_PWD �� ��ȣȭ ó��
				strSql = "UPDATE MO_MEM_MAS SET MM_MEM_PW = dbo.UF_MD5('"& LCase(sContent) &"'), MM_UPD_DT=getdate()  WHERE MM_MEM_ID='"&TRIM(mm_id)&"' "
				Call DBExec(strSql,"main") : Call DBClose(DBCon)

				zRtn = FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", mem_email, mm_id, mem_nm, sMailTile, sContent, "PWD")
                if zRtn <> "ok" then
                    intMsg = 9
		        Else
                    intMsg = 4
				End If
			End If 
		End If 
	End If 

'--------------------------------------------------------------------------
'	�ӽ� ��й�ȣ ����
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
				alert('��������� �ٽ� Ȯ���� �ּ���');
			break;
			case(2) :
				alert('��ġ�ϴ� ȸ�������� �������� �ʽ��ϴ�.');
			break;
			case(3) :
				alert('ȸ�� ���̵� �̸��Ϸ� �߼� �Ǿ����ϴ�.');
			break;
			case(4) :
				alert('�ӽ� ��й�ȣ�� �̸��Ϸ� �߼۵Ǿ����ϴ�.');
			break;
			case(9) :
				alert('�̸��� �߼ۿ� ������ �ֽ��ϴ�.\n�����ڿ��� ���� ��Ź �帳�ϴ�.');
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
