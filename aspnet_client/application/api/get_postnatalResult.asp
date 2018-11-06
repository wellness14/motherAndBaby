<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_postnatalResult.asp?UCode=1000000001&latitude=32.1212&longitude=127.1212
   
   Dim UCode, latitude, longitude  
   UCode	 = request("UCode")  
   latitude	 = request("latitude")  
   longitude	 = request("longitude")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

   If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
   End If 

   
  Dim ReqItem(12), item, i 
  sQuery = "select top 1 * from tb_postnatalUser_log where UCode = '"&UCode&"' order by logSeq desc "
  Set oRS = oDb.Execute(sQuery)
  
  If oRs.eof Then 

    errcode = "-2"
    errmsg = "등록된 정보가 없습니다."

  Else 
    
   ReqItem(0)	= oRs("cal")  'cal = 음력 l, 양력 s
   ReqItem(1)	= oRs("birthday") '생일
   ReqItem(2)	= oRs("duedate")  '출산예정일
   ReqItem(3)	= oRs("wedding")  '결혼기념일
   ReqItem(4)	= oRs("parous")   '출산경험
   ReqItem(5)	= oRs("babynum")  '아기수
   ReqItem(6)	= oRs("clinic")  '조리원
   ReqItem(7)	= oRs("delivery")  '분만형태
   ReqItem(8)	= oRs("workplace")  '직장형태
   ReqItem(9)	= oRs("gperiod")  '임신기간
   ReqItem(10)	= oRs("stature")  '신장
   ReqItem(11)	= oRs("gweight")  '임신전체중
   ReqItem(12)	= oRs("pweight")  '현재체중


  End If 
  
  oRs.close
  
 
  '입력값 정상유무 확인    

	  For Each item In ReqItem
			
			select case i
			case "0"
				If item = "" Then 
				errcode = "100"
			    errmsg = "default parameter info error(음력|양력)"
				End if
			Case "1" 
                If item = "" Then 
				errcode = "101"
			    errmsg = "default parameter info error(생일)"
				End If
			Case "2" 
                If item = "" Then 
				errcode = "102"
			    errmsg = "default parameter info error(출산예정일)"
				End If
            Case "3" 
                If item = "" Then 
				errcode = "103"
			    errmsg = "default parameter info error(결혼기념일)"
				End If
            Case "4" 
                If item = "" Then 
				errcode = "104"
			    errmsg = "default parameter info error(출산경험)"
				End If
            Case "5" 
                If item = "" Then 
				errcode = "105"
			    errmsg = "default parameter info error(아기수)"
				End If
            Case "6" 
                If item = "" Then 
				errcode = "106"
			    errmsg = "default parameter info error(조리원)"
				End If
            Case "7" 
                If item = "" Then 
				errcode = "107"
			    errmsg = "default parameter info error(분만형태)"
				End If
            Case "8" 
                If item = "" Then 
				errcode = "108"
			    errmsg = "default parameter info error(직장형태)"
				End If
            Case "9" 
                If item = "" Then 
				errcode = "109"
			    errmsg = "default parameter info error(임신기간)"
				End If
            Case "10" 
                If item = "" Then 
				errcode = "110"
			    errmsg = "default parameter info error(신장)"
				End If
            Case "11" 
                If item = "" Then 
				errcode = "111"
			    errmsg = "default parameter info error(임신전체중)"
				End If
            Case "12" 
                If item = "" Then 
				errcode = "112"
			    errmsg = "default parameter info error(현재체중)"
				End If
		    end Select
		
	   i = i + 1
    Next 
    
	'Response.write ReqItem(1) & ReqItem(2) & ReqItem(3) & "<br>"
    
	If errcode = "0" Then 

			Dim pDay, pregnancyPeriod,today_date, ubirth, userage,agetext, gapweight, gaptext
			pDay = DateDiff("d",ReqItem(3),ReqItem(2))
			If pDay >= "2000" Then 
			   pregnancyPeriod = "2000일 이상"
			Else 
			   pregnancyPeriod = "2000일 이하"
			End If 
			
			today_date = Now()
			
			' 음력 사용자 양력 전환하기 
			If ReqItem(0) = "음력" Then 

				 ubirth = gf_lun2sol(Left(ReqItem(1),4),Mid(ReqItem(1),6,2),Mid(ReqItem(1),8,2),"0") 
			
			Else 
				
				 ubirth = ReqItem(1)
				  
			End If 
			
			userage = (DateDiff("m", ubirth, today_date) / 12)

			If userage >=35 Then 

			   agetext = "이상"

			Else
			   
			   agetext = "이하"

			End If 


			' 과체중 구하기 
			' 현재몸무게에서 임신전 몸무게를 구한다. 
			' 임신주간에 따라서 공식 대입
			gapweight = ReqItem(12) - ReqItem(11)
			
			If ReqItem(9) <= 20 Then 
				 
				 If gapweight > 4 Then 
					gaptext = "과체중"
				 Else
					gaptext = "정상"
				 End If 

			ElseIf ReqItem(9) >= 21 And ReqItem(9) <= 25 Then

				 If gapweight > 6 Then 
					gaptext = "과체중"
				 Else
					gaptext = "정상"
				 End If

			ElseIf ReqItem(9) >= 26 And ReqItem(9) <= 30 Then

				 If gapweight > 8 Then 
					gaptext = "과체중"
				 Else
					gaptext = "정상"
				 End If

			ElseIf ReqItem(9) >= 31 And ReqItem(9) <= 35 Then
				 
				 If gapweight > 10 Then 
					gaptext = "과체중"
				 Else
					gaptext = "정상"
				 End If

			ElseIf ReqItem(9) >= 36 And ReqItem(9) <= 40 Then
				 
				 If gapweight > 12 Then 
					gaptext = "과체중"
				 Else
					gaptext = "정상"
				 End If

			End If 


			'결과값을 가져온다. 
			Dim ResultTXT, ResultCommnet, voteResult1, voteResult2, ResultKeyword, poiDelivery, poiGuide, poiMassage, poiDiet
			sQuery = "select top 1 * from tb_postnatalServiceInfo"
			squery = sQuery & " where pregnancyPeriod  = '"&pregnancyPeriod&"' "
			squery = sQuery & " and delivery  = '"&ReqItem(7)&"' "  
			squery = sQuery & " and parous  = '"&Left(ReqItem(4),2)&"' "
			squery = sQuery & " and clinic  = '"&ReqItem(6)&"' "
			squery = sQuery & " and workplace  = '"&ReqItem(8)&"' " 
			squery = sQuery & " and age35  = '"&agetext&"' "
			squery = sQuery & " and weightPlus  = '"&gaptext&"'  "   
			
			Set oRS = oDb.Execute(sQuery)

			If oRs.eof Then 


			Else 

			   voteResult1   = oRs("voteResult1")
			   voteResult2   = oRs("voteResult2")
			   ResultKeyword = oRs("ResultKeyword") 
			   poiDelivery   = oRs("poiDelivery")
			   poiGuide      = oRs("poiGuide")
			   poiMassage    = oRs("poiMassage")
			   poiDiet       = oRs("poiDiet")


			End If 

			'Response.write voteResult1 &"|"& voteResult2 &"|"& poiDelivery &"|"& poiGuide &"|"& poiMassage &"|"&poiDiet & "<br>"
			 
			oRs.close 
			
            '결과값 2 설명 제공 
            sQuery = "select top 1 * from tb_postnatalServiceInfo_Result"
			squery = sQuery & " where flagTxT  = '"&ResultKeyword&"' "
			Set oRS = oDb.Execute(sQuery)

			'Response.write sQuery

			
			If oRs.eof Then 

			ResultCommnet = ""

			Else

			ResultCommnet = Replace(oRs("comment"), "\br\", "/br/")

			End If 

			oRs.close


			' 사용자 닉네임을 가져온다. 
			Dim NickName
			sQuery = "select top 1 * from tb_UserInfo where Useq = '"&UCode&"' "
			Set oRS = oDb.Execute(sQuery)

			NickName = oRs("NickName")

			oRs.close

			'Response.write NickName

			ResultTXT = "(" & NickName & ") 산모님의 건강한 산후조리를 맘초가 함께하겠습니다./br/"
			ResultTXT = ResultTXT & "(" & NickName & ")산모님께는 (" & voteResult1 & ")/br/"
			ResultTXT = ResultTXT & "조리원 (" & voteResult2 & ")의 산후도우미를 받으시길 추천드립니다."  
			'Response.write ResultTXT

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
     Response.write """ResultTXT"": """&ResultTXT&""","
     Response.write """ResultTitle"": """&ResultKeyword&"""," 
     Response.write """ResultComment"": """&ResultCommnet&""""
	 Response.write "}"
     Response.write "],"

	 '반경을 가져와서 순차적으로 배치한다.

	 If longitude = "" And latitude = "" Then 
			
			longitude = "126.977988"
			latitude    = "37.566492"
  
	 End If 

	 Dim poi_query,intCount 
	 poi_query = "ACOS(COS(RADIANS(90-"&latitude&"))"
	 poi_query = poi_query & " * COS(RADIANS(90-convert(float,f_lat)))"
	 poi_query = poi_query & " + SIN(RADIANS(90-"&latitude&"))"
	 poi_query = poi_query & " * SIN(RADIANS(90-convert(float,f_lat)))"
	 poi_query = poi_query & " * COS(RADIANS("&longitude&"-convert(float,f_lng))) )"
	 poi_query = poi_query & " * 6371 as distance"

	 ' 산후 조리원 정보 찾아오기 
	 sQuery = " select top 3 *, "&poi_query&" from tb_poishopinfo" 
	 sQuery = sQuery & " where category = '100001'" 
	 sQuery = sQuery & " order by distance asc "
	 oRs.Open sQuery,oDb,1
     intCount = oRs.recordcount 
     	 
     Response.write """POISTEP1"": ["
     Response.write "   {"
	 Response.write "       ""GroupName"": ""산후조리원"","
     Response.write "       ""listLink"": ""http://mothernbaby.co.kr/application/api/get_poiShopListSearch.asp?Category=100001&latitude="&latitude&"&longitude="&longitude&"&searchgu=&gotopage=1"","  '좌표 정보를 같이 보내주세요.
     Response.write "       ""TotalCount"": """&intCount&""","
     Response.write "       ""STEP1LIST"": ["
	 i = 1
	 Do While Not ( oRs.eof or oRs.bof ) 
	 Response.write "           {"
     Response.write "               ""shopSeq"": """&oRs("pSeq")&""","
     Response.write "               ""shopTitle"": """&oRs("title")&""","
	 Response.write "				""distance"": """&oRs("distance")&""","
     Response.write "               ""Address"": """&oRs("shopaddress")&""","
	 Response.write "               ""tel1"": """&oRs("tel1")&""","
     Response.write "               ""viewLink"": ""http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq="&oRs("pSeq")&"&latitude="&latitude&"&longitude="&longitude&""""
     Response.write "            }"
     if intCount <> i  then Response.write "," end if 
	 i = i + 1
	 oRs.MoveNext
	 Loop
     oRs.Close
     Response.write "       ]"
     Response.write "   }"
     Response.write "],"
     
	 ' 산후 도우미 정보 찾아오기 
	 sQuery = " select top 3 *, "&poi_query&" from tb_poishopinfo" 
	 sQuery = sQuery & " where category = '100002'" 
	 sQuery = sQuery & " order by distance asc "
	 oRs.Open sQuery,oDb,1
     intCount = oRs.recordcount 

     Response.write """POISTEP2"": ["
     Response.write "   {"
	 Response.write "       ""GroupName"": ""산후도우미"","
	 Response.write "       ""listLink"": ""http://mothernbaby.co.kr/application/api/get_poiShopListSearch.asp?Category=100002&latitude="&latitude&"&longitude="&longitude&"&searchgu=&gotopage=1"","  '좌표 정보를 같이 보내주세요.
     Response.write "       ""TotalCount"": """&intCount&""","
     Response.write "       ""STEP2LIST"": ["
     i = 1
	 Do While Not ( oRs.eof or oRs.bof ) 
	 Response.write "           {"
     Response.write "               ""shopSeq"": """&oRs("pSeq")&""","
     Response.write "               ""shopTitle"": """&oRs("title")&""","
	 Response.write "				""distance"": """&oRs("distance")&""","
     Response.write "               ""Address"": """&oRs("shopaddress")&""","
	 Response.write "               ""tel1"": """&oRs("tel1")&""","
     Response.write "               ""viewLink"": ""http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq="&oRs("pSeq")&"&latitude="&latitude&"&longitude="&longitude&""""
     Response.write "            }"
     if intCount <> i  then Response.write "," end if 
	 i = i + 1
	 oRs.MoveNext
	 Loop
     oRs.Close
     Response.write "       ]"
     Response.write "   }"
     Response.write "],"

	 ' 모유수유마시지
	 sQuery = " select top 3 *, "&poi_query&" from tb_poishopinfo" 
	 sQuery = sQuery & " where category = '100003'" 
	 sQuery = sQuery & " order by distance asc "
	 oRs.Open sQuery,oDb,1
     intCount = oRs.recordcount 

     Response.write """POISTEP3"": ["
     Response.write "   {"
	 Response.write "       ""GroupName"": ""모유수유마시지"","
	 Response.write "       ""listLink"": ""http://mothernbaby.co.kr/application/api/get_poiShopListSearch.asp?Category=100003&latitude="&latitude&"&longitude="&longitude&"&searchgu=&gotopage=1"","  '좌표 정보를 같이 보내주세요.
     Response.write "       ""TotalCount"": """&intCount&""","
     Response.write "       ""STEP3LIST"": ["
     i = 1
	 Do While Not ( oRs.eof or oRs.bof ) 
	 Response.write "           {"
     Response.write "               ""shopSeq"": """&oRs("pSeq")&""","
     Response.write "               ""shopTitle"": """&oRs("title")&""","
	 Response.write "				""distance"": """&oRs("distance")&""","
     Response.write "               ""Address"": """&oRs("shopaddress")&""","
	 Response.write "               ""tel1"": """&oRs("tel1")&""","
     Response.write "               ""viewLink"": ""http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq="&oRs("pSeq")&"&latitude="&latitude&"&longitude="&longitude&""""
     Response.write "            }"
     if intCount <> i  then Response.write "," end if 
	 i = i + 1
	 oRs.MoveNext
	 Loop
     oRs.Close
     Response.write "       ]"
     Response.write "   }"
     Response.write "],"

	 ' 산후다이어트 
	 sQuery = " select top 3 *, "&poi_query&" from tb_poishopinfo" 
	 sQuery = sQuery & " where category = '100004'" 
	 sQuery = sQuery & " order by distance asc "
	 oRs.Open sQuery,oDb,1
     intCount = oRs.recordcount 

     Response.write """POISTEP4"": ["
     Response.write "   {"
	 Response.write "       ""GroupName"": ""산후다이어트"","
	 Response.write "       ""listLink"": ""http://mothernbaby.co.kr/application/api/get_poiShopListSearch.asp?Category=100004&latitude="&latitude&"&longitude="&longitude&"&searchgu=&gotopage=1"","  '좌표 정보를 같이 보내주세요.
     Response.write "       ""TotalCount"": """&intCount&""","
     Response.write "       ""STEP4LIST"": ["
     i = 1
	 Do While Not ( oRs.eof or oRs.bof ) 
	 Response.write "           {"
     Response.write "               ""shopSeq"": """&oRs("pSeq")&""","
     Response.write "               ""shopTitle"": """&oRs("title")&""","
	 Response.write "				""distance"": """&oRs("distance")&""","
     Response.write "               ""Address"": """&oRs("shopaddress")&""","
	 Response.write "               ""tel1"": """&oRs("tel1")&""","
     Response.write "               ""viewLink"": ""http://mothernbaby.co.kr/application/api/get_shopview.asp?shopSeq="&oRs("pSeq")&"&latitude="&latitude&"&longitude="&longitude&""""
     Response.write "            }"
     if intCount <> i  then Response.write "," end if 
	 i = i + 1
	 oRs.MoveNext
	 Loop
     oRs.Close
     Response.write "       ]"
     Response.write "   }"
     Response.write "]"

     Response.write "}"
    

	call sDbClose()
%>
