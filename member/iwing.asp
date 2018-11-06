 <!--#include virtual="/common/menu/head_iwing.asp"-->

			<body>	
				<table>
					<tr>
						<form id="oFrm" name="oFrm" method="post">
						<br><br>
						<td width="74">아이디 </td>
						<td width=""><label>
							<input type="text" id="mem_id" name="mem_id" style="width:198px;" placeholder="이메일로 입력해주세요" class="textarea" size="19" maxlength="200" style="ime-mode:disabled;" />
						</label>
					    <img src="/image/bt_0027.jpg"width="123" height="37" border="0" align="absmiddle" id="btnIdCheck" style="cursor:pointer;"/>
						</td>
					</tr>
					<tr>
						<td>비밀번호 </td>
						<td><label>
							<input type="password" id="pwd" name="pwd" class="textarea" style="width:325px;" size="35" maxlength="15" style="ime-mode:disabled;" valid="E|M=10|T=패스워드|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td style="width:100px;">비밀번호 확인</td>
						<td><label>
							<input type="password" id="pwd_check" name="pwd_check" style="width:325px;" class="textarea" size="35" maxlength="15" style="ime-mode:disabled;" valid="E|M=10|T=패스워드 확인|A=패스워드 확인을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><label>
							<input type="text" id="nickname" name="nickname" style="width:325px;" class="textarea" maxlength="10" size="35" valid="E|M=10|T=별명|A=별명을 입력해 주세요"/>
						</label></td>
					</tr>	
   					<tr>
						<td>생년월일</td>
						<td><label>
							<select name="Ybirth" id="Ybirth" class="textarea" style="height:35px;width:77px;" valid="E|A=생년월일을 선택해 주세요">
								<option value=""> 년 </option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="Mbirth" id="Mbirth" class="textarea" style="height:35px;width:96px;" valid="E|A=생년월일을 선택해 주세요">
								<option value=""> 월 </option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>월</option>
							<% Next %>
							</select>
							<select name="Dbirth" id="Dbirth" class="textarea" style="height:35px;width:96px;" valid="E|A=생년월일을 선택해 주세요">
								<option value=""> 일 </option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>일</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	  	  	    	  
					<tr style="height:35px;">
						<td>전화번호</td>
						<td><label>
								<select id="hp_1" name="hp_1" class="textarea" style="height:35px;width:77px;" valid="E|A=핸드폰번호를 선택해 주세요">
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
							<input type="text" id="hp_2" name="hp_2" style="height:28px;width:75px;" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" id="hp_3" name="hp_3" style="height:28px;width:75px;" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
			</form>
			<tr>
				<td colspan="2" style="padding-top:30px; padding-bottom:50px;">
					<div align="center"><br><br>
						<img src="/image/iwing_btn_02.png"  border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
						<!--img src="/image/bt_0002.jpg" width="150" height="40" border="0" onClick="location.reload();" style="cursor:pointer;"/-->
					</div>
				</td>	
			</tr>    
			</table>
		</td>
	</tr>
	</table>
 
</body>

<form id="soFrm" name="soFrm" target="ifrm" method="post" action="">
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
 
	var btnSubmit = jQuery("#btnSubmit");
	var btnIdCheck = jQuery("#btnIdCheck");
	var btnIdCert = jQuery("#btnIdCert");


		btnIdCheck.click(function(){
		var id = jQuery("#mem_id").val();

		 
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
  

		if(regex.test(id) === false) {  
			alert("잘못된 이메일 형식입니다.");
			return false;  
		} else {  
			//alert('ok');
		}  
		 
		
		if (id == ""){
			alert("ID를 입력해주세요.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_check.asp",{"proc_type":'checkUserId',"user_id":id},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('등록가능합니다.');
					break;
					case("1000") :
						alert('중복된 아이디 입니다.');
						return false;
					break;
					case("1001") :
						alert('데이터를 정확히 입력해주세요.');
						return false;
					break;
					case("9999") :
						alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
						return false;
					break;
				}
			});
		}
	});


		btnIdCert.click(function(){
 
 
			var cert_id = jQuery("#cert_id").val();
			var pwd2 = jQuery("#pwd2").val();
 
/*

		proc_type	confirmUser	수행명(고정값)
		user_id	입력값	아이디(이메일주소)
		pwd	입력값	비밀번호
		pn_mem_id	mBaby	파트너 아이디(고정값)

		0000	인증완료(캐시지급)
		1001	필수 파라미터 값이 없을경우
		1002	아이디 혹은 비밀번호 오류
		1003	이미 인증을 받아 캐시를 지급받은 경우
		9999	처리중 오류발생
*/
		if (cert_id == ""){
			alert("ID를 입력해주세요.");
			return false;
		}
		
		if(pwd2 == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_cert_check.asp",{"proc_type":'confirmUser',"user_id":cert_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('인증이 완료되었습니다.');
					break;
					case("1001") :
						alert('데이터를 정확히 입력해주세요.');
						return false;
					break;
					case("1002") :
						alert('아이디 혹은 비밀번호를 제대로 입력해주세요');
						return false;
					break;
					case("1003") :
						alert('이미 인증을 받은 아이디입니다.');
						return false;
					break;
					case("9999") :
						alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
						return false;
					break;
				}
			});
		}
	});

  





		btnSubmit.click(function(){
			var id1 = jQuery("#mem_id").val();
			var pwd = jQuery("#pwd").val();
			var nickname = jQuery("#nickname").val();
			var hp_1 = jQuery("#hp_1").val();
			var hp_2 = jQuery("#hp_2").val();
			var hp_3 = jQuery("#hp_3").val();

			var hp_num = hp_1 + hp_2 + hp_3;
 
			var cert_id = jQuery("#cert_id").val();
			var pwd2 = jQuery("#pwd2").val();


			var Ybirth = jQuery("#Ybirth").val();
			var Mbirth = jQuery("#Mbirth").val();
			var Dbirth = jQuery("#Dbirth").val();
 
/*

		proc_type	insertUser	수행명(고정값)
		user_id	입력값	아이디(이메일주소)
		pwd	입력값	비밀번호(6~15자리 영문및숫자구성)
		nickname	입력값	닉네임(10자리)
		birthday	입력값	생년월일(숫자 8자리)
		phone	입력값	전화번호(숫자만입력)
		pn_mem_id	mBaby	파트너 아이디(고정값)

		회원가입완료
		중복된 아이디일 경우
		필수 파라미터 값이 없을경우
		처리중 오류발생

	
*/
		var email = jQuery("#mem_id").val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
  

		if(regex.test(email) === false) {  
			alert("잘못된 이메일 형식입니다.");
			return false;  
		} else {  
			//alert('ok');
		}  
				 

		mem_pw = jQuery("#pwd").val();
		mem_pw_check = jQuery("#pwd_check").val();
		if (mem_pw != mem_pw_check){
			alert('비밀번호를 다시 확인해 주세요');
			return false;
		}
		if (id1 == ""){
			alert("ID를 입력해주세요.");
			return false;
		}
		if (pwd == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if (pwd2 == ""){
			alert("비밀번호를 재입력 해주세요.");
			return false;
		}
		if (nickname == ""){
			alert("닉네임을 입력해주세요.");
			return false;
		}
		if (Ybirth == ""){
			alert("생년을 입력해주세요.");
			return false;
		}
		if (Mbirth == ""){
			alert("월을 입력해주세요.");
			return false;
		}
		if (Dbirth == ""){
			alert("일을 입력해주세요.");
			return false;
		}
		if (hp_1 == ""){
			alert("핸드폰번호를 입력해주세요.");
			return false;
		}
		if (hp_2 == ""){
			alert("핸드폰번호를 입력해주세요.");
			return false;
		}
		if (hp_3 == ""){
			alert("핸드폰번호를 입력해주세요.");
			return false;
		}

		if (id1 == ""){
			alert("ID를 입력해주세요.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_join_check.asp",{"proc_type":'insertUser',"user_id":id1,"pwd":pwd,"nickname":nickname,"Ybirth":Ybirth,"Mbirth":Mbirth,"Dbirth":Dbirth,"phone":hp_num,"pn_mem_id":"mBaby"},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('회원가입이 완료되었습니다.');
						self.close();
					break;
					case("1000") :
						alert('중복된 아이디 입니다.');
						return false;
					break;
					case("1001") :
						alert('데이터를 정확히 입력해주세요.');
						return false;
					break;
					case("9999") :
						alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
						return false;
					break;
				}
			});
		}
	});

  
/*
	btnSubmit.click(function(){

		var id1 = jQuery("#mem_id").val();
		var pwd = jQuery("#pwd").val();
		var nickname = jQuery("#nickname").val();
		var hp_1 = jQuery("#hp_1").val();
		var hp_2 = jQuery("#hp_2").val();
		var hp_3 = jQuery("#hp_3").val();

		var hp_num = hp_1 + hp_2 + hp_3;
	//	var birth  = ;

 
 
 

		var pw = jQuery("#pwd").val();
		if (!check_info(pw,"패스워드")){ return false }

		mem_pw = jQuery("#pwd").val();
		mem_pw_check = jQuery("#pwd_check").val();
		if (mem_pw != mem_pw_check){
			alert('비밀번호를 다시 확인해 주세요');
			return false;
		}

 

		if  (!checkForm(frm,tar)){ return false }
		frm.submit();
	});


	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : ""
	});

 */
</script>

 
 
</html>
