<!--#include virtual="/common/menu/head.asp"-->
<%
	If uId = "" Then 
		Response.Redirect "/member/login.asp?mOne=6&mTwo=1"
	End If 

	If uId <> "" Then 
		strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE MM_DEL_DT IS NULL AND  MD_MEM_ID = '"& uId &"'"

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "			MM_MEM_ID "
		strSql = strSql & "			,MM_MEM_NM "
		strSql = strSql & "			,MM_ENT_DT "
		strSql = strSql & "			,MD_PHONE "
		strSql = strSql & "			,MD_HP "
		strSql = strSql & "			,MD_SEX "
		strSql = strSql & "			,MD_BIRTH "
		strSql = strSql & "			,MD_POST "
		strSql = strSql & "			,MD_ADDR1 "
		strSql = strSql & "			,MD_ADDR2 "
		strSql = strSql & "			,MD_EMAIL "
		strSql = strSql & "			,MD_SNS_FLG "
		strSql = strSql & "			,MD_EMAIL_FLG "
		strSql = strSql & "			,MD_CHILDBIRTH "
		strSql = strSql & "			,MD_CHILD_FLG "
		strSql = strSql & "			,MD_TYPE "
		strSql = strSql & "			,MD_LOCAL "
		strSql = strSql & "			,MD_HP_ADD "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		Else 
			response.Write "<script type='text/javascript'>alert('회원정보가 올바르지 않습니다.');location.href='http://mothernbaby.co.kr';</script>"
			response.End 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='http://mothernbaby.co.kr';</script>"
		response.End 
	End If 

'-----------------------------------------------------------------------------
'	지점 정보 호출
	md_local = arrList(16,0)
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_nm = Rs(0)
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

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
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="770" style="padding-top:40px;"><img src="/image/sub06_subtitle05.jpg" width="770" height="41" /></td>
			</tr>
			<tr>
				<td width="770" height="40"><spacer type="block"></td>
			</tr>  
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="upd">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<input type="hidden" name="mem_id" value="<%=uId%>">
			<tr>
				<td bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0007.jpg" width="770" height="49" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><img src="/image/text_0008.jpg" width="74" height="20" /></td>
						<td width="546" height="35" style="font-size:15px; font-weight:bold; color:#000000;"><%=uId%></td>
					</tr>
					<tr>
						<td><img src="/image/text_0032.jpg" width="72" height="14" /></td>
						<td><label>
							<input type="password" name="mem_old_pw" class="textarea" size="35" valid="E|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0033.jpg" width="73" height="14" /></td>
						<td><label>
							<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="35" style="ime-mode:disabled;"/>
						</label></td>
					</tr>	  
					<tr>
						<td><img src="/image/text_0010.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="35" style="ime-mode:disabled;"/>
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0011.jpg" width="74" height="20" /></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%=arrList(1,0)%></span></label></td>
					</tr>	
					<tr>
						<td><img src="/image/text_0012.jpg" width="74" height="20" /></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%If arrList(5,0) = 1 Then%>남자<%Else%>여자<%End If%></span></label></td>
					</tr>	  
					<tr>
						<td><img src="/image/text_0013.jpg" width="74" height="20" /></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%=Left(arrList(6,0),4)%>년 <%=Mid(arrList(6,0),5,2)%>월 <%=Right(arrList(6,0),2)%>일</span></label></td>
					</tr>	  	  
					<tr>
						<td><img src="/image/text_0014.jpg" width="74" height="20" /></td>
						<td><label>
						<%
							arrPhone = Split(arrList(3,0),"-")
						%>
								<select name="phone_1" class="textarea" style="height:35px;" valid="E|A=전화번호를 선택해 주세요">
									<option value="">선택</option>
									<option value="02" <%=fncSetSelectBox("02",arrPhone(0))%>>02</option>
									<option value="031" <%=fncSetSelectBox("031",arrPhone(0))%>>031</option>
									<option value="032" <%=fncSetSelectBox("032",arrPhone(0))%>>032</option>
									<option value="033" <%=fncSetSelectBox("033",arrPhone(0))%>>033</option>
									<option value="041" <%=fncSetSelectBox("041",arrPhone(0))%>>041</option>
									<option value="042" <%=fncSetSelectBox("042",arrPhone(0))%>>042</option>
									<option value="043" <%=fncSetSelectBox("043",arrPhone(0))%>>043</option>
									<option value="051" <%=fncSetSelectBox("051",arrPhone(0))%>>051</option>
									<option value="052" <%=fncSetSelectBox("052",arrPhone(0))%>>052</option>
									<option value="053" <%=fncSetSelectBox("053",arrPhone(0))%>>053</option>
									<option value="054" <%=fncSetSelectBox("054",arrPhone(0))%>>054</option>
									<option value="055" <%=fncSetSelectBox("055",arrPhone(0))%>>055</option>
									<option value="061" <%=fncSetSelectBox("061",arrPhone(0))%>>061</option>
									<option value="062" <%=fncSetSelectBox("062",arrPhone(0))%>>062</option>
									<option value="063" <%=fncSetSelectBox("063",arrPhone(0))%>>063</option>
									<option value="064" <%=fncSetSelectBox("064",arrPhone(0))%>>064</option>
									<option value="070" <%=fncSetSelectBox("070",arrPhone(0))%>>070</option>
								</select>
							</label>
							-
							<input type="text" name="phone_2" class="textarea" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=전화번호를 입력해 주세요"/>
							-
							<input type="text" name="phone_3" class="textarea" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=전화번호를 입력해 주세요"/>   
						</td>
					</tr>	  	  	    	  
					<tr>
						<td><img src="/image/text_0015.jpg" width="74" height="20" /></td>
						<td><label>
						<%
							arrHp = Split(arrList(4,0),"-")
						%>
							<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
								<option value="">선택</option>
								<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
								<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
								<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
								<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
								<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
								<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
							</select>
						</label>
						-
						<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
						-
						<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;
						<input type="checkbox" name="check3" value="Y" <%=fncSetCheckBox("Y",arrList(11,0))%>/>SMS 수신동의		
					</td>
				</tr>
				<tr>
						<td><img src="/image/text_0015_02.jpg" width="74" height="20" /></td>
						<td><label>
						<%
							add_arrHp = Split(arrList(17,0),"-")
						%>
							<select name="add_hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
								<option value="">선택</option>
								<option value="02" <%=fncSetSelectBox("02",add_arrHp(0))%>>02</option>
								<option value="031" <%=fncSetSelectBox("031",add_arrHp(0))%>>031</option>
								<option value="032" <%=fncSetSelectBox("032",add_arrHp(0))%>>032</option>
								<option value="033" <%=fncSetSelectBox("033",add_arrHp(0))%>>033</option>
								<option value="041" <%=fncSetSelectBox("041",add_arrHp(0))%>>041</option>
								<option value="042" <%=fncSetSelectBox("042",add_arrHp(0))%>>042</option>
								<option value="043" <%=fncSetSelectBox("043",add_arrHp(0))%>>043</option>
								<option value="051" <%=fncSetSelectBox("051",add_arrHp(0))%>>051</option>
								<option value="052" <%=fncSetSelectBox("052",add_arrHp(0))%>>052</option>
								<option value="053" <%=fncSetSelectBox("053",add_arrHp(0))%>>053</option>
								<option value="054" <%=fncSetSelectBox("054",add_arrHp(0))%>>054</option>
								<option value="055" <%=fncSetSelectBox("055",add_arrHp(0))%>>055</option>
								<option value="061" <%=fncSetSelectBox("061",add_arrHp(0))%>>061</option>
								<option value="062" <%=fncSetSelectBox("062",add_arrHp(0))%>>062</option>
								<option value="063" <%=fncSetSelectBox("063",add_arrHp(0))%>>063</option>
								<option value="064" <%=fncSetSelectBox("064",add_arrHp(0))%>>064</option>
								<option value="070" <%=fncSetSelectBox("070",add_arrHp(0))%>>070</option>
								<option value="010" <%=fncSetSelectBox("010",add_arrHp(0))%>>010</option>
								<option value="011" <%=fncSetSelectBox("011",add_arrHp(0))%>>011</option>
								<option value="016" <%=fncSetSelectBox("016",add_arrHp(0))%>>016</option>
								<option value="017" <%=fncSetSelectBox("017",add_arrHp(0))%>>017</option>
								<option value="018" <%=fncSetSelectBox("018",add_arrHp(0))%>>018</option>
								<option value="019" <%=fncSetSelectBox("019",add_arrHp(0))%>>019</option>
							</select>
						</label>
						-
						<input type="text" name="add_hp_2" class="textarea" size="5" maxlength="4" value="<%=add_arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
						-
						<input type="text" name="add_hp_3" class="textarea" size="5" maxlength="4" value="<%=add_arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;
						 
					</td>
				</tr>
				<tr>
					<td><img src="/image/text_0016.jpg" width="74" height="20" /></td>
					<td>
						<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(7,0),3)%>" readonly valid="E|A=우편번호를 입력해 주세요"/>
						-
						<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(7,0),3)%>" readonly valid="E|A=우편번호를 입력해 주세요"/>
						&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onclick="fncOpenZip();" style="cursor:pointer;"/>
					</td>
				</tr>	
				<tr>
					<td>&nbsp;</td>
					<td><label>
						<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" value="<%=arrList(8,0)%>" onclick="fncOpenZip();" readonly valid="E|A=주소를 입력해 주세요"/>
					</label></td>
				</tr>	
				<tr>
					<td>&nbsp;</td>
					<td><label>
						<input type="text" name="addr_2" class="textarea" size="35" value="<%=arrList(9,0)%>" valid="E|A=상세주소를 입력해 주세요"/>&nbsp;&nbsp;
					</label></td>
				</tr>	
				<tr>
					<td><img src="/image/text_0017.jpg" width="74" height="20" /></td>
					<td><label>
						<input type="text" name="email" class="textarea" size="35" value="<%=arrList(10,0)%>" valid="E|A=이메일 주소를 입력해 주세요"/>&nbsp;&nbsp;
						<input type="checkbox" name="check4" value="Y" <%=fncSetCheckBox("Y",arrList(12,0))%>/>이메일 수신동의 
					</label></td>
				</tr>
				</table>
			</td>	
		</tr>
		<tr>
			<td height="50">&nbsp;</td>
		</tr>   
		<tr>
			<td bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0022.jpg" width="770" height="50" />
				<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">	  
				<tr>
					<td><img src="/image/text_0085.png" width="74" height="20" /></td>
					<td height="40">
						<select name="local" onchange="fncSetPart(this.value,'');" class="textarea" style="height:35px;">
							<option value="">지역</option>
						<%
							If IsArray(arrLocal) Then 
								For num = 0 To UBound(arrLocal,2)
						%>
							<option value="<%=arrLocal(0,num)%>" <%If local_nm = arrLocal(0,num) Then%>selected<%End If%>><%=arrLocal(0,num)%></option>
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
					<%
						If Trim(arrList(13,0)) <> "" Then 
							Mchildbirth = Mid(arrList(13,0),5,2)
							If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
							Dchildbirth = Right(arrList(13,0),2)
							If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
						End If 
					%>
						<select name="childbirth_y" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">년</option>
						<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(13,0),4))%>><%=num%></option>
						<% Next %>
						</select>
						<select name="childbirth_m" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">월</option>
						<% For num=1 To 12 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>월</option>
						<% Next %>
						</select>
						<select name="childbirth_d" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">일</option>
						<% For num=1 To 31 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>일</option>
						<% Next %>
						</select>
					</label></td>
				</tr>	  	  
				<tr>
					<td><img src="/image/text_0019.jpg" width="74" height="20" /></td>
					<td height="40"><label>
						<input type="radio" name="radio3" value="초산" <%=fncSetCheckBox("초산",arrList(14,0))%>/>초산&nbsp;&nbsp;
						<input type="radio" name="radio3" value="1명" <%=fncSetCheckBox("1명",arrList(14,0))%>/>1명&nbsp;&nbsp;
						<input type="radio" name="radio3" value="2명이상" <%=fncSetCheckBox("2명이상",arrList(14,0))%>/>2명이상
					</label></td>
				</tr>	  	  	    	  
				<tr>
					<td><img src="/image/text_0020.jpg" width="74" height="20" /></td>
					<td height="40">
					<label>
						<input type="radio" name="radio4" value="바우처" <%=fncSetCheckBox("바우처",arrList(15,0))%>/>바우처&nbsp;&nbsp;
						<input type="radio" name="radio4" value="일반" <%=fncSetCheckBox("일반",arrList(15,0))%>/>일반 
					</label></td>
				</tr>
				</table>
			</td>	
		</tr>
		</form>
		<tr>
			<td style="padding-top:30px; padding-bottom:50px;">
				<div align="center">
					<img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
					<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onclick="location.reload();" style="cursor:pointer;"/>
				</div>
			</td>	
		</tr>    
		</table>
	</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
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
			alert('');
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
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>
