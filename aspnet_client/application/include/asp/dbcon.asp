<!--METADATA TYPE="typelib"  NAME="ADODB Type Library UUID= "00000205-0000-0010-8000-00AA006D2EA4"-->
<% '@EnableSessionState = false %>
<%		
	Option Explicit
	
	Response.Expires = -1
	Response.AddHeader"Pragma","no-cache"
	response.Charset = "UTF-8"
	
	'	Response.expires= now()+1
  '	response.cachecontrol="public"
			
	Dim sCn, oDb, oDb2, oRs, sQuery,Rs, sQuerySub
	
	'=================================================================================================
	'- Define : 데이터베이스를 오픈한다
	'- Para   : sFlag(데이터베이스명)
	'- Sample : sDbOpen("mem_zzang")
	'- Db컨은 모두 소문자로 한다.
	'=================================================================================================
	sub sDbOpen(sFlag)
	
		dim sLoginPwd, sLoginID, sLoginDB, sLoginIP

		select case sFlag
			CASE "BABYAPP"
				'sLoginPwd	= "wellness141414"
				'sLoginID		= "wellness14"				
				'sLoginDB		= "wellness14"										
				'sLoginIP		= "wellness14.cafe24.com"
				sLoginPwd		= "wellness35793"
				sLoginID		= "wellness14"				
				sLoginDB		= "wellness14_godohosting_com"										
				sLoginIP		= "db49.godohosting.com"
				sCn = "Provider=SQLOLEDB.1;Password=" & sLoginPwd & ";Persist Security Info=True;User ID=" & sLoginID & ";Initial Catalog=" & sLoginDB & ";Data Source=" & sLoginIP																
				
			case else
				response.write sFlag  & " : 연결설정이 잘못되었습니다."
				response.end		
		
		 end select 	
		 
		Set oDb = Server.CreateObject("ADODB.Connection")				
		oDb.Open sCn
		
	end sub


	'=================================================================================================
	'- Define : 데이터베이스를 오픈한다
	'- Para   : sFlag(데이터베이스명)
	'- Sample : sDbOpen("dspenter")
	'=================================================================================================
	sub sDbOpen2(sFlag)
	
		dim sPwd, sID, sDB, sIP
			
		select case sFlag
			CASE "BABYAPP"
				'sLoginPwd	= "wellness141414"
				'sLoginID		= "wellness14"				
				'sLoginDB		= "wellness14"										
				'sLoginIP		= "wellness14.cafe24.com"
				sLoginPwd		= "wellness35793"
				sLoginID		= "wellness14"				
				sLoginDB		= "wellness14_godohosting_com"										
				sLoginIP		= "db49.godohosting.com"
				sCn = "Provider=SQLOLEDB.1;Password=" & sLoginPwd & ";Persist Security Info=True;User ID=" & sLoginID & ";Initial Catalog=" & sLoginDB & ";Data Source=" & sLoginIP																
				
																			
			case else
				response.write "연결설정이 잘못되었슴당."
				response.end
		end select
			
		
			Set oDb2 = Server.CreateObject("ADODB.Connection")			
			oDb2.Open sCn
				
'		oDb2.Open sCn
		
	end sub
	
		
	'=================================================================================================
	'- Define : 레코드셋을 닫는다
	'- Para   : Nothing
	'- Sample : sRsClose()
	'=================================================================================================	
	sub sRsClose()
		oRs.Close
		set oRs = nothing
	end sub

	'=================================================================================================
	'- Define : 데이터베이스를 닫는다
	'- Para   : NOTHING
	'- Sample : sDbClose()
	'=================================================================================================
	sub sDbClose()
		oDb.Close
		set oDb = nothing
	end sub
		
	'=================================================================================================
	'- Define : 레코드셋, 디비 모두를 닫는다
	'- Para   : Nothing
	'- Sample : sAllClose()
	'=================================================================================================	
	sub sAllClose()
		oRs.Close()
		oDb.Close()
		set oRs = nothing
		set oDb = nothing
	end sub	


	'=================================================================================================
	'- Define : 레코드셋을 닫는다
	'- Para   : Nothing
	'- Sample : sRsClose()
	'=================================================================================================	
	sub sRsClose2()
		Rs.Close
		set Rs = nothing
	end sub

	'=================================================================================================
	'- Define : 데이터베이스를 닫는다
	'- Para   : NOTHING
	'- Sample : sDbClose()
	'=================================================================================================
	sub sDbClose2()
		oDb2.Close
		set oDb2 = nothing
	end sub
	
	'=================================================================================================
	'- Define : 레코드셋, 디비 모두를 닫는다
	'- Para   : Nothing
	'- Sample : sAllClose()
	'=================================================================================================	
	sub sAllClose2()
		Rs.Close()
		oDb2.Close()
		set Rs = nothing
		set oDb2 = nothing
	end sub


%>