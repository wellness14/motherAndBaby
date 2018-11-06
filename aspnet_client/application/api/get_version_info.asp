<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
	  'http://mothernbaby.co.kr/application/api/get_version_info.asp?maketName=google

	  
	   Dim maketName
	   Dim errcode, errmsg
	   Dim versionName, versionCode, popflag, downURL

	   maketName		 = Request("maketName")
	   
        	   
	   errcode = "0" 
       errmsg = "success"


	   ' marketinfo에 따라서 정보 가져오기 
	   sQuery = "Select top 1 * From tb_Appversion_history Where maketName = '"&maketName&"' and useYN='Y' order by regDate desc "	  
       Set oRS = oDb.Execute(sQuery)
	  
	   if oRs.eof Then 

	        versionName  = "1.2"
			versionCode   = "3"
			popflag = "C" '강제 C, 나중에 L
			downURL = "market://details?id=kr.co.momcho.app"
              

	   Else 
	    
	        versionName  = oRs("versionName")
			versionCode   = oRs("versionCode")
			popflag = oRs("popflag")
			downURL = oRs("downUrl")

		
   	   End If 

	   If maketName = "" Then 

		   errcode = "100" 
		   errmsg = "marketName input no!"

           versionName  = ""
		   versionCode   = ""
		   popflag = ""
		   downURL = ""


	   End If 
        
	   
	   response.write "{"
	   response.write """errcode"""
	   response.write ":"
	   response.write """"&errcode&""""
	   response.write ","
	   response.write """errmsg"""
	   response.write ":"
	   response.write """"&errmsg&""""
	   response.write ","
           response.write """infolist"""
	   response.write ":"
	   response.write "[{"
	   response.write """versionName"""
	   response.write ":"
	   response.write """"&versionName&""""
	   response.write ","
	   response.write """versionCode"""
	   response.write ":"
	   response.write """"&versionCode&""""
	   response.write ","
	   response.write """popflag"""
	   response.write ":"
	   response.write """"&popflag&""""
	   response.write ","
	   response.write """downURL"""
	   response.write ":"
	   response.write """"&downURL&""""
	   response.write "}]}"


	   
	   
	   

	   oRs.close
       Set oRs = Nothing

	   call sDbClose()
%>
