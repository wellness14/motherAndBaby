<%
'======================================================================
'업 무 명 : mothernbaby - 관리자
'모듈기능 : 서버 디비 연결자 설정
'파 일 명 : Create RecordSet object
'			사용할 페이지 에서 call
'			사용이 끝나면 객체 반환 call RSClose(RecordSet이름)
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>
<!-- #include virtual = "/mobileweb/common/asp/DBSrv.asp" -->
<%
'===========================================================================
'함수명		: DBexec
'INPUT 		: sSQL(실행할 Query 문장),DBTarget(각 데이타베이스 디바이스 접근 설정)
'기능설명	: 단일 데이터 베이스 연결 객체 생성/실행
'===========================================================================
Function DBexec(sSQL,DBTarget)
	Dim DBCon
	On Error Resume Next

	If  LEN(sSQL) = 0 Then
		Response.Write "<br><font size=2>에러스텝 1 : 실행할 SQL문을 입력하세요.</font><br>"
		response.end
		Exit function
	End If

	Select Case DBTarget
		Case "main"			:	DBTgt = DBConMothernbaby
       	Case Else
			Response.Write "<br><font size=2>에러스텝 2 : 연결할 데이타베이스의 정확한 문자열을 입력하시오!</font><br>"
			Response.End
	End Select

	Set DBCon=Server.CreateObject("ADODB.Connection") 'DB에 연결
	
	DBCon.CursorLocation = 3	'client cursor
	DBCon.Open DBTgt
	if Err.number <> 0 Then
		response.write "<br><font size=2>에러스텝 3 : DB Open Error!! 데이터베이스를 정상적으로 연결하지 못하였습니다.</font><br>"
		v_to = "pico@megastudy.net;ysoh@megastudy.net;ymkim@megastudy.net;cheolung@megastudy.net;cellist@megastudy.net;"& _
			"momo3574@megastudy.net;choipd75@megastudy.net;bkstory@megastudy.net"
		v_from = "sysadmin@megastudy.net"
		v_subject = "에러스텝 3 : DB Open Error!! 데이터베이스를 정상적으로 연결하지 못하였습니다."
		htmlstr = "에러발생웹서버 : " & request.servervariables("LOCAL_ADDR") & "<br>"
		htmlstr = htmlstr & "에러발생웹페이지 : " & request.servervariables("PATH_INFO") & "<br>"
		htmlstr = htmlstr & "에러발생데이터베이스연결자 : "& DBTarget
		call SendHtmlMail(v_to,v_from,v_subject,htmlstr)
		Response.End
		Exit Function
	End If

	Set DBexec = DBCon.Execute(sSQL)

	If Err.number <> 0 Then
		err_source = replace(Err.Source,"'","''")
		err_description = replace(Err.description,"'","''")
		err_number = replace(Err.Number,"'","''")
		err_page = replace(request.servervariables("URL"),"'","''")
		sErr = "<TABLE cellSpacing=1 cellPadding=1 width='80%' border=1 align=center>"
		sErr = sErr & "<TR><TD width='12%'><FONT SIZE=2>에러스텝 4</FONT></TD><TD><FONT SIZE=2>개체명이나 컬럼 혹은 인수값이 잘못되었습니다.</FONT></TD></TR>"
		sErr = sErr & "<TR><TD ><FONT SIZE=2>오류객체명</FONT></TD><TD><FONT SIZE=2>"&Err.Source&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>오류설명</FONT></TD><TD><FONT SIZE=2>"&Err.description&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>오류번호</FONT></TD><TD><FONT SIZE=2>"&Err.Number&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>QUERY</FONT></TD><TD><FONT SIZE=2>"&sSQL&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>에러페이지</FONT></TD><TD><FONT SIZE=2>"&err_page&"</FONT></TD></TR>"
		sErr = sErr & "</TABLE>"
		Response.Write sErr

		call DBclose(DBcon)

		Set DBCon=Server.CreateObject("ADODB.Connection") 'DB에 연결
		DBCon.CursorLocation = 3	'client cursor
		DBCon.Open DBConManager
		SQL = "INSERT ERROR_WEB VALUES ('"&err_source&"','"&err_description&"','"&err_number&"','"&sSQL&"',GETDATE())"
		DBCon.Execute(SQL)
		call DBclose(DBcon)

		Response.End
		Exit Function
	End If

End function
'===========================================================================
'함수명		: DBClose
'INPUT 		:
'기능설명	: 단일 데이터 베이스 연결 객체 소멸
'===========================================================================
Function DBClose(DBCon)
	If IsObject(DBCon) = True Then
		DBCon.Close
		Set DBCon = Nothing
	end if
End Function
'===========================================================================
'함수명		: RSexec
'INPUT 		: rsName(RecordSet객체를위한Instance 이름),pSize(PageSize 선택)
'		  cType : CursorType 설정
'			0 : AdOpenForwardOnly(MoveNext만 지원)
'			1 : AdOpenKeyset(변경 데이타는 볼 수 없음)
'			2 : AdOpenDynamic(모든 방식의 커서지원)
'			3 : AdOpenStatic(데이타 검색이나 레포트 생성시에 사용)
'		  sSQL(실행할 Query 문장),DBTarget(각 데이타베이스 디바이스 접근 설정)
'기능설명	: 레코드셋 객체 생성/실행
'===========================================================================
Function RSexec(rsName,pSize,cType,sSQL,DBTarget)
	Dim globalDBCon
	On Error Resume Next

	If  LEN(sSQL) = 0 Then
		Response.Write "<br><font size=2>에러스텝 1 : 실행할 SQL문을 입력하세요.</font><br>"
		response.end
		Exit function
	End If

	Select Case DBTarget
		Case "main"			:	DBTgt = DBConMothernbaby
		Case "study"		:	DBTgt = DBConMegaStudy			'메인 DB
		Case Else
			Response.Write "<br><font size=2>에러스텝 2 : 연결할 데이타베이스의 정확한 문자열을 입력하시오!</font><br>"
			Response.End
	End Select

	If IsObject(globalDBCon) = False Then
		Set globalDBCon = Server.CreateObject("ADODB.Connection")
		globalDBCon.CursorLocation = 3
		globalDBCon.Open DBTgt
		if Err.number <> 0 Then
			response.write "<br><font size=2>에러스텝 3 : DB Open Error!! 데이터베이스를 정상적으로 연결하지 못하였습니다.</font><br>"
			v_to = "pico@megastudy.net;ysoh@megastudy.net;ymkim@megastudy.net;cheolung@megastudy.net;cellist@megastudy.net;"& _
				"momo3574@megastudy.net;choipd75@megastudy.net;bkstory@megastudy.net"
			v_from = "sysadmin@megastudy.net"
			v_subject = "에러스텝 3 : DB Open Error!! 데이터베이스를 정상적으로 연결하지 못하였습니다."
			htmlstr = "에러발생웹서버 : " & request.servervariables("LOCAL_ADDR") & "<br>"
			htmlstr = htmlstr & "에러발생웹페이지 : " & request.servervariables("PATH_INFO") & "<br>"
			htmlstr = htmlstr & "에러발생데이터베이스연결자 : "& DBTarget
			call SendHtmlMail(v_to,v_from,v_subject,htmlstr)
			Response.End
			Exit Function
		End If
	End If

	Set rsName = Server.CreateObject("ADODB.RecordSet")

	If Psize <> "0" Then		'Psize가 0으로 셋팅되면 Pagesize를 잡지 않음.
		RSName.PageSize = Psize
	End If

	globalDBCon.CursorLocation = 3
	RSName.Open sSQL, globalDBCon, Ctype

	If Err.number <> 0 Then
		err_source = replace(Err.Source,"'","''")
		err_description = replace(Err.description,"'","''")
		err_number = replace(Err.Number,"'","''")
		err_page = replace(request.servervariables("URL"),"'","''")
		sErr = "<TABLE cellSpacing=1 cellPadding=1 width='80%' border=1 align=center>"
		sErr = sErr & "<TR><TD width='12%'><FONT SIZE=2>에러스텝 4</FONT></TD><TD><FONT SIZE=2>개체명이나 컬럼 혹은 인수값이 잘못되었습니다.</FONT></TD></TR>"
		sErr = sErr & "<TR><TD ><FONT SIZE=2>오류객체명</FONT></TD><TD><FONT SIZE=2>"&Err.Source&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>오류설명</FONT></TD><TD><FONT SIZE=2>"&Err.description&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>오류번호</FONT></TD><TD><FONT SIZE=2>"&Err.Number&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>QUERY</FONT></TD><TD><FONT SIZE=2>"&sSQL&"</FONT></TD></TR>"
		sErr = sErr & "<TR><TD><FONT SIZE=2>에러페이지</FONT></TD><TD><FONT SIZE=2>"&err_page&"</FONT></TD></TR>"
		sErr = sErr & "</TABLE>"
		Response.Write sErr
		call RSclose(rsName)

		Set DBCon=Server.CreateObject("ADODB.Connection") 'DB에 연결
		DBCon.CursorLocation = 3	'client cursor
		DBCon.Open DBConManager
		SQL = "INSERT ERROR_WEB VALUES ('"&err_source&"','"&err_description&"','"&err_number&"','"&sSQL&"','"&err_page&"',GETDATE())"
		DBCon.Execute(SQL)
		call DBclose(DBcon)

		Response.End
		Exit Function
	End If

End Function
'===========================================================================
'함수명		: RSClose
'INPUT 		: rsName
'기능설명	: 레코드셋 객체 소멸
'===========================================================================
Function RSClose(rsName)
	if IsObject(rsName) = True Then
		rsName.Close
		Set rsName = Nothing
	end if
	If IsObject(globalDBCon) = True Then
		globalDBCon.Close
		Set globalDBCon = Nothing
	End If
End Function
%>
