<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/lunar_calenda.asp"-->
<%
    response.charset = "utf-8"
	sDbOpen("BABYAPP")
	  
   'http://mothernbaby.co.kr/application/api/get_postnatalsave.asp?UCode=1000000001&selinput=양력|1974-08-23|2015-08-23|2014-01-23|초산모|없음|이용함|자연분만|육아맘|20|176|60|80
   '음력,양력| 생년월일 | 출산예정일 | 결혼기념일 | 출산경험 | 첫아이 | 조리원 | 분만형태 | 직장유무 | 임신기간 | 키 | 임신전 몸무게 | 현재 몸무게
   
   Dim UCode, selinput
   UCode	 = request("UCode")  
   selinput	 = request("selinput")  
   
   Dim errcode,errmsg
   errcode = "0" 
   errmsg = "success"

   If UCode = "" Then 
		errcode = "-1"
		errmsg = "default parameter info error(UCode)"
   End If 

   Dim ReqItem, item, i 
   ReqItem = Split(selinput, "|")

   If (IsArray(ReqItem)) Then
       If UBound(ReqItem) <> 12 Then 
		errcode = "-2"
		errmsg = "default parameter info error(selinput)"
	   End If 
   End If




   'ReqItem(0)	= request("cal")  'cal = 음력 l, 양력 s
   'ReqItem(1)	= request("birthday") '생일
   'ReqItem(2)	= request("duedate")  '출산예정일
   'ReqItem(3)	= request("wedding")  '결혼기념일
   'ReqItem(4)	= request("parous")   '출산경험
   'ReqItem(5)	= request("babynum")  '아기수
   'ReqItem(6)	= request("clinic")  '조리원
   'ReqItem(7)	= request("delivery")  '분만형태
   'ReqItem(8)	= request("workplace")  '직장형태
   'ReqItem(9)	= request("gperiod")  '임신기간
   'ReqItem(10)	= request("stature")  '신장
   'ReqItem(11)	= request("gweight")  '임신전체중
   'ReqItem(12)	= request("pweight")  '현재체중

 
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
				errcode = "110"
			    errmsg = "default parameter info error(임신전체중)"
				End If
            Case "12" 
                If item = "" Then 
				errcode = "110"
			    errmsg = "default parameter info error(현재체중)"
				End If
		    end Select
		
	   i = i + 1
    Next 
    
	'Response.write ReqItem(1) & ReqItem(2) & ReqItem(3) & "<br>"
    
	If errcode = "0" Then 

					
			' 사용자의 맞춤 정보를 저장하여 로그를 기록한다. 
			sQuery = "insert into tb_postnatalUser_log (UCode,cal,birthday,duedate,wedding,parous,babynum,clinic,delivery,workplace,gperiod,stature,gweight,pweight,RegDATE) " 
			sQuery = sQuery & " values ('"&UCode&"','"&ReqItem(0)&"','"&ReqItem(1)&"','"&ReqItem(2)&"','"&ReqItem(3)&"','"&ReqItem(4)&"','"&ReqItem(5)&"','"&ReqItem(6)&"','"&ReqItem(7)&"','"&ReqItem(8)&"','"&ReqItem(9)&"','"&ReqItem(10)&"','"&ReqItem(11)&"','"&ReqItem(12)&"',getdate())"
			'Response.write sQuery 

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
     Response.write """infolist"": ["
     Response.write "{"
     Response.write """UCode"": """&UCode&""","
     Response.write """selinput"": """&selinput&"""" 
	 Response.write "}"
     Response.write "]"
	 Response.write "}"

	
    

	call sDbClose()
%>
