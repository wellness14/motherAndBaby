<%
    
   Dim UCode, visitCode 
   Dim AppUCODE
   UCode = Request("UCode")  '사용자 코드 
   visitCode = Request("visitCode") '방문한 페이지의 주인장 코드

   If UCode <> "" Then 
   
   Response.Cookies("APP").Domain 					= "mothernbaby.co.kr"
   Response.Cookies("APP")("APPUCODE") 		    = UCode
   
   Else

   Response.Cookies("APP").Domain 					= "mothernbaby.co.kr"
   Response.Cookies("APP")("APPUCODE") 		    = ""
   
   End If 


   AppUCODE = Request.Cookies("APP")("APPUCODE")

%>

