<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : ���� �� �ۼ�
'�� �� �� : comp_06_sql.asp
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
		txtCop			= fncRequest("txtCop")				' ��ü��
		txtNm			= fncRequest("txtNm")				' �����
		
		hp_1			= Trim(fncRequest("hp_1"))			' �ڵ�����ȣ
		hp_2			= Trim(fncRequest("hp_2"))			' �ڵ�����ȣ
		hp_3			= Trim(fncRequest("hp_3"))			' �ڵ�����ȣ

		textarea		= fncRequest("textarea")			' ��㳻��
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	
	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

	If mode = "ins" And (txtCop = "" Or txtNm = "") Then 
		intMsg = 1
	Else 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_BRD_CONTACT ( "
				strSql = strSql & "         MC_COP,MC_COP_NM,MC_HP,MC_CONTENT "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& txtCop &"','"& txtNm &"','"& hp &"','"& textarea &"' "
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
			
			Case "upd" : 
'				If intIDX > 0 Then 
'					strSql = ""
'					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
'					strSql = strSql & "		MS_MEM_NM = '"& mem_nm &"' "
'					strSql = strSql & "		,MS_BIRTH = '"& birth &"' "
'					strSql = strSql & "		,MS_PHONE = '"& phone &"' "
'					strSql = strSql & "		,MS_HP = '"& hp &"' "
'					strSql = strSql & "		,MS_POST = '"& post &"' "
'					strSql = strSql & "		,MS_ADDR1 = '"& addr_1 &"' "
'					strSql = strSql & "		,MS_ADDR2 = '"& addr_2 &"' "
'					strSql = strSql & "		,MS_SERVICE = '"& check1 &"' "
'					strSql = strSql & "		,MS_PERIOD = '"& radio1 &"' "
'					strSql = strSql & "		,MS_TYPE = '"& radio2 &"' "
'					strSql = strSql & "		,MS_CHILDBIRTH = '"& childbirth &"' "
'					strSql = strSql & "		,MS_SERVICEDT = '"& serviceDt &"' "
'					strSql = strSql & "		,MS_CLINIC = '"& radio3 &"' "
'					strSql = strSql & "		,MS_EXPER = '"& radio4 &"' "
'					strSql = strSql & "		,MS_UNIQUE = '"& check2 &"' "
'					strSql = strSql & "		,MS_FAMILY = '"& check3 &"' "
'					strSql = strSql & "		,MS_CONTENT = '"& textarea &"' "
'					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
'					Call DBExec(strSql, "main") : Call DBClose(DBCon)
'					intMsg = 3
'				End If 
			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_CONTACT SET "
					strSql = strSql & "		MC_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MC_IDX='"& intIDX &"' "
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
				alert('��� ������ �ٽ� Ȯ���� �ּ���');
				history.go(-1);
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "comp_06.asp?<%=strParam%>"
			break;
			case(3) :
				alert('���� ��ϵǾ����ϴ�.');
				parent.location.href = "/admin/member/contact_list.asp"
			break;
			case(4) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "/admin/member/contact_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
