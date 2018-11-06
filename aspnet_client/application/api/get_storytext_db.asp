<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/Base64ende.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_storytext_db.asp?sMode=reg&Ucode=1000000001&category=300001&sText=사랑합니다&FileYN=Y

	Dim sMode, UCode
	Dim category, sText,FileYN
	
    sMode				=	Trim(Request("sMode"))
	UCode				=	Trim(Request("UCode"))
    category			=	Trim(Request("category"))
    sText				=	Replace(Trim(Request("sText")), "'","''")
	FileYN				=  Trim(Request("FileYN"))

   Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    If sMode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(sMode)"
   End If 

   If UCode = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(UCode)"
   End If

   If category = "" Then 
		errcode = "-3"
		errmsg = "default parameter info error(category)"
   End If
   
   If FileYN = "" Then 
		errcode = "-4"
		errmsg = "default parameter info error(FileYN)"
   End If

   If errcode = "0" Then 

			
				
				' 컨텐츠 코드를 가져오고, 폴더를 생성한다
				Dim maxcode
				sQuery = "SELECT Max(sNumber) + 1 as maxcode FROM tb_StoryCommunityList"
				Set oRS = oDb.Execute(sQuery)
					
						   If ISNULL(oRs("maxcode")) Then 
						   maxcode = "1" 
						   Else
						   maxcode = oRs("maxcode")			   
						   End If 

				oRs.close
                Dim useYN
				If FileYN = "N" Then 
				     useYN = "Y" 
			    ElseIf FileYN = "Y" then
                     useYN = "W" 
                Else 
					 useYN = "W" 
				End If 
                
				'커뮤니티 정보를 입력한다. 
			    sQuery = "insert into tb_StoryCommunityList (sNumber, Category, Useq, sTitle, sText, sSource, hit, useYN) " 
			    sQuery = sQuery & " values ("&maxcode&", '"&category&"', '"&UCode&"', '.', '"&sText&"', '', 0, '"&useYN&"') " 
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
	   response.write """"&maxcode&""""
	   response.write ","
	   response.write """UCode"""
	   response.write ":"
	   response.write """"&UCode&""""
	 Response.write "}"
     Response.write "]"
     Response.write "}"


%>
