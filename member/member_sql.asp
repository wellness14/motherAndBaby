<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : ȸ�� ����
'�� �� �� : member_sql.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/member_email_send.asp"-->
<!-- #include virtual = "/common/asp/DbGodo.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
	mOne		= fncRequest("mOne")
	mTwo		= fncRequest("mTwo")
	
    mode		= fncRequest("mode")				'ó������(���/����)
	idCheck		= fncRequest("idCheck")				'���̵� üũ ����
	smsCheck	= fncRequest("smsCheck")			'sms üũ ����
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		check1			= fncRequest("check1")				' �̿���
		check2			= fncRequest("check2")				' ����������޹�ħ
		mem_id			= Trim(fncRequest("mem_id"))		' �����ID
		mem_old_pw		= Trim(fncRequest("mem_old_pw"))	' ���� ��й�ȣ
		mem_pw			= Trim(fncRequest("mem_pw"))		' ��й�ȣ
		mem_nm			= Trim(fncRequest("mem_nm"))		' ����� �̸�
		radio1			= fncRequest("radio1")				' ����

		Ybirth			= fncRequest("Ybirth")				' �������
		Mbirth			= fncRequest("Mbirth")				' �������
		Dbirth			= fncRequest("Dbirth")				' �������

		phone_1			= Trim(fncRequest("phone_1"))		' ��ȭ��ȣ
		phone_2			= Trim(fncRequest("phone_2"))		' ��ȭ��ȣ
		phone_3			= Trim(fncRequest("phone_3"))		' ��ȭ��ȣ

		hp_1			= Trim(fncRequest("hp_1"))			' �ڵ�����ȣ
		hp_2			= Trim(fncRequest("hp_2"))			' �ڵ�����ȣ
		hp_3			= Trim(fncRequest("hp_3"))			' �ڵ�����ȣ

		add_hp_1			= Trim(fncRequest("add_hp_1"))			' �ڵ�����ȣ
		add_hp_2			= Trim(fncRequest("add_hp_2"))			' �ڵ�����ȣ
		add_hp_3			= Trim(fncRequest("add_hp_3"))			' �ڵ�����ȣ

		check3			= fncRequest("check3")				' SMS ���ŵ���

		post			= Trim(fncRequest("post"))		' �����ȣ
 
		address1		= Trim(fncRequest("address1"))		' �ּ�
		address2		= Trim(fncRequest("address2"))		' �ּ�

		email			= Trim(fncRequest("email"))			' �̸���
		check4			= fncRequest("check4")				' �̸��� ���� ����

		childbirth_y	= fncRequest("childbirth_y")		' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")		' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")		' ��꿹����

		radio3			= fncRequest("radio3")				' ū���� ����
		radio4			= fncRequest("radio4")				' ��𱸺�

		part			= fncRequest("part")				' ���� ����

		agree3			= fncRequest("agree3")				' ��3����������
  
		If part <> "" then
        class_value = part
		dim myarray                          
		myarray=split(class_value,":")
		class_value_1=myarray(0)      
		title_value_1=myarray(1)

		End if
        
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
	If Ybirth <> "" And Mbirth <> "" And Dbirth <> "" Then 
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	End If 

	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	'post = post_1 & "-" & post_2

	add_phone = add_hp_1 & "-" & add_hp_2 & "-" & add_hp_3
	
	If check3 = "" Then check3 = "N" 
	If check4 = "" Then check4 = "N"

	If childbirth_y <> "" And childbirth_m <> "" And childbirth_d <> "" Then 
	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	End If 
	
	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

	If mode = "ins" And (check1 = "" Or check2 = "") Then 
		intMsg = 1
	ElseIf mode = "upd" And mem_old_pw = "" Then 
		intMsg = 5
	ElseIf mode = "ins" And idCheck = "N" Then 
		intMsg = 6
	ElseIf mode = "ins" And smsCheck = "N" Then 
		intMsg = 7
	Else 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_MEM_MAS ( "
				strSql = strSql & "         MM_MEM_ID,MM_MEM_TYPE,MM_MEM_NM,MM_MEM_PW "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& mem_id &"','S','"& mem_nm &"',dbo.UF_MD5('"& mem_pw &"'); "

				strSql = strSql & " INSERT INTO MO_MEM_DTL ( "
				strSql = strSql & "         MD_MEM_ID,MD_PHONE,MD_HP,MD_SEX,MD_BIRTH,MD_POST,MD_ADDR1,MD_ADDR2, "
				strSql = strSql & "         MD_EMAIL,MD_SNS_FLG,MD_EMAIL_FLG,MD_LOCAL,MD_LOCAL_DETAIL,MD_CHILDBIRTH,MD_CHILD_FLG,MD_TYPE, MD_HP_ADD, MD_EXT_INFO "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& mem_id &"','"& phone &"','"& hp &"','"& radio1 &"','"& birth &"','"& post &"','"& address1 &"','"& address2 &"', "
				strSql = strSql & "			'"& email &"','"& check3 &"','"& check4 &"','"& class_value_1 &"','"& title_value_1 &"','"& childbirth &"','"& radio3 &"','"& radio4 &"','"& add_phone &"','"& agree3 &"'; "
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				
				'���� ȸ������ ����
				godoSql = "insert into gd_member set"
				godoSql = godoSql & " m_id = '"& mem_id &"',"
				godoSql = godoSql & " level = '1',"
				godoSql = godoSql & " name = '"& mem_nm &"',"
				godoSql = godoSql & " nickname = '"& mem_nm &"',"
				godoSql = godoSql & " password	= password('"& mem_pw &"'),"
				godoSql = godoSql & " password_moddt = now(),"
				godoSql = godoSql & " status = '1',"
				godoSql = godoSql & " email = '"& email &"',"
				godoSql = godoSql & " zipcode = '"& post &"',"
				godoSql = godoSql & " address = '"& address1 &"',"
				godoSql = godoSql & " address_sub = '"& address2 &"',"
				godoSql = godoSql & " phone = '"& hp &"',"
				godoSql = godoSql & " mobile = '"& hp &"',"
				godoSql = godoSql & " mailling = '"& LCase(check4) &"',"
				godoSql = godoSql & " sms = '"& LCase(check3) &"',"
				godoSql = godoSql & " sex = '',"
				godoSql = godoSql & " inflow = 'mnb',"
				godoSql = godoSql & " regdt = now()"

				dbConGodo.Execute(godoSql)

				dbConGodo.Close
				Set dbConGodo = Nothing

				intMsg = 2
			
				sMailTile	= "[�����غ��̺�] ȸ�� ������ ���� �帳�ϴ�."
				sContent	= Left(mem_pw,Len(mem_pw)-2) & "**"
				zRtn = FNC_SEND_EMAIL("�����غ��̺�", "mothernbaby@mothernbaby.co.kr", email, mem_id, mem_nm, sMailTile, sContent, "JOIN")

			Case "upd" : 
				If mem_id <> "" And mem_old_pw <> "" Then 
				'---------------------------------------------------------------------
				'	��й�ȣ Ȯ��
					strSql = " SELECT MM_MEM_ID FROM MO_MEM_MAS WITH(NOLOCK) WHERE MM_MEM_ID = '" & mem_id & "' AND MM_MEM_PW = dbo.UF_MD5('"& mem_old_pw &"') "
					Set Rs = DBExec(strSql,"main")
					If Not Rs.EOF Then 
						mem_old_id = Rs(0)
					End If 
					Call RSClose(Rs)
				'---------------------------------------------------------------------
 
					If mem_id = mem_old_id Then 
						strSql = ""
						strSql = strSql & " UPDATE MO_MEM_MAS SET "
						strSql = strSql & "		MM_UPD_DT = GETDATE() "
						If mem_pw <> "" Then 
						strSql = strSql & "		,MM_MEM_PW = dbo.UF_MD5('"& mem_pw &"') "
						End If 
						strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"'; "

						strSql = strSql & " UPDATE MO_MEM_DTL SET "
						strSql = strSql & "		MD_PHONE ='"& phone &"' "
						strSql = strSql & "		,MD_HP ='"& hp &"' "
						strSql = strSql & "		,MD_POST ='"& post &"' "
						strSql = strSql & "		,MD_ADDR1 ='"& address1 &"' "
						strSql = strSql & "		,MD_ADDR2 ='"& address2 &"' "
						strSql = strSql & "		,MD_EMAIL ='"& email &"' "
						strSql = strSql & "		,MD_SNS_FLG ='"& check3 &"' "
						strSql = strSql & "		,MD_EMAIL_FLG ='"& check4 &"' "
						strSql = strSql & "		,MD_LOCAL ='"& class_value_1 &"' "
						strSql = strSql & "		,MD_LOCAL_DETAIL ='"& title_value_1 &"' "
						strSql = strSql & "		,MD_CHILDBIRTH ='"& childbirth &"' "
						strSql = strSql & "		,MD_CHILD_FLG ='"& radio3 &"' "
						strSql = strSql & "		,MD_TYPE ='"& radio4 &"' "
						strSql = strSql & "		,MD_HP_ADD ='"& add_phone &"' "
						strSql = strSql & "	WHERE MD_MEM_ID='"& mem_id &"'; "
						Call DBExec(strSql, "main") : Call DBClose(DBCon)
						intMsg = 3
					Else 
 '�����
						intMsg = 5
					End If 
				Else 
 
					intMsg = 5
				End If 
			Case "del" : 
				uId = Trim(fncRequestCookie("uid"))
				If uId <> "" Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_MEM_MAS SET "
					strSql = strSql & "		MM_UPD_DT = GETDATE() "
					strSql = strSql & "		,MM_DEL_DT = GETDATE() "
					strSql = strSql & "	WHERE MM_MEM_ID='"& uId &"'; "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		End Select 
	End If 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('�̿����� ������ �ּ���');
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "http://www.mothernbaby.co.kr/member/login.asp?mOne=6&mTwo=1"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "http://www.mothernbaby.co.kr/member/member_change.asp?mOne=6&mTwo=6"
			break;
			case(4) :
				alert('�׵��� �����غ��̺� �̿��� �ּż� �����մϴ�.\nȸ�� Ż�� �Ǿ����ϴ�.');
				parent.location.href = "http://www.mothernbaby.co.kr/member/logout.asp"
			break;
			case(5) :
				alert('ȸ�������� ��ġ���� �ʽ��ϴ�.');
			break;
			case(6) :
				alert('���̵� �ߺ�üũ�� �� �ּ���.');
			break;
			case(7) :
				alert('�ڵ��� ������ �� �ּ���.');
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
