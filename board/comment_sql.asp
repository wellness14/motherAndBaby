<%
'======================================================================
'�� �� �� : �����غ��� - ����
'����� : Ī���սô� �� �ۼ�
'�� �� �� : board_04_sql.asp
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
'-------------------------------------------------------------------------------
 
'-------------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	Request
	
'	intIDX		= fncRequest("idx")
'	comment_seq		= fncRequest("comment_Seq")
'	mem_nm		= fncRequest("mem_nm")
'	email		= fncRequest("email")
'	pw		= fncRequest("pw")			 
'	content	= fncRequest("content")		 
'	level	= fncRequest("LEVEL")	

    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")
	comment_seq		= fncRequest("comment_Seq")
%>

 

<%
	If mode = "ins" Or mode = "upd" Or mode="recom" Then 
		
		
		mem_nm		= fncRequest("mem_nm")
		email		= fncRequest("email")
		pw		= fncRequest("pw")			 
		content	= fncRequest("content")		
		level	= fncRequest("LEVEL")

		%>
<!--
<script>

alert("<%=intIDX%>");
alert("<%=comment_seq%>");
alert("<%=mem_nm%>");
alert("<%=email%>");
alert("<%=pw%>");
alert("<%=content%>");
alert("<%=level%>");

</script>
-->

		<%
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	������ Ȯ��
 

  
'-----------------------------------------------------------------------------	

'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------




	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_BRD_EVENT_COMMENT ( "
			strSql = strSql & "         BA_IDX  "
			strSql = strSql & "         ,BA_SEQ  "
			strSql = strSql & "         ,BA_LEVEL  "
			strSql = strSql & "         ,BA_NAME  "
			strSql = strSql & "         ,BA_EMAIL  "
			strSql = strSql & "         ,BA_PW  "
			strSql = strSql & "         ,BA_COMMENT  "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES "
			strSql = strSql & "			(  "
			strSql = strSql & "			'"& intIDX &"' "
			strSql = strSql & "	,		( SELECT ISNULL(MAX(BA_SEQ), 0) + 1 FROM MO_BRD_EVENT_COMMENT )  "
			strSql = strSql & "	,		'"& level &"'   "
			strSql = strSql & "	,		'"& mem_nm &"'   "
			strSql = strSql & "	,		'"& email &"' "
			strSql = strSql & "	,		'"& pw &"'  "
			strSql = strSql & "	,		'"& content &"') ; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE MO_BRD_EVENT_COMMENT "
			strSql = strSql & " SET  "
			strSql = strSql & "		 BA_NAME ='"& mem_nm &"' "
			strSql = strSql & "		,BA_EMAIL ='"& email &"' "
			strSql = strSql & "		,BA_PW ='"& pw &"' "
			strSql = strSql & "		,BA_COMMENT ='"& content &"' "
			strSql = strSql & " WHERE   BA_SEQ = " & comment_seq   
			strSql = strSql & " and BA_PW='"& pw &"' "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

			intMsg = 3
		Case "del" : 
			If intIDX > 0 Then 
			'------------------------------------------------------------
			'	���� ���� ����
				strSql = "SELECT BA_MEM_ID,BA_DPH FROM " & brd_tbl & " WITH(NOLOCK) WHERE BA_IDX = " & intIDX
				Set Rs = DBexec(strSql,"main")
				if not Rs.eof then
					MemId   = Trim(Rs(0))
					Dph     = Trim(Rs(1))
				End If 
				RSClose(Rs)
			'------------------------------------------------------------

				If UCase(MemId) = UCase(uid) Or MegaAdminChk = True then				
					strSql = "UPDATE " & brd_tbl & " SET "
					strSql = strSql & "		BA_UNI_NM = '" & uid & "' "
					strSql = strSql & "		,BA_UPD_DT = GETDATE() "
					strSql = strSql & "		,BA_CNLKBN = 'Y' "
					strSql = strSql & "		,BA_IP = '" & user_ip & "' "
					If Dph = 1 Then 
					strSql = strSql & "	WHERE (BA_IDX=" & intIDX & " OR BA_PIDX=" & intIDX & ")  "
					Else 
					strSql = strSql & "	WHERE (BA_IDX=" & intIDX & ")  "
					End If 
					Call DBExec(strSql,"main") : Call DBClose(DBcon)
				End If 
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
				parent.location.href = "./board_01_view.asp?idx=<%=intIDX%>&mOne=4&mTwo=5&brd_id=EVENT&secFlg=Y"
			break;
			case(3) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "./board_01_view.asp?idx=<%=intIDX%>&mOne=4&mTwo=5&brd_id=EVENT&secFlg=Y"
			break;
			case(4) :
				alert('�����Ǿ����ϴ�.');
				parent.location.href = "./board_05.asp?mOne=4&mTwo=5"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
 