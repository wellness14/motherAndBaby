<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
    'http://mothernbaby.co.kr/application/api/get_storycomment_db.asp?sNum=1&Useq=1000000001&replyText=121212ㅇㅁㄹㅇ

   
	Dim sNum, Useq, replyText
	Dim category, sText
	
    sNum				=	Trim(request("sNum"))
	Useq					=	Trim(request("Useq"))
	replyText			=	Replace(Trim(request("replyText")), "'","''")

	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    If sNum = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(sNum)"
   End If 

   If Useq = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(Useq)"
   End If

   If replyText = "" Then 
		errcode = "-3"
		errmsg = "default parameter info error(replyText)"
   End If

     
    If errcode = "0" Then 
				
				
			  
			    '커뮤니티 정보를 입력한다. 
			    sQuery = "insert into tb_StoryCommentList (sNumber, Useq, tText) " 
			    sQuery = sQuery & " values ("&sNum&", '"&Useq&"', '"&replyText&"') " 
			    oDb.Execute(sQuery)

			  
  
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
       response.write """sNum"""
	   response.write ":"
	   response.write """"&sNum&""""
	   response.write ","
	   response.write """Useq"""
	   response.write ":"
	   response.write """"&Useq&""""
	 Response.write "}"
     Response.write "]"
     Response.write "}"




  call sDbClose()




%>
