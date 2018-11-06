<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
        <td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
				<td style="padding-bottom:0;"></td>
			</tr>
            <tr>
                <td id="gift" style="width:770px; align:center; padding-top:40px; padding-bottom:60px; margin-bottom:300px;">
  
      
                <img src="/image/sub03_subtitle06.jpg" width="770" height="44" />
                <dl><img src="/image/gift00.jpg"/></dl>
                <dl class="accor">
                    <dt style="width:770px; border:1px solid #ccc; border-radius:5px; padding-top:7px; padding-bottom:7px; font-weight:bolder; background-color:#fff;"/><img src="/image/giftbtn1.jpg" onMouseOver="this.style.opacity=0.5;this.filters.alpha.opacity=50" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></dt>
                    <dd style="width:770px; color:#666; position:relative; left:-39px;"/><img src="/image/gift01_171215.jpg" style="width:770px;"usemap="#gift_01"/>
						<map name="gift_01" id="gift_01">
						  <area shape="rect" coords="0,1261,764,1455" href="http://www.momnshop.com/shop/goods/goods_list.php?&category=005002" target="_blank"/>
						</map></dd>
                    <dt style="width:770px; border:1px solid #ccc; border-radius:5px; padding-top:7px; padding-bottom:7px; font-weight:bolder; background-color:#fff;"/><img src="/image/giftbtn2.jpg"onMouseOver="this.style.opacity=0.5;this.filters.alpha.opacity=50" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></dt>
                    <dd style="width:770px; color:#666;position:relative; left:-39px;"/><img src="/image/gift02.jpg" style="width :770px;"usemap="#gift_02"/>
						<map name="gift_02" id="gift_02">
							<area shape="rect" coords="-1,1393,770,1505" href="http://www.momnshop.com/shop/goods/goods_list.php?&category=005003"target="_blank" />
						</map></dd>
                    <dt style="width:770px; border:1px solid #ccc; border-radius:5px; padding-top:7px; padding-bottom:7px; font-weight:bolder; background-color:#fff;"/><img src="/image/giftbtn3.jpg"onMouseOver="this.style.opacity=0.5;this.filters.alpha.opacity=50" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></dt>
                    <dd style="width:770px; color:#666; position:relative; left:-39px;"/><img src="/image/gift03.jpg" style="width:770px;"usemap="#gift_03" />
						<map name="gift_03" id="gift_03">
						  <area shape="rect" coords="-7,1300,745,1530" href="http://www.momnshop.com/shop/goods/goods_list.php?&category=005004"target="_blank" />
						</map></dd>
                    <dt style="width:770px; border:1px solid #ccc; border-radius:5px; padding-top:7px; padding-bottom:7px; font-weight:bolder; background-color:#fff;"/><img src="/image/giftbtn4.jpg"onMouseOver="this.style.opacity=0.5;this.filters.alpha.opacity=50" onMouseOut="this.style.opacity=1;this.filters.alpha.opacity=100" /></dt>
                    <dd style="width:770px; color:#666; position:relative; left:-39px;"/><img src="/image/gift04.jpg" style="width:770px;"usemap="#gift_04" />
						<map name="gift_04" id="gift_04">
						  <area shape="rect" coords="12,1039,743,1198" href="http://www.momnshop.com/shop/goods/goods_list.php?&category=005005"target="_blank" />
						</map></dd>
                </dl>
                </td>
            </tr>    
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
<script>
	$(".accor dd").hide();
	$(".accor dt").css("cursor","pointer")//마우스모양을 손모양으로
	$(".accor dt").click(function(){
		$(this).next("dd").slideToggle("slow")
		$(this).next("dd").siblings("dd").slideUp("slow");//앞부분에 위에 줄과 동일한 부분은 지우고 붙여써도 됨
	})
</script>
    
</body>
</html>
