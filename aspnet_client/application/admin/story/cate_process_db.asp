<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

CALL sChkSession()
sDbOpen("BABYAPP")

    
    Dim sMode, Cflag, cSeq, Category
	sMode			=		Request("sMode")
	Cflag			=		Request("Cflag")
	cSeq			=		Request("cSeq")
    Category		=		Request("Category")

	
	Dim icon, CateName, orderNum, useYN, pNum
	icon			=		Request("icon")
	CateName		=		Request("CateName")
	orderNum		=		Request("orderNum")
	useYN			=		Request("useYN")
    pNum			=		Request("pNum")
	
    'Response.write sMode & "/" &  Cflag & "/" &  icon & "/" &  CateName & "/" &  orderNum & "/" &  useYN
	'Response.End 
	
    select case sMode

	    case "reg"

		' 분류코드를 생성한다.
		  Dim maxcode
		  sQuery = "SELECT Max(Category) + 1 as maxcode FROM tb_StoryCategoryList where CFlag = '"&Cflag&"' "
		  Set oRS = oDb.Execute(sQuery)
        
		       If ISNULL(oRs("maxcode")) Then 
					If Cflag = "S" Then maxcode = "10001" 
                    If Cflag = "G" Then maxcode = "20001" 
			   Else
			   maxcode = oRs("maxcode")			   
			   End If 

         oRs.close


         '중복된 이름 정보가 있는 지 확인 한다. 
         sQuery = "SELECT * FROM tb_StoryCategoryList where CName = '"&CateName&"'"
		 Set oRS = oDb.Execute(sQuery)

			   if Not(oRs.eof) Then
		       
			       call sChkMsg("등록된 분류 정보가 존재합니다. 다시 입력해주세요","1","")

               Else 

                   '노출순위를 위하여 동일한 번호위로 +1 한다.  
				   sQuery = "update tb_StoryCategoryList set orderNum = orderNum + 1 where orderNum >= '"&orderNum&"' and CFlag = '"&CFlag&"' " 
				   oDb.Execute(sQuery)

				   '정보를 등록한다.
			       sQuery = "insert into tb_StoryCategoryList " 
				   sQuery = sQuery & " (Category, CName,CFlag, orderNum, iConFile, useYN) "
				   sQuery = sQuery & " values ('"&maxcode&"','"&CateName&"', '"&Cflag&"','"&orderNum&"','"&icon&"','"&useYN&"') "
				   oDb.Execute(sQuery)

				   call sChkMsg("분류 정보가 등록되었습니다","2","cate_list.asp?CFlag="&CFlag&"")



			   End If 
		
		oRs.close
		

		case "edit"

         '중복된 이름 정보가 있는 지 확인 한다. 
         sQuery = "SELECT * FROM tb_StoryCategoryList where CName = '"&CateName&"' and cSeq <> '"&cSeq&"' "
		 Set oRS = oDb.Execute(sQuery)

			   if Not(oRs.eof) Then
		       
			       call sChkMsg("등록된 분류 정보가 존재합니다. 다시 입력해주세요","1","")

               Else 

                   '노출순위를 변경된 경우에는 조정한다.
				   If pNum <> orderNum Then 
				   
				   sQuery = "update tb_StoryCategoryList set orderNum = orderNum + 1 where orderNum >= '"&orderNum&"' and cSeq <> '"&cSeq&"' and CFlag = '"&CFlag&"' " 
				   oDb.Execute(sQuery)

				   End If 
					
				   '정보를 등록한다.
			       sQuery = "update tb_StoryCategoryList set " 
				   sQuery = sQuery & " CName = '"&CateName&"' " 
                   sQuery = sQuery & " ,orderNum = '"&orderNum&"' " 
				   sQuery = sQuery & " ,iConFile = '"&icon&"' " 
				   sQuery = sQuery & " ,useYN = '"&useYN&"' " 
				   sQuery = sQuery & " where cSeq = '"&cSeq&"' " 

				   oDb.Execute(sQuery)

				   call sChkMsg("분류 정보가 수정되었습니다","2","cate_list.asp?CFlag="&CFlag&"")



			   End If 
		
		oRs.close
		
		case "del"

		 sQuery = "SELECT * FROM tb_StoryCommunityList where Category = '"&Category&"' "
		 Set oRS = oDb.Execute(sQuery)

			   if Not(oRs.eof) Then
		       
			       call sChkMsg("커뮤니티 리스트가 존재합니다. 전체 삭제 후 완전삭제가 가능합니다.","1","")

               Else 

                   sQuery = "update tb_StoryCategoryList set orderNum = orderNum - 1 where orderNum > '"&pNum&"' and CFlag = '"&CFlag&"' " 
				   oDb.Execute(sQuery)

				   sQuery = "delete from tb_StoryCategoryList where cSeq = '"&cSeq&"' "
				   oDb.Execute(sQuery)

                   call sChkMsg("분류 정보가 완전삭제되었습니다","2","cate_list.asp?CFlag="&CFlag&"")

			   End If 
		
		oRs.close


		


	end select


	
	call sDbClose()

%>