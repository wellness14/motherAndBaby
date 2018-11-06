<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td bgcolor="#f1f1f1"><table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="301"><img src="/image/top_001.jpg" width="193" height="32" alt="개인맞춤형서비스" /></td>
				<% If uId <> "" Then %>
			<td width="749" style="padding-right:130px;">
				<%else%>
			<td width="749" style="padding-right:130px;">
				<%End if%>
				<div align="right">
				<% If uId <> "" Then %>
					<a href="/member/logout.asp"><img src="/image/top_logout.jpg" border="0" /></a>
					<img src="/image/top_002.jpg" width="30" height="32" />
					<a href="/member/member_change.asp?mOne=6&mTwo=6"><img src="/image/top_mypage.jpg" border="0" /></a>


					<%  If uId = "byunsatto" Then %>

					<!--img src="/image/top_002.jpg" width="30px" height="32px" />
					<a href="/member/member_constract.asp?mOne=6&mTwo=6"><img src="/image/top_mypage.jpg" border="0" /></a-->

					<% End if%>


				<% Else %>
					<a href="/member/login.asp?mOne=6&mTwo=1"><img src="/image/top_login.jpg" border="0" /></a>
					<img src="/image/top_002.jpg" width="30" height="32" />
					<a href="/member/member.asp?mOne=6&mTwo=2"><img src="/image/top_join.jpg" border="0" /></a>
				<% End If %>
				</div>
			</td>
		</tr>
	</table></td>
</tr>
</table>
<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
	<td width="301"><a href="http://www.mothernbaby.co.kr/"><img src="/image/top_logo.jpg" width="196" height="83" border="0" /></a></td>
	<td width="749">
		<div align="right">
<!-- 			<img src="/image/top_navi.jpg" width="601" height="83" border="0" id="top_menu" style="cursor:pointer;"  usemap="#top_navi"/> -->
			<img src="/image/top_navi_new.jpg" width="655px" height="83px" border="0" id="top_menu" style="position:relative; opacity:1;filter:alpha(opacity=100)" cursor="pointer" usemap="#top_navi"  />
		</div>
	</td>
</tr>
</table>

<map name="top_navi" id="top_navi">
<!-- 	<area shape="rect" coords="8,19,129,66" href="http://mothernbaby.co.kr/comp/comp_01.asp?mOne=1&amp;mTwo=1"/> -->
<!-- 	<area shape="rect" coords="170,16,284,67" href="http://mothernbaby.co.kr/service/service_01.asp?mOne=2&amp;mTwo=1" /> -->
<!-- 	<area shape="rect" coords="337,17,455,66" href="http://mothernbaby.co.kr/info/info_01.asp?mOne=3&amp;mTwo=1" /> -->
<!-- 	<area shape="rect" coords="499,16,584,65" href="http://mothernbaby.co.kr/board/board_01.asp?mOne=4&amp;mTwo=1" /> -->
	<area shape="rect" coords="545,0,654,82" href="http://latherapie.co.kr" target="_blank"/>
</map>

<% If InStr(PageName,"index.asp") = 0 Then %>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td height="5" bgcolor="<%=brdColor%>"><spacer type="block"></td>
</tr>
</table>
<% End If %>


<!-- 서브메뉴 시작 -->
<div id="sub_menu" style="display:none; width:650px; height:324px; position:absolute; top:115px; left:50%; margin-left:-150px; z-index: 3;">
	<table width="650" height="324" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="/image/navi_bg.jpg" style="padding-left:20px;">
			<table width="595" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="110" height="38"><a href="/comp/comp_01.asp?mOne=1&mTwo=1"><img src="/image/navi_menu1-1.jpg" width="113" height="21" border="0"/></a></td>
				<td width="110"><a href="/service/service_01.asp?mOne=2&amp;mTwo=1"><img src="/image/navi_menu2-1.jpg" border="0"/></a></td>
				<td width="110"><a href="/info/info_01.asp?mOne=3&amp;mTwo=1"><img src="/image/navi_menu3-1.jpg" border="0" /></a></td>
				<td width="110"><a href="/board/board_01.asp?mOne=4&amp;mTwo=1"><img src="/image/navi_menu4-1.jpg" border="0"/></a></td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_02.asp?mOne=1&mTwo=2"><img src="/image/navi_menu1-2.jpg" width="113" height="21" border="0"/></a></td>
				<td><a href="/service/service_03.asp?mOne=2&amp;mTwo=3"><img src="/image/navi_menu2-3.jpg" border="0"/></a></td>
				<td><a href="/info/info_02.asp?mOne=3&amp;mTwo=2"><img src="/image/navi_menu3-2.jpg" border="0" /></a></td>
				<td><a href="/board/board_02.asp?mOne=4&amp;mTwo=2"><img src="/image/navi_menu4-2.jpg" border="0"/></a></td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_03.asp?mOne=1&amp;mTwo=3"><img src="/image/navi_menu1-3.jpg" width="113" height="21" border="0"/></a></td>
				<td><a href="/service/service_04.asp?mOne=2&amp;mTwo=4"><img src="/image/navi_menu2-4.jpg" border="0"/></a></td>
				<td><a href="/info/info_03.asp?mOne=3&amp;mTwo=3"><img src="/image/navi_menu3-3.jpg" border="0"/></a></td>
				<td><a href="/board/board_03.asp?mOne=4&amp;mTwo=3"><img src="/image/navi_menu4-3.jpg" border="0"/></a></td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_04.asp?mOne=1&amp;mTwo=4"><img src="/image/navi_menu1-4.jpg" width="113" height="21" border="0" /></a></td>
				<td><a href="/service/service_05.asp?mOne=2&amp;mTwo=5"><img src="/image/navi_menu2-5.jpg" border="0"/></a></td>
				<td><a href="/info/info_04.asp?mOne=3&amp;mTwo=4"><img src="/image/navi_menu3-4.jpg" border="0" /></a></td>
				<td><a href="/board/board_04.asp?mOne=4&amp;mTwo=4"><img src="/image/navi_menu4-4.jpg" border="0" /></a></td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_05.asp?mOne=1&amp;mTwo=5"><img src="/image/navi_menu1-5.jpg" width="113" height="21" border="0"/></a></td>
				<td><a href="/service/service_06.asp?mOne=2&amp;mTwo=6"><img src="/image/navi_menu2-6.jpg" border="0"/></a></td>
				<td><a href="/info/info_05.asp?mOne=3&amp;mTwo=5"><img src="/image/navi_menu3-5.jpg" border="0"/></a></td>
				<td><a href="/board/board_05.asp?mOne=4&amp;mTwo=5"><img src="/image/navi_menu4-5.jpg" border="0"/></a></td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_14.asp?mOne=1&amp;mTwo=14"><img src="/image/navi_menu1-8.jpg"  width="113" height="21" border="0"/></a></td>
				<td><a href="/service/service_07.asp?mOne=2&amp;mTwo=7"><img src="/image/navi_menu2-7.jpg" border="0"/></a></td>
				<td><a href="/info/info_06.asp?mOne=3&amp;mTwo=6"><img src="/image/navi_menu3-6.jpg" border="0"/></a></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td height="38"><a href="/comp/comp_06.asp?mOne=1&amp;mTwo=6"><img src="/image/navi_menu1-6.jpg" border="0"/></a></td>
				<!--<td><a href="/service/service_08.asp?mOne=2&amp;mTwo=8"><img src="/image/navi_menu2-8.jpg" border="0"/></a></td>-->
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
            <tr>
				<td height="38"><a href="/comp/comp_07.asp?mOne=1&amp;mTwo=7"><img src="/image/navi_menu1-7.jpg" border="0"/></a></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
</div>
<!-- 서브메뉴 끝 -->

<!-- <a href="http://www.mothernbaby.co.kr/banner/click.asp?b=3" target="_blank" class="aside" style="width:120px;height:600px;position: fixed;top:130px;text-align: center;color:white; display:block;"> -->
<!-- 	<img src="http://www.mothernbaby.co.kr/banner/open.asp?b=3" alt="보험배너"> -->
<!-- </a> -->


<script type="text/javascript">
	var top_menu = jQuery("#top_menu");
	var sub_menu = jQuery("#sub_menu");
	var sub_img  = jQuery("#sub_menu img");
	
	sub_img.mouseover(function(){
		num = sub_img.index(this);
		sub_img.each(function(i){
			if (i == num){
				sub_img.eq(i).attr({"src": sub_img.eq(i).attr("src").replace("_on.jpg",".jpg").replace(".jpg","_on.jpg")});
			}else{
				sub_img.eq(i).attr({"src": sub_img.eq(i).attr("src").replace("_on.jpg",".jpg")});
			}
		});
	});

	top_menu.hover(function(){
		sub_menu.show();
		top_menu.attr({"src": top_menu.attr("src").replace("_on.jpg",".jpg").replace(".jpg","_on.jpg")});
	},function(){
		sub_menu.hide();
		top_menu.attr({"src": top_menu.attr("src").replace("_on.jpg",".jpg")});
	});

	sub_menu.hover(function(){
		sub_menu.show();
	},function(){
		sub_menu.hide();		
	});

	// aside menu left값
	asideLeft();
	function asideLeft(){
		var cont_w = 1050;
		var win_w = $(window).width();
		var left_value = cont_w + ((win_w - cont_w) /2 + 30);
		$(".aside").css({left:left_value});
	};	
	$(window).resize(function(){
		asideLeft();
	});
	

</script>
