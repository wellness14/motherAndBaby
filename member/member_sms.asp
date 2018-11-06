<!--#include virtual="/common/menu/head.asp"-->
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
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<tr>
				<td width="400" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0005.jpg" width="78" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./service.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check1" value="Y" />
					</label>
					위의 약관에 동의합니다.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include file="./info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check2" value="Y" />
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
							<input type="text" name="mem_id" class="textarea" size="19" valid="E|M=10|T=아이디|A=아이디를 입력해 주세요"/>
						</label>
					    <a href="#"><img src="/image/bt_0027.jpg" border="0" align="absmiddle" /></a>
						<img src="/image/text_0021.jpg" width="241" height="20" align="absmiddle" /></td>
					</tr>
					<tr>
						<td><img src="/image/text_0009.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="35" valid="E|M=10|T=패스워드|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0010.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="35" valid="E|M=10|T=패스워드 확인|A=패스워드 확인을 입력해 주세요"/>
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
							<% For num=Year(Date()) To Year(DateAdd("yyyy",-40,Date())) Step -1 %>
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
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;<a href="#"><img src="/image/bt_0028.jpg" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/></a>
							<input type="checkbox" name="check3" value="Y" />SMS 수신동의		
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="111" class="textarea" size="23" valid="111"/>&nbsp;&nbsp;
						    <a href="#"><img src="/image/bt_0029.jpg" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/></a></label></td>
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
								<option value="<%=num%>"><%=num%>월</option>
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
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }

		mem_pw = jQuery("#mem_pw").val();
		mem_pw_check = jQuery("#mem_pw_check").val();
		if (mem_pw != mem_pw_check){
			alert('비밀번호를 다시 확인해 주세요');
			return false;
		}

		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_sql.asp"
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
</html>
