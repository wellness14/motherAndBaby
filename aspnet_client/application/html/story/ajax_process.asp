<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

sDbOpen("BABYAPP")

    Dim sMode, cateCode, sNum, tSeq,visitCode, UCode
	sMode			=		Request("sMode")
	cateCode		=		Request("cateCode")
	sNum			=		Request("sNum")
    tSeq				=		Request("tSeq")
    UCode			=		Request("UCode")

	
	'Response.write sMode & "/" &  cateCode & "/" &  sNum & "/" &  tSeq
	'Response.End 
	
    select case sMode

	    case "del_comment"

		     sQuery = "update tb_StoryCommentList set useYN = 'D' where tSeq = '"&tSeq&"' " 
			 oDb.Execute(sQuery)

			 

        case "del"  

             sQuery = "update tb_StoryCommunityList set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)

			 sQuery = "update tb_StoryCommentList set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)

			 sQuery = "update tb_StoryFileinfo set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)


			 Response.Write "<script language='JavaScript'> " &_
                		    "location.href='applist.asp?UCode="&Request.Cookies("APP")("APPUCODE")&"';" &_
					        "</script>"

		Case "Like" 

           Dim userOX
		   sQuery = "select * from tb_StoryLikeList where sNumber = '"&sNum&"' and uSeq = '"&UCode&"' "
		   Set oRS = oDb.Execute(sQuery)

            If oRs.eof Then 

                  sQuery = "insert into tb_StoryLikeList(sNumber, Useq) values ('"&sNum&"' ,'"&UCode&"' ) "
				  oDb.Execute(sQuery)

				  userOX = "Y"

			Else 
                  sQuery = "delete from tb_StoryLikeList where sNumber = '"&sNum&"' and uSeq = '"&UCode&"' "
				  oDb.Execute(sQuery)
				  userOX = "N"
			

			End If 
          
		  oRs.close 
          
		  Dim LikeCount
		  sQuery = "select count(-1) as total from tb_StoryLikeList where sNumber = '"&sNum&"' "
		  Set oRS = oDb.Execute(sQuery)
		  LikeCount = oRs("total") 

		  oRs.close 

          Dim classov
          If userOX = "Y" Then classov = " class='ov'" End If 

		  Response.write "<span"&classov&"><a class=""btn_Like"" id="""&sNum&""">좋아요</a> "&LikeCount&"</span>" &_
								  "<span><a href=""javascript:fnshareAdd('http://www.mothernbaby.co.kr/application/html/story/shareview.asp?sNum="&sNum&"');"">공유</a></span>"


	end select


	
	call sDbClose()

%>