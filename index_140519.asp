<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->

<!--table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#d2eef2"><div align="center"><img src="/image/temp04.jpg" width="1226" height="529" /></div></td>
  </tr>
</table-->
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
<div id="showcase" style="width:100%; height:529px; position:absolute; top:115px; text-align:center; background-color:#d2eef2;">
<%
	If IsArray(arrMainList) Then 
		For num=0 To UBound(arrMainList,2)
%>
		<img src="/upload_file/main/<%=arrMainList(1,num)%>" width="1300" height="529" border="0" class="mainList"/>
<%
		Next
	End If 
%>
</div>
<div id="Layer2" style="width:52px; height:53px; position:absolute; top:330px; left:50%; margin-left:-525px;"><img src="/image/img_0009.png" width="52" height="53" border="0" onclick="fncMainPre();" style="cursor:pointer;"/></div>
<div id="Layer2" style="width:52px; height:53px; position:absolute; top:330px; left:50%; margin-left:473px;"><img src="/image/img_0010.png" width="52" height="53" border="0" onclick="fncMainNext();" style="cursor:pointer;"/></div>
<div id="Layer1" style="top:525px; position:absolute; left:50%; margin-left:-525px; ">
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2"><a href="<%=strUrl1%>"><img src="/upload_file/main/<%=strImg1%>" width="528" height="238" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'" /></a></td>
		<td width="261"><a href="<%=strUrl2%>"><img src="/upload_file/main/<%=strImg2%>" width="261" height="238" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'"  /></a></td>

		<td width="261"><table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><img src="/image/main_notice.jpg" width="261" height="31" border="0" usemap="#Map" /></td>
				<map name="Map" id="Map"><area shape="rect" coords="234,2,260,27" href="/board/board_01.asp?mOne=4&mTwo=1" /></map>
			</tr>
			<tr>
				<td height="88" bgcolor="#c0c060" style="padding-left:20px;">
		<%
			strSql = "SELECT TOP 3 BA_IDX, BA_TITLE "
			strSql = strSql & " FROM MO_BRD_NOTICE WITH(NOLOCK) "
			strSql = strSql & " WHERE BA_CNLKBN='N' "
			strSql = strSql & " ORDER BY BA_IDX DESC "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				Do Until Rs.EOF 
		%>
					<a href="/board/board_01_view.asp?idx=<%=Rs(0)%>&brd_id=NOTICE&mOne=4&mTwo=1" class="notice_text">- <%=Trim(Rs(1))%></a><br />
		<%
					Rs.movenext
				Loop
			End If 
			Call RSClose(Rs)
		%>
				</td>
			</tr>
			<tr>
				<td><img src="/image/main_faq.jpg" width="261" height="31" border="0" usemap="#Map2" /></td>
				<map name="Map2" id="Map2"><area shape="rect" coords="235,2,259,26" href="/board/board_02.asp?mOne=4&mTwo=2" /></map>
			</tr>
			<tr>
				<td height="88" bgcolor="#c19c60" style="padding-left:20px;">
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
				</td>
			</tr>		
		</table></td>
	</tr>
	<tr>
		<td width="265" rowspan="2">
		<%
			If IsArray(arrEventList) Then 
				For num=0 To UBound(arrEventList,2)
		%>
			<a href="<%=arrEventList(0,num)%>" class="eventList" <%If num <> 0 Then%>style="display:none;"<%End If%>><img src="/upload_file/main/<%=arrEventList(1,num)%>" width="265" height="241" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'"  /></a>
		<%
				Next
			End If 
		%>
		</td>
		<td width="263" rowspan="2"><a href="<%=strUrl3%>"><img src="/upload_file/main/<%=strImg3%>" width="263" height="241" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'"  /></a></td>
		<td rowspan="2"><a href="<%=strUrl4%>"><img src="/upload_file/main/<%=strImg4%>" width="261" height="241" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'"  /></a></td>
		<td><a href="<%=strUrl5%>"><img src="/upload_file/main/<%=strImg5%>" width="261" height="125" border="0" /></a></td>
	</tr>
	<tr>
		<td><a href="<%=strUrl6%>"><img src="/upload_file/main/<%=strImg6%>" width="261" height="116" border="0" onload="this.style.filter='alpha(opacity=100)'" onMouseOver="this.style.filter='alpha(opacity=90)'" onMouseOut="this.style.filter='alpha(opacity=100)'"  /></a></td>
	</tr>
	</table>

	<!--#include virtual="/common/menu/bottom.asp"-->
</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
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
