<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<!--#include virtual="/application/admin/function/json2.asp"-->

<%

   response.charset = "utf-8"
   CALL sChkSession()
   sDbOpen("BABYAPP")
   

   Dim pushSeq, area, Sex, group, keyword 
   
   pushSeq  = Request("pushSeq")
   Sex = Request("Sex")
   Group = Request("Group")
   keyword = Request("keyword")


    sQuery = "Select  * from tb_PushBadge_info where pushSeq = '"&pushSeq&"' "
	Set oRS = oDb.Execute(sQuery)

	If Not(oRs.eof) Then 

		Dim sendType, title, conTxT, sendResult, imgfilename, imgfilepath, regDate
		sendType			=		oRs("sendType")
		title					=		oRs("title")
		conTxT				=		oRs("conTxT")
		sendResult		=		oRs("sendResult")
		imgfilepath		=		oRs("filepath")
		imgfilename		=		oRs("imgfilename")
		regDate			=		oRs("regDate")

	

   Dim Set_UserPushCode2, i 
   Dim result_gcm
   Dim GOOGLE_GCM_KEY 

   GOOGLE_GCM_KEY = "AIzaSyABOn-L5lvnNNbdVX9onuUn6CweEdW1BqE"
   
   Redim Set_Data(1,2)
   Set_Data(1,1) = "msg"
   If sendType = "img" Then  
			Set_Data(1,2) = "<title>"&title&"</title><context>"&conTxT&"</context><image>http://www.mothernbaby.co.kr"&imgfilepath&"/"&imgfilename&"</image>"
   elseIf sendType = "txt" Then  
			Set_Data(1,2) = "<title>"&title&"</title><context>"&conTxT&"</context>"
   End If 

   'Response.write Set_Data(1,2) & "<br/>"


      Dim intCount
	  
	   If sex = "all" And Group = "" And keyword = "" Then 
	  
		 sQuery = "select top 10 * from tb_UserDeviceInfo B" 
	     sQuery = sQuery & " where pushYN = 'Y' and B.TokenInfo <> ''"


	  Else 
		
        sQuery = "select top 10 * from tb_UserInfo A, tb_UserDeviceInfo B " 
	    sQuery = sQuery & " where A.DeviceID = B. DeviceID "
        sQuery = sQuery & " and B.pushYN = 'Y' and  A.useYN = 'Y'  and B.TokenInfo <> '' "
        If sex <> "all" Then sQuery = sQuery & " and A.sex = '"&Sex&"'"
	    If keyword <> "" Then sQuery = sQuery & " and "&group&" like '%"&keyword&"%' " 

	  End If 


 	  Set oRs = Server.CreateObject("ADODB.Recordset") 
	  oRs.Open sQuery,oDb,1

	  intCount = oRs.recordcount 

      Redim Set_UserPushCode(intCount-1)

	   i = 0 
       Do While Not ( oRs.eof or oRs.bof ) 

				 
			   Set_UserPushCode(i) = oRs("TokenInfo")

			    If sex = "all" And Group = "" And keyword = "" Then 
	  
			    Else 
		              
                   sQuery = "insert into tb_Pushuser_log (uSeq, title, sendflag,linkCode,regDate) values ('"&oRs("uSeq")&"',  '"&title&"',  '공지',  '',  getdate() ) " 
                   oDb.Execute(sQuery)

				End If 


        i = i + 1
        oRs.MoveNext
        Loop

       oRs.close
      
	   result_gcm = SendPushByAndroid(Set_Data, Set_UserPushCode)
       

	        If result_gcm(0) = false  Then
				' 전송결과 처리.
				' json 파싱시 multicast_id 등이 ~E나오는거 처리를 위해 문자열로 파싱되도록 " 추가
				Dim result, cnt_ok, cnt_err, key, res_err, res_ok
				result = result_gcm(2) ' 
				result = Replace(result," ","")
				result = Replace(result,"multicast_id"":","multicast_id"":""")
				result = Replace(result,",""success",""",""success")

				' 결과값 형식
				' json string => {"multicast_id":"8565733994660211065","success":0,"failure":1,"canonical_ids":0,"results":[{"error":"InvalidRegistration"}]}
				'결과값 처리. multicast_id, canonical_ids 는 처리하지않음. : 필요시 처리

				dim result_gcm_info : set result_gcm_info = JSON.parse(result)
				cnt_ok = CInt(result_gcm_info.Get("success")) ' 전송성공 결과수
				cnt_err = CInt(result_gcm_info.Get("failure")) ' 전송실패 결과수
                  
                 Response.write "전송성공건"& cnt_ok & "<br>전송실패건" & cnt_err & "<br>"

						for each key in result_gcm_info.Get("results").keys()
						res_err = result_gcm_info.Get("results").Get(key).Get("error") ' 에러메세지 
						res_ok  = result_gcm_info.Get("results").Get(key).Get("message_id") ' 성공일경우 message_id 있음
						
                        		'If res_err <> "" Then
								'Response.write "f"& res_err ' 발송실패 처리로직~~~~
								'Else
								'Response.write "s"& res_ok ' 발송성공 처리로직~~~~
								'End If
								

						Next
				
			sQuery = "insert into tb_PushHistory_info (pushSeq, SearchArea1, SearchArea2, SearchArea3, ref_Success, ref_Fail, results_TxT, sendCID)" 
		    sQuery = sQuery & " values ('"&pushSeq&"','','"&Sex&"','"&Group&"|"&keyword&"','"&cnt_ok&"','"&cnt_err&"','전송완료','"&CID&"' ) "
            oDb.Execute(sQuery)

            sQuery = "update tb_PushBadge_info set sendResult='Y', sendTotal = sendTotal + 1, sendNum = sendNum + "&cnt_ok&" + "&cnt_err&" , sendDate = getdate(), sendCID = '"&CID&"' " 
			sQuery = sQuery & " where pushSeq = '"&pushSeq&"' " 
			oDb.Execute(sQuery)


		  Else
				 
				 
            sQuery = "insert into tb_PushHistory_info (pushSeq, SearchArea1, SearchArea2, SearchArea3, ref_Success, ref_Fail, results_TxT, sendCID)" 
		    sQuery = sQuery & " values ('"&pushSeq&"','','"&Sex&"','"&Group&"|"&keyword&"','0','0','통신오류 발생','"&CID&"' ) "
            oDb.Execute(sQuery)

            sQuery = "update tb_PushBadge_info set sendResult='Y', sendTotal = sendTotal + 1, sendNum = sendNum + 0, sendDate = getdate(), sendCID = '"&CID&"' " 
			sQuery = sQuery & " where pushSeq = '"&pushSeq&"' " 
			oDb.Execute(sQuery)


				
				
		  End if
	   
     Else 

          sQuery = "insert into tb_PushHistory_info (pushSeq, SearchArea1, SearchArea2, SearchArea3, ref_Success, ref_Fail, results_TxT, sendCID)" 
		  sQuery = sQuery & " values ('"&pushSeq&"','','"&Sex&"','"&Group&"|"&keyword&"','0','0','검색된 정보가 없습니다.','"&CID&"' ) "
          oDb.Execute(sQuery)
	 
	 End If 





     
						Response.write " <script language='javascript'> "
						Response.write "    alert('요청하신정보가 전송되었습니다.'); "
						Response.write "    opener.location.reload();"
						Response.write "    self.close();" 
						Response.write " </script> "	




   call sDbClose()




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
	'for i = 1 to Ubound(Set_UserPushCode,1)
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

	'Response.write "sURL : " & sURL &"<br /><br />"
	'Response.write "param : " & param &"<br /><br />"

	objHttp.Open "POST", sURL, False
	objHttp.SetRequestHeader "Content-Type","application/json"
	objHttp.SetRequestHeader "Authorization","key=" & GOOGLE_GCM_KEY
	objHttp.send param

	XMLHTTPS(1) = objHttp.status
	XMLHTTPS(2) = objHttp.responseText
	If Err.Number <> 0 Then
		XMLHTTPS(0)  = False
	Else
		XMLHTTPS(0)  = True
	End If

	'Response.write "XMLHTTPS(0) : " & XMLHTTPS(0) &"<br /><br />"
	'Response.write "XMLHTTPS(1) : " & XMLHTTPS(1) &"<br /><br />"
	'Response.write "XMLHTTPS(2) : " & XMLHTTPS(2) &"<br /><br />"
	SendPushByAndroid = XMLHTTPS

End Function


%>


