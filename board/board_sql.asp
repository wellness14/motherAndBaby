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
'	����� ����
	uId			= Trim(fncRequestCookie("uid"))				'ȸ��	���̵�
	usernm		= LCase(fncRequestCookie("uname"))			'ȸ��	����
	mem_type	= LCase(Trim(fncRequestcookie("mem_type")))	'ȸ��	����
'-------------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	Request
	mOne		= fncRequest("mOne")
	mTwo		= fncRequest("mTwo")
	
	brd_id		= fncRequest("brd_id")			' �Խ���ID
	brd_type	= fncRequest("brd_type")		' �Խ��� Ÿ��
	brd_sec		= fncRequest("brd_sec")			' ��б� ����
	file_cnt	= fncRequest("file_cnt")		' ÷������ ����

    mode		= fncRequest("mode")				'ó������(���/����)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Or mode="recom" Then 
		mem_nm		= fncRequest("mem_nm")
		intPw		= fncRequest("pw")
		email		= fncRequest("email")
		title		= Trim(fncRequest("title"))
		content		= Trim(fncRequest("content"))
		fileNm		= Trim(fncRequest("fileNm"))
		filePath	= Trim(fncRequest("filePath"))

		part		= Trim(fncRequest("part"))

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
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "
	urlList = "http://www.mothernbaby.co.kr/board/board_0"& mTwo &".asp"

	Dim sec_flg : sec_flg = "N"
	If intPw <> "" Then 
		sec_flg = "Y"
	End If 

	fileNm = Replace(fileNm,", ","||")
	filePath = Replace(filePath,", ","||")
	
	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

'-----------------------------------------------------------------------------
'	�Խ��� �������� Ȯ��
	strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		If Rs(0) = "N" Then 
			response.Write "<script type='text/javascript'>alert('�������� �ʴ� �Խ��� �Դϴ�.');history.back(-1);</script>"
			response.End 
		End If 
	End If 
	Call DBClose(Rs)
'-----------------------------------------------------------------------------

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " DECLARE  @IDX INT; "
			strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
			strSql = strSql & "         BA_SEQ, BA_DPH, BA_PIDX, BA_LOCAL, BA_LOCAL_DETAIL, BA_MEM_ID, BA_MEM_NM, BA_TITLE, "
			strSql = strSql & "         BA_CONTENT, BA_SEC_FLG, BA_SEC_NUM, BA_IP, BA_EMAIL, BA_FILE_NM, BA_FILE_PATH "
			strSql = strSql & " )  "
			strSql = strSql & " SELECT  ISNULL((SELECT TOP 1 BA_SEQ FROM "& brd_tbl &" WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
			strSql = strSql & "			'1',ISNULL((SELECT TOP 1 BA_SEQ FROM " & brd_tbl & " WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
			strSql = strSql & "			'"& class_value_1 &"','"& title_value_1 &"','"& uId &"','"& mem_nm &"','"& title &"','"& content &"','"& sec_flg &"','"& intPw &"','"& user_ip &"', "
			strSql = strSql & "			'"& email &"','"& fileNm &"','"& filePath &"'; "
			strSql = strSql & "SELECT   @IDX = @@IDENTITY;  "
			strSql = strSql & "UPDATE   " & brd_tbl & " SET BA_PIDX = @IDX WHERE BA_IDX = @IDX; "
'			response.Write strSql
'			response.End 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE  "& brd_tbl &" "
			strSql = strSql & " SET     BA_TITLE='"& title &"', BA_CONTENT='"& content &"', BA_SEC_FLG='"& sec_flg &"', BA_SEC_NUM='"& intPw &"', "
			strSql = strSql & "			BA_LOCAL='"& class_value_1 &"', BA_LOCAL_DETAIL='"& title_value_1 &"', BA_EMAIL='"& email &"', BA_FILE_NM='"& fileNm &"', BA_FILE_PATH='"& filePath &"', BA_UPD_DT = GETDATE() "
			strSql = strSql & " WHERE   BA_IDX = " & intIDX
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
				parent.location.href = "<%=urlList%>?<%=strParam%>"
			break;
			case(3) :
				alert('���� �Ǿ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strParam%>"
			break;
			case(4) :
				alert('�����Ǿ����ϴ�.');
				parent.location.href = "<%=urlList%>?<%=strParam%>"
			break;
		}
	}
//	---------	Page OnLoad Event ó��
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
