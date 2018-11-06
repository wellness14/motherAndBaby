<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<%'=====================================================================================================
'-  Define  : 
'-  Ref_Tab : 
'=====================================================================================================%>
<!--#include virtual="/application/admin/push/json2.asp"-->

<%

   response.charset = "utf-8"
    
   Redim Set_UserPushCode(0)
   Redim Set_Data(0)

   Set_UserPushCode2 = "APA91bHfZr8XvNIkre3PUVh3PqzShzX6CFwA8PbJ7C17Ide4XU12J-FbMWEvKupfRor_82DuZheIhyC986p3h8gMnKP_ziqoM4HC_ZndEzBj9CqTe81jbf4ZTwxgC_HGYYvgca5MZVvp"
   'Set_UserPushCode2 = "APA91bGywDkqp6gQYqDNvupWY_zyBUafzdFeHXMbhNuk4z-a4EuDOOODPatn7B4siRaviMVP-tYK9wGWslW4B8_SjlRNPhb5FmDTzH-O-X4EiNlfnTISqZqWLxNIweUZmb1-zQAZKa4KFkZ9gA8_klAxJwjVyiYlBA"
   Set_UserPushCode(i) = Set_UserPushCode2

	Redim Set_Data(1,2)
    Set_Data(1,1) = "msg"
    Set_Data(1,2) = "<title>맘초 PUSH 테스트</title><context>맘초 세미나 이벤트</context><image>http://cafefiles.naver.net/20141119_277/27624939_1416346241377_jy7qzT_jpg/27624939_user_063041.jpg</image>"
	Response.write Set_Data(1,2)


    'GCM발송	
	result_gcm = SendPushByAndroid(Set_Data, Set_UserPushCode)

   If result_gcm(0) = True Then

		  ' 전송결과 처리.

		' json 파싱시 multicast_id 등이 ~E나오는거 처리를 위해 문자열로 파싱되도록 " 추가
		result = result_gcm(2)  
		result = Replace(result," ","")
		result = Replace(result,"multicast_id"":","multicast_id"":""")
		result = Replace(result,",""success",""",""success")

		Response.write result



		dim result_gcm_info : set result_gcm_info = JSON.parse(result)
		cnt_ok = CInt(result_gcm_info.Get("success")) ' 전송성공 결과수
		cnt_err = CInt(result_gcm_info.Get("failure")) ' 전송실패 결과수

			for each key in result_gcm_info.Get("results").keys()
			res_err = result_gcm_info.Get("results").Get(key).Get("error") ' 에러메세지 
			res_ok  = result_gcm_info.Get("results").Get(key).Get("message_id") ' 성공일경우 message_id 있음

				If res_err <> "" Then
				' 발송실패 처리로직~~~~
				Else
				' 발송성공 처리로직~~~~
				End If
				
			Next

	Else

 ' 서버에러

 '  에러처리 로직 ~~~~~~

	End if






' 구글 GCM 함수
Function SendPushByAndroid(Byval Set_Data, Byval Set_UserPushCode)

	On Error Resume Next
	Dim param ,i
	Dim XMLHTTPS(2)
	Dim objHttp

	Set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")

	Dim senddata    : senddata = ""
	Dim gcmid    : gcmid = ""
	Dim sURL

    ' 배열로 받는다

	if not isarray(Set_Data) Then
		SendPushByAndroid = 0
		Exit Function
	End If

	' json

	for i = 1 to Ubound(Set_Data,1)

		senddata = senddata & """" & Set_Data(i,1) & """:""" & Set_Data(i,2) & """"

		if i <> Ubound(Set_Data,1) Then
			senddata = senddata & ","
		End If

	Next



	for i = 0 to Ubound(Set_UserPushCode,1)

		gcmid = gcmid & """" & Set_UserPushCode(i) & """"

		if i <> Ubound(Set_UserPushCode,1) Then
			gcmid = gcmid & ","
		End If

	Next

	param = "{"
	param = param & """collapse_key"" :""" & collapse_key & ""","
	param = param & """data"":{" & senddata & "},""registration_ids"":["& gcmid &"]"
	param = param & "}"




	sURL = "https://android.googleapis.com/gcm/send"
	objHttp.Open "POST", sURL, False
	objHttp.SetRequestHeader "Content-Type","application/json"
	objHttp.SetRequestHeader "Authorization","key=AIzaSyABOn-L5lvnNNbdVX9onuUn6CweEdW1BqE"
	objHttp.send param




	XMLHTTPS(1) = objHttp.status
	XMLHTTPS(2) = objHttp.responseText

	If Err.Number <> 0 Then
		XMLHTTPS(0)  = False
	Else
		XMLHTTPS(0)  = True
	End If

	SendPushByAndroid = XMLHTTPS

End Function


%>


