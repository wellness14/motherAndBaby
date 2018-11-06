<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_UserInfoRegStep2.asp?UCode=1000000001&NM=텐핀스아줌마&BT=1985-01-23&LC=123456&GD=F 

   Dim ReqItem(4), item, i 
   ReqItem(0)	= request("UCode") 
   ReqItem(1)	= request("NM") 
   ReqItem(2)	= request("BT") 
   ReqItem(3)	= request("LC") 
   ReqItem(4)	= request("GD") 'F:남자, M:여자

   Dim errcode,errmsg
      i = 0 
      errcode = "0" 
	  errmsg = "success"
       
	  '입력값 정상유무 확인    

	  For Each item In ReqItem
			
			select case i
			case "0"
				If item = "" Then 
				errcode = "100"
			    errmsg = "사용자 코드가 없습니다."
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "닉네임 정보을 입력해주세요."
				End If
			Case "2" 
                If item = "" Then 
				errcode = "102"
			    errmsg = "생년월일을 입력해주세요."
				End If
            Case "3" 
                If item = "" Then 
				errcode = "103"
			    errmsg = "지역정보를 선택해주세요."
				End If
			Case "4" 
                If item = "" Then 
				errcode = "104"
			    errmsg = "성별을 선택해주세요."
				End If
		    end Select
		
	   i = i + 1
    Next 
    
	If errcode = "0" Then 
		
		Dim totalCount
		sQuery = "select count(-1) as Count from tb_UserInfo where Useq = '"& ReqItem(0) &"' " 
		Set oRS = oDb.Execute(sQuery)

		totalCount = oRs("Count")

		oRs.close 

		If totalCount = "0" Then 

			errcode = "200" 
			errmsg = "회원정보중에서 동일한 정보를 가진 정보가 없습니다."

		Else 

			sQuery = "update tb_UserInfo set" 
			sQuery = sQuery & " nickName = '"&ReqItem(1)&"'"
			sQuery = sQuery & " ,birth = '"&ReqItem(2)&"'" 
			sQuery = sQuery & " ,localCD = '"&ReqItem(3)&"'" 
			sQuery = sQuery & " ,sex = '"&ReqItem(4)&"'"
			sQuery = sQuery & " ,modifyDate = getdate()" 
	 
			sQuery = sQuery & " where Useq = '"&ReqItem(0)&"' " 
			oDb.Execute(sQuery)

		End If
		
    End If 

    Response.write "{"
     response.write """errcode"""
	   response.write ":"
	   response.write """"&errcode&""""
	   response.write ","
	   response.write """errmsg"""
	   response.write ":"
	   response.write """"&errmsg&""""
       response.write ","
     Response.write """infolist"": ["
        Response.write "{"
            Response.write """UCode"": """& ReqItem(0) &""","
			Response.write """NM"": """&ReqItem(1)&""","
            Response.write """BT"": """&ReqItem(2)&""","
			Response.write """LC"": """&ReqItem(3)&""","
			Response.write """GD"": """&ReqItem(4)&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"

	
	call sDbClose()
%>
