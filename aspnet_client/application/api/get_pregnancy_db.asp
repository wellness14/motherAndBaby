<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_pregnancy_db.asp
   
	
	Dim UCode, checkinput,periodCH
	UCode					=	request("UCode")
    checkinput				=	request("checkinput")
    periodCH				=	request("period")
 
    
	Dim errcode,errmsg
    errcode = "0" 
    errmsg = "success"

    If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
    End If 

    If checkinput = "" Then 
		errcode = "-2"
		errmsg = "default parameter info error(checkinput)"
    End If 

	If checkinput = "" Then 
		errcode = "-3"
		errmsg = "default parameter info error(periodCH)"
    End If 

    
	If errcode = "0" Then 

		'등록된 정보 로그를 삭제한다. 
		sQuery = "delete from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and period = '"&periodCH&"' "
		oDb.Execute(sQuery)

		Dim ReqItem, i, period
		ReqItem = Split(checkinput, "|")
		  
		
		For i = 0 To UBound(ReqItem)

			sQuery = "select period from tb_pregnancyCheckList where cNum = '"&ReqItem(i)&"' " 
			Set oRS = oDb.Execute(sQuery)
			
			period = oRs("period") 

			oRs.close

			
			sQuery = "select * from tb_pregnancyUserCheckInfo where uSeq = '"&UCode&"' and cNum = '"&ReqItem(i)&"' " 
			Set oRS = oDb.Execute(sQuery)
			
			'Response.write sQuery

			If Not(oRs.eof) Then 
	 
			   sQuery = "update tb_pregnancyUserCheckInfo set checkYN = 'Y', modifyDate = getdate() where uSeq = '"&UCode&"' and cNum = '"&ReqItem(i)&"' " 
			   oDb.Execute(sQuery)

			Else 
			   
			   sQuery = "insert into tb_pregnancyUserCheckInfo(period, cNum, checkYN, uSeq) values ('"&period&"', '"&ReqItem(i)&"', 'Y', '"&UCode&"' ) " 
			   oDb.Execute(sQuery)

			End If 

			oRs.close 

		NEXT

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
            Response.write """uCode"": """&uCode&""","
            Response.write """checkinput"": """&checkinput&""""
        Response.write "}"
      Response.write "]"
    Response.write "}"


    call sDbClose()

      



%>
