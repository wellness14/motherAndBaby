<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : ����û �� �ۼ�
'�� �� �� : info_01_sql.asp
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
<%	
'-----------------------------------------------------------------------------
'	Request
	mOne		= fncRequest("mOne")
	mTwo		= fncRequest("mTwo")
	
    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		mem_nm			= fncRequest("mem_nm")				' ����
		Ybirth			= fncRequest("Ybirth")				' �������
		Mbirth			= fncRequest("Mbirth")				' �������
		Dbirth			= fncRequest("Dbirth")				' �������

		phone_1			= Trim(fncRequest("phone_1"))		' ��ȭ��ȣ
		phone_2			= Trim(fncRequest("phone_2"))		' ��ȭ��ȣ
		phone_3			= Trim(fncRequest("phone_3"))		' ��ȭ��ȣ

		hp_1			= Trim(fncRequest("hp_1"))			' �ڵ�����ȣ
		hp_2			= Trim(fncRequest("hp_2"))			' �ڵ�����ȣ
		hp_3			= Trim(fncRequest("hp_3"))			' �ڵ�����ȣ

		post_1			= Trim(fncRequest("post_1"))		' �����ȣ
		post_2			= Trim(fncRequest("post_2"))		' �����ȣ

		addr_1			= Trim(fncRequest("addr_1"))		' �ּ�
		addr_2			= Trim(fncRequest("addr_2"))		' �ּ�

		check1			= fncRequest("check1")				' ��û����
		radio1			= fncRequest("radio1")				' �̿�Ⱓ
		radio2			= fncRequest("radio2")				' �̿�����

		childbirth_y	= fncRequest("childbirth_y")		' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")		' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")		' ��꿹����

		serviceDt_y		= fncRequest("serviceDt_y")			' ���񽺽��� ������
		serviceDt_m		= fncRequest("serviceDt_m")			' ���񽺽��� ������
		serviceDt_d		= fncRequest("serviceDt_d")			' ���񽺽��� ������

		radio3			= fncRequest("radio3")				' ������ �̿�
		radio4			= fncRequest("radio4")				' ������

		check2			= fncRequest("check2")				' Ư�̻���
		check3			= fncRequest("check3")				' ��������

		textarea		= fncRequest("textarea")			' ��㳻��

		check4			= fncRequest("check4")				' �̿���
		check5			= fncRequest("check5")				' ����������޹�ħ
		part			= fncRequest("part")				'  ����
		consulting_end	= fncRequest("consulting_end")		'  ���ϷῩ��
		jumin1	= fncRequest("jumin1")		'  �ֹι�ȣ1
		jumin2	= fncRequest("jumin2")		'  �ֹι�ȣ2

		If part <> "" Then 
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
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")

	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	serviceDt = serviceDt_y & fncSetNumber(serviceDt_m) & fncSetNumber(serviceDt_d)

	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

	If mode = "ins" And (check4 = "" Or check5 = "") Then 
		intMsg = 1
	Else 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_BRD_SERVICE ( "
				strSql = strSql & "         MS_MEM_ID,MS_MEM_NM,MS_BIRTH,MS_PHONE,MS_HP,MS_POST,MS_ADDR1,MS_ADDR2, "
				strSql = strSql & "         MS_SERVICE,MS_PERIOD,MS_TYPE,MS_CHILDBIRTH,MS_SERVICEDT,MS_CLINIC, "
				strSql = strSql & "         MS_EXPER,MS_UNIQUE,MS_FAMILY,MS_CONTENT,MS_PROVISION_1,MS_PROVISION_2, MD_LOCAL, MD_LOCAL_DETAIL, "
				strSql = strSql & "         MS_JUMIN1,MS_JUMIN2 "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'','"& mem_nm &"','"& birth &"','"& phone &"','"& hp &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "			'"& check1 &"','"& radio1 &"','"& radio2 &"','"& childbirth &"','"& serviceDt &"','"& radio3 &"', "
				strSql = strSql & "			'"& radio4 &"','"& check2 &"','"& check3 &"','"& textarea &"','"& check4 &"','"& check5 &"','"& class_value_1 &"','"& title_value_1 &"', "
				strSql = strSql & "			'"& jumin1 &"','"& jumin2 &"';"
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
			
			Case "upd" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
					strSql = strSql & "		MS_MEM_NM = '"& mem_nm &"' "
					strSql = strSql & "		,MS_BIRTH = '"& birth &"' "
					strSql = strSql & "		,MS_PHONE = '"& phone &"' "
					strSql = strSql & "		,MS_HP = '"& hp &"' "
					strSql = strSql & "		,MS_POST = '"& post &"' "
					strSql = strSql & "		,MS_ADDR1 = '"& addr_1 &"' "
					strSql = strSql & "		,MS_ADDR2 = '"& addr_2 &"' "
					strSql = strSql & "		,MS_SERVICE = '"& check1 &"' "
					strSql = strSql & "		,MS_PERIOD = '"& radio1 &"' "
					strSql = strSql & "		,MS_TYPE = '"& radio2 &"' "
					strSql = strSql & "		,MS_CHILDBIRTH = '"& childbirth &"' "
					strSql = strSql & "		,MS_SERVICEDT = '"& serviceDt &"' "
					strSql = strSql & "		,MS_CLINIC = '"& radio3 &"' "
					strSql = strSql & "		,MS_EXPER = '"& radio4 &"' "
					strSql = strSql & "		,MS_UNIQUE = '"& check2 &"' "
					strSql = strSql & "		,MS_FAMILY = '"& check3 &"' "
					strSql = strSql & "		,MS_CONTENT = '"& textarea &"' "
					strSql = strSql & "		,MD_LOCAL = '"& class_value_1 &"' "
					strSql = strSql & "		,MD_LOCAL_DETAIL = '"& title_value_1 &"' "
					strSql = strSql & "		,MS_END = '"& consulting_end &"' "
					strSql = strSql & "		,MS_JUMIN1 = '"& jumin1 &"' "
					strSql = strSql & "		,MS_JUMIN2 = '"& jumin2 &"' "
					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3
				End If 
			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
					strSql = strSql & "		MS_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
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
				history.go(-1);
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "mobile_info_01.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "/mobile_admin/member/mobile_service_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "/mobile_admin/member/mobile_service_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
