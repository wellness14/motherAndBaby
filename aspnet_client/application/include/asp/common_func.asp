<%'=====================================================================================================
'-  Define  : COMMON FUNCTION DEFINE
'-  Dev_Day : gulliver - 2003.11.22
'-  Cerrect : 
'-  Ref_Tab : 
'=======================================================================================================%>
<%
  dim CID, sCode, cName, authlevel  
							
	CID 				  = Request.Cookies("partner")("CID")
	sCode 				  = Request.Cookies("partner")("shopCode")
    cName 				  = Request.Cookies("partner")("cName")
	authlevel 		      = Request.Cookies("partner")("authlevel")


    '=================================================================================================
	'- Define : 로그인여부를 파악고 로그인후 제위치로 이동
	'- Para   : 
	'- Sample : sChkSession()
	'=================================================================================================
	sub sChkSession()
		if CID = ""  then
			call sChkMsg("로그인 후 이용해 주세요","2","/application/admin/login.asp")
		end if
	end Sub

   

    sub sChkMsg(sMsg, nMode, sLink)
		
		dim  action
		
		if sMsg <> "" then action = "alert('☞ " & sMsg & "');" & vbcrlf													'메시지출력
					
		select case nMode
			case 1
				action = action & " history.back();"																				'뒤로백
			case 2
				action = action & " location.href='" & sLink & "';"																'sLink로 경로이동
			case 3
				action = action & " top.location.href='" & sLink & "';"														'프래임시 top페이지로 이동
			case 4
				action = action & " self.close();"																					'팝업창을 닫는다
			case 5
				action = action & " self.close();" & vbcrlf & " opener.location.href='" & sLink & "';"					'팝업창을 닫고 부모창을 sLink경로로 이동
			case 6
				action = action & " self.close();" & vbcrlf & " opener.top.location.href='" & sLink & "';"			'부모창이 프래임시 팝업창을 닫고 sLink로 이동
			case 7
				action = action & " parent.location.href='" & sLink & "';"													'부모창을 sLink로 이동
			case 8
				action = action & " self.close();" & vbcrlf & " opener.parent.location.href='" & sLink & "';"		'부모창이 프래임시 팝업창을 닫고 sLink로 이동
			case 9
				action = action & "location.href='" & sLink & "';" & vbcrlf & " opener.location.reload();"			'부모창을 리로드 시키고 원하는 페이지로 이동
			case 10 
				action = action & "if(opener.closed)" & vbcrlf
				action = action & "{" & vbcrlf
				action = action & "window.open('" & sLink & "','return_url',('width=800,height=600,location=yes,toolbar=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes'));" & vbcrlf
				action = action & "self.close();" & vbcrlf
				action = action & "}"  & vbcrlf
				action = action & "else"  & vbcrlf
				action = action & "{" & vbcrlf 
				action = action & "window.open('" & sLink & "','return_url',('width=800,height=600,location=yes,toolbar=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes'));"& vbcrlf
				action = action & "self.close();"& vbcrlf
				action = action & "opener.self.close();"& vbcrlf
				action = action & "}" & vbcrlf
			case 15
				action = action & "self.close();" & vbcrlf & " opener.location.reload();"
			case 11
				action = action & "self.close();" & vbcrlf & " opener.parent.location.reload();"
			case 12
				action = action
			case 13
				action = action & "self.close();" & vbcrlf & " opener.parent.location.href='" & sLink & "';"
			case 14
				action = action & "location.href='" & sLink & "';" & vbcrlf & " parent.location.reload();"			'부모창을 리로드 시키고 원하는 페이지로 이동
				
			end select
		
		Response.Write "<script language='javascript'>	" & _
									action				  & _
						"</script>						"
		'Response.End
	
	end Sub
	
	Function gotoPageHTML(StartPage, PageNo, Page_List, intTotalPageCount, strURL)
	Dim CurrentPage
		dim arrImage(3)
		arrImage(0) = ""
		arrImage(1) = ""
		arrImage(2) = "Prev"
		arrImage(3) = "Next"
	
		StartPage			= cint(StartPage)
		PageNo				= cint(PageNo)
		Page_List			= cint(Page_List)
		intTotalPageCount	= cdbl(intTotalPageCount)
		
		'response.write "<div class='paginate_complex'>" & VbCrLf
			
		' 전체 페이지수가 바로 가기 페이지 수 보다 많은지 확인
		if intTotalPageCount > Page_List then
			'이전블락 설정 부분
			if StartPage <> 1 then
				'Response.Write "<a href='" & strURL & "&gotopage=" & (StartPage-Page_List) & "&startpage=" & (StartPage-Page_List) &"' class='dipolyion prev'>" & arrImage(0) & "</a>"  & VbCrLf
			else
				'Response.Write "<a href='#' class='dipolyion prev'>" & arrImage(0) & "</a>"  & VbCrLf
			end if

			'이전 페이지로 이동
			if PageNo > 1 then
				if(PageNo Mod Page_List) = 1 and StartPage <> 1 then
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo-1) & "&startpage=" & (StartPage-Page_List) &  "'>" & arrImage(2) & "</a></li>"  & VbCrLf
				else
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo-1) & "&startpage=" & StartPage & "'>" & arrImage(2) & "</a></li>"  & VbCrLf
				end if
			else
				Response.Write "<li><a href='#'>" & arrImage(2) & "</a></li>"  & VbCrLf
			end if

			For CurrentPage = StartPage to StartPage + Page_List - 1
				if CurrentPage > intTotalPageCount then
					Exit For
				else 
					if CurrentPage = PageNo then
						Response.Write "<li><a href='#'>" & CurrentPage & "</a></li>"  & VbCrLf
					else
						Response.Write "<li class=""active""><a href='" & strURL & "&gotopage=" & CurrentPage & "&startpage=" & StartPage & "'>" & CurrentPage & "</a></li>"  & VbCrLf

					end if
				end if
			Next

			'다음 페이지로 이동
			if PageNo >= intTotalPageCount then
				Response.Write "<li><a href='#'>" & arrImage(3) & "</a></li>"  & VbCrLf
			else
				if (PageNo mod Page_List) = 0 then
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo+1) & "&startpage=" & (Page_List+StartPage) & "'>" & arrImage(3) & "</a></li>" & VbCrLf
				else
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo+1) & "&startpage=" & StartPage & "'>" & arrImage(3) & "</a></li>" & VbCrLf
				end if
			end if
			
			'페이지 바로가기 다음 목록 설정
			'if((StartPage/Page_List) <> (intTotalPageCount\Page_List)) then
			'	if CurrentPage > intTotalPageCount then
			'		Response.Write "<a href='#' class='dipolyion next'>" & arrImage(1) & "</a>"  & VbCrLf
			'	else
			'		Response.Write "<a href='" & strURL & "&gotopage=" & CurrentPage & "&startpage=" & CurrentPage & "' class='dipolyion next'>" & arrImage(1) & "</a>" & VbCrLf
			'	end if
			'else
			'	Response.Write "<a href='#' class='dipolyion next'>" & arrImage(1) & "</a>"  & VbCrLf
			'end if
		else
			'Response.Write "<a href='#' class='dipolyion Prev'>" & arrImage(0) & "</a>"  & VbCrLf
			'이전 페이지로 이동
			if PageNo > 1 then
				if(PageNo Mod Page_List) = 1 and StartPage <> 1 then
					Response.Write "<li><a href='" & strURL & "&gotopage="  & (PageNo-1) & "&startpage=" & (StartPage-Page_List) & "'>" & arrImage(2) & "</a></li>" & VbCrLf
				else
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo-1) & "&startpage=" & StartPage & "'>" & arrImage(2) & "</a></li>" & VbCrLf
				end if
			else
				Response.Write "<li><a href='#'>" & arrImage(2) & "</a>"  & VbCrLf
			end if

			For CurrentPage = StartPage to intTotalPageCount
				if CurrentPage = PageNo then
					Response.Write "<li><a href='#'>" & CurrentPage & "</a></li>" & VbCrLf
				else
					Response.Write "<li class=""active""><a href='" & strURL & "&gotopage=" & CurrentPage & "'>" & CurrentPage & "</a></li>" & VbCrLf
				end if
			Next

			'다음 페이지로 이동
			if PageNo >= intTotalPageCount then
				Response.Write "<li><a href='#'>" & arrImage(3) & "</a></li>"  & VbCrLf
			else
				if (PageNo mod Page_List) = 0 then
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo+1) & "&startpage=" & (Page_List+StartPage) & "'>" & arrImage(3) & "</a></li>" & VbCrLf
				else
					Response.Write "<li><a href='" & strURL & "&gotopage=" & (PageNo+1) & "&startpage=" & StartPage & "'>" & arrImage(3) & "</a></li>" & VbCrLf
				end if
			end if
			'Response.Write "<a href='#' class='dipolyion next'>" & arrImage(1) & "</a>"  & VbCrLf
		end if

		'response.write "</div>"
	End Function

%>