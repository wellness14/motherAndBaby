<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ���� ����
'�� �� �� : local_sql.asp
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
<!-- #include file = "./local_inc.asp"-->
<%
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		local		= fncRequest("local")
		part		= fncRequest("part")
		use_flg		= fncRequest("use_flg")
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
	brd_tbl = " MO_COMM_CD "
'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
			strSql = strSql & "         CC_COMM_KIND,CC_COMM_CD,CC_KOR_NM,CC_USE_YN,CC_REG_DT,CC_KOR_NM2 "
			strSql = strSql & " )  "
			strSql = strSql & " SELECT  "
			strSql = strSql & "			88 "
			strSql = strSql & "			,ISNULL((SELECT TOP 1 CC_COMM_CD FROM "& brd_tbl &" WHERE CC_COMM_KIND = 88 ORDER BY CC_COMM_CD DESC ),0) + 1 "
			strSql = strSql & "			,'"& local &"-"& part &"', '"& use_flg &"',getdate(),'"& part &"'; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE  "& brd_tbl &" SET "
			strSql = strSql & "      CC_KOR_NM = '"& local &"-"& part &"' "
			strSql = strSql & "      ,CC_USE_YN = '"& use_flg &"' "
			strSql = strSql & "      ,CC_KOR_NM2 = '"& part &"' "
			strSql = strSql & "      ,CC_UPD_DT = GETDATE() "
			strSql = strSql & " WHERE   CC_COMM_CD = " & intIDX
		'	response.Write strSql
		'	response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

			intMsg = 3
		Case "del" : 
			If intIDX > 0 Then 
			End If 
			intMsg = 4

	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('�α��� �� �̿� �����մϴ�.');
				history.go(-1);
			break;
			case(2) :
				alert('���������� ��ϵǾ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(3) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(4) :
				alert('�����Ǿ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
			case(7) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strLinkUrl%>"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
