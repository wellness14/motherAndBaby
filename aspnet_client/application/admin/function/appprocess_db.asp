<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/application/include/asp/dbcon.asp"-->
<!--#include virtual="/application/include/asp/common_func.asp"-->
<% 

CALL sChkSession()
sDbOpen("BABYAPP")


    Dim sMode
	sMode		=		Request("sMode")
    
	Dim seq, marketname, versionCode, versionName, className, downurl, popupflag, useYN

    seq					= Request("seq")
    marketname		= Request("marketname")
	versionCode		= Request("versionCode")
	versionName		= Request("versionName")
	className			= Request("className")
	downurl			= Request("downurl")
	popupflag			= Request("popupflag")
	useYN				= Request("useYN")

    
	
    select case sMode
		
		case "writer"

        sQuery = "insert into tb_Appversion_history(maketName,versionName,versionCode, className,downUrl,popflag,useYN ) "
		sQuery = sQuery & " values ('"&marketname&"', '"&versionCode&"','"&versionName&"','"&className&"','"&downurl&"','"&popupflag&"','"&useYN&"') " 			
        oDb.Execute(sQuery)

        call sChkMsg("앱마켓 및 버전 정보가 등록이 되었습니다.","2","appversion.asp")

		case "edit"
         
		sQuery = "update  tb_Appversion_history set " 
		sQuery = sQuery & " maketName = '"&marketname&"' "
		sQuery = sQuery & " ,versionName = '"&versionName&"' "
		sQuery = sQuery & " ,versionCode = '"&versionCode&"' "
		sQuery = sQuery & " ,className = '"&className&"' "
		sQuery = sQuery & " ,downUrl = '"&downurl&"' "
		sQuery = sQuery & " ,popflag = '"&popupflag&"' "
		sQuery = sQuery & " ,useYN = '"&useYN&"' "
		sQuery = sQuery & " ,regDate = getdate()"
		sQuery = sQuery & " where seq = " & seq 

        oDb.Execute(sQuery)

        call sChkMsg("앱마켓 및 버전 정보가 수정이 되었습니다.","2","appversion.asp")


		case "del"
 


	end select


	
	call sDbClose()

%>