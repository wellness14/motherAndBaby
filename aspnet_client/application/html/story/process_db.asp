<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<%

sDbOpen("BABYAPP")

    Dim sMode, cateCode, sNum, tSeq
	sMode			=		Request("sMode")
	cateCode		=		Request("cateCode")
	sNum			=		Request("sNum")
    tSeq				=		Request("tSeq")

	
	'Response.write sMode & "/" &  cateCode & "/" &  sNum & "/" &  tSeq
	'Response.End 
	
    select case sMode

	    case "del_comment"

		     sQuery = "update tb_StoryCommentList set useYN = 'D' where tSeq = '"&tSeq&"' " 
			 oDb.Execute(sQuery)

			 Response.Write "<script language='JavaScript'> " &_
                		    "location.href='view.asp?cateCode="&cateCode&"&sNum="&sNum&"';" &_
					        "</script>"

        case "del"  

             sQuery = "update tb_StoryCommunityList set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)

			 sQuery = "update tb_StoryCommentList set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)

			 sQuery = "update tb_StoryFileinfo set useYN = 'D' where sNumber = '"&sNum&"' " 
			 oDb.Execute(sQuery)


			 Response.Write "<script language='JavaScript'> " &_
                		    "location.href='list.asp?cateCode="&cateCode&"';" &_
					        "</script>"

	end select


	
	call sDbClose()

%>