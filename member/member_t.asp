<!--#include virtual="/common/menu/head.asp"-->
<%
'-----------------------------------------------------------------------------
'	지점 정보 호출
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

%>

<style>
.agreeView :hover { 
     color: red;
} 
</style>

<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" style="padding-top:40px;"><img src="/image/sub06_subtitle02.jpg" /></td>
			</tr>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" id="smsCheck" name="smsCheck" value="N">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<tr style="display:none;">
				<td width="400" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0005.jpg" width="78" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./service.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check11" value="Y"/>
					</label>
					위의 약관에 동의합니다.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check22" value="Y"/>
					</label>
						위의 개인정보 수집 및 이용에 동의합니다. 
				</td>
			</tr>
			<tr>
				<td colspan="2" height="320">
					<div>
						<ul style="text-align:center;">
							<li style="float:left; width:49%; border-top:1px solid gray; border-left:1px solid gray; border-bottom:1px solid gray;">
								<div style="border-bottom:1px solid gray; font-size:15px; font-weight:bold; height:50px; line-height:50px;">목 차</div>
								<div style="border-bottom:1px solid gray; font-size:13px; font-weight:bold; text-align:left; height:50px; line-height:50px; padding-left:20px;">마더앤베이비 약관</div>
								<div style="text-align:left; height:150px;">
									<div style="border-bottom:1px solid gray; font-size:13px; font-weight:bold; height:49px; line-height:49px; padding-left:20px;">
										<a id="agree1View" class="agreeView"><span>ㄴ서비스 이용약관</span></a>
										&nbsp;&nbsp;&nbsp;<input type="radio" name="agree1" id="agree1" class="agree1" value="Y" />동의함
										<input type="radio" name="agree1" id="agree1" class="agree1" value="N" />동의안함
									</div>
									<div style="border-bottom:1px solid gray; font-size:13px; font-weight:bold; height:49px; line-height:49px; padding-left:20px;">
										<a id="agree2View" class="agreeView"><span>ㄴ개인정보 취급방침</span></a>
										<input type="radio" name="agree2" id="agree2" class="agree2" value="Y" />동의함
										<input type="radio" name="agree2" id="agree2" class="agree2" value="N" />동의안함
									</div>
									<div style="font-size:13px; font-weight:bold; height:50px; line-height:50px; padding-left:20px;">
										<a id="agree3View" class="agreeView"><span>ㄴ제 3자 정보 제공</span></a>
										&nbsp;&nbsp;&nbsp;<input type="radio" name="agree3" id="agree3" class="agree3" value="Y" />동의함
										<input type="radio" name="agree3" id="agree3" class="agree3" value="N" />동의안함
									</div>
								</div>
							</li>
							<li style="float:left; width:49%; border:1px solid gray;">
								<div style="border-bottom:1px solid gray; font-size:15px; font-weight:bold; height:50px; line-height:50px;">내 용</div>
								<div style="font-size:15px; font-weight:bold; height:200px;">
									<textarea style="width:98.5%; height:98%;" id="agree1Txt"><!--#include file="./service.html"--></textarea>
									<textarea style="width:98.5%; height:98%; display:none;" id="agree2Txt"><!--#include file="./info.html"--></textarea>
									<textarea style="width:98.5%; height:98%; display:none;" id="agree3Txt"><!--#include file="./extinfo.html"--></textarea>
								</div>
							</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" height="50" style="font-size:15px; font-weight:bold;">
					<input type="hidden" name="check1" value="Y"/>
					<input type="hidden" name="check2" value="Y"/>
					<input type="checkbox" name="agree4" id="agree4" value="Y" />전체 동의합니다.
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0007.jpg" width="770" height="49" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><img src="/image/text_0008.jpg" width="74" height="20" /></td>
						<td width="546"><label>
							<input type="text" id="mem_id" name="mem_id" class="textarea" size="19" style="ime-mode:disabled;" valid="E|M=10|T=아이디|A=아이디를 입력해 주세요"/>
						</label>
					    <img src="/image/bt_0027.jpg" border="0" align="absmiddle" id="btnIdCheck" style="cursor:pointer;"/>
						<img src="/image/text_0021.jpg" width="241" height="20" align="absmiddle" />
					</td>
					</tr>
					<tr>
						<td><img src="/image/text_0009.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="35" style="ime-mode:disabled;" valid="E|M=10|T=패스워드|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0010.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="35" style="ime-mode:disabled;" valid="E|M=10|T=패스워드 확인|A=패스워드 확인을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0011.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=10|T=성명|A=성명을 입력해 주세요"/>
						</label></td>
					</tr>	
					<!-- <tr style="display:none;">
						<td><img src="/image/text_0012.jpg" width="74" height="20" /></td>
						<td height="40"><label>
							<input type="radio" name="radio1" value="2" valid="E|A=성별을 선택해 주세요"/>여자&nbsp;&nbsp;
							<input type="radio" name="radio1" value="1" />남자
						</label></td>
					</tr>	  
					<tr style="display:none;">
						<td><img src="/image/text_0013.jpg" width="74" height="20" /></td>
						<td><label>
							<select name="Ybirth" class="textarea" style="height:35px;" valid="E|A=생년월일을 선택해 주세요">
								<option value="">년</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="Mbirth" class="textarea" style="height:35px;" valid="E|A=생년월일을 선택해 주세요">
								<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
							<select name="Dbirth" class="textarea" style="height:35px;" valid="E|A=생년월일을 선택해 주세요">
								<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	  	  
					<tr style="display:none;">
						<td><img src="/image/text_0014.jpg" width="74" height="20" /></td>
						<td><label>
								<select name="phone_1" id="phone_1" class="textarea" style="height:35px;" valid="E|A=전화번호를 선택해 주세요">
									<option value="">선택</option>
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
								</select>
							</label>
							-
							<input type="text" name="phone_2" class="textarea" size="5" maxlength="4" valid="E|A=전화번호를 입력해 주세요"/>
							-
							<input type="text" name="phone_3" class="textarea" size="5" maxlength="4" valid="E|A=전화번호를 입력해 주세요"/>       
						</td>
					</tr> -->	  	  	    	  
					<tr>
						<td><img src="/image/text_0015.jpg" width="74" height="20" /></td>
						<td><label>
								<select id="hp_1" name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
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
							<input type="text" id="hp_2" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" id="hp_3" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;<img src="/image/bt_0028.jpg" border="0" align="absmiddle" id="btnSms" style="cursor:pointer;"/>
							<input type="checkbox" name="check3" value="Y" checked />SMS 수신동의		
						</td>
					</tr>
					
					<!-- <tr style="display:none;">
						<td><img src="/image/text_0015_02.jpg" width="74" height="20" /></td>
						<td><label>
								<select id="add_hp_1" name="add_hp_1" class="textarea" style="height:35px;" valid="E|A=보호자번호를 입력해주세요">
									<option value="">선택</option>
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
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</label>
							-
							<input type="text" id="add_hp_2" name="add_hp_2" class="textarea" size="5" maxlength="4" valid="E|A=보호자번호를 입력해주세요"/>
							-
							<input type="text" id="add_hp_3" name="add_hp_3" class="textarea" size="5" maxlength="4" valid="E|A=보호자번호를 입력해주세요"/>&nbsp;&nbsp;
						</td>
					</tr> -->
					<!--tr>
						<td></td>
						<td>
						<div data-group="add_ph">
							<label>
							<input type="checkbox" name="add_hp_chk3" id="add_hp_chk3" value="3" onClick="Input_Add_3()" />상위 집전화와 동일&nbsp;&nbsp;
							<input type="checkbox" name="add_hp_chk2" id="add_hp_chk2" value="2" onClick="Input_Add_2()"/>상위 핸드폰번호와 동일
							<input type="checkbox" name="add_hp_chk1" id="add_hp_chk1" value="1" onClick="Input_Add_1()" checked/>보호자핸드폰(별도)
							</label>
						</div>
						</td>
					</tr-->
					<tr>
						<td>&nbsp;</td>
						<td>
							<input type="text" id="cert_num"  name="cert_num" maxlength="10" class="textarea" size="23"/>&nbsp;&nbsp;
						    <img src="/image/bt_0029.jpg" border="0" align="absmiddle" id="btnSmsCheck" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td><img src="/image/text_0016.jpg" width="74" height="20" /></td>
						<td>
							<input type="text" id="post" name="post" class="textarea" size="5" maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/> 
							&nbsp;&nbsp;<img src="/image/bt_0004.jpg" id="post_btn" width="107" height="28" border="0" align="absmiddle" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" id="address1" name="address1" class="textarea" size="60" readonly valid="E|A=주소를 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text"  id="address2" name="address2" class="textarea" size="35" valid="E|A=상세주소를 입력해 주세요"/>&nbsp;&nbsp;
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0017.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="text" name="email" class="textarea" size="35" valid="E|A=이메일 주소를 입력해 주세요"/>&nbsp;&nbsp;
							<input type="checkbox" name="check4" value="Y" checked />이메일 수신동의 
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0085.png" /></td>
						<td height="40">
							<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;" valid="E|A=지역을 선택해 주세요">
								<option value="">지역</option>
							<%
								If IsArray(arrLocal) Then 
									For num = 0 To UBound(arrLocal,2)
							%>
								<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
							<%
									Next 
								End If 
							%>
							</select>
							<select id="part" name="part" class="textarea" style="height:35px;" valid="E|A=지점을 선택해 주세요">
								<option value="">지점선택</option>
							</select>
						</td>
					</tr>
					</table>
				</td>	
			</tr>
			<!-- <tr style="display:none;">
				<td height="50" colspan="2">&nbsp;</td>
			</tr>   
			<tr style="display:none;">
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0022.jpg" width="770" height="50" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">	  
					<tr>
						<td><img src="/image/text_0085.png" /></td>
						<td height="40">
							<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
								<option value="">지역</option>
							<%
								If IsArray(arrLocal) Then 
									For num = 0 To UBound(arrLocal,2)
							%>
								<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
							<%
									Next 
								End If 
							%>
							</select>
							<select id="part" name="part" class="textarea" style="height:35px;">
								<option value="">지점선택</option>
							</select>
						</td>
					</tr>

					<tr>
						<td width="74"><img src="/image/text_0018.jpg" width="74" height="20" /></td>
						<td width="546"><label>
							<select name="childbirth_y" class="textarea" style="height:35px;">
								<option value="">년</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="childbirth_m" class="textarea" style="height:35px;">
								<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
							<select name="childbirth_d" class="textarea" style="height:35px;">
								<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	  	  
					<tr>
						<td><img src="/image/text_0019.jpg" width="74" height="20" /></td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="초산" />초산&nbsp;&nbsp;
							<input type="radio" name="radio3" value="1명" />1명&nbsp;&nbsp;
							<input type="radio" name="radio3" value="2명이상" />2명이상
						</label></td>
					</tr>	  	  	    	  
					<tr>
						<td><img src="/image/text_0020.jpg" width="74" height="20" /></td>
						<td height="40">
						<label>
							<input type="radio" name="radio4" value="바우처" />바우처&nbsp;&nbsp;
							<input type="radio" name="radio4" value="일반" />일반 
						</label></td>
					</tr>
					</table>
				</td>	
			</tr> -->
			</form>
			<tr>
				<td colspan="2" style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
						<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onClick="location.reload();" style="cursor:pointer;"/>
					</div>
				</td>	
			</tr>    
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>

<form id="soFrm" name="soFrm" target="ifrm" method="post" action="/common/inc/sms_send.asp">
<input type="hidden" name="action" value="go">
<input type="hidden" name="type" value="join">
<input type="hidden" name="testflag" value="N">
<input type="hidden" name="rphone" value="">
</form>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var hp = "";
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSms = jQuery("#btnSms");
	var btnSmsCheck = jQuery("#btnSmsCheck");
	var btnSubmit = jQuery("#btnSubmit");
	var btnIdCheck = jQuery("#btnIdCheck");

	$(document).ready(function() {
		$("#agree1View").click(function() {
			$("#agree1Txt").show();
			$("#agree2Txt").hide();
			$("#agree3Txt").hide();
		}).css("cursor", "pointer");

		$("#agree2View").click(function() {
			$("#agree1Txt").hide();
			$("#agree2Txt").show();
			$("#agree3Txt").hide();
		}).css("cursor", "pointer");

		$("#agree3View").click(function() {
			$("#agree1Txt").hide();
			$("#agree2Txt").hide();
			$("#agree3Txt").show();
		}).css("cursor", "pointer");

		$(".agree3:eq(1)").click(function() {
			alert("제 3자 정보 제공에 동의하지 않으시면 마케팅 정보 서비스를 받으실 수 없습니다.");
		});

		$("#agree4").click(function() {
			if ($(this).is(":checked")) {
				$(".agree1:eq(0)").prop("checked", true);
				$(".agree2:eq(0)").prop("checked", true);
				$(".agree3:eq(0)").prop("checked", true);
			} else {
				$(".agree1:eq(0)").prop("checked", false);
				$(".agree2:eq(0)").prop("checked", false);
				$(".agree3:eq(0)").prop("checked", false);
			}
		});
	});
 
	btnSmsCheck.click(function(){
		cert_num = jQuery("#cert_num").val();
		if (cert_num == ""){
			alert("인증번호를 입력해 주세요");
			return false;
		}else{
			jQuery.post("/common/inc/sms_check.asp",{"cert_num":cert_num,"hp":hp},function(data,testStatus){
				switch(data) {
					case("1") :
						alert('인증번호를 입력해 주세요');
					break;
					case("2") :
						alert('인증받을 핸드폰 번호를 입력해 주세요');
					break;
					case("3") :
						alert('인증 되었습니다.');
						jQuery("#smsCheck").val("Y");
					break;
					case("4") :
						alert('인증번호를 다시 확인해 주세요');
					break;
				}
			});
		}
	});

	btnSms.click(function(){
		hp_1 = jQuery("#hp_1").val();
		hp_2 = jQuery("#hp_2").val();
		hp_3 = jQuery("#hp_3").val();
		hp = hp_1 +"-"+ hp_2 +"-"+ hp_3

		if (hp_1 == "" || hp_2 == "" || hp_3 == "" ){
			alert("인증받을 핸드폰 번호를 입력해 주세요");
			return false;
		}else{
			jQuery("#soFrm").children("input").eq(3).val(hp);
			jQuery("#soFrm").submit();
		}
	});

	btnIdCheck.click(function(){
		var id = jQuery("#mem_id").val();
		if (!check_info(id,"아이디")){ return false }

		jQuery.post("/common/inc/check_id_ax.asp",{"mem_id":id},function(data,testStatus){
			switch(data) {
				case("1") :
					alert('사용하실 아이디를 입력해 주세요.');
				break;
				case("2") :
					alert('이미 등록된 아이디 입니다.');
				break;
				case("3") :
					alert('사용 가능한 아이디 입니다.');
					jQuery("#idCheck").val("Y");
				break;
			}
		});
	});

	btnSubmit.click(function(){
		var agree1 = $("input[type=radio][name=agree1]:checked").val();

		if (agree1 == undefined || agree1 == "N") {
			alert("서비스 이용약관에 동의해 주세요.");
			$("agree1").focus();
			return false;
		}

		var agree2 = $("input[type=radio][name=agree2]:checked").val();

		if (agree2 == undefined || agree2 == "N") {
			alert("개인정보 취급방침에 동의해 주세요.");
			$("agree2").focus();
			return false;
		}

		var id = jQuery("#mem_id").val();
		if (!check_info(id,"아이디")){ return false }

		val = jQuery("#idCheck").val();
		if (val != "Y"){
			alert("아이디 중복체크를 해 주세요.");
			return false;
		}

		var pw = jQuery("#mem_pw").val();
		if (!check_info(pw,"패스워드")){ return false }

		mem_pw = jQuery("#mem_pw").val();
		mem_pw_check = jQuery("#mem_pw_check").val();
		if (mem_pw != mem_pw_check){
			alert('비밀번호를 다시 확인해 주세요');
			return false;
		}

		val = jQuery("#smsCheck").val();
		if (val != "Y"){
			alert("핸드폰 인증을 해 주세요.");
			return false;
		}

		if  (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_sql.asp"
	});


	function check_info(input,t) {

		if (input.length < 1 ){ alert("사용하실 "+ t +"를 입력해 주세요."); return false; }
		
		var err_cnt = 0
		for (var i = 0; i < input.length; i++) {
			var val = input.charAt(i);
			if (!((val >= "0" && val <= "9") || (val >= "a" && val <= "z") || (val >= "A" && val <= "Z")))
				err_cnt++
		}
		if (err_cnt == 0){
			if (input.length < 6) { alert(""+ t +"를 6자이상 입력하세요"); return false; }
			return true;
		}else{
			alert(""+ t +"는 영문, 숫자만 사용해주세요.");
			return false;
		}
	}

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


<script type="text/javascript"> 

	function Input_Add_3(num){
 
		var frm_id = document.getElementById("oFrm");
		var frm = document.oFrm;
 
		var add_hp_chk3 = document.getElementById("add_hp_chk3"); 
 
		var phone_1 = frm.phone_1.value;
		var phone_2 = frm.phone_2.value;
		var phone_3 = frm.phone_3.value;

		var hp_1 = frm.hp_1.value;
		var hp_2 = frm.hp_2.value;
		var hp_3 = frm.hp_3.value;
	 
		 
	if (add_hp_chk3.value  == "3"){
		//집전화
		jQuery("#add_hp_1").val(phone_1);
		jQuery("#add_hp_2").val(phone_2);
		jQuery("#add_hp_3").val(phone_3);
	} else if (add_hp_chk2.value  == "2"){
		//핸드폰
		jQuery("#add_hp_1").val(hp_1);
		jQuery("#add_hp_2").val(hp_2);
		jQuery("#add_hp_3").val(hp_3);
	}else{
		jQuery("#add_hp_1").val(null);
		jQuery("#add_hp_2").val(null);
		jQuery("#add_hp_3").val(null);
	}
}

	function Input_Add_2(){
 
		var frm_id = document.getElementById("oFrm");
		var frm = document.oFrm;
		var add_hp_chk2 = document.getElementById("add_hp_chk2"); 
 
		var phone_1 = frm.phone_1.value;
		var phone_2 = frm.phone_2.value;
		var phone_3 = frm.phone_3.value;

		var hp_1 = frm.hp_1.value;
		var hp_2 = frm.hp_2.value;
		var hp_3 = frm.hp_3.value;
	 
		 
	if (add_hp_chk2.value  == "3"){
		//집전화

		jQuery("#add_hp_1").val(phone_1);
		jQuery("#add_hp_2").val(phone_2);
		jQuery("#add_hp_3").val(phone_3);
	} else if (add_hp_chk2.value  == "2"){
		//핸드폰
		jQuery("#add_hp_1").val(hp_1);
		jQuery("#add_hp_2").val(hp_2);
		jQuery("#add_hp_3").val(hp_3);
	}else{
		jQuery("#add_hp_1").val(null);
		jQuery("#add_hp_2").val(null);
		jQuery("#add_hp_3").val(null);
	}
}

	function Input_Add_1(){
 
		var frm_id = document.getElementById("oFrm");
		var frm = document.oFrm;
		var add_hp_chk1 = document.getElementById("add_hp_chk1"); 
 
		var phone_1 = frm.phone_1.value;
		var phone_2 = frm.phone_2.value;
		var phone_3 = frm.phone_3.value;
		var hp_1 = frm.hp_1.value;
		var hp_2 = frm.hp_2.value;
		var hp_3 = frm.hp_3.value;
	 
	if (add_hp_chk1.value  == "3"){
		//집전화
		jQuery("#add_hp_1").val(phone_1);
		jQuery("#add_hp_2").val(phone_2);
		jQuery("#add_hp_3").val(phone_3);
	} else if (add_hp_chk1.value  == "2"){
		//핸드폰
		jQuery("#add_hp_1").val(hp_1);
		jQuery("#add_hp_2").val(hp_2);
		jQuery("#add_hp_3").val(hp_3);
	}else{
		jQuery("#add_hp_1").val(null);
		jQuery("#add_hp_2").val(null);
		jQuery("#add_hp_3").val(null);
	}
}



 
// 체크박스가 하나만 선택되도록 하는 함수.
function fn_onlyOneChk(groupName)
{
    var chk = $('[data-group="'+ groupName +'"]').find('input[type="checkbox"]');
 
    chk.click(function(){
         if($(this).is(':checked'))
         {
              chk.not(this).prop('checked', false);
         }
    });
}
 


 $(document).ready(function() {
    fn_onlyOneChk('add_ph');
});
 
 /*


<div data-group="food">
    <input type="checkbox" id="food_a" name="food_a" value="A">
    <label for="food_a">A 음식</label>
    <input type="checkbox" id="food_b" name="food_b" value="B">
    <label for="food_b">B 음식</label>
    <input type="checkbox" id="food_c" name="food_c" value="C">
    <label for="food_c">C 음식</label>
</div>
 




 */




</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#post_btn").click(function() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if(data.userSelectedType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					//$("#post").val(data.zonecode); //5자리 새우편번호 사용
					$("#post").val(data.postcode);
					$("#address1").val(fullAddr);

					// 커서를 상세주소 필드로 이동한다.
					$("#address2").val("");
					$("#address2").focus();
				}
			}).open();
		});
	});
</script>
</html>
