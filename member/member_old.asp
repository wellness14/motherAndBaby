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
			<tr>
				<td width="400" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0005.jpg" width="78" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./service.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check1" value="Y"/>
					</label>
					위의 약관에 동의합니다.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check2" value="Y"/>
					</label>
						위의 개인정보 수집 및 이용에 동의합니다. 
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
					<tr>
						<td><img src="/image/text_0012.jpg" width="74" height="20" /></td>
						<td height="40"><label>
							<input type="radio" name="radio1" value="2" valid="E|A=성별을 선택해 주세요"/>여자&nbsp;&nbsp;
							<input type="radio" name="radio1" value="1" />남자
						</label></td>
					</tr>	  
					<tr>
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
					<tr>
						<td><img src="/image/text_0014.jpg" width="74" height="20" /></td>
						<td><label>
								<select name="phone_1" class="textarea" style="height:35px;" valid="E|A=전화번호를 선택해 주세요">
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
					</tr>	  	  	    	  
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
							<input type="checkbox" name="check3" value="Y" />SMS 수신동의		
						</td>
					</tr>
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
							<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/>
							-
							<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" readonly valid="E|A=우편번호를 입력해 주세요"/>
							&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" onClick="fncOpenZip();" readonly valid="E|A=주소를 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=상세주소를 입력해 주세요"/>&nbsp;&nbsp;
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0017.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="text" name="email" class="textarea" size="35" valid="E|A=이메일 주소를 입력해 주세요"/>&nbsp;&nbsp;
							<input type="checkbox" name="check4" value="Y" />이메일 수신동의 
						</label></td>
					</tr>
					</table>
				</td>	
			</tr>
			<tr>
				<td height="50" colspan="2">&nbsp;</td>
			</tr>   
			<tr>
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
								<option value="">지점</option>
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
			</tr>
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
					alert('이미 등록되 아이디 입니다.');
				break;
				case("3") :
					alert('사용 가능한 아이디 입니다.');
					jQuery("#idCheck").val("Y");
				break;
			}
		});
	});

	btnSubmit.click(function(){
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
</html>
