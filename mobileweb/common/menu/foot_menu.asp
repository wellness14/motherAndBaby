	   <div id="mfooter">
			    <div id="mf1">
				<% If uId <> "" Then %>
                <ul>
					<li class="mf0"><a href="/mobileweb/member/logout.asp"><img src="/mobileweb/html/images/mlogout.jpg"  /></a></li>
					<li class="mf0"><a href="/mobileweb/member/member_service.asp"><img src="/mobileweb/html/images/mmypage.jpg"  /></a></li>
					<li class="mf0"><a href="http://www.mothernbaby.co.kr" target="_blank"><img src="/mobileweb/html/images/mpc.jpg" /></a></li>
				</ul>
				<% Else %>
				<ul>
					<li class="mf0"><a href="/mobileweb/member/login.asp"><img src="/mobileweb/html/images/mlogin.jpg"  /></a></li>
					<li class="mf0"><a href="/mobileweb/member/member.asp"><img src="/mobileweb/html/images/mjoin.jpg"  /></a></li>
					<li class="mf0"><a href="http://www.mothernbaby.co.kr" target="_blank"><img src="/mobileweb/html/images/mpc.jpg" /></a></li>

				</ul>
                
				<% End If %>
				<div>
         </div>    
 </div>
        <div id="nmf">
                  <img src="/mobileweb/html/images/mfooter.jpg"  width="360" usemap="#mft"alt=""/>
		</div>
        <h1>
          <map name="mft" id="mft">
            <area shape="rect" coords="180,0,240,11" href="/mobileweb/member/member_02.asp" />
            <area shape="rect" coords="117,0,177,11" href="/mobileweb/member/member_01.asp" />
          </map>
</h1>
<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
<form id="ofrm" name="ofrm" method="post" action="board_01_view.asp">
	<input type="hidden" name="menuCode1" value="<%=menuCode1%>">
	<input type="hidden" name="menuCode2" value="<%=menuCode2%>">
	<input type="hidden" id="idx" name="idx" value="">
	<input type="hidden" id="num" name="num" value="">
	<input type="hidden" name="brd_id" value="<%=brd_id%>">
	<input type="hidden" name="sec_flg" value="Y">
</form>
<script type="text/javascript">
	function fncView(flg,idx,num){
		if (flg == "N"){
			fncFormSubmit(idx,num);
		}else{
			window.open("./board_pop.asp?idx="+ idx +"&num="+ num +"&brd_id=<%=brd_id%>&<%=strParam%>","board_view","width=500px, height=200px");
		}
	}

	function fncFormSubmit(idx,num){
		jQuery("#ofrm").children("input").eq(2).val(idx);
		jQuery("#ofrm").children("input").eq(3).val(num);
		jQuery("#ofrm").submit();
	}
</script>