<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : �����ڵ� ����û
'�� �� �� : icord_01_sql.asp
'�ۼ����� : 2015/05/27
'�� �� �� : ȫ����
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

		mem_nm			= fncRequest("mem_nm")				' ����

		phone_1			= Trim(fncRequest("phone_1"))		' ��ȭ��ȣ
		phone_2			= Trim(fncRequest("phone_2"))		' ��ȭ��ȣ
		phone_3			= Trim(fncRequest("phone_3"))		' ��ȭ��ȣ

		hp_1			= Trim(fncRequest("hp_1"))				' �ڵ�����ȣ
		hp_2			= Trim(fncRequest("hp_2"))				' �ڵ�����ȣ
		hp_3			= Trim(fncRequest("hp_3"))				' �ڵ�����ȣ

		childbirth_y	= fncRequest("childbirth_y")				' ��꿹����
		childbirth_m	= fncRequest("childbirth_m")			' ��꿹����
		childbirth_d	= fncRequest("childbirth_d")				' ��꿹����

		serviceDt_y		= fncRequest("serviceDt_y")			' ����û��
		serviceDt_m		= fncRequest("serviceDt_m")		' ����û��
		serviceDt_d		= fncRequest("serviceDt_d")			' ����û��

		post_1			= Trim(fncRequest("post_1"))				' �����ȣ
		post_2			= Trim(fncRequest("post_2"))				' �����ȣ

		addr_1			= Trim(fncRequest("addr_1"))				' �ּ�
		addr_2			= Trim(fncRequest("addr_2"))				' �ּ�

		check_info			= fncRequest("check_info")		' ����������޹�ħ

'-----------------------------------------------------------------------------
'	������ Ȯ��
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	serviceDt = serviceDt_y & fncSetNumber(serviceDt_m) & fncSetNumber(serviceDt_d)
'-----------------------------------------------------------------------------	
	strSql = ""
	strSql = strSql & " INSERT INTO MO_ICORD_SERVICE ( "
	strSql = strSql & "         MI_MEM_NM, MI_PHONE, MI_HP, MI_CHILDBIRTH, MI_SERVICEDT, MI_POST, MI_ADDR1, MI_ADDR2"
	strSql = strSql & " )  VALUES ("
	strSql = strSql & "'"& mem_nm &"','"& phone &"','"& hp &"','"& childbirth &"','"& serviceDt &"','"& post &"','"& addr_1 &"','"& addr_2 &"');"
'	response.Write strSql
'	response.End 
	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2

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
				parent.location.href = "service_07.asp?mOne=2&mTwo=7"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
