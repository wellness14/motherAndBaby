<%
'======================================================================
'�� �� �� : mothernbaby - ������
'����� : ���� �Լ� ����
'�� �� �� : FunDef.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>

<%
'===========================================================================
'�Լ���		: fncRequest
'INPUT 		: Request��
'��ɼ���	:
'===========================================================================
Function fncRequest(varParam)
	fncRequest = sqlFilter(Request(varParam))
End Function 

'===========================================================================
'�Լ���		: fncRequestNum
'INPUT 		: Request��
'��ɼ���	:
'===========================================================================
Function fncRequestNum(varParam)
        If IsNumeric(Request(varParam)) Then
            fncRequestNum=trim(sqlFilter(Request(varParam)))
        Else 
			response.end
        End If
End Function 

'===========================================================================
'��ɼ���	: ���� üũ�ؼ� ���ڰ� �ƴϸ� fRet �� ����
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
'�Լ���		: fncRequestForm
'INPUT 		: Request��
'��ɼ���	:
'===========================================================================
Function fncRequestForm(varParam)
	fncRequestForm = sqlFilter(Request.Form(varParam))
End Function

'===========================================================================
'�Լ���		: fncRequestCookie
'INPUT 		: Request��
'��ɼ���	:
'===========================================================================
Function fncRequestCookie(varParam)
	fncRequestCookie = sqlFilter(Request.cookies(varParam))
End Function

'===========================================================================
'�Լ���		: fncRequestVariables
'INPUT 		: Request��
'��ɼ���	:
'===========================================================================
Function fncRequestVariables(varParam)
	p = ""
	if ucase(varParam) = "REMOTE_ADDR" then        '����Ʈ ip �����ͼ���
		p = Request.ServerVariables("HTTP_CLIENT_IP")
		if p = "" then   '�ϰ͵� ������ ......
		   p = Request.ServerVariables(varParam)   'REMOTE_ADDR �ٽ� �ް�
		end if
	else
		p = Request.ServerVariables(varParam)      '������ ���� ������ �׳ɻ��
	end if
	fncRequestVariables = p
End Function 






'===========================================================================
'�Լ���		: SetCookie
'INPUT 		: ��Ű��, ��Ű��
'��ɼ���	: ��Ű �� ��Ʈ
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
'�Լ���		: Session_Check
'��ɼ���	: �α��� �Ǿ� �ִ��� ��Ű�� üũ
'===========================================================================
Function Session_Check()
	goUrl=URL_Check()
	userid = Request.Cookies("userid")
	if userid = "" or isEmpty("userid") or isNull("userid") then
		Response.Cookies("goURL") = Trim(cstr(Request("url")))
		if Trim(cstr(Request("url")))="" then
			Response.Cookies("goURL")=""
		End if
		response.write "<script language=javascript>alert('�α����� �ϼž߸� �̿��ϽǼ� �ֽ��ϴ�.');location.href="& url_member &"/default.asp?vurl=mb_login.asp;</script>"
	End if
End Function

'===========================================================================
'�Լ���		: Admin_Check
'��ɼ���	: ������ üũ
'===========================================================================
Function Admin_Check()
	goUrl=URL_Check()
	userid = Request.Cookies("userid")
	Admin_check=True
	if userid <> "ADMIN" then
		Response.Cookies("goURL") = Trim(cstr(Request("url")))
		Admin_check=false
		respnse.write "<script language=javascript>alert('�����ڸ� �̿��ϽǼ� �ֽ��ϴ�.');location.href='/default.asp';</script>"
	End if
End Function

'===========================================================================
'�Լ���		: URL_Check
'��ɼ���	: URL üũ
'===========================================================================
Function URL_Check()
	Response.Cookies("goURL") = Request.ServerVariables("URL")
	Response.Cookies("goURL").Path = "/"
	Response.Cookies("goURL").Domain = "megastudy.net"
End Function

'===========================================================================
'�Լ���		: USER_Check
'INPUT 		: url ==> url
'��ɼ���	: �α��� ����ڰ� �ƴ� ��� �־��� url�� �̵�
'===========================================================================
Function USER_Check(url)
	If IsEmpty(Request.Cookies("userid")) OR IsNull(Request.Cookies("userid")) OR Request.Cookies("userid") = "" Then
		'Response.Redirect url
	response.end
	End If
End Function


' �ƢƢ� ���ڿ� ġȯ �Լ� ���� �ƢƢ�
'===========================================================================
'�Լ���		: ChrConvert
'INPUT 		: str ==> ���ڿ�
'��ɼ���	: ���ڿ� ġȯ
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
'�Լ���		: ChrReConvert
'INPUT 		: str ==> ���ڿ�
'��ɼ���	: ���ڿ� ��ġȯ 1
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
'�Լ���		: STR_TO_DB
'INPUT 		: cur_str ==> ���ڿ�
'��ɼ���	: ���ڿ� DB�� ������ ġȯ
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
'�Լ���		: DB_TO_STR
'INPUT 		: cur_str ==> ���ڿ�
'��ɼ���	: ���ڿ� DB���� ���� ġȯ
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
'�Լ���		: STR_TO_DB
'INPUT 		: cur_str ==> ���ڿ�
'��ɼ���	: ���ڿ� DB�� ������ ġȯ
'===========================================================================
Function STR_TO_DB2(cur_str)
   if trim(cur_str) <> "" then
	cur_str = replace(cur_str,chr(34),"&#34;")	'Quotation mark
	cur_str = replace(cur_str,chr(39),"&#39;")	'Apostrophe
   end if
	STR_TO_DB2 = cur_str
End Function

'===========================================================================
'�Լ���		: DB_TO_STR
'INPUT 		: cur_str ==> ���ڿ�
'��ɼ���	: ���ڿ� DB���� ���� ġȯ
'===========================================================================
Function DB_TO_STR2(cur_str)
  if trim(cur_str) <> "" then
	cur_str = replace(cur_str,"&#34;",chr(34))	'Quotation mark
	cur_str = replace(cur_str,"&#39;",chr(39))	'Apostrophe
  end if
	DB_TO_STR2 = cur_str
End Function


'===========================================================================
'�Լ���		: Replace_Number
'INPUT 		: str ==> ���ڿ�
'��ɼ���	: �������� ���ڸ� ������ �Լ�
'===========================================================================
Function Replace_Number(str)
	for i=48 to 57
		str=replace(str,cstr(chr(i)),"")
	next
	Replace_Number=str
End Function
' �ƢƢ� ���ڿ� ġȯ �Լ� ���� �ƢƢ�



'===========================================================================
'�Լ���		: GetSubString
'INPUT 		:  - str : ��ȯ�� ��Ʈ��, - strLength : ��������
'�ۼ�����	:
'�ۼ���		: ������
'��ɼ���	: ������ ���ڿ�(���ڰ�: str)�� ��������(���ڰ�: strLength)���� Ŭ��� �� ���̸�ŭ�� �߶� �����ֱ� ���� �Լ�
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



' �ƢƢ� ���� ���� �Լ� ���� �ƢƢ�
'===========================================================================
'�Լ���		: Last_Str
'INPUT 		: str:"d:\test\test.gif", comp:'\', return:"test.gif"
'��ɼ���	: ��ü ���� ��ο��� ���ϸ� ���
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
'�Լ���		: First_Str
'INPUT 		: str:"d:\test\test.gif", comp:'\', return:"d:"
'��ɼ���	: ��ü ���� ��ο��� ����̺�� ���
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
' �ƢƢ� ���� ���� �Լ� ���� �ƢƢ�

%>


<%
'���� ���輺�� �����ϴ� ���ڵ��� ���͸�
'���ڿ� �Է°��� ����
'�������� ������ Ÿ���� ������ üũ�ϵ��� �Ѵ�.
Function sqlFilter(search)
	Dim strSearch(7), strReplace(7), cnt, data

	'SQL Injection Ư������ ���͸�
	'�ʼ� ���͸� ���� ����Ʈ
	strSearch(0)="��"
	strSearch(1)="'"
	strSearch(2)=""""
	'strSearch(3)="\"
	'strSearch(4)="null"
	'strSearch(5)="#"
	'strSearch(6)="--"
	'strSearch(7)=";"

	'��ȯ�� ���� ����
	strReplace(0)=""""
	strReplace(1)="''"
	strReplace(2)=""""""
	'strReplace(3)="\\"
	'strReplace(4)="\"&null
	'strReplace(5)="\#"
	'strReplace(6)="\--"
	'strReplace(7)="\;"

	data = search
	For cnt = 0 to 2 '���͸� �ε����� �迭 ũ��� �����ش�.
		data = replace(data, LCASE(strSearch(cnt)), strReplace(cnt))
	Next

	sqlFilter = data
End Function

Function Re_sqlFilter(search)
      Dim strSearch(5), strReplace(5), cnt, data

      'SQL Injection Ư������ ���͸�
      '�ʼ� ���͸� ���� ����Ʈ
      strSearch(0)="'"
      strSearch(1)=""""
      strSearch(2)="\"
      strSearch(3)="#"
      strSearch(4)="--"
      strSearch(5)=";"

      '��ȯ�� ���� ����
      strReplace(0)="''"
      strReplace(1)=""""""
      strReplace(2)="\\"
      strReplace(3)="\#"
      strReplace(4)="\--"
      strReplace(5)="\;"

      data = search
      For cnt = 0 to 5 '���͸� �ε����� �迭 ũ��� �����ش�.
       data = replace(data, LCASE(strReplace(cnt)), strSearch(cnt))
      Next

      Re_sqlFilter = data
End Function

'XSS ��� ���� �Լ�
'XSS ���� �Լ�
'$str - ���͸��� ��°�
'$avatag - ����� �±� ����Ʈ ��)  $avatag = "p,br"
Function clearXSS(strString, avatag)
	'XSS ���͸�
	strString = replace(strString, "<", "&lt;")
	strString = replace(strString, "'", "''")
	strString = replace(strString, "\0", "")

	'����� �±� ��ȯ
	avatag = replace(avatag, " ", "")		'���� ����
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
'	���Խ��� �̿��� html ���� �Լ� by ����ǥ
	Function StripTags(htmlDoc)
		Dim rex
		Set rex = new Regexp
		rex.Pattern = "<[^>]+>"
		rex.Global=True
		StripTags = rex.Replace(htmlDoc,"")
	End function 
'------------------------------------------------------------------------

'===========================================================================
'�Լ���		: datetime
'��ɼ���	: ��¥ �Լ� System date => yyyymmddhhmmss
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
'�Լ���		: date_service
'��ɼ���	: ��¥ �Լ� System date => yyyy�� mm�� dd��
'===========================================================================
Function date_service(intDate)
	v_year	= Left(intDate,4)
	v_month = Mid(intDate,5,2)
	v_day = Right(intDate,2)
	
	v_datetime = v_year &"�� "& v_month &"�� "& v_day &"�� "
	date_service = v_datetime
End Function


'--------------------------------------------------------------
'	���̵�� ���ڵ� Ȯ��
Function getTeamId(pUserId)
	'���̵�� ����� �׷� Ȯ��
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
'	������ ���� �ο�
	Function getAdminAuth()
		adminUserAuth = "N"
		serverIP = Request.ServerVariables("LOCAL_ADDR")
		admUserId = LCASE(trim(Request.Cookies("userid")))

		Select Case admUserId
			Case "findaday"			 	            'Admin ���Ѻο�
				adminUserAuth = "Y"
			Case "wellness14"		 	            '������ ���Ѻο�
				adminUserAuth = "C"
		End Select 

	'	If adminUserAuth <> "Y" Then
	'		���̵�� ����� �׷� Ȯ��
	'		RsTeamId = getTeamId(admUserId)
	'	End If

	'	If RsTeamId = "1000" Then					'������
	'		adminUserAuth = "Y"
	'	End If

		getAdminAuth = adminUserAuth
	End Function
'--------------------------------------------------------------

'--------------------------------------------------------------
'	9���� ���ڿ� 0���̱�
	Function fncSetNumber(num)
		If num < 10 Then 
			num = "0" & num 
		End If 
		fncSetNumber = num
	End Function  
'--------------------------------------------------------------

'--------------------------------------------------------------
'	select box ���� ���� üũ
	Function fncSetSelectBox(num,val)
		If Trim(num) = Trim(val) Then 
			strSelect = "selected"
		End If 

		fncSetSelectBox = strSelect
	End Function  
'--------------------------------------------------------------

'--------------------------------------------------------------
'	radio, check ���� ���� üũ
	Function fncSetCheckBox(num,val)
		If Trim(num) = Trim(val) Then 
			strCheck = "checked"
		End If 

		fncSetCheckBox = strCheck
	End Function  
'--------------------------------------------------------------


'--------------------------------------------------------------
'	�Խ��� Ÿ�� üũ
	Function fncSetBrdNm(val)
		Select Case val
			Case "1" : type_nm ="�����Խ���"
			Case "2" : type_nm ="���۰Խ���"
			Case "3" : type_nm ="�̺�Ʈ�Խ���"
			Case "4" : type_nm ="�ϹݰԽ���"
			Case "5" : type_nm ="FAQ�Խ���"
		End Select 

		fncSetBrdNm = type_nm
	End Function 
'--------------------------------------------------------------

'--------------------------------------------------------------
'	��뿩�� üũ
	Function fncSetUseNm(val)
		Select Case use_flg
			Case "Y" : use_nm = "���"
			Case "N" : use_nm = "������"
		End Select 

		fncSetUseNm = use_nm
	End Function 
'--------------------------------------------------------------
%>