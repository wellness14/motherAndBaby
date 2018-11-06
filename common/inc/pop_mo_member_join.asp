<!--#include virtual="/common/menu/head.asp"-->
<%
	  SearchDong = fncRequest("SearchDong")
	  mem_nm		= Trim(fncRequest("mem_nm"))



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
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>

<body>
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><strong><h2>회원등록</h2></strong></td>
	</tr>
 

		<table  class="tb_style02">
			<tr>
				<body>
	 
	<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		 
		<td width="500" valign="top"><table width="500" border="0" align="center" cellpadding="0" cellspacing="0">

			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" id="smsCheck" name="smsCheck" value="N">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">

			<tr>
				<td colspan="2" style="padding-bottom:20px;">
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74"><font style="font-weight: bold;">아이디<font></td>
						<td width="546"><label>
							<input type="text" id="mem_id" name="mem_id" class="textarea" size="19" style="ime-mode:disabled;" valid="E|M=10|T=아이디|A=아이디를 입력해 주세요"/>
						</label>
					    <img src="/image/bt_0027.jpg" border="0" align="absmiddle" id="btnIdCheck" style="cursor:pointer;"/>
						<img src="/image/text_0021.jpg" width="241" height="20" align="absmiddle" />
					</td>
					</tr>
					<tr>
						<td><font style="font-weight: bold;">비밀번호<font></td>
						<td><label>
							<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="35" style="ime-mode:disabled;" valid="E|M=10|T=패스워드|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><font style="font-weight: bold;">비밀번호확인<font></td>
						<td><label>
							<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="35" style="ime-mode:disabled;" valid="E|M=10|T=패스워드 확인|A=패스워드 확인을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td><font style="font-weight: bold;">성명<font></td>
						<td><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=10|T=성명|A=성명을 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td><font style="font-weight: bold;">성별<font></td>
						<td height="40"><label>
							<input type="radio" name="radio1" value="2" valid="E|A=성별을 선택해 주세요"/>여자&nbsp;&nbsp;
							<input type="radio" name="radio1" value="1" />남자
						</label></td>
					</tr>	  
					<tr>
						<td><font style="font-weight: bold;">생년월일<font></td>
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
						<td><font style="font-weight: bold;">전화번호<font></td>
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
					</tr>	  	  	    	  
					<tr>
						<td><font style="font-weight: bold;">핸드폰번호<font></td>
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
							<input type="text" id="hp_3" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/> 
							<input type="checkbox" name="check3" value="Y" />SMS 수신동의		
						</td>
					</tr>
					
					<tr>
						<td><font style="font-weight: bold;">보호자번호<font></td>
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
					</tr>
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
						<td><font style="font-weight: bold;">주소<font></td>
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
							<input type="text" id="addr_1" name="addr_1" class="textarea" size="50" onClick="fncOpenZip();" readonly valid="E|A=주소를 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=상세주소를 입력해 주세요"/>&nbsp;&nbsp;
						</label></td>
					</tr>
					<tr>
						<td><font style="font-weight: bold;">이메일<font></td>
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
				<td colspan="2" style="padding-bottom:20px;"><h1><font style="font-weight: bold;">부가정보<font></h1>
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">	  
					<tr>
						<td><font style="font-weight: bold;">지점선택<font></td>
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
						<td width="74"><font style="font-weight: bold;">분만예정일<font></td>
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
						<td><font style="font-weight: bold;">큰아이여부<font></td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="초산" />초산&nbsp;&nbsp;
							<input type="radio" name="radio3" value="1명" />1명&nbsp;&nbsp;
							<input type="radio" name="radio3" value="2명이상" />2명이상
						</label></td>
					</tr>	  	  	    	  
					<tr>
						<td><font style="font-weight: bold;">산모구분<font></td>
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
					 <p style="margin-left:250px;">
						<input type="button" width="150" height="40" border="0" id="btnSubmit" value=" 확 인 " style="cursor:pointer;"/> &nbsp;&nbsp;
						<input type="button" width="150" height="40" border="0" value=" 취 소 " onClick="location.reload();" style="cursor:pointer;"/>
					 </p>
				</td>	
			</tr>    
			</table>
		</td>
	</tr>
	</table>
 
</body>
			</tr>
 
</table>

<form id="soFrm" name="soFrm" target="ifrm" method="post" action="">
 
</form>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var hp = "";
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");
	var btnIdCheck = jQuery("#btnIdCheck");
 

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

 

		if  (!checkForm(frm,tar)){ return false }
		frm.submit();
		  self.close();

	});



	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "/member/member_join_sql.asp"
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
