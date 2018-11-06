<%
'======================================================================
'업 무 명 : mothernbaby - 관리자
'모듈기능 : 공통 함수 정의
'파 일 명 : FunDef.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>

<%
'===========================================================================
'함수명		: fncRequest
'INPUT 		: Request명
'기능설명	:
'===========================================================================
Function fncRequest(varParam)
	fncRequest = sqlFilter(Request(varParam))
End Function 

'===========================================================================
'함수명		: fncRequestNum
'INPUT 		: Request명
'기능설명	:
'===========================================================================
Function fncRequestNum(varParam)
        If IsNumeric(Request(varParam)) Then
            fncRequestNum=trim(sqlFilter(Request(varParam)))
        Else 
			response.end
        End If
End Function 

'===========================================================================
'기능설명	: 값을 체크해서 숫자가 아니면 fRet 값 리턴
'===========================================================================
function fnReqNumToRet(varParam,fRet)
	retVal	= Trim(sqlFilter(Request(varParam)))
	If retVal <> "" Then
		If IsNumeric(retVal) Then
			retVal = Int(retVal)
		Else
			retVal = fRet
		End If
	Else
		retVal = fRet
	End If

	fnReqNumToRet = retVal
End Function 

'===========================================================================
'함수명		: fncRequestForm
'INPUT 		: Request명
'기능설명	:
'===========================================================================
Function fncRequestForm(varParam)
	fncRequestForm = sqlFilter(Request.Form(varParam))
End Function

'===========================================================================
'함수명		: fncRequestCookie
'INPUT 		: Request명
'기능설명	:
'===========================================================================
Function fncRequestCookie(varParam)
	fncRequestCookie = sqlFilter(Request.cookies(varParam))
End Function

'===========================================================================
'함수명		: fncRequestVariables
'INPUT 		: Request명
'기능설명	:
'===========================================================================
Function fncRequestVariables(varParam)
	p = ""
	if ucase(varParam) = "REMOTE_ADDR" then        '리모트 ip 가져와서리
		p = Request.ServerVariables("HTTP_CLIENT_IP")
		if p = "" then   '암것도 없으면 ......
		   p = Request.ServerVariables(varParam)   'REMOTE_ADDR 다시 받고
		end if
	else
		p = Request.ServerVariables(varParam)      '나머지 서버 변수는 그냥사용
	end if
	fncRequestVariables = p
End Function 






'===========================================================================
'함수명		: SetCookie
'INPUT 		: 쿠키명, 쿠키값
'기능설명	: 쿠키 값 세트
'===========================================================================
Function SetCookie(sCNM, sVal)
	Response.Cookies(sCNM) = LCase(sVal)
	Response.Cookies(sCNM).Path = "/"

	If url_main = "http://localhost/" Then
	   Response.Cookies(sCNM).Domain = "localhost"
	Else
	   Response.Cookies(sCNM).Domain = "mothernbaby.co.kr"
	End If 
End Function

'===========================================================================
'함수명		: Session_Check
'기능설명	: 로그인 되어 있는지 쿠키값 체크
'===========================================================================
Function Session_Check()
	goUrl=URL_Check()
	userid = Request.Cookies("userid")
	if userid = "" or isEmpty("userid") or isNull("userid") then
		Response.Cookies("goURL") = Trim(cstr(Request("url")))
		if Trim(cstr(Request("url")))="" then
			Response.Cookies("goURL")=""
		End if
		response.write "<script language=javascript>alert('로그인을 하셔야만 이용하실수 있습니다.');location.href="& url_member &"/default.asp?vurl=mb_login.asp;</script>"
	End if
End Function

'===========================================================================
'함수명		: Admin_Check
'기능설명	: 관리자 체크
'===========================================================================
Function Admin_Check()
	goUrl=URL_Check()
	userid = Request.Cookies("userid")
	Admin_check=True
	if userid <> "ADMIN" then
		Response.Cookies("goURL") = Trim(cstr(Request("url")))
		Admin_check=false
		respnse.write "<script language=javascript>alert('관리자만 이용하실수 있습니다.');location.href='/default.asp';</script>"
	End if
End Function

'===========================================================================
'함수명		: URL_Check
'기능설명	: URL 체크
'===========================================================================
Function URL_Check()
	Response.Cookies("goURL") = Request.ServerVariables("URL")
	Response.Cookies("goURL").Path = "/"
	Response.Cookies("goURL").Domain = "megastudy.net"
End Function

'===========================================================================
'함수명		: USER_Check
'INPUT 		: url ==> url
'기능설명	: 로그인 사용자가 아닌 경우 주어진 url로 이동
'===========================================================================
Function USER_Check(url)
	If IsEmpty(Request.Cookies("userid")) OR IsNull(Request.Cookies("userid")) OR Request.Cookies("userid") = "" Then
		'Response.Redirect url
	response.end
	End If
End Function


' ▒▒▒ 문자열 치환 함수 시작 ▒▒▒
'===========================================================================
'함수명		: ChrConvert
'INPUT 		: str ==> 문자열
'기능설명	: 문자열 치환
'===========================================================================
Function ChrConvert(str)
	str = replace(str,chr(34),"&#34;")	'Quotation mark
	str = replace(str,chr(39),"&#39;")	'Apostrophe
	str = replace(str,"&","&amp;")		'Ampersand
	str = replace(str,"<","&lt;")		'disable HTML tag
	str = replace(str,">","&gt;")		'disable HTML tag
	ChrConvert = str
End Function

'===========================================================================
'함수명		: ChrReConvert
'INPUT 		: str ==> 문자열
'기능설명	: 문자열 역치환 1
'===========================================================================
Function ChrReConvert(str)
	str = replace(str,"&#34;",chr(34))	'Quotation mark
	str = replace(str,"&#39;",chr(39))	'Apostrophe
	str = replace(str,"&amp;","&")		'Ampersand
	str = replace(str,"&lt;","<")		'disable HTML tag
	str = replace(str,"&gt;",">")		'disable HTML tag
	ChrReConvert = str
End Function

'===========================================================================
'함수명		: STR_TO_DB
'INPUT 		: cur_str ==> 문자열
'기능설명	: 문자열 DB에 넣을때 치환
'===========================================================================
Function STR_TO_DB(cur_str)
   if trim(cur_str) <> "" then
	cur_str = replace(cur_str,"'","''")
	cur_str = replace(cur_str,"&","&amp;")
	cur_str = replace(cur_str,"<","&lt;")
	cur_str = replace(cur_str,">","&gt;")
   end if
	STR_TO_DB = cur_str
End Function

'===========================================================================
'함수명		: DB_TO_STR
'INPUT 		: cur_str ==> 문자열
'기능설명	: 문자열 DB에서 뺄때 치환
'===========================================================================
Function DB_TO_STR(cur_str)
  if trim(cur_str) <> "" then
	cur_str = replace(cur_str,"''","'")
	cur_str = replace(cur_str,"&amp;","&")
	cur_str = replace(cur_str,"&lt;","<")
	cur_str = replace(cur_str,"&gt;",">")
  end if
	DB_TO_STR = cur_str
End Function


'===========================================================================
'함수명		: STR_TO_DB
'INPUT 		: cur_str ==> 문자열
'기능설명	: 문자열 DB에 넣을때 치환
'===========================================================================
Function STR_TO_DB2(cur_str)
   if trim(cur_str) <> "" then
	cur_str = replace(cur_str,chr(34),"&#34;")	'Quotation mark
	cur_str = replace(cur_str,chr(39),"&#39;")	'Apostrophe
   end if
	STR_TO_DB2 = cur_str
End Function

'===========================================================================
'함수명		: DB_TO_STR
'INPUT 		: cur_str ==> 문자열
'기능설명	: 문자열 DB에서 뺄때 치환
'===========================================================================
Function DB_TO_STR2(cur_str)
  if trim(cur_str) <> "" then
	cur_str = replace(cur_str,"&#34;",chr(34))	'Quotation mark
	cur_str = replace(cur_str,"&#39;",chr(39))	'Apostrophe
  end if
	DB_TO_STR2 = cur_str
End Function


'===========================================================================
'함수명		: Replace_Number
'INPUT 		: str ==> 문자열
'기능설명	: 문자중의 숫자를 빼내는 함수
'===========================================================================
Function Replace_Number(str)
	for i=48 to 57
		str=replace(str,cstr(chr(i)),"")
	next
	Replace_Number=str
End Function
' ▒▒▒ 문자열 치환 함수 종료 ▒▒▒



'===========================================================================
'함수명		: GetSubString
'INPUT 		:  - str : 변환할 스트링, - strLength : 일정길이
'작성일자	:
'작성자		: 최윤희
'기능설명	: 보여줄 문자열(인자값: str)이 일정길이(인자값: strLength)보다 클경우 그 길이만큼만 잘라서 보여주기 위한 함수
'===========================================================================

FUNCTION GetSubString(ByVal strLength, ByVal Str)

	Dim strLen

	if isNull(Str) = False then

		strLen = len(Str)

		if cInt(strLen) > cInt(strLength) then

			str = left(str, strLength) & "..."

         end if

            GetSubString = str

        else

             GetSubString = ""

        end if

END FUNCTION



' ▒▒▒ 파일 관련 함수 시작 ▒▒▒
'===========================================================================
'함수명		: Last_Str
'INPUT 		: str:"d:\test\test.gif", comp:'\', return:"test.gif"
'기능설명	: 전체 파일 경로에서 파일명만 취득
'===========================================================================
Function Last_Str(Str,Comp)
	ch = ""
	i = -1
	k=0
	IF  IsEmpty(Str) THEN
		Last_Str = ""
	ELSE
		Do While k=0
			ch = MID(Str,Len(Str)-i,1)
			IF ch = Comp THEN
				k=1
			End IF
			i = i+1
			IF(i>=Len(Str) )  THEN
				k=1
				i = Len(Str)+1
			End IF
		Loop
		Last_Str = RIGHT(Str,i-1)
	End IF
End Function

'===========================================================================
'함수명		: First_Str
'INPUT 		: str:"d:\test\test.gif", comp:'\', return:"d:"
'기능설명	: 전체 파일 경로에서 드라이브명 취득
'===========================================================================
Function First_Str(Str,Comp)
	ch = ""
	i = 1
	k=0
	IF Str=Empty THEN
		First_Str = ""
	ELSE
		Do While k=0
			ch = MID(Str,i,1)
			IF ch = Comp THEN
				k=1
			End IF
			i = i+1
			IF(i>=Len(Str) )  THEN
				k=1
				i = Len(Str)+1
			End IF
		Loop
		First_Str = Left(Str,i-1)
	End IF
End Function
' ▒▒▒ 파일 관련 함수 종료 ▒▒▒

%>


<%
'공격 위험성이 존재하는 문자들을 필터링
'문자열 입력값을 검증
'숫자형은 데이터 타입을 별도로 체크하도록 한다.
Function sqlFilter(search)
	Dim strSearch(7), strReplace(7), cnt, data

	'SQL Injection 특수문자 필터링
	'필수 필터링 문자 리스트
	strSearch(0)="“"
	strSearch(1)="'"
	strSearch(2)=""""
	'strSearch(3)="\"
	'strSearch(4)="null"
	'strSearch(5)="#"
	'strSearch(6)="--"
	'strSearch(7)=";"

	'변환될 필터 문자
	strReplace(0)=""""
	strReplace(1)="''"
	strReplace(2)=""""""
	'strReplace(3)="\\"
	'strReplace(4)="\"&null
	'strReplace(5)="\#"
	'strReplace(6)="\--"
	'strReplace(7)="\;"

	data = search
	For cnt = 0 to 2 '필터링 인덱스를 배열 크기와 맞춰준다.
		data = replace(data, LCASE(strSearch(cnt)), strReplace(cnt))
	Next

	sqlFilter = data
End Function

Function Re_sqlFilter(search)
      Dim strSearch(5), strReplace(5), cnt, data

      'SQL Injection 특수문자 필터링
      '필수 필터링 문자 리스트
      strSearch(0)="'"
      strSearch(1)=""""
      strSearch(2)="\"
      strSearch(3)="#"
      strSearch(4)="--"
      strSearch(5)=";"

      '변환될 필터 문자
      strReplace(0)="''"
      strReplace(1)=""""""
      strReplace(2)="\\"
      strReplace(3)="\#"
      strReplace(4)="\--"
      strReplace(5)="\;"

      data = search
      For cnt = 0 to 5 '필터링 인덱스를 배열 크기와 맞춰준다.
       data = replace(data, LCASE(strReplace(cnt)), strSearch(cnt))
      Next

      Re_sqlFilter = data
End Function

'XSS 출력 필터 함수
'XSS 필터 함수
'$str - 필터링할 출력값
'$avatag - 허용할 태그 리스트 예)  $avatag = "p,br"
Function clearXSS(strString, avatag)
	'XSS 필터링
	strString = replace(strString, "<", "&lt;")
	strString = replace(strString, "'", "''")
	strString = replace(strString, "\0", "")

	'허용할 태그 변환
	avatag = replace(avatag, " ", "")		'공백 제거
	If (avatag <> "") Then
		taglist = split(avatag, ",")

		for each p in taglist
			strString = replace(strString, "&lt;"&p&" ", "<"&p&" ", 1, -1, 1)
			strString = replace(strString, "&lt;"&p&">", "<"&p&">", 1, -1, 1)
			strString = replace(strString, "&lt;/"&p&" ", "</"&p&" ", 1, -1, 1)
		next
	End If

	clearXSS = strString
End Function


'------------------------------------------------------------------------
'	정규식을 이용한 html 제거 함수 by 전형표
	Function StripTags(htmlDoc)
		Dim rex
		Set rex = new Regexp
		rex.Pattern = "<[^>]+>"
		rex.Global=True
		StripTags = rex.Replace(htmlDoc,"")
	End function 
'------------------------------------------------------------------------

'===========================================================================
'함수명		: datetime
'기능설명	: 날짜 함수 System date => yyyymmddhhmmss
'===========================================================================
Function datetime()
	v_year = year(date)
	v_month = month(date)
	if v_month < 10 then v_month = "0" & v_month
	v_day = day(date)
	if v_day < 10 then v_day = "0" & v_day
	v_hour = hour(time)
	if v_hour < 10 then v_hour = "0" & v_hour
	v_minute = minute(time)
	if v_minute < 10 then v_minute = "0" & v_minute
	v_second = second(time)
	if v_second < 10 then v_second = "0" & v_second
	v_datetime = v_year&v_month&v_day&v_hour&v_minute&v_second
	datetime = v_datetime
End Function


'===========================================================================
'함수명		: date_service
'기능설명	: 날짜 함수 System date => yyyy년 mm월 dd일
'===========================================================================
Function date_service(intDate)
	v_year	= Left(intDate,4)
	v_month = Mid(intDate,5,2)
	v_day = Right(intDate,2)
	
	v_datetime = v_year &"년 "& v_month &"월 "& v_day &"일 "
	date_service = v_datetime
End Function


'--------------------------------------------------------------
'	아이디로 팀코드 확인
Function getTeamId(pUserId)
	'아이디로 사용자 그룹 확인
	strSql = ""
	strSql = strSql & " SELECT "
	strSql = strSql & "     UL_GRP_CD "
	strSql = strSql & " FROM MO_USER_LIST WITH(NOLOCK) "
	strSql = strSql & " WHERE UL_MEM_ID='"& pUserId &"' "
	call RSExec(RS,0,1,strSQL,"main")
	If Not RS.EOF Then
		getTeamId = RS(0)
	End If 
	Call RSClose(RS)
End Function 
'--------------------------------------------------------------

'--------------------------------------------------------------
'	관리자 권한 부여
	Function getAdminAuth()
		adminUserAuth = "N"
		serverIP = Request.ServerVariables("LOCAL_ADDR")
		admUserId = LCASE(trim(Request.Cookies("userid")))

		Select Case admUserId
			Case "findaday"			 	            'Admin 권한부여
				adminUserAuth = "Y"
			Case "wellness14"		 	            '관리자 권한부여
				adminUserAuth = "C"
		End Select 

	'	If adminUserAuth <> "Y" Then
	'		아이디로 사용자 그룹 확인
	'		RsTeamId = getTeamId(admUserId)
	'	End If

	'	If RsTeamId = "1000" Then					'개발자
	'		adminUserAuth = "Y"
	'	End If

		getAdminAuth = adminUserAuth
	End Function
'--------------------------------------------------------------

'--------------------------------------------------------------
'	9이하 숫자에 0붙이기
	Function fncSetNumber(num)
		If num < 10 Then 
			num = "0" & num 
		End If 
		fncSetNumber = num
	End Function  
'--------------------------------------------------------------

'--------------------------------------------------------------
'	select box 선택 여부 체크
	Function fncSetSelectBox(num,val)
		If Trim(num) = Trim(val) Then 
			strSelect = "selected"
		End If 

		fncSetSelectBox = strSelect
	End Function  
'--------------------------------------------------------------

'--------------------------------------------------------------
'	radio, check 선택 여부 체크
	Function fncSetCheckBox(num,val)
		If Trim(num) = Trim(val) Then 
			strCheck = "checked"
		End If 

		fncSetCheckBox = strCheck
	End Function  
'--------------------------------------------------------------


'--------------------------------------------------------------
'	게시판 타입 체크
	Function fncSetBrdNm(val)
		Select Case val
			Case "1" : type_nm ="공지게시판"
			Case "2" : type_nm ="덧글게시판"
			Case "3" : type_nm ="이벤트게시판"
			Case "4" : type_nm ="일반게시판"
			Case "5" : type_nm ="FAQ게시판"
		End Select 

		fncSetBrdNm = type_nm
	End Function 
'--------------------------------------------------------------

'--------------------------------------------------------------
'	사용여부 체크
	Function fncSetUseNm(val)
		Select Case use_flg
			Case "Y" : use_nm = "사용"
			Case "N" : use_nm = "사용안함"
		End Select 

		fncSetUseNm = use_nm
	End Function 
'--------------------------------------------------------------
%>