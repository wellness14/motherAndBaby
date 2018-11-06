<!--#include virtual="/common/menu/head.asp"-->
<%

	check_seq = fncRequest("check_seq")    
	%>
 
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


If check_seq <> "" Then 
		strTable = " FROM MO_MEM_NO_JOIN WITH(NOLOCK) "
		strTable = strTable & "  "
		strWhere = " WHERE MD_MEM_SEQ = '"& check_seq &"'"

		strSql = ""
		strSql = strSql & "	SELECT "
		strSql = strSql & "			MD_MEM_NAME "
		strSql = strSql & "			,MD_PHONE "
		strSql = strSql & "			,MD_HP "
		strSql = strSql & "			,MD_SEX  "
		strSql = strSql & "			,MD_BIRTH  "
		strSql = strSql & "			,MD_POST  "
		strSql = strSql & "			,MD_ADDR1  "
		strSql = strSql & "			,MD_ADDR2  "
		strSql = strSql & "			,MD_EMAIL  "
		strSql = strSql & "			,MD_SNS_FLG  "
		strSql = strSql & "			,MD_EMAIL_FLG  "
		strSql = strSql & "			,MD_LOCAL  "
		strSql = strSql & "			,MD_CHILDBIRTH  "
		strSql = strSql & "			,MD_CHILD_FLG  "
		strSql = strSql & "			,MD_TYPE  "
		strSql = strSql & "			,MD_HP_ADD  "
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
			<input type="hidden" id="smsCheck" name="smsCheck" value="Y">
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
							<input type="hidden" name="mem_nm" value="<%=arrList(0,0)%>" />
							<input type="hidden" name="radio1" value="<%=arrList(3,0)%>" /> <!-- 성별 --> 

<%
					Mbirth = Mid(arrList(4,0),5,2)
					If Mbirth <> "" Then 
					If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
					Dbirth = Right(arrList(4,0),2)
					If Dbirth < 10 Then Dbirth = Right(Dbirth,1)
%>

							<input type="hidden" name="Ybirth" value="<%=Left(arrList(4,0),4)%>" />
							<input type="hidden" name="Mbirth" value="<%=Mbirth%>" />
							<input type="hidden" name="Dbirth" value="<%=Dbirth%>" />

<%
	End If
%>


				<%
					arrPhone = Split(arrList(1,0),"-")
				%>
							<input type="hidden" name="phone_1" value="<%=arrPhone(0)%>" />
							<input type="hidden" name="phone_2" value="<%=arrPhone(1)%>" />
							<input type="hidden" name="phone_3" value="<%=arrPhone(2)%>" />
				<%
					arrHp = Split(arrList(2,0),"-")
				%>
							<input type="hidden" name="hp_1" value="<%=arrHp(0)%>" />
							<input type="hidden" name="hp_2" value="<%=arrHp(1)%>" />
							<input type="hidden" name="hp_3" value="<%=arrHp(2)%>" />

							<input type="hidden" name="check3" value="<%=arrList(9,0)%>"/>

							<input type="hidden" name="add_hp_1" value="" />
							<input type="hidden" name="add_hp_2" value="" />
							<input type="hidden" name="add_hp_3" value="" />

							<input type="hidden" name="post_1" value="<%=Left(arrList(5,0),3)%>" />
							<input type="hidden" name="post_2" value="<%=Right(arrList(5,0),3)%>" />

							<input type="hidden" name="addr_1" value="<%=arrList(6,0)%>" />
							<input type="hidden" name="addr_2" value="<%=arrList(7,0)%>" />

							<input type="hidden" name="email" value="<%=arrList(8,0)%>" />
							<input type="hidden" name="check4" value="<%=arrList(10,0)%>"/>

							<input type="hidden" name="part" value="<%=arrList(11,0)%>" />


<%
					Mchildbirth = Mid(arrList(12,0),5,2)
					If Mchildbirth <> "" Then 
					If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
					Dchildbirth = Right(arrList(12,0),2)
					If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
%>
							<input type="hidden" name="childbirth_y" value="<%=Left(arrList(12,0),4)%>" />
							<input type="hidden" name="childbirth_m" value="<%=Mchildbirth%>" />
							<input type="hidden" name="childbirth_d" value="<%=Dchildbirth%>" />
							<input type="hidden" name="radio3" value="<%=arrList(13,0)%>" /><!-- 초산 등등 -->
							<input type="hidden" name="radio4" value="<%=arrList(14,0)%>" /><!--바우처 일반 -->
<%
		End If
%>
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
</html>
