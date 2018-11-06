<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리
'파 일 명 : brd_sql.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include file = "./brd_inc.asp" -->
<%
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Or mode="recom_ins" Or mode="recom_upd" Then 
		mem_nm		= fncRequest("mem_nm")
		intPw		= fncRequest("pw")
		email		= fncRequest("email")
		ba_type		= fncRequest("ba_type")
		notice_flg	= fncRequest("notice_flg")
		sdate		= fncRequest("sdate")
		edate		= fncRequest("edate")
		title		= Trim(fncRequest("title"))
		content		= Trim(fncRequest("content"))
		fileNm		= Trim(fncRequest("fileNm"))
		filePath	= Trim(fncRequest("filePath"))

		part		= fncRequest("part")				' 지점 선택

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
'	데이터 확인
	brd_tbl = "dbo.MO_BRD_"& brd_id &" "

	Dim sec_flg : sec_flg = "N"
	If intPw <> "" Then 
		sec_flg = "Y"
	End If 
	
	fileNm = Replace(fileNm,", ","||")
	filePath = Replace(filePath,", ","||")
'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " DECLARE  @IDX INT; "
			strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
			strSql = strSql & "         BA_SEQ, BA_DPH, BA_PIDX, BA_MEM_ID, BA_MEM_NM, BA_TITLE, "
			strSql = strSql & "         BA_CONTENT, BA_SEC_FLG, BA_SEC_NUM, BA_IP, BA_EMAIL, BA_FILE_NM, BA_FILE_PATH "
			If brd_type = "1" Or brd_type = "5" Then 
			strSql = strSql & "         ,BA_TYPE "
			strSql = strSql & "         ,BA_NOTICE_FLG "
			End If 
			If brd_type = "2" Then 
			strSql = strSql & "			,BA_LOCAL, BA_LOCAL_DETAIL "
			End If 
			If brd_type = "3" Then 
			strSql = strSql & "         ,BA_STD_SDT, BA_STD_EDT "
			End If 
			strSql = strSql & " )  "
			strSql = strSql & " SELECT  ISNULL((SELECT TOP 1 BA_SEQ FROM "& brd_tbl &" WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
			strSql = strSql & "			'1',ISNULL((SELECT TOP 1 BA_SEQ FROM " & brd_tbl & " WITH(NOLOCK) ORDER BY BA_SEQ DESC),0)+1, "
			strSql = strSql & "			'"& uId &"','"& mem_nm &"','"& title &"','"& content &"','"& sec_flg &"','"& intPw &"','"& user_ip &"', "
			strSql = strSql & "			'"& email &"','"& fileNm &"','"& filePath &"' "
			If brd_type = "1" Or brd_type = "5" Then 
			strSql = strSql & "         ,'"& ba_type &"' "
			strSql = strSql & "         ,'"& notice_flg &"' "
			End If 
			If brd_type = "2" Then 
			strSql = strSql & "			,'"& class_value_1 &"','"& title_value_1 &"' "
			End If 
			If brd_type = "3" Then 
			strSql = strSql & "         ,'"& sdate &"' ,'"& edate &"' "
			End If 
			strSql = strSql & ";SELECT   @IDX = @@IDENTITY;  "
			strSql = strSql & "UPDATE   " & brd_tbl & " SET BA_PIDX = @IDX WHERE BA_IDX = @IDX; "

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2
			
		Case "upd" : 
			strSql = ""
			strSql = strSql & " UPDATE  "& brd_tbl &" "
			strSql = strSql & " SET     BA_MEM_NM = '"& mem_nm &"',	BA_TITLE = '"& title &"', BA_CONTENT = '"& content &"', BA_SEC_FLG = '"& sec_flg &"', BA_SEC_NUM = '"& intPw &"', "
			strSql = strSql & "			BA_EMAIL = '"& email &"', BA_FILE_NM = '"& fileNm &"', BA_FILE_PATH = '"& filePath &"',BA_UPD_DT = GETDATE() "
			If (brd_type = "1" Or brd_type = "5") And Trim(brd_tbl) <> "dbo.MO_BRD_faq" Then 
			strSql = strSql & "			,BA_TYPE = '"& ba_type &"' "
			strSql = strSql & "         ,BA_NOTICE_FLG = '"& notice_flg &"' "
			End If 
			If brd_type = "2" Then 
			strSql = strSql & "			,BA_LOCAL = '"& class_value_1 &"',  BA_LOCAL_DETAIL = '"& title_value_1 &"'"
			End If 
			If brd_type = "3" Then 
			strSql = strSql & "			,BA_STD_SDT = '"& sdate &"',BA_STD_EDT = '"& edate &"' "
			End If 
			strSql = strSql & " WHERE   BA_IDX = " & intIDX
			Call DBExec(strSql, "main") : Call DBClose(DBCon)

			intMsg = 3
		Case "del" : 
			If intIDX > 0 Then 
			'------------------------------------------------------------
			'	삭제 권한 추출
				strSql = "SELECT BA_MEM_ID,BA_DPH FROM " & brd_tbl & " WITH(NOLOCK) WHERE BA_IDX = " & intIDX
				Set Rs = DBexec(strSql,"main")
				if not Rs.eof then
					MemId   = Trim(Rs(0))
					Dph     = Trim(Rs(1))
				End If 
				RSClose(Rs)
			'------------------------------------------------------------
				If UCase(MemId) = UCase(uid) Or MegaAdminChk = "Y" Or MegaAdminChk = "C" then				
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
				intMsg = 4
			End If 
		Case "recom_ins" : 
			If intIDX > 0 Then 
			'---------------------------------------------------------------------
			'	글 순번 추출
				strSql = " SELECT BA_SEQ,BA_SEC_FLG,BA_SEC_NUM FROM "& brd_tbl &" WITN(NOLOCK) WHERE BA_IDX='"& intIDX &"' "
				Set Rs = DBExec(strSql,"main")
				If Not Rs.EOF Then 
					intSeq = Rs(0)
					sec_flg = Rs(1)
					sec_num = Rs(2)
				End If 
				Call DBClose(Rs)
			'---------------------------------------------------------------------

			'---------------------------------------------------------------------
			'	글 순번 변경
				strSql = " UPDATE "& brd_tbl &" SET BA_SEQ = BA_SEQ+1 WHERE BA_SEQ >= '"& intSeq &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
			'---------------------------------------------------------------------

			'답변 등록시 수동 입력한 작성자로 입력
			If brd_id = "consult" Or brd_id = "PRAISE" Then
				uNm = mem_nm
			End If


			'---------------------------------------------------------------------
			'	답변 내용 저장
				strSql = ""
				strSql = strSql & " INSERT INTO "& brd_tbl &" ( "
				strSql = strSql & "         BA_SEQ, BA_DPH, BA_PIDX, BA_MEM_ID, BA_MEM_NM, BA_TITLE, "
				strSql = strSql & "         BA_CONTENT, BA_IP, BA_UNI_NM, BA_SEC_FLG, BA_SEC_NUM "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT  '"& intSeq &"', '2','"& intIDX &"','"& uId &"','"& uNm &"','"& title &"', "
				strSql = strSql & "			'"& content &"','" & user_ip & "','" & uid & "', '"& sec_flg &"', '"& sec_num &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
			'---------------------------------------------------------------------
				intMsg = 5
			End If 

		Case "recom_upd" : 
			re_idx = fncRequest("re_idx")
			If re_idx > 0 Then 
				
				'답변 등록시 수동 입력한 작성자로 입력
				If brd_id = "consult" Or brd_id = "PRAISE" Then
					uNm = mem_nm
				End If
				
			'---------------------------------------------------------------------
			'	답변 내용 저장
				strSql = ""
				strSql = strSql & " UPDATE "& brd_tbl &" SET  "
				strSql = strSql & "		BA_MEM_ID = '"& uId &"' "
				strSql = strSql & "     ,BA_MEM_NM = '"& uNm &"' "
				strSql = strSql & "		,BA_TITLE = '"& title &"' "
				strSql = strSql & "     ,BA_CONTENT = '"& content &"' "
				strSql = strSql & "     ,BA_IP = '" & user_ip & "' "
				strSql = strSql & "     ,BA_UNI_NM = '" & uid & "' "
				strSql = strSql & " WHERE BA_IDX = '"& re_idx &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
			'---------------------------------------------------------------------
				intMsg = 5
			End If 

		Case "dpUp" :
			If intIDX > 0 Then
				strSql = ""
				strSql = strSql & "SET NOCOUNT ON;" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET	SL_ORD=SL_ORD+1,SL_UPD_DT=GETDATE() WHERE SL_IDX=" & intIDX & ";" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET" & vbcrlf
				strSql = strSql & "		SL_ORD=ORD.ORD_RN" & vbcrlf
				strSql = strSql & "FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "INNER JOIN (" & vbcrlf
				strSql = strSql & "		SELECT	SL_IDX	AS ORD_IDX" & vbcrlf
				strSql = strSql & "			,ROW_NUMBER() OVER( ORDER BY SL_ORD ASC, SL_UPD_DT ASC ) AS ORD_RN" & vbcrlf
				strSql = strSql & "		FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "		WHERE SL_NUM='"& intNum &"' "
				strSql = strSql & ") AS ORD" & vbcrlf
				strSql = strSql & "ON ORD.ORD_IDX=SL_IDX;" & vbcrlf
				strSql = strSql & "SET NOCOUNT OFF;" & vbcrlf
'				Response.Write strSql
'				Response.End
				Call DBExec(strSql,"main"): Call DBClose(DBCon)
			End If

			intMsg = 7

		Case "dpDn" :
			If intIDX > 0 Then
				strSql = ""
				strSql = strSql & "SET NOCOUNT ON;" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET	SL_ORD=SL_ORD-1, SL_UPD_DT=getdate() WHERE	SL_IDX=" & intIDX & ";" & vbcrlf
				strSql = strSql & "UPDATE	dbo.MS_SERVICE_LIST SET" & vbcrlf
				strSql = strSql & "		SL_ORD=ORD.ORD_RN" & vbcrlf
				strSql = strSql & "FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "INNER JOIN (" & vbcrlf
				strSql = strSql & "		SELECT	SL_IDX	AS ORD_IDX" & vbcrlf
				strSql = strSql & "			,ROW_NUMBER() OVER( ORDER BY SL_ORD ASC, SL_UPD_DT DESC ) AS ORD_RN" & vbcrlf
				strSql = strSql & "		FROM	dbo.MS_SERVICE_LIST WITH(NOLOCK)" & vbcrlf
				strSql = strSql & "		WHERE SL_NUM='"& intNum &"' "
				strSql = strSql & ") AS ORD" & vbcrlf
				strSql = strSql & "ON ORD.ORD_IDX=SL_IDX;" & vbcrlf
				strSql = strSql & "SET NOCOUNT OFF;" & vbcrlf
'				Response.Write strSql
'				Response.End
				Call DBExec(strSql,"main"): Call DBClose(DBCon)
			End If

			intMsg = 7
	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('로그인 후 이용 가능합니다.');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLnkUrl%>"
			break;
			case(3) :
				alert('수정 되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLnkUrl%>"
			break;
			case(4) :
				alert('삭제되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLnkUrl%>"
			break;
			case(5) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "<%=urlView%>?idx=<%=intIDX%>&<%=strLnkUrl%>"
			break;
			case(7) :
				alert('변경 되었습니다.');
				location.href = "<%=urlList%>?<%=strLnkUrl%>"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
