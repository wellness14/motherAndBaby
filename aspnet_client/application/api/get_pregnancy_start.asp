<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_pregnancy_start.asp
   
	
	Dim UCode
	UCode					=	request("UCode")
    
	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
    End If 

    sQuery = "select Top 1 * from tb_pregnancyUserInfo where uSeq = '"&UCode&"'"
    Set oRS = oDb.Execute(sQuery)

    Dim uTitle
    If Not(oRs.eof) Then 
      uTitle = oRs("uTitle")
	Else 
      uTitle = "" 
	End If 
    oRs.close 
	
    Dim intCount,groupJson, i  
	Dim periodTxt, uCount, uStateText
	sQuery = "select count(-1) as totalCount, period from tb_pregnancyCheckList group by period order by period"
    oRs.Open sQuery,oDb,1
    intCount = oRs.recordcount 
    

	groupJson = ""
	  i = 1
	  Do While Not ( oRs.eof or oRs.bof ) 

       If oRs("period") = "1" Then periodTxt = "임신초기(1~3개월)"
       If oRs("period") = "2" Then periodTxt = "임신중기(4~7개월)"
	   If oRs("period") = "3" Then periodTxt = "임신후기(8~10개월)"
	   If oRs("period") = "4" Then periodTxt = "산욕기(출산후 6~8주)"
       
	   sQuery = "select count(-1) as uCount from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and checkYN = 'Y' and period = '"&oRs("period")&"' "
       Set Rs = oDb.Execute(sQuery)
	   
	   uCount = Rs("uCount")

	   Rs.close 

       If uCount = 0 Then 
	       uStateText = "미작성"
       ElseIf oRs("totalCount") > uCount Then 
	       uStateText = "작성중"
	   ElseIf oRs("totalCount") <= uCount Then 
	       uStateText = "완료"
       End If 


		   groupJson = groupJson & "{"
		   groupJson = groupJson & """periodTxt"":"""&periodTxt&""","
           groupJson = groupJson & """period"":"""&oRs("period")&"""," 
           groupJson = groupJson & """link"":""http://mothernbaby.co.kr/application/api/get_pregnancy_check.asp?period="&oRs("period")&"&uCode="&UCode&"&uTtitle="","
		   groupJson = groupJson & """uStateText"":"""&uStateText&""""
		   groupJson = groupJson & "}" 
	       if intCount <> i  Then groupJson = groupJson & "," end if 

	   i = i + 1
       oRs.MoveNext
	   Loop

	oRs.close


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
     Response.write """UCode"": """&UCode&""","
     Response.write """uTitle"": """&uTitle&"""," 
	 response.write """infolist"""
				      response.write ":"
				      response.write "["
                      response.write groupJson
					  response.write "]"


	 Response.write "}"
     Response.write "]"
     Response.write "}"



    call sDbClose()

      



%>
