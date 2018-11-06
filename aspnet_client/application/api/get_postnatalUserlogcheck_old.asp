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
			selinput = oRs("cal")&"|"&oRs("birthday")&"|"&oRs("duedate")&"|"&oRs("wedding")&"|"&oRs("parous")&"|"&oRs("babynum")&"|"&oRs("clinic")&"|"&oRs("delivery")&"|"&oRs("workplace")&"|"&oRs("gperiod")&"|"&oRs("stature")&"|"&oRs("gweight")&"|"&oRs("pweight") 
			
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
			Response.write """selinput"": """&selinput&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


	call sDbClose()
%>
