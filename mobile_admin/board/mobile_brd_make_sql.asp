<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 게시판 관리 - 게시판 생성
'파 일 명 : brd_make_sql.asp
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
<!-- #include file = "./brd_make_inc.asp"-->
<%
    mode		= fncRequest("mode")					' 저장구분(ins:신규, upd:수정, del:삭제)
	intIDX		= fncRequest("idx")						' 글번호

	If mode = "ins" Or mode = "upd" Then 
		brd_type	= fncRequest("brd_type")			' 게시판 타입(1:공지,2:덧글)
		brd_id		= UCase(Trim(fncRequest("brd_id")))	' 게시판 ID
		brd_nm		= Trim(fncRequest("brd_nm"))		' 게시판명
		file_cnt	= Trim(fncRequest("file_cnt"))		' 첨부파일 갯수		
		sec_flg		= fncRequest("sec_flg")				' 비밀글사용여부(A:전체비밀글,Y:부분비밀글,N:사용안함)
		use_flg		= fncRequest("use_flg")				' 게시판 사용여부
		service_url	= Trim(fncRequest("service_url"))	' 게시판 url
	End If 
	
	Select Case mode 
		Case "ins" : 
			strSql = " SELECT BM_BRD_ID FROM MO_BRD_MAS WITN(NOLOCK) WHERE BM_BRD_ID='"& brd_id &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				intMsg = 4
			Else 
			'-----------------------------------------------------------------------------
			'	게시판 생성여부 확인
				strSql = "IF object_id(N'dbo.MO_BRD_"& brd_id &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
				Set Rs1 = DBExec(strSql,"main")
				If Not Rs1.EOF Then 
					If Rs1(0) = "Y" Then 
						intMsg = 4
					Else 
					'----------------------------------------------------------------------------
					'	게시판 생성하기
						strSql = ""
						strSql = strSql & " INSERT INTO MO_BRD_MAS ( "
						strSql = strSql & "         BM_BRD_TYPE,	BM_BRD_ID,		BM_BRD_NM,			BM_SEC_FLG, "
						strSql = strSql & "         BM_FILE_CNT,	BM_USE_FLG,		BM_SERVICE_URL "
						strSql = strSql & " )  "
						strSql = strSql & " SELECT  "
						strSql = strSql & "			'"& brd_type &"','"& brd_id &"','"& brd_nm &"','"& sec_flg &"', "
						strSql = strSql & "			'"& file_cnt &"','"& use_flg &"','"& service_url &"'; "
						Call DBExec(strSql, "main") : Call DBClose(DBCon)
					'----------------------------------------------------------------------------

					'--------------------------------------------------------------------------------------
					'	테이블 생성
						strSql = ""
						strSql = strSql & "if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MO_BRD_"& brd_id &"]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) "
						strSql = strSql & "DROP TABLE [dbo].[MO_BRD_"& brd_id &"] "
						strSql = strSql & "CREATE TABLE [dbo].[MO_BRD_"& brd_id &"] ( "
						strSql = strSql & "		[BA_IDX] [int] IDENTITY(1,1) NOT NULL,"
						strSql = strSql & "		[BA_SEQ] [int] NOT NULL,"
						strSql = strSql & "		[BA_DPH] [int] NULL,"
						strSql = strSql & "		[BA_PIDX] [int] NULL,"
						If brd_type = "1" Or brd_type = "5" Then 
						strSql = strSql & "		[BA_TYPE] [varchar](20) NULL,"
						End If 
						strSql = strSql & "		[BA_MEM_ID] [varchar](20) NULL,"
						strSql = strSql & "		[BA_MEM_NM] [varchar](20) NULL,"
						strSql = strSql & "		[BA_TITLE] [varchar](400) NOT NULL,"
						strSql = strSql & "		[BA_CONTENT] [text] NULL,"
						strSql = strSql & "		[BA_SEC_FLG] [char](1) NULL,"
						strSql = strSql & "		[BA_SEC_NUM] [varchar](10) NULL,"
						strSql = strSql & "		[BA_CNLKBN] [char](1) NULL,"
						If brd_type = "3" Then 
						strSql = strSql & "		[BA_STD_SDT] [datetime] NULL, "
						strSql = strSql & "		[BA_STD_EDT] [datetime] NULL, "
						End If 
						strSql = strSql & "		[BA_REG_DT] [datetime] NULL, "
						strSql = strSql & "		[BA_UPD_DT] [datetime] NULL, "
						strSql = strSql & "		[BA_IP] [varchar](15) NULL, "
						strSql = strSql & "		[BA_EMAIL] [varchar](60) NULL, "
						strSql = strSql & "		[BA_CNT] [int] NULL, "
						strSql = strSql & "		[BA_UNI_NM] [varchar](100) NULL, "
						strSql = strSql & "		[BA_FILE_NM] [varchar](350) NULL, "
						strSql = strSql & "		[BA_FILE_PATH] [varchar](350) NULL, "
						strSql = strSql & "	CONSTRAINT [PK__MO_BRD_"& brd_id &"] PRIMARY KEY CLUSTERED "
						strSql = strSql & "	( "
						strSql = strSql & "		[BA_IDX] DESC "
						strSql = strSql & "	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY] "
						strSql = strSql & "	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]; "
						strSql = strSql & "	ALTER TABLE [dbo].[MO_BRD_"& brd_id &"] ADD  CONSTRAINT [DF_MO_BRD_"& brd_id &"_BA_CNLKBN]  DEFAULT ('N') FOR [BA_CNLKBN]; "
						strSql = strSql & "	ALTER TABLE [dbo].[MO_BRD_"& brd_id &"] ADD  CONSTRAINT [DF_MO_BRD_"& brd_id &"_BA_SEC_FLG]  DEFAULT ('N') FOR [BA_SEC_FLG]; "
						strSql = strSql & "	ALTER TABLE [dbo].[MO_BRD_"& brd_id &"] ADD  CONSTRAINT [DF_MO_BRD_"& brd_id &"_BA_REG_DT]  DEFAULT (getdate()) FOR [BA_REG_DT]; "
						strSql = strSql & "	ALTER TABLE [dbo].[MO_BRD_"& brd_id &"] ADD  CONSTRAINT [DF_MO_BRD_"& brd_id &"_BA_CNT]  DEFAULT ((0)) FOR [BA_CNT]; "
						Call DBExec(strSql,"main") : DBClose(DBCon)
					'--------------------------------------------------------------------------------------
						intMsg = 2
					End If 
				End If 
				Call DBClose(Rs1)
			'-----------------------------------------------------------------------------
			End If 
			Call DBClose(Rs)
			
		Case "upd" : 
			If intIDX > 0 Then 
				strSql = ""
				strSql = strSql & " UPDATE  MO_BRD_MAS "
				strSql = strSql & " SET     "
				strSql = strSql & "		BM_BRD_TYPE = '"& brd_type &"' "
				strSql = strSql & "		,BM_BRD_NM = '"& brd_nm &"' "
				strSql = strSql & "		,BM_SEC_FLG = '"& sec_flg &"' "
				strSql = strSql & "		,BM_FILE_CNT = '"& file_cnt &"' "
				strSql = strSql & "		,BM_USE_FLG = '"& use_flg &"' "
				strSql = strSql & "		,BM_SERVICE_URL = '"& service_url &"' "
				strSql = strSql & "		,BM_UPD_DT = GETDATE() "
				strSql = strSql & " WHERE   BM_IDX = " & intIDX
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 
			intMsg = 3

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
				Call DBExec(strSql,"watcher"): Call DBClose(DBCon)
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
				Call DBExec(strSql,"watcher"): Call DBClose(DBCon)
			End If

			intMsg = 7
		
		Case "del" : 
			strSql = ""
			strSql = strSql & " UPDATE MS_SERVICE_LIST "
			strSql = strSql & "		SET SL_DEL_FLG='Y', SL_UPD_DT=GETDATE() "
			strSql = strSql & " WHERE SL_DEL_FLG='N' AND SL_IDX = " & intIDX
			Call DBExec(strSql,"watcher"): Call DBClose(DBCon)

			intMsg = 6

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
				alert('이미 등록된 게시판 ID 입니다.');
				history.go(-1);
			break;
			case(6) :
				alert('삭제되었습니다.');
				parent.location.href = "<%=urlList%>?<%=strLnkUrl%>"
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
