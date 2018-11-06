<!-- Ç²ÅÍ ½ÃÀÛ -->
<table width="1050" border="0"  cellpadding="0" cellspacing="0">
  <tr>
    <td><a href="#"></a><img src="http://mothernbaby.co.kr/image/footer.jpg" border="0" usemap="#footer" /></td>
  </tr>
</table>
<!-- Ç²ÅÍ ³¡ -->

<form id="ofrm" name="ofrm" method="post" action="board_01_view.asp">
	<input type="hidden" name="mOne" value="<%=mOne%>">
	<input type="hidden" name="mTwo" value="<%=mTwo%>">
	<input type="hidden" id="idx" name="idx" value="">
	<input type="hidden" id="num" name="num" value="">
	<input type="hidden" name="brd_id" value="<%=brd_id%>">
	<input type="hidden" name="sec_flg" value="Y">
</form>

<map name="footer" id="footer"><area shape="rect" coords="937,166,1082,202" href="https://www.facebook.com/mfiwing" target="_blank" /><area shape="rect" coords="987,87,1046,145" href="http://www.meritzfire.com/wbiz/page/index.do?q=C0A86B74189E00EB891F2029AF8E6780C01D769337CACA" target="_blank" />
	<area shape="rect" coords="663,25,715,50" href="/comp/comp_08.asp?mOne=5&mTwo=1" />
	<area shape="rect" coords="733,25,817,50" href="/member/member_01.asp?mOne=6&mTwo=3" />
	<area shape="rect" coords="832,24,930,51" href="/member/member_02.asp?mOne=6&mTwo=4" />
	<area shape="rect" coords="946,23,1045,51" href="/member/member_03.asp?mOne=6&mTwo=5" />
	<area shape="rect" coords="638,82,692,142" href="http://www.mw.go.kr" target="_blank" />
	<area shape="rect" coords="830,84,893,145" href="http://www.ftc.go.kr" target="_blank" />
	<area shape="rect" coords="907,85,966,143" href="http://www.lig.co.kr" target="_blank" />
	<area shape="rect" coords="767,85,820,143" href="http://www.kipo.go.kr" target="_blank" />
	<area shape="rect" coords="702,87,754,145" href="http://www.smba.go.kr" target="_blank" />
	<area shape="rect" coords="640,164,779,200" href="http://blog.naver.com/momsrecipe" target="_blank" />
	<area shape="rect" coords="786,164,931,200" href="https://www.facebook.com/mothernbabycare" target="_blank" /><area shape="rect" coords="501,165,630,199" href="http://cafe.naver.com/mymotherskitchen" target="_blank" />
	<area shape="rect" coords="899,52,1044,76" href="http://www.mothernbaby.co.kr/member/member_04.asp?mOne=6&mTwo=7" target="_blank" />
</map>
<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
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