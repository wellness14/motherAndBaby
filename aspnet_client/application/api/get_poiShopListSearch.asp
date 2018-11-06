<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_poiShopListSearch.asp?Category=100001&latitude=32.1212&longitude=127.1212&searchgu=마포구
   
   
   Dim Category, latitude, longitude,searchgu 
   Category	 = request("Category")  
   searchgu	 = request("searchgu")  
   latitude	 = request("latitude")  
   longitude = request("longitude")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

   If Category = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(Category)"
   End If 

   If latitude = "" Or longitude = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(latitude,longitude)"
   End If

  
   If errcode = "0" Then 

      '카테고리 명칭 
	  Dim categoryName
	  select case Category
			case "100001"
				categoryName = "산후조리원"
			Case "100002" 
                categoryName = "산후도우미"
			Case "100003" 
                categoryName = "모유수유마시지"
            Case "100004" 
                categoryName = "산후다이어트" 
      end Select

	  const PAGESIZE = 1000          ''''''''''''' 몇개의 레코드를 보여주나
	
	  Dim Page               '''''''  현재 페이지
	  Dim TotalRecord     '''''''  총 레코드 수
	  Dim TotalPage       ''''''''  총 페이지 수
	  Dim NTOPSIZE
	  Dim Temp_Query

	  Page = CInt(Request("gotopage"))       ''''' 페이지 설정
	  	
	  If Page=0 Then   page=1
	  
	  NTOPSIZE = pagesize * (page-1)

      '반경을 가져온다
	  Dim poi_query
	  poi_query = "ACOS(COS(RADIANS(90-"&latitude&"))"
	  poi_query = poi_query & " * COS(RADIANS(90-convert(float,f_lat)))"
	  poi_query = poi_query & " + SIN(RADIANS(90-"&latitude&"))"
	  poi_query = poi_query & " * SIN(RADIANS(90-convert(float,f_lat)))"
	  poi_query = poi_query & " * COS(RADIANS("&longitude&"-convert(float,f_lng))) )"
	  poi_query = poi_query & " * 6371 as distance"


      sQuery = "SELECT count(-1) as total FROM tb_poishopinfo"
	  sQuery = sQuery & " where Category = '"&Category&"' and useflag = 'Y' "
	  If searchgu <> "" Then sQuery = sQuery & " and shopaddress like '%"&searchgu&"%'"
	  
	  Set oRS = oDb.Execute(sQuery) 

	  TotalRecord = oRS("total")
	  TotalPage = Int(TotalRecord / PAGESIZE)
		
	  'Response.write sQuery

		
	  If TotalRecord mod PAGESIZE<>0 Then
			TotalPage = TotalPage + 1
	  End If

      oRS.Close           '''''''''''''' 한개 쿼리 끝남 

      sQuery = "SELECT top "&PAGESIZE&" C.category, C.pSeq, C.title, C.shopaddress, C.Tel1, C.Tel2, C.f_lat, C.f_lng, "&poi_query&" "
	  sQuery = sQuery & " FROM ( SELECT category, pSeq, title, shopaddress, Tel1, Tel2, f_lat, f_lng,useFlag, "&poi_query&" from tb_poishopinfo )C " 
	  sQuery = sQuery & " where C.Category = '"&Category&"' and C.useFlag = 'Y' "
      If searchgu <> "" Then sQuery = sQuery & " and C.shopaddress like '%"&searchgu&"%'"

	  sQuery = sQuery & " and C.pSeq Not In (SELECT top "&NTOPSIZE&" D.pSeq " 
      sQuery = sQuery & " FROM ( SELECT pSeq, Category, shopaddress, f_lat, f_lng, useFlag, "&poi_query&" from tb_poishopinfo )D " 

	  sQuery = sQuery & " where D.Category = '"&Category&"' and D.useFlag = 'Y' "
	  If searchgu <> "" Then sQuery = sQuery & " and D.shopaddress like '%"&searchgu&"%'"

	  sQuery = sQuery & " order by D.distance asc) order by C.distance asc " 
      
	  'Response.write sQuery

      Set oRs = Server.CreateObject("ADODB.Recordset") 
	  oRs.Open sQuery,oDb,1
	  

      Dim intCount
      intCount = oRs.recordcount 
      
	  Dim i, listTxt
	  i = 1
	  listTxt = ""
      If Not(oRs.eof) Then 
		  Do While Not ( oRs.eof or oRs.bof ) 

		       		    listTxt = listTxt & "{"
						listTxt = listTxt & """shopSeq"": """&oRs("pSeq")&""","
						listTxt = listTxt & """shopTitle"": """&oRs("title")&""","
						listTxt = listTxt & """distance"": """&oRs("distance")&""","
						listTxt = listTxt & """Address"": """&oRs("shopaddress")&""","
						listTxt = listTxt & """tel1"": """&oRs("tel1")&""","
						listTxt = listTxt & """viewLink"": ""http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq="&oRs("pSeq")&"&latitude="&latitude&"&longitude="&longitude&""""
						listTxt = listTxt & "}"	       
						
						if intCount <> i  Then listTxt = listTxt & "," end if 
		   i = i + 1
		   oRs.MoveNext
		   Loop
       Else
					    listTxt = "{"
						listTxt = listTxt & """shopSeq"": """","
						listTxt = listTxt & """shopTitle"": """","
						listTxt = listTxt & """distance"": """","
						listTxt = listTxt & """Address"": """","
						listTxt = listTxt & """tel1"": """","
						listTxt = listTxt & """viewLink"": """""
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
       response.write """pagesize"""
	   response.write ":"
	   response.write """"&pagesize&""""
	   response.write ","
	   response.write """totalcount"""
	   response.write ":"
	   response.write """"&TotalRecord&""""
	   response.write ","
	   response.write """TotalPage"""
	   response.write ":"
	   response.write """"&TotalPage&""""
	   response.write ","
	   response.write """CategoryName"""
	   response.write ":"
	   response.write """"&CategoryName&""""
	 Response.write "}"
     Response.write "],"
     
	 Response.write """infolist"": ["
     Response.write listTxt
     Response.write "]"

     Response.write "}"


	call sDbClose()
%>
