<!--#include virtual="/common/menu/main_head.asp"-->
<body>
	<!--#include virtual="/common/menu/main_top.asp"-->
<%
	strSql = "SELECT MM_URL,MM_IMG FROM MO_MAIN_MAS WITH(NOLOCK) "
	strWhere = " WHERE MM_VIEW_FLG = 'Y' "
	strOrd = "ORDER BY MM_ORD ASC, MM_IDX DESC"

	Sql = strSql & strWhere & " AND MM_NUM='1' " & strOrd & ";"
	Set Rs = DBExec(Sql,"main")
	If Not Rs.EOF Then 
		arrMainList = Rs.getRows()
	End If 

	Sql = strSql & strWhere & " AND MM_NUM='2' " & strOrd & ";"
	Set Rs1 = DBExec(Sql,"main")
	If Not Rs1.EOF Then 
		strUrl1 = Rs1(0)
		strImg1 = Rs1(1)
	End If 

	Sql = strSql & strWhere & " AND MM_NUM='3' " & strOrd & ";"
	Set Rs2 = DBExec(Sql,"main")
	If Not Rs2.EOF Then 
		strUrl2 = Rs2(0)
		strImg2 = Rs2(1)
	End If 
	
	Sql = strSql & strWhere & " AND MM_NUM='4' " & strOrd & ";"
	Set Rs3 = DBExec(Sql,"main")
	If Not Rs3.EOF Then 
		strUrl3 = Rs3(0)
		strImg3 = Rs3(1)
	End If 
	
	Sql = strSql & strWhere & " AND MM_NUM='5' " & strOrd & ";"
	Set Rs4 = DBExec(Sql,"main")
	If Not Rs4.EOF Then 
		strUrl4 = Rs4(0)
		strImg4 = Rs4(1)
	End If 

	Sql = strSql & strWhere & " AND MM_NUM='6' " & strOrd & ";"
	Set Rs5 = DBExec(Sql,"main")
	If Not Rs5.EOF Then 
		strUrl5 = Rs5(0)
		strImg5 = Rs5(1)
	End If 
	
	Sql = strSql & strWhere & " AND MM_NUM='7' " & strOrd & ";"
	Set Rs6 = DBExec(Sql,"main")
	If Not Rs6.EOF Then 
		strUrl6 = Rs6(0)
		strImg6 = Rs6(1)
	End If 

	Sql = strSql & strWhere & " AND MM_NUM='8' " & strOrd & ";"
	Set Rs7 = DBExec(Sql,"main")
	If Not Rs7.EOF Then 
		arrEventList = Rs7.getRows()
	End If 
	Call RSClose(Rs) : RSClose(Rs1) : RSClose(Rs2) : RSClose(Rs3) : RSClose(Rs4) : RSClose(Rs5) : RSClose(Rs6) : RSClose(Rs7)
%>

	<div id="wrap2">
		<div id="header">
			<div id="showcase" style="width:100%; height:529px; position:absolute; text-align:center;">
			<%
				If IsArray(arrMainList) Then 
					For num=0 To UBound(arrMainList,2)
			%><a href="<%=arrMainList(0,num)%>" class="mainList" <%If num <> 0 Then%>style="display:none;"<%End If%>><img src="/upload_file/main/<%=arrMainList(1,num)%>" width="1300px" height="529px" border="0"/></a>
			<%
					Next
				End If 
			%>
			</div>
			<div id="Layer2" style="width:52px; height:53px; position:absolute; top:200px; left:50%; margin-left:-525px;"><img src="http://mothernbaby.co.kr/image/img_0009.png" width="52" height="53" border="0" onClick="fncMainPre();"	style="cursor:pointer;"/></div>
			<div id="Layer2" style="width:52px; height:53px; position:absolute; top:200px; left:50%; margin-left:473px;"><img src="http://mothernbaby.co.kr/image/img_0010.png" width="52px" height="53px" border="0" onClick="fncMainNext();" style="cursor:pointer;"/></div>
			<div id="Layer1" style="top:525px; position:absolute; left:50%; margin-left:-525px; "></div>
		</div>

		<div id="cont">
			<div class="pdl125">
				<div class="cont-row">
					<div class="span">
						<a href="<%=strUrl1%>"><img src="/upload_file/main/<%=strImg1%>" width="528px" height="238px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
                        
  
                        
                        
					</div>
					<div class="span">
						<a href="<%=strUrl2%>"><img src="/upload_file/main/<%=strImg2%>" width="261px" height="238px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="span">
						<div class="notice-list">
							<h3>
								<img src="http://mothernbaby.co.kr/image/main_notice.jpg" width="261px" height="31px" border="0" usemap="#Map" />
								<map name="Map" id="Map"><area shape="rect" coords="234,2,260,27" href="/board/board_01.asp?mOne=4&mTwo=1" /></map>
							</h3>
							<div class="cont-list" style="width:241px; font-size:12px;">
							<%
								strSql = "SELECT TOP 3 BA_IDX, BA_TITLE "
								strSql = strSql & " FROM MO_BRD_NOTICE WITH(NOLOCK) "
								strSql = strSql & " WHERE BA_CNLKBN='N' "
								strSql = strSql & " ORDER BY BA_IDX DESC "
								Set Rs = DBExec(strSql,"main")
								If Not Rs.EOF Then 
									Do Until Rs.EOF 
							%>
									<a href="/board/board_01_view.asp?idx=<%=Rs(0)%>&brd_id=NOTICE&mOne=4&mTwo=1" class="notice_text">- <%=GetSubString(20,Trim(Rs(1)))%></a><br />
							<%
										Rs.movenext
									Loop
								End If 
								Call RSClose(Rs)
							%>
							</div>
						</div>
						<div class="faq-list">
							<h3>
								<img src="http://mothernbaby.co.kr/image/main_faq.jpg" width="261" height="31" border="0" usemap="#Map2" /></td>
								<map name="Map2" id="Map2"><area shape="rect" coords="235,2,259,26" href="/board/board_02.asp?mOne=4&mTwo=2" /></map>
							</h3>
							<div class="cont-list" style="width:241px; font-size:12px;">
							<%
								strSql = "SELECT TOP 3 BA_IDX,BA_TYPE,BA_TITLE "
								strSql = strSql & " FROM MO_BRD_FAQ WITH(NOLOCK) "
								strSql = strSql & " WHERE BA_CNLKBN='N' "
								strSql = strSql & " ORDER BY BA_IDX DESC "
								Set Rs = DBExec(strSql,"main")
								If Not Rs.EOF Then 
									Do Until Rs.EOF 
							%>
									<a href="/board/board_02.asp?idx=<%=Rs(0)%>&type=<%=Rs(1)%>&mOne=4&mTwo=2" class="notice_text">- <%=Trim(Rs(2))%></a><br />
							<%
									Rs.movenext
									Loop
								End If 
								Call RSClose(Rs)
							%>
							</div>
						</div>
					</div>
				</div>
				<div class="cont-row">
					<div class="span">
					<%
						If IsArray(arrEventList) Then 
							For num=0 To UBound(arrEventList,2)
					%>
						<a href="<%=arrEventList(0,num)%>" class="eventList" <%If num <> 0 Then%>style="display:none;"<%End If%>><img src="/upload_file/main/<%=arrEventList(1,num)%>" width="265px" height="241px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100 /></a>
					<%
							Next
						End If 
					%>
					</div>
					<div class="span">
						<a href="<%=strUrl3%>"><img src="/upload_file/main/<%=strImg3%>" width="263px" height="241px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="span">
						<a href="<%=strUrl4%>"><img src="/upload_file/main/<%=strImg4%>" width="261px" height="241px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="qna">
							<a href="<%=strUrl6%>"><img src="/upload_file/main/<%=strImg5%>" width="261px" height="116px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
						<div class="qna">
							<a href="<%=strUrl6%>"><img src="/upload_file/main/<%=strImg6%>" width="261px" height="116px" border="0" "opacity:1;filter:alpha(opacity=100)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90 onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
						</div>
					</div>
				</div>

				<!--#include virtual="/common/menu/main_bottom.asp"-->
			</div>
		</div>
	</div>
	<!--#include virtual="/popup.asp"-->
</body>


<script type="text/javascript">
	var MainList = jQuery(".mainList");
	var EventList = jQuery(".eventList");
	var intMainCnt = 0;
	var intMainNow = 0;
	var intEventCnt = 0;
	var intEventNow = 0;

	function fncSetMainTimer() {
		intMainCnt = MainList.length;
		if (intMainCnt > 1){ Main = setInterval("fncMainNext()", 5000); }
	}

	function fncMainPre() {
		intMainNow -= 1;
		if (intMainNow < 0) { intMainNow = intMainCnt-1; }
		fncMainShow(intMainNow);
	}

	function fncMainNext() {
		intMainNow += 1;
		if (intMainNow >= intMainCnt) { intMainNow = 0; }
		fncMainShow(intMainNow);
	}

	function fncMainShow(num) {
		intMainNow = num;
		MainList.each(function (i) {
			if (i == num) { MainList.eq(i).show(); }
			else { MainList.eq(i).hide(); }
		});
	}

	function fncSetEventTimer() {
		intEventCnt = EventList.length;
		if (intEventCnt > 1){ Event = setInterval("fncEventNext()", 3000); }
	}

	function fncEventNext() {
		intEventNow += 1;
		if (intEventNow >= intEventCnt) { intEventNow = 0; }
		fncEventShow(intEventNow);
	}

	function fncEventShow(num) {
		intEventNow = num;
		EventList.each(function (i) {
			if (i == num) { EventList.eq(i).show(); }
			else { EventList.eq(i).hide(); }
		});
	}

	jQuery(document).ready(function(){
		fncSetMainTimer();
		fncSetEventTimer();
	});
</script>
</html>