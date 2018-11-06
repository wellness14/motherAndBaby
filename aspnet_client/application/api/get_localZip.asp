<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_localZip.asp?dong=논현동

   Dim dong
   dong	= request("dong") 

   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

	If dong = "" Then 
		errcode = "100"
	    errmsg = "default parameter info error(dong)"
	End if
	 
	Dim areaJson, i 
	areaJson = ""
	If errcode = "0" Then 


		Dim intCount
		sQuery = "select * from MO_ZIP_MAS where ZM_DON = '"& dong &"' order by ZM_ZIP_CD asc" 
		Set oRs = Server.CreateObject("ADODB.Recordset") 
	    oRs.Open sQuery,oDb,1
      
        intCount = oRs.recordcount 

		
        i = 1
	    Do While Not ( oRs.eof or oRs.bof ) 

		   areaJson = areaJson & "{"
		   areaJson = areaJson & """LC"":"""&oRs("ZM_ZIP_CD")&""","
           areaJson = areaJson & """DO"":"""&oRs("ZM_DO")&""","   
           areaJson = areaJson & """GU"":"""&oRs("ZM_GU")&""","   
		   areaJson = areaJson & """DONG"":"""&oRs("ZM_DON")&""","   
		   areaJson = areaJson & """BUN"":"""&oRs("ZM_BUN")&""""   
		   areaJson = areaJson & "}" 
		   if intCount <> i  Then areaJson = areaJson & "," end if 

	    i = i + 1
        oRs.MoveNext
	    Loop

        oRs.Close

		
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
       response.write areaJson
       Response.write "]"
    Response.write "}"


	
	call sDbClose()
%>
