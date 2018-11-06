<!--#include virtual="/common/menu/head.asp"-->

<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub01_subtitle06.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td><img src="http://mothernbaby.co.kr/image/sub_0006.jpg" border="0" usemap="#partner" /></td>	
			</tr>
			<tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
				<td bgcolor="#f6f6f6" style="padding-bottom:20px; padding-top:20px;">
					<table width="640" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="107"><img src="/image/text_0001.jpg" width="57" height="29" /></td>
						<td width="533">
							<label>
								<input type="text" name="txtCop" class="textarea" size="35" valid="E|M=20|T=업체명|A=업체명을 입력해 주세요"/>
							</label>
						</td>
					</tr>
					<tr>
						<td><img src="/image/text_0002.jpg" width="57" height="29" /></td>
						<td><label>
							<input type="text" name="txtNm" class="textarea" size="35" valid="E|M=10|T=담당자명|A=담당자명을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0003.jpg" width="57" height="29" /></td>
						<td><label>
							<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
							<option value="">선택</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							</label>
							-
							<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
					<tr>
						<td><img src="/image/text_0004.jpg" width="57" height="29" /></td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|M=230|T=문의내용|A=문의내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>
					</table>
				</td>	
			</form>
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/bt_0001.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
						<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onClick="location.reload();" style="cursor:pointer;"/>
					</div>
				</td>	
			</tr>    
		</table></td>
	</tr>
	</table>
	<map name="partner" id="partner">
		<area shape="rect" coords="5,83,192,255" href="http://health.gangnam.go.kr" target="_blank" />
		<area shape="rect" coords="194,83,384,255" href="http://www.seongnam.go.kr" target="_blank" />
		<area shape="rect" coords="387,84,577,255" href="http://www.mw.go.kr" target="_blank" />
		<area shape="rect" coords="579,83,768,255" href="http://www.smba.go.kr" target="_blank" />
		<area shape="rect" coords="3,259,191,427" href="http://www.babytimes.co.kr" target="_blank" />
		<area shape="rect" coords="196,258,383,428" href="http://www.namyangi.com" target="_blank" />
		<area shape="rect" coords="388,260,577,429" href="http://www.miztree.co.kr" target="_blank" />
		<area shape="rect" coords="3,434,191,604" href="http://www.healing-u.co.kr" target="_blank" />
		<area shape="rect" coords="195,434,382,606" href="http://www.jinmedi.com" target="_blank" />
		<area shape="rect" coords="389,434,576,605" href="http://www.wooasung.com" target="_blank" />
		<area shape="rect" coords="579,434,767,605" href="http://www.dewslim.com" target="_blank" />
		<area shape="rect" coords="2,610,191,779" href="http://www.aesopclinic.com" target="_blank" />
		<area shape="rect" coords="389,609,576,780" href="http://www.terminix.co.kr" target="_blank" />
		<area shape="rect" coords="580,608,768,778" href="http://www.merrymaids.co.kr" target="_blank" />
		<area shape="rect" coords="3,784,191,954" href="http://www.chunho.net" target="_blank" />
		<area shape="rect" coords="194,785,384,955" href="http://www.paulsbaby.com" target="_blank" />
		<area shape="rect" coords="195,959,384,1128" href="http://www.9wishes.co.kr" target="_blank" />
		<area shape="rect" coords="387,960,576,1129" href="http://eaurganic.co.kr " target="_blank" />
	<area shape="rect" coords="1,1133,192,1305" href="http://www.jellypop.kr" target="_blank"><area shape="rect" coords="196,1134,384,1305" href="http://blog.naver.com/abh000" target="_blank">
	<area shape="rect" coords="3,959,194,1130" href="http://www.nurturedbynature.co.kr" target="_blank">
	<area shape="rect" coords="391,785,577,955" href="http://www.spoon.co.kr" target="_blank">
	</map>	
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./comp_06_sql.asp"
	});
</script>
</html>
