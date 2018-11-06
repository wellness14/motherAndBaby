<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_postnatalUserlogcheck.asp?UCode=1000000001
   
   Dim UCode 
   UCode	 = request("UCode")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"
   
   If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
   End If 

   '사용자 닉네임을 가져온다.
   Dim NickName
   sQuery = "select top 1 * from tb_UserInfo where Useq = '"&UCode&"' "
   Set oRS = oDb.Execute(sQuery)
   
   If oRs.eof Then 

	  errcode = "-2"
	  errmsg = "사용자 정보가 존재하지 않습니다."
		
   Else

   NickName = oRs("NickName")

   End If 

   oRs.close

   If errcode = "0" Then 

		

        Dim selinput
		sQuery = "select top 1 * from tb_postnatalUser_log"
		squery = sQuery & " where UCode  = '"&UCode&"' order by regDATE DESC"
		Set oRS = oDb.Execute(sQuery)

		If oRs.eof Then 

            errcode = "0" 
            errmsg = "success(NO)"
			selinput = ""


		Else
           
		    errcode = "0" 
            errmsg = "success(YES)"
			'selinput = oRs("cal")&"|"&oRs("birthday")&"|"&oRs("duedate")&"|"&oRs("wedding")&"|"&oRs("parous")&"|"&oRs("babynum")&"|"&oRs("clinic")&"|"&oRs("delivery")&"|"&oRs("workplace")&"|"&oRs("gperiod")&"|"&oRs("stature")&"|"&oRs("gweight")&"|"&oRs("pweight") 
			Dim selinput1, selinput2, selinput3, selinput4,selinput5,selinput6,selinput7,selinput8,selinput9,selinput10,selinput11,selinput12,selinput13
			selinput1 = oRs("cal")
            selinput2 = oRs("birthday")
			selinput3 = oRs("duedate")
			selinput4 = oRs("wedding")
			selinput5 = oRs("parous")
			selinput6 = oRs("babynum")
			selinput7 = oRs("clinic")
			selinput8 = oRs("delivery")
			selinput9 = oRs("workplace")
			selinput10 = oRs("gperiod")
			selinput11 = oRs("stature")
			selinput12 = oRs("gweight")
			selinput13 = oRs("pweight")

			
		End If 


		oRs.close 




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
            Response.write """UCode"": """&UCode&""","
            Response.write """NickName"": """&NickName&""","
			Response.write """selinput1"": """&selinput1&""","
            Response.write """selinput2"": """&selinput2&""","
			Response.write """selinput3"": """&selinput3&""","
			Response.write """selinput4"": """&selinput4&""","
			Response.write """selinput5"": """&selinput5&""","
			Response.write """selinput6"": """&selinput6&""","
			Response.write """selinput7"": """&selinput7&""","
			Response.write """selinput8"": """&selinput8&""","
			Response.write """selinput9"": """&selinput9&""","
			Response.write """selinput10"": """&selinput10&""","
			Response.write """selinput11"": """&selinput11&""","
			Response.write """selinput12"": """&selinput12&""","
			Response.write """selinput13"": """&selinput13&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
