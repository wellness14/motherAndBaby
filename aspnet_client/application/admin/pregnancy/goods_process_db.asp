<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

CALL sChkSession()
sDbOpen("BABYAPP")

	Dim sMode
    sMode				=	request("sMode")

	Dim gTitle, gNumber, period, TipKeyword
	gTitle				=	Replace(Trim(request("gTitle")), "'","''")
	gNumber			=	Replace(Trim(request("gNumber")), "'","''")
    period				=	request("period")

	Dim cNum
	cNum				=	request("cNum")
    
	 Dim ArrayNum, i , Y 
    	
    select case sMode

	    case "reg"

		' 컨텐츠 코드를 가져오고, 폴더를 생성한다
				Dim maxcode
				sQuery = "SELECT Max(cNum) + 1 as maxcode FROM tb_pregnancyCheckList"
				Set oRS = oDb.Execute(sQuery)
					
						   If ISNULL(oRs("maxcode")) Then 
						   maxcode = "1" 
						   Else
						   maxcode = oRs("maxcode")			   
						   End If 

				oRs.close
				

				Dim orderNum 
                
				sQuery = "update tb_pregnancyCheckList set orderNum = orderNum + 1 where period = '"&period&"' "
				oDb.Execute(sQuery)


				'커뮤니티 정보를 입력한다. 
			    sQuery = "insert into tb_pregnancyCheckList (cNum, gTitle, gNumber, period, orderNum) " 
			    sQuery = sQuery & " values ("&maxcode&", '"&gTitle&"', '"&gNumber&"', '"&period&"', '1') " 
			    oDb.Execute(sQuery)


				ArrayNum = request("TipKeyword").Count - 1

				ReDim Preserve nArrayKeyword(ArrayNum)
				ReDim Preserve nArrayLink(ArrayNum)

				For i = 1 To request("TipKeyword").Count

				Y = i - 1
					 
							If request("TipKeyword")(i) <> "" Then 
							
							nArrayKeyword(Y) = request("TipKeyword")(i)
							nArrayLink(Y) = request("TipLink")(i)

										  
										   sQuery = "insert into tb_pregnancyTipList (cNum, TipKeyword, TLink) " 
									       sQuery = sQuery & " values ("&maxcode&", '"&nArrayKeyword(Y)&"', '"&nArrayLink(Y)&"') " 
										   oDb.Execute(sQuery)

                             End If 
										
						   
						   

				NEXT
                
				call sChkMsg("등록되었습니다","2","goodslist.asp?period="&period&"")

		case "edit"
		   

		        sQuery = "update tb_pregnancyCheckList set gTitle = '"&gTitle&"',  gNumber = '"&gNumber&"', period = '"&period&"' where cNum = '"&cNum&"' "
				oDb.Execute(sQuery)

                ArrayNum = request("TipKeyword").Count - 1

				ReDim Preserve nArrayKeyword(ArrayNum)
				ReDim Preserve nArrayLink(ArrayNum)
                ReDim Preserve nArraytSeq(ArrayNum)

				For i = 1 To request("TipKeyword").Count

				Y = i - 1
					 
							nArrayKeyword(Y) = request("TipKeyword")(i)
							nArrayLink(Y) = request("TipLink")(i)
                            nArraytSeq(Y) = request("tSeq")(i)

							If nArraytSeq(Y) <> "" Then 
							
									If nArrayKeyword(Y) = "" Then '삭제
										   
										   sQuery = "delete from tb_pregnancyTipList where tSeq = '"&nArraytSeq(Y)&"' " 
										   'Response.write sQuery & "<br>"
										   oDb.Execute(sQuery)
											

									Else '수정

										  sQuery = "update tb_pregnancyTipList set TipKeyword = '"&nArrayKeyword(Y)&"', TLink = '"&nArrayLink(Y)&"' where  tSeq = '"&nArraytSeq(Y)&"' " 
										  'Response.write sQuery & "<br>"
										  oDb.Execute(sQuery)		


									End If 
								

                            Else '추가
							         
										  If nArrayKeyword(Y) <> "" Then 
										  
										   sQuery = "insert into tb_pregnancyTipList (cNum, TipKeyword, TLink) " 
									       sQuery = sQuery & " values ("&cNum&", '"&nArrayKeyword(Y)&"', '"&nArrayLink(Y)&"') " 
										   'Response.write sQuery & "<br>"
										   oDb.Execute(sQuery)

										  End If 


							End If 
										
						   
						   

				Next
				
			  '사용자의 로그 정보도 변경한다. 
			  sQuery = "update tb_pregnancyUserCheckInfo set period = '"&period&"' where cNum = '"&cNum&"' "
			  oDb.Execute(sQuery)


				
               call sChkMsg("수정되었습니다","2","goodslist.asp?period="&period&"")
               
				

        case "del"

              
		Case "orderNum"
           
			 Dim checkOrderNum, ReqItem
			 checkOrderNum = Request("checkOrderNum")

            
		     ReqItem = Split(checkOrderNum, ",")

				   Y = 1
				    
					   For i = 0 To  UBound(ReqItem) 
					     
						'Response.write ReqItem(i) &"<br>"
                        
						sQuery = "update tb_pregnancyCheckList set"
						sQuery = sQuery & " orderNum = '"&Y&"' " 
						sQuery = sQuery & " Where period = '"&period&"' and cNum = '"&ReqItem(i)&"' " 

						oDb.Execute(sQuery)

						Y = Y + 1
					 Next	 

           Response.write " <script language='javascript'> "
						Response.write "    alert('리스트순서가 재정의 되었습니다.'); "
						Response.write "    opener.location.reload();"
						Response.write "    self.close();" 
						Response.write " </script> "
       
	   case "import" '가져오기
                
				  ReqItem = Split(cNum, ",")
                  
				   If (IsArray(ReqItem)) Then
					  
					   For i = 0 To  UBound(ReqItem) 
					    
						
							sQuery = "update tb_pregnancyCheckList set"
							sQuery = sQuery & " period = '"&period&"'" 
						    sQuery = sQuery & " Where cNum = '"&ReqItem(i)&"' " 
							oDb.Execute(sQuery)

							 '사용자의 로그 정보도 변경한다. 
							 sQuery = "update tb_pregnancyUserCheckInfo set period = '"&period&"'  where cNum = '"&ReqItem(i)&"' "
						     oDb.Execute(sQuery)

						
					 Next


				 End If
                  
 				        Response.write " <script language='javascript'> "
						Response.write "    alert('리스트가 추가되었습니다.'); "
						Response.write "    opener.location.reload();"
						Response.write "    self.close();" 
						Response.write " </script> "
      

	  case "export" '내보내기
                
				  ReqItem = Split(cNum, ",")
                  
				   If (IsArray(ReqItem)) Then
					  
					   For i = 0 To  UBound(ReqItem) 
					    
						
							sQuery = "update tb_pregnancyCheckList set"
							sQuery = sQuery & " period = '0'" 
						    sQuery = sQuery & " Where cNum = '"&ReqItem(i)&"' " 
							oDb.Execute(sQuery)

							 '사용자의 로그 정보도 변경한다. 
							 sQuery = "update tb_pregnancyUserCheckInfo set period = '0' where cNum = '"&ReqItem(i)&"' "
						     oDb.Execute(sQuery)


						
					 Next


				 End If
                  
 				        Response.write " <script language='javascript'> "
						Response.write "    alert('리스트가 비그룹으로 이동되었습니다.'); "
						Response.write "    opener.location.reload();"
						Response.write "    self.close();" 
						Response.write " </script> "



	end select


	
	call sDbClose()



%>