<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_pregnancy_start.asp
   
	
	Dim UCode, period, uTtitle 
	UCode					=	request("UCode")
    period					=	request("period")
	uTtitle					=	request("uTtitle")
    
	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
    End If 

	If period = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(period)"
    End If

	If uTtitle = "" Then 
		errcode = "-3"
		errmsg = "default parameter info error(uTtitle)"
    End If

    If errcode = "0" Then 

		'사용자의 제목있는지에 따라서 insert, update 한다. 
		sQuery = "select Top 1 * from tb_pregnancyUserInfo where uSeq = '"&UCode&"'"
		Set oRS = oDb.Execute(sQuery)

		Dim uTitle
		If Not(oRs.eof) Then 
		   
		   sQuery = "update tb_pregnancyUserInfo set utitle = '"&uTtitle&"', modifyDate = getdate() where uSeq = '"&UCode&"' " 
		   oDb.Execute(sQuery)

		Else 
		   
		   sQuery = "insert into tb_pregnancyUserInfo (utitle, uSeq) values ('"&uTtitle&"', '"&UCode&"') " 
		   oDb.Execute(sQuery)

		End If 
		oRs.close

		'중앙 타이틀 셋팅
		Dim periodTxt
		If period = "1" Then periodTxt = "임신초기출산리스트(1~3개월)"
		If period = "2" Then periodTxt = "임신중기출산리스트(4~7개월)"
		If period = "3" Then periodTxt = "임신후기출산리스트(8~10개월)"
		If period = "4" Then periodTxt = "산욕기리스트(출산후 6~8주)"

		
		'현재 전체 체크리스트와 체크한 정보를 가져와서, 셋팅한다. 
		Dim totalCount, userCount
		sQuery = "select Count(-1) as TotalCount from tb_pregnancyCheckList"
		Set oRS = oDb.Execute(sQuery) 
		totalCount = oRs("TotalCount")
		oRs.close 

		sQuery = "select count(-1) as userCount from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and checkYN = 'Y' "
		Set oRS = oDb.Execute(sQuery) 
		userCount = oRs("userCount")
		oRs.close 

		
		'현재 구간의 상태와 정보를 루프로 돌려준다. 
		Dim uCount, intCount, i, y,  uStateText, checkYN, kCount, Tipkeyword, varkeywordLink,  listJson 
		sQuery = "select count(-1) as uCount from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and checkYN = 'Y' and period = '"&period&"' "
		Set oRs = oDb.Execute(sQuery)
		uCount = oRs("uCount")
		oRs.close 

		sQuery = "select * from tb_pregnancyCheckList where period = '"&period&"' order by orderNum asc"
		oRs.Open sQuery,oDb,1
		intCount = oRs.recordcount    
		
		listJson = ""
		  i = 1
		  Do While Not ( oRs.eof or oRs.bof ) 

			   '사용자 체크 여부 확인
			   sQuery = "select checkYN from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and cNum = '"&oRs("cNum")&"' "
			   Set Rs = oDb.Execute(sQuery)

			   If Not(Rs.eof) Then 
			   checkYN = Rs("checkYN")
			   Else 
			   checkYN = "N"
			   End If 
			   Rs.close

			   'Tip 키워드를 가져온다 
			   sQuery = "select TipKeyword, TLink from tb_pregnancyTipList where cNum = '"&oRs("cNum")&"' "
			   Rs.Open sQuery,oDb,1
			   kCount = Rs.recordcount    
			   
			   Tipkeyword = ""
			   varkeywordLink = ""

			   y = 1
			   Do While Not ( Rs.eof or Rs.bof ) 
			 
               If Rs("TLink") <> "" Then varkeywordLink = "<a href=\'"&Rs("TLink")&"'\>" & Rs("TipKeyword") & "</a>"
			   If Rs("TLink") = "" Or ISNULL(Rs("TLink")) Then varkeywordLink = Rs("TipKeyword") 

			   Tipkeyword = Tipkeyword & varkeywordLink
			   if kCount <> y  Then Tipkeyword = Tipkeyword & " | " end if 
			   y = y + 1  
			   Rs.MoveNext
			   Loop  
			 
			   listJson = listJson & "{"
			   listJson = listJson & """cNum"":"""&oRs("cNum")&""","
			   listJson = listJson & """period"":"""&oRs("period")&""","
			   listJson = listJson & """gTitle"":"""&oRs("gTitle")&""","
			   listJson = listJson & """gNumber"":"""&oRs("gNumber")&""","
			   listJson = listJson & """checkYN"":"""&checkYN&""","
			   
			   
			   listJson = listJson & """Tipkeyword"":"""&Tipkeyword&""""

			   listJson = listJson & "}" 
			   if intCount <> i  Then listJson = listJson & "," end if 

		   i = i + 1
		   oRs.MoveNext
		   Loop

		oRs.close
		
		   If uCount = 0 Then 
			   uStateText = "미작성"
		   ElseIf intCount > uCount Then 
			   uStateText = "작성중"
		   ElseIf intCount <= uCount Then 
			   uStateText = "완료"
		   End If
     
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
        Response.write """allListNum"":"""&totalCount&"""," 
		Response.write """userCheckNum"":"""&userCount&"""," 
        Response.write """selectTitle"":"""&periodTxt&""","  
        Response.write """uStateText"":"""&uStateText&""","  
        Response.write """periodCheckNum"":"""&uCount&""","  
					  response.write """infolist"""
				      response.write ":"
				      response.write "["
                      response.write listJson
					  response.write "]"


	 Response.write "}"
     Response.write "]"
     Response.write "}"


    call sDbClose()

      



%>
