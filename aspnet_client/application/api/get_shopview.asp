<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq=1&latitude=32.1212&longitude=127.1212
   
   Dim shopSeq, latitude, longitude  
   shopSeq	 = request("shopSeq")  
   latitude	 = request("latitude")  
   longitude	 = request("longitude")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

   If shopSeq = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(shopSeq)"
   End If 

   If latitude = "" Or longitude = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(latitude,longitude)"
   End If


   
    
	If errcode = "0" Then 

	 '반경을 가져온다
	 Dim poi_query,shopTitle,distance, Address, tel1, tel2
	 poi_query = "ACOS(COS(RADIANS(90-"&latitude&"))"
	 poi_query = poi_query & " * COS(RADIANS(90-convert(float,f_lat)))"
	 poi_query = poi_query & " + SIN(RADIANS(90-"&latitude&"))"
	 poi_query = poi_query & " * SIN(RADIANS(90-convert(float,f_lat)))"
	 poi_query = poi_query & " * COS(RADIANS("&longitude&"-convert(float,f_lng))) )"
	 poi_query = poi_query & " * 6371 as distance"
	 
     
	 ' 산후 조리원 정보 찾아오기 
	 sQuery = " select *, "&poi_query&" from tb_poishopinfo" 
	 sQuery = sQuery & " where pSeq = '"&shopSeq&"'" 
	 sQuery = sQuery & " order by distance asc "
	 Set oRS = oDb.Execute(sQuery)


		 If oRs.eof Then 

			errcode = "-1"
			errmsg = "shop 정보가 존재하지 않습니다."

		 Else 

			shopTitle = oRs("title")
            distance = oRs("distance")
			Address = oRs("shopaddress")
			tel1 = oRs("tel1")
            tel2 = oRs("tel2")
			 
			 
		 End If 


    End If 

	oRs.close

    '샵의 히트를 더한다. 
	sQuery = "update tb_poishopinfo set hit = hit + 1 where pSeq = '"&shopSeq&"'" 
	oDb.Execute(sQuery)


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
            Response.write """shopTitle"": """&shopTitle&""","
            Response.write """distance"": """&distance&""","
			Response.write """Address"": """&Address&""","
            Response.write """tel1"": """&tel1&""","
			Response.write """tel2"": """&tel2&""""
        Response.write "}"
      Response.write "],"

		 Response.write """fileinfo"": ["
		 
		 ' 이미지 파일 가져오기
		 Dim intCount, i
		 sQuery = " select * from tb_poishopinfo_file" 
		 sQuery = sQuery & " where pSeq = '"&shopSeq&"'" 
		 oRs.Open sQuery,oDb,1
		 intCount = oRs.recordcount 
		 
		 i = 1
	     Do While Not ( oRs.eof or oRs.bof ) 

		 Response.write "           {"
		 Response.write "               ""filepath"": """&oRs("filepath")&""","
		 Response.write "               ""filename"": """&oRs("filename")&""","
         Response.write "               ""fwidth"": """&oRs("fwidth")&""","
		 Response.write "               ""fheight"": """&oRs("fheight")&""","
		 Response.write "            }"
		 if intCount <> i  then Response.write "," end if 
		 i = i + 1
		 oRs.MoveNext
		 Loop

		 oRs.Close
		 Response.write "       ]"

 
    Response.write "}"
	 

	 
    

	call sDbClose()
%>
