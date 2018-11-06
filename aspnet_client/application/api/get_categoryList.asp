<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_categoryList.asp?Cflag=G  'S : 스토리, G : 일반
   
   
   Dim Cflag  
   Cflag	 = request("Cflag")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

   If Cflag = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(Cflag)"
   End If 


  
   If errcode = "0" Then 

      
      sQuery = "SELECT * FROM tb_StoryCategoryList where Cflag = '"&Cflag&"' order by orderNum asc"
      Set oRs = Server.CreateObject("ADODB.Recordset") 
	  oRs.Open sQuery,oDb,1
	  

      Dim intCount
      intCount = oRs.recordcount 
      
	  Dim i, listTxt
	  i = 1
	  
      If Not(oRs.eof) Then 
		  listTxt = "{"
						listTxt = listTxt & """cSeq"": ""99999"","
						listTxt = listTxt & """Category"": ""99999"","
						listTxt = listTxt & """CName"": ""비공개"","
						listTxt = listTxt & """CFlag"": ""G"","
						listTxt = listTxt & """iConfile"": ""http://www.mothernbaby.co.kr/upload_application/storyicon/ic_strory_category0.png"""
						listTxt = listTxt & "},"

		  
		  Do While Not ( oRs.eof or oRs.bof ) 

		       		    listTxt = listTxt & "{"
						listTxt = listTxt & """cSeq"": """&oRs("cSeq")&""","
						listTxt = listTxt & """Category"": """&oRs("Category")&""","
						listTxt = listTxt & """CName"": """&oRs("CName")&""","
						listTxt = listTxt & """CFlag"": """&oRs("CFlag")&""","
						listTxt = listTxt & """iConfile"": ""http://www.mothernbaby.co.kr/upload_application/storyicon/ic_strory_category"&oRs("iConfile")&".png"""
						listTxt = listTxt & "}"	       
						
						if intCount <> i  Then listTxt = listTxt & "," end if 
		   i = i + 1
		   oRs.MoveNext
		   Loop
       Else
					    listTxt = "{"
						listTxt = listTxt & """cSeq"": """","
						listTxt = listTxt & """Category"": """","
						listTxt = listTxt & """CName"": """","
						listTxt = listTxt & """CFlag"": """","
						listTxt = listTxt & """iConfile"": """""
						listTxt = listTxt & "}"		


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
     Response.write """infoview"": ["
     Response.write "{"
	   response.write """totalcount"""
	   response.write ":"
	   response.write """"&intCount&""""
	 Response.write "}"
     Response.write "],"
     
	 Response.write """infolist"": ["
     Response.write listTxt
     Response.write "]"

     Response.write "}"


	call sDbClose()
%>
