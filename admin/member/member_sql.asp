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
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
    mode			= fncRequest("mode")				'ó������(���/����)
	mem_id			= Trim(fncRequest("mem_id"))		' �����ID

	If mode = "ins" Or mode = "upd" Then 
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

		check3			= fncRequest("check3")				' SMS ���ŵ���

		post_1			= Trim(fncRequest("post_1"))		' �����ȣ
		post_2			= Trim(fncRequest("post_2"))		' �����ȣ

		addr_1			= Trim(fncRequest("addr_1"))		' �ּ�
		addr_2			= Trim(fncRequest("addr_2"))		' �ּ�

		email			= Trim(fncRequest("email"))			' �̸���
		check4			= fncRequest("check4")				' �̸��� ���� ����

		childbirth_y	= fncRequest("childbirth_y")		' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")		' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")		' ��꿹����

		radio3			= fncRequest("radio3")				' ū���� ����
		radio4			= fncRequest("radio4")				' ��𱸺�

		part			= fncRequest("part")				' ���� ����

		birth_j				= fncRequest("birth")				' ����(�޷�)  

If part <> "" then
		class_value = part
		dim myarray                          
		myarray=split(class_value,":")
		class_value_1=myarray(0)      
		title_value_1=myarray(1)
End If

	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------

'--------�޷��߰��� ���� ----------------------------------------------------------
	If birth_j <> "" Then 
	birth_j_arr=split(birth_j,"-") 
	birth_y = birth_j_arr(0)
	birth_m = birth_j_arr(1)
	birth_d = birth_j_arr(2)
	birth = birth_y &  birth_m  &  birth_d 
	End If 
'--------�޷��߰��� ���� ----------------------------------------------------------


'	������ Ȯ��
	If Ybirth <> "" And Mbirth <> "" And Dbirth <> "" Then 
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	End If 

	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2
	
	If check3 = "" Then check3 = "N" 
	If check4 = "" Then check4 = "N"

	If childbirth_y <> "" And childbirth_m <> "" And childbirth_d <> "" Then 
	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	End If 
'-----------------------------------------------------------------------------	

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
			strSql = strSql & "         MD_EMAIL,MD_SNS_FLG,MD_EMAIL_FLG,MD_LOCAL,MD_LOCAL_DETAIL,MD_CHILDBIRTH,MD_CHILD_FLG,MD_TYPE "
			strSql = strSql & " )  "
			strSql = strSql & " SELECT "
			strSql = strSql & "			'"& mem_id &"','"& phone &"','"& hp &"','"& radio1 &"','"& birth &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
			strSql = strSql & "			'"& email &"','"& check3 &"','"& check4 &"','"& class_value_1 &"','"& title_value_1 &"','"& childbirth &"','"& radio3 &"','"& radio4 &"'; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
		
		Case "upd" : 
			If mem_id <> "" Then 
				strSql = ""
				strSql = strSql & " UPDATE MO_MEM_MAS SET "
				strSql = strSql & "		MM_UPD_DT = GETDATE() "
				If mem_pw <> "" Then 
				strSql = strSql & "		,MM_MEM_PW = dbo.UF_MD5('"& mem_pw &"')"
				End If 
				strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"'; "

				strSql = strSql & " UPDATE MO_MEM_DTL SET "
				strSql = strSql & "		MD_PHONE ='"& phone &"' "
				strSql = strSql & "		,MD_HP ='"& hp &"' "
				strSql = strSql & "		,MD_POST ='"& post &"' "
				strSql = strSql & "		,MD_ADDR1 ='"& addr_1 &"' "
				strSql = strSql & "		,MD_ADDR2 ='"& addr_2 &"' "
				strSql = strSql & "		,MD_EMAIL ='"& email &"' "
				strSql = strSql & "		,MD_BIRTH ='"& birth &"' "
				strSql = strSql & "		,MD_SNS_FLG ='"& check3 &"' "
				strSql = strSql & "		,MD_EMAIL_FLG ='"& check4 &"' "
				strSql = strSql & "		,MD_LOCAL ='"& class_value_1 &"' "
				strSql = strSql & "		,MD_LOCAL_DETAIL ='"& title_value_1 &"' "
				strSql = strSql & "		,MD_CHILDBIRTH ='"& childbirth &"' "
				strSql = strSql & "		,MD_CHILD_FLG ='"& radio3 &"' "
				strSql = strSql & "		,MD_TYPE ='"& radio4 &"' "
				strSql = strSql & "	WHERE MD_MEM_ID='"& mem_id &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
			End If 
		Case "del" : 
			If mem_id <> "" Then 
				strSql = ""
				strSql = strSql & " UPDATE MO_MEM_MAS SET "
				strSql = strSql & "		MM_UPD_DT = GETDATE() "
				strSql = strSql & "		,MM_DEL_DT = GETDATE() "
				strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 4
			End If 
	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('�̿����� ������ �ּ���');
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "./member_list.asp"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "./member_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./member_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
