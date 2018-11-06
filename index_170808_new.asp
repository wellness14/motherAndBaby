<!--#include virtual="/common/menu/main_head.asp"-->
<body>
	<!--#include virtual="/common/menu/main_top.asp"-->
<%
    If uId <> "" Then
    
	strSqll = strSqll & " INSERT INTO MO_LOGIN_LOG ( "
	strSqll = strSqll & "         MM_MEM_ID "
	strSqll = strSqll & " )  "
	strSqll = strSqll & " VALUES ("
	strSqll = strSqll & "			'"& uId &"'); "
'			response.Write strSql
'			response.End 
	Call DBExec(strSqll, "main") : Call DBClose(DBCon)
 
	End if

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
			%><a href="<%=arrMainList(0,num)%>" class="mainList" <%If num <> 0 Then%>style="display:none;"<%End If%>><img src="/upload_file/main/<%=arrMainList(1,num)%>" width="1300" height="529" border="0"/></a>
			<%
				Next
				End If 
			%>
			</div>
			
			<div id="Layer2" style="width:52px; height:53px; position:absolute; top:200px; left:50%; margin-left:-525px;">
				<img src="http://mothernbaby.co.kr/image/img_0009.png" width="52" height="53" border="0" onClick="fncMainPre();"	style="cursor:pointer;"/>
			</div>
			<div id="Layer2" style="width:52px; height:53px; position:absolute; top:200px; left:50%; margin-left:473px;">
				<img src="http://mothernbaby.co.kr/image/img_0010.png" width="52" height="53" border="0" onClick="fncMainNext();" style="cursor:pointer;"/>
			</div>
			<div id="Layer1" style="top:525px; position:absolute; left:50%; margin-left:-525px; "></div>
		</div>

		<div id="cont">
			<div class="pdl125">
<!-- 				<ul class="cont-row"> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu01.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu02.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu03.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu04.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 				<ul class="cont-row"> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu05.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu06.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu07.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 					<li><a href="#!"></a> -->
<!-- 						<img src="/upload_file/main/menu08.jpg" alt="" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"> -->
<!-- 					</li> -->
<!-- 				</ul> -->
				<div class="cont-row">
					<div class="span">
						<a href="<%=strUrl1%>"><img src="/upload_file/main/<%=strImg1%>" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="span">
						<a href="<%=strUrl2%>"><img src="/upload_file/main/<%=strImg2%>" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="span">
						<div class="notice-list">
							<a href="http://www.mothernbaby.co.kr/member/member_change.asp?mOne=6&mTwo=6"><img src="/upload_file/main/menu03.jpg" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100"/></a>
						</div>
						<div class="faq-list">
							<a href="http://www.mothernbaby.co.kr/board/board_03.asp?mOne=4&mTwo=3"><img src="/upload_file/main/menu04.jpg" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
						</div>
					</div>
				</div>
				<div class="cont-row">
					<div class="span">
					<%
						If IsArray(arrEventList) Then 
							For num=0 To UBound(arrEventList,2)
					%>
						<a href="<%=arrEventList(0,num)%>"><img src="/upload_file/main/<%=arrEventList(1,num)%>" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					<%
							Next
						End If 
					%>
					</div>
					<div class="span">
						<a href="<%=strUrl3%>" target="_blank"><img src="/upload_file/main/<%=strImg3%>" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
					<div class="span">
						<a href="<%=strUrl4%>"><img src="/upload_file/main/<%=strImg4%>" border="0" style="opacity:0.9;filter:alpha(opacity=90)" onMouseOver="this.style.opacity=0.9;this.filters.alpha.opacity=90" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></a>
					</div>
				</div>

				<!--#include virtual="/common/menu/main_bottom.asp"-->
			</div>
		</div>
	</div>
	<!--#include virtual="/popup.asp"-->

			<!-- Google Code for &#47700;&#51064;&#54168;&#51060;&#51648; &#50976;&#51077; &#51104;&#51116;&#44256;&#44061; &#47784;&#49688; -->

			<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->

			<script type="text/javascript">

			/* <![CDATA[ */

			var google_conversion_id = 938455758;

			var google_conversion_label = "x80cCJTw514QzuW-vwM";

			var google_custom_params = window.google_tag_params;

			var google_remarketing_only = true;

			/* ]]> */

			</script>

			<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">

			</script>

			<noscript>

			<div style="display:inline;">

			<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/938455758/?value=1.00&amp;currency_code=KRW&amp;label=x80cCJTw514QzuW-vwM&amp;guid=ON&amp;script=0"/>

			</div>

			</noscript>

<script type="text/javascript">
    var roosevelt_params = {
        retargeting_id:'RiSvXXiD56LhpdsbQvwyQw00',
        tag_label:'w-ihawVeQ7mv1ukx2KbJcA'
    };
</script>
<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>

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
			if (i == num) { MainList.eq(i).css('display','block'); }
			else { MainList.eq(i).css('display','none'); }
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