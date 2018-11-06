<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	  <td width="770" valign="top">
		<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-bottom:10px;"> <img src="http://mothernbaby.co.kr/image/sub_0028.jpg" border="0" usemap="#icode"/></td>	
			</tr>
		</table>
	  </td>
	</tr>
</table>
 <map name="icode" id="icode"><area shape="rect" coords="84,297,203,402" href="http://mothernbaby.co.kr/service/icode_event.html" target="_blank" /><area shape="rect" coords="551,1336,622,1353" href="http://www.useven.co.kr/shop/goods/goods_view.php?&goodsno=6031&category=" target="_blank" /><area shape="rect" coords="595,1126,666,1143" href="http://www.ryanbaby.com/main/sub/ryan_product_00.asp?depth1=2&depth2=22" target="_blank" /><area shape="rect" coords="654,943,725,960" href="http://www.chaum.net/" target="_blank" /><area shape="rect" coords="536,1446,637,1545" href="http://www.icord.com/module2014/images/info/product4.jpg" target="_blank" />
        <area shape="rect" coords="551,943,622,960" href="http://www.soonsung.com/menu_02_01.php" target="_blank" />
        <area shape="rect" coords="656,741,725,760" href="http://www.upang.co.kr/" target="_blank" />
        </map>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
		마더앤베이비 개인정보 활용 정책
		</td>
	</tr>
	<tr>
		<td align = "center">
			<textarea name="textarea" rows="10" cols="106">
 개인정보 활용 정책

 1.개인정보활용 목적

 아이코드 이벤트와 관련하여 고객님들께 보다 다양한 정보와 혜택을 제공해드리기 위하여 활용동의서에 동의한 회원의 개인정보를 차바이오텍에 제공합니다.

 2.수집,활용정보
 개인정보가 제공되는 차바이텍에 제공된 정보의 이용목적 및 이용기간은 아래와 같습니다. 
 개인정보의 마케팅 활용동의서에 동의하신 회원님들의 정보만이 제공되며, 제공된 정보는 명시된 이용목적을 벗어나 이용되지 않습니다.

 3.정보제공의 동의 철회

 본 동의서에 동의하신 회원 중 정보제공을 철회하고자 하는 회원은 이미 제공된 개인정보라 하더라도, 언제든지 열람,정정,삭제를 요구 할 수 있습니다.열람,정정,삭제 및 정보제공 동의하여 본인 확인 후 요청할 수 있습니다. 고객의 정확한 정보 확인 후, 회원탈되 시, 적립된 마일리지 소멸 및 고객정보가 삭제됩니다.
 회원탈퇴처리 된 후에도 TM이 1회 정도 갈 수 있습니다.


 제공업체명 : (주)차바이오텍 . 웰니스인텔리전스(주)                                                           
 * 제공목적: 이벤트 참여확인/ 영업정보자료(TM,SMS,DM,EM)로 활용           
 * 제공정보 : 이름/ 연락처 / 주소 / 출산예정일 / 상담희망일 
 개인정보를 제공받는 자의 개인정보 보유기간 : 위탁업체 제공일로 3년
 문의처 : 문의처 : 02-557-3544	
			</textarea>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td width="770" align="center">
			<input type="checkbox" class="checkbox" id="isnewletter" name="check_info" value="Y" valid="E|A=개인 정보 활용에 동의하여 주세요.">개인 정보 활용에 동의 합니다</input>
		</td>
	</tr>
</table>

<table width="770" height="36" border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr width="770" height="36" align ="center" >
		<td width="770" height="36" align ="center" >
			<!--img src="/image/txt_bg1.png" /-->
			<h1 style="position: relative;top:17px;left:-10px;font-size:10;color:#fff;background:url(/image/txt_bg1.png)no-repeat 50% 50%;">전화상담 예약</h1>
		</td>
	</tr>
</table>

<div style="width:770px;height:270px;background-color:#fb6566;border-top:8px solid #9c3536;margin-top:0px;">

			<!--h1><span style="font-size:20px; background:url(/image/txt_bg1.png)">전화상담 예약</h1-->
			<table style="width:770px;">
				<tr style="height:25px;">
					<th style= "width:15%;height:37px;padding-top:1px;color:#fff; font-size:14px;">이름</th>
					<td style= "width:35%"><input type="text" name="mem_nm" id="tc_name" maxlength="20" ></td>
					<th style= "width:15%;height:37px;padding-top:1px;color:#fff; font-size:14px;">출산예정일</th>
					<td style= "width:35%"><label>
						<select name="childbirth_y" style="height:20px;" valid="E|A=출산 예정일을 선택해 주세요">
							<option>년</option>
						<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
							<option value="<%=num%>"><%=num%></option>
						<% Next %>
						</select>
						<select name="childbirth_m" style="height:20px; width:70px" valid="E|A=출산 예정일을 선택해 주세요">
							<option>월</option>
						<% For num=1 To 12 %>
							<option value="<%=num%>"><%=num%>월</option>
						<% Next %>
						</select>
						<select name="childbirth_d"  style="height:20px; width:70px" valid="E|A=출산 예정일을 선택해 주세요">
							<option>일</option>
						<% For num=1 To 31 %>
							<option value="<%=num%>"><%=num%>일</option>
						<% Next %>
						</select>
					</label></td>
				</tr>
				<tr style="height:25px;">
					<th style= "width:15%;height:37px;padding-top:1px;color:#fff; font-size:14px;">연락처</th>
					<td width="35%">
						<select id="tc_tel1" name="phone_1"style="height:20px;">
						  <option value="">없음</option>
						  <option value="02">02</option>
						  <option value="031">031</option>
						  <option value="032">032</option>
						  <option value="033">033</option>
						  <option value="041">041</option>
						  <option value="042">042</option>
						  <option value="043">043</option>
						  <option value="051">051</option>
						  <option value="052">052</option>
						  <option value="053">053</option>
						  <option value="054">054</option>
						  <option value="055">055</option>
						  <option value="061">061</option>
						  <option value="062">062</option>
						  <option value="063">063</option>
						  <option value="064">064</option>
						  <option value="070">070</option>
						</select> -						
						<input type="text" name="phone_2" id="tc_tel2"  title="" class="txt" style="ime-mode:disabled; width:40px;height:20px;" maxlength="4"> -
						<input type="text" name="phone_3" id="tc_tel3" title="" class="txt" style="ime-mode:disabled; width:40px;height:20px;" maxlength="4">
					</td>
					<th style= "width:15%;height:37px;padding-top:1px;color:#fff;  font-size:14px;">상담희망일</th>
					<td width="35%"><label>
						<select name="serviceDt_y" style="height:20px;" valid="E|A=상담희망일을 선택해 주세요">
							<option>년</option>
						<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
							<option value="<%=num%>"><%=num%></option>
						<% Next %>
						</select>
						<select name="serviceDt_m"  style="height:20px; width:70px" valid="E|A=상담희망일을 선택해 주세요">
							<option>월</option>
						<% For num=1 To 12 %>
							<option value="<%=num%>"><%=num%>월</option>
						<% Next %>
						</select>
						<select name="serviceDt_d"  style="height:20px; width:70px" valid="E|A=상담희망일을 선택해 주세요">
							<option>일</option>
						<% For num=1 To 31 %>
							<option value="<%=num%>"><%=num%>일</option>
						<% Next %>
						</select>
					</label></td>	
				</tr>
				<tr style="height:25px;">
					<th style= "width:15%;height:37px;padding-top:1px;color:#fff;  font-size:14px;">휴대폰</th>
					<td width="250">
						<select  id="tc_mobile1" name="hp_1"style="height:20px;">
						  <option value="">없음</option>
						  <option value="010">010</option>
						  <option value="011">011</option>
						  <option value="016">016</option>
						  <option value="017">017</option>
						  <option value="018">018</option>
						  <option value="019">019</option>
						</select> -
						<input type="text" name="hp_2" id="tc_mobile2" title="" class="txt" style="ime-mode:disabled; width:40px;" maxlength="4" > -
						<input type="text" name="hp_3" id="tc_mobile3" title="" class="txt" style="ime-mode:disabled; width:40px;" maxlength="4">
					</td>
					<td width="80">
						<!--input type="checkbox" class="checkbox" id="isnewletter" name="isnewletter" value="Y" checked="">개인 정보 활용에 동의 합니다<br/>
						<input type="checkbox" class="checkbox" id="isnewletter" name="isnewletter" value="Y" checked="">카카오스토리 친구등록에 동의합니다.-->
					</td>
					<td width="400">
						
					</td>
				</tr>
				<tr style="height:25px;">
					<th style= "width:15%;padding-top:1px;color:#fff;font-size:14px;">주소</th>
					<td colspan="3">
						<input type="text" id="post_1" name="post_1" " style="ime-mode:disabled; width:40px;height:15px;" maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/>
						-
						<input type="text" id="post_2" name="post_2" style="ime-mode:disabled; width:40px;height:15px;" " maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/>
						&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="25px;" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="3">
						<label>
							<input type="text" id="addr_1" name="addr_1" width="25" size="60" onClick="fncOpenZip();" readonly valid="E|A=주소를 입력해 주세요"/>
						</label>
					</td>
				</tr>
				<tr style="height:25px;">
					<td>&nbsp;</td>
					<td colspan="3">
						<label>
							<input type="text" name="addr_2" maxlength="35" valid="E|A=상세주소를 입력해 주세요"/>
							&nbsp;&nbsp;</label>
						</label>
					</td>
				</tr>

				<tr>
					<td colspan="4"></td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<img src="http://mothernbaby.co.kr/image/btn_bot1.png"border="0" id="btnSubmit"></a>
					</td>
				</tr>
			</table>
</div>

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
		"action" : "./icord_01_sql.asp?<%=strLnkUrl%>"
	});

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function fncOpenZip(){
		window.open("/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}
</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-bottom:10px;"> <img src="http://mothernbaby.co.kr/image/sub_0028_01.jpg" border="0" /></td>	
			</tr>
		</table>