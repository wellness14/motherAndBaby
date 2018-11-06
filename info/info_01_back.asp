<!--#include virtual="/common/menu/head.asp"-->
<% 

%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
		<form id="oFrm" name="oFrm" method="post">
		<input type="hidden" name="mode" value="ins">
		<input type="hidden" name="mOne" value="<%=mOne%>">
		<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" style="padding-top:40px;"><img src="/image/sub03_subtitle01.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td colspan="2"><img src="/image/text_0040.jpg" /></td>
			</tr>  
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;">
					<img src="/image/text_0041.jpg" width="770" height="50" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><img src="/image/text_0011.jpg" width="74" height="20" /></td>
						<td width="546"><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=5|T=이름|A=이름을 입력해 주세요"/>
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
						<td>
							<label>
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
						<td>
							<label>
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
						<td><img src="/image/text_0016.jpg" width="74" height="20" /></td>
						<td>
							<input type="text" name="post_1" class="textarea" size="5" maxlength="3" valid="E|A=우편번호를 입력해 주세요"/>
							-
							<input type="text" name="post_2" class="textarea" size="5" maxlength="3" valid="E|A=우편번호를 입력해 주세요"/>
							&nbsp;&nbsp;<a href="#"><img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" /></a>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_1" class="textarea" size="60" valid="E|A=주소를 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=상세주소를 입력해 주세요"/>
							&nbsp;&nbsp;</label>
						</td>
					</tr>
					</table>
				</td>	
			</tr> 
			<tr>
				<td height="50" colspan="2">&nbsp;</td>
			</tr>   
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0042.jpg" width="770" height="50" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">	  
					<tr>
						<td><img src="/image/text_0043.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="checkbox" name="check1" value="베이직" valid="E|A=신청서비스를 선택해 주세요"/>베이직&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="프리미엄" />프리미엄&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="과체중" />과체중&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="35세이상" />35세이상&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="워킹맘" />워킹맘
								<br />
								<input type="checkbox" name="check1" value="산후조리원을 내집" />산후조리원을 내집에&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="상담 후 결정" />상담 후 결정
							</label>
						</td>
					</tr>
					<tr>
						<td><img src="/image/text_0044.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="radio" name="radio1" value="1주" valid="E|A=이용기간을 선택해 주세요"/>1주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="2주" />2주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="3주" />3주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="4주 이상" />4주 이상&nbsp;&nbsp;
								<input type="radio" name="radio1" value="상담 후 결정" />상담 후 결정
							</label>
						</td>
					</tr>
					<tr>
						<td><img src="/image/text_0045.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
							<input type="radio" name="radio2" value="출퇴근" valid="E|A=이용형태를 선택해 주세요"/>출퇴근&nbsp;&nbsp;
							<input type="radio" name="radio2" value="입주" />입주&nbsp;&nbsp;
							<input type="radio" name="radio2" value="상담 후 결정" />상담 후 결정
							</label>
						</td>
					</tr>	  	  	  
					<tr>
						<td width="109"><img src="/image/text_0046.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<select name="childbirth_y" class="textarea" style="height:35px;" valid="E|A=출산예정일을 선택해 주세요">
								<option value="">년</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="childbirth_m" class="textarea" style="height:35px;" valid="E|A=출산예정일을 선택해 주세요">
								<option value="">월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
							<select name="childbirth_d" class="textarea" style="height:35px;" valid="E|A=출산예정일을 선택해 주세요">
								<option value="">일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	 
					<tr>
						<td width="109"><img src="/image/text_0047.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<select name="serviceDt_y" class="textarea" style="height:35px;" valid="E|A=서비스시작 예정일을 선택해 주세요">
								<option>년</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="serviceDt_m" class="textarea" style="height:35px;" valid="E|A=서비스시작 예정일을 선택해 주세요">
								<option>월</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
							<select name="serviceDt_d" class="textarea" style="height:35px;" valid="E|A=서비스시작 예정일을 선택해 주세요">
								<option>일</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	 	   	  
					<tr>
						<td><img src="/image/text_0048.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="이용함" valid="E|A=조리원 이용여부를 선택해 주세요"/>이용함&nbsp;&nbsp;
							<input type="radio" name="radio3" value="이용안함" />이용안함
						</label></td>
					</tr>	  	  	    	  
					<tr>
						<td><img src="/image/text_0049.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="radio" name="radio4" value="초산모" valid="E|A=출산경험을 선택해 주세요"/>초산모&nbsp;&nbsp;
							<input type="radio" name="radio4" value="경산모" />경산모 
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0050.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check2" value="쌍둥이" valid="E|A=특이사항을 선택해 주세요"/>쌍둥이&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="임신성 당뇨" />임신성 당뇨 &nbsp;&nbsp;
							<input type="checkbox" name="check2" value="부종" />부종&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="고혈압" />고혈압
						</label></td>
					</tr>	  
					<tr>
						<td><img src="/image/text_0051.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check3" value="부모님" valid="E|A=가족사항을 선택해 주세요"/>부모님&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="남편" />남편 &nbsp;&nbsp;
							<input type="checkbox" name="check3" value="큰아이 1명" />큰아이 1명&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="큰아이 2명이상" />큰아이 2명이상&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="기타가족" />기타가족
						</label></td>
					</tr>	
					<tr>
						<td><img src="/image/text_0052.jpg" width="103" height="19" /></td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=상담내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>	  	  
					</table>
				</td>	
			</tr>   
			<tr>
				<td width="400" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0005.jpg" width="78" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include virtual="/member/service.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check4" value="Y" valid="E|A=이용약관을 선택해 주세요"/>
					</label>
					위의 약관에 동의합니다.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include virtual="/member/info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check5" value="Y" valid="E|A=개인정보 취급방침을 선택해 주세요"/>
					</label>
					위의 개인정보 수집 및 이용에 동의합니다. 
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/bt_0014.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
						<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onclick="location.reload();" style="cursor:pointer;"/>
					</div>
				</td>	
			</tr>    
			</table>
		</form>
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
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./info_01_sql.asp?<%=strLnkUrl%>"
	});
</script>
</html>
