 <!--#include virtual="/common/menu/head_iwing.asp"-->

			<body>	
				<table>
					<tr>
						<form id="oFrm" name="oFrm" method="post">
						<br><br>
						<td width="74">���̵� </td>
						<td width=""><label>
							<input type="text" id="mem_id" name="mem_id" style="width:198px;" placeholder="�̸��Ϸ� �Է����ּ���" class="textarea" size="19" maxlength="200" style="ime-mode:disabled;" />
						</label>
					    <img src="/image/bt_0027.jpg"width="123" height="37" border="0" align="absmiddle" id="btnIdCheck" style="cursor:pointer;"/>
						</td>
					</tr>
					<tr>
						<td>��й�ȣ </td>
						<td><label>
							<input type="password" id="pwd" name="pwd" class="textarea" style="width:325px;" size="35" maxlength="15" style="ime-mode:disabled;" valid="E|M=10|T=�н�����|A=�н����带 �Է��� �ּ���"/>
						</label></td>
					</tr>
					<tr>
						<td style="width:100px;">��й�ȣ Ȯ��</td>
						<td><label>
							<input type="password" id="pwd_check" name="pwd_check" style="width:325px;" class="textarea" size="35" maxlength="15" style="ime-mode:disabled;" valid="E|M=10|T=�н����� Ȯ��|A=�н����� Ȯ���� �Է��� �ּ���"/>
						</label></td>
					</tr>
					<tr>
						<td>�г���</td>
						<td><label>
							<input type="text" id="nickname" name="nickname" style="width:325px;" class="textarea" maxlength="10" size="35" valid="E|M=10|T=����|A=������ �Է��� �ּ���"/>
						</label></td>
					</tr>	
   					<tr>
						<td>�������</td>
						<td><label>
							<select name="Ybirth" id="Ybirth" class="textarea" style="height:35px;width:77px;" valid="E|A=��������� ������ �ּ���">
								<option value=""> �� </option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="Mbirth" id="Mbirth" class="textarea" style="height:35px;width:96px;" valid="E|A=��������� ������ �ּ���">
								<option value=""> �� </option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="Dbirth" id="Dbirth" class="textarea" style="height:35px;width:96px;" valid="E|A=��������� ������ �ּ���">
								<option value=""> �� </option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	  	  	    	  
					<tr style="height:35px;">
						<td>��ȭ��ȣ</td>
						<td><label>
								<select id="hp_1" name="hp_1" class="textarea" style="height:35px;width:77px;" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
									<option value="">����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</label>
							-
							<input type="text" id="hp_2" name="hp_2" style="height:28px;width:75px;" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							-
							<input type="text" id="hp_3" name="hp_3" style="height:28px;width:75px;" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
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
			alert("�߸��� �̸��� �����Դϴ�.");
			return false;  
		} else {  
			//alert('ok');
		}  
		 
		
		if (id == ""){
			alert("ID�� �Է����ּ���.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_check.asp",{"proc_type":'checkUserId',"user_id":id},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('��ϰ����մϴ�.');
					break;
					case("1000") :
						alert('�ߺ��� ���̵� �Դϴ�.');
						return false;
					break;
					case("1001") :
						alert('�����͸� ��Ȯ�� �Է����ּ���.');
						return false;
					break;
					case("9999") :
						alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
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

		proc_type	confirmUser	�����(������)
		user_id	�Է°�	���̵�(�̸����ּ�)
		pwd	�Է°�	��й�ȣ
		pn_mem_id	mBaby	��Ʈ�� ���̵�(������)

		0000	�����Ϸ�(ĳ������)
		1001	�ʼ� �Ķ���� ���� �������
		1002	���̵� Ȥ�� ��й�ȣ ����
		1003	�̹� ������ �޾� ĳ�ø� ���޹��� ���
		9999	ó���� �����߻�
*/
		if (cert_id == ""){
			alert("ID�� �Է����ּ���.");
			return false;
		}
		
		if(pwd2 == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_cert_check.asp",{"proc_type":'confirmUser',"user_id":cert_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('������ �Ϸ�Ǿ����ϴ�.');
					break;
					case("1001") :
						alert('�����͸� ��Ȯ�� �Է����ּ���.');
						return false;
					break;
					case("1002") :
						alert('���̵� Ȥ�� ��й�ȣ�� ����� �Է����ּ���');
						return false;
					break;
					case("1003") :
						alert('�̹� ������ ���� ���̵��Դϴ�.');
						return false;
					break;
					case("9999") :
						alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
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

		proc_type	insertUser	�����(������)
		user_id	�Է°�	���̵�(�̸����ּ�)
		pwd	�Է°�	��й�ȣ(6~15�ڸ� �����׼��ڱ���)
		nickname	�Է°�	�г���(10�ڸ�)
		birthday	�Է°�	�������(���� 8�ڸ�)
		phone	�Է°�	��ȭ��ȣ(���ڸ��Է�)
		pn_mem_id	mBaby	��Ʈ�� ���̵�(������)

		ȸ�����ԿϷ�
		�ߺ��� ���̵��� ���
		�ʼ� �Ķ���� ���� �������
		ó���� �����߻�

	
*/
		var email = jQuery("#mem_id").val();
		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
  

		if(regex.test(email) === false) {  
			alert("�߸��� �̸��� �����Դϴ�.");
			return false;  
		} else {  
			//alert('ok');
		}  
				 

		mem_pw = jQuery("#pwd").val();
		mem_pw_check = jQuery("#pwd_check").val();
		if (mem_pw != mem_pw_check){
			alert('��й�ȣ�� �ٽ� Ȯ���� �ּ���');
			return false;
		}
		if (id1 == ""){
			alert("ID�� �Է����ּ���.");
			return false;
		}
		if (pwd == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}
		if (pwd2 == ""){
			alert("��й�ȣ�� ���Է� ���ּ���.");
			return false;
		}
		if (nickname == ""){
			alert("�г����� �Է����ּ���.");
			return false;
		}
		if (Ybirth == ""){
			alert("������ �Է����ּ���.");
			return false;
		}
		if (Mbirth == ""){
			alert("���� �Է����ּ���.");
			return false;
		}
		if (Dbirth == ""){
			alert("���� �Է����ּ���.");
			return false;
		}
		if (hp_1 == ""){
			alert("�ڵ�����ȣ�� �Է����ּ���.");
			return false;
		}
		if (hp_2 == ""){
			alert("�ڵ�����ȣ�� �Է����ּ���.");
			return false;
		}
		if (hp_3 == ""){
			alert("�ڵ�����ȣ�� �Է����ּ���.");
			return false;
		}

		if (id1 == ""){
			alert("ID�� �Է����ּ���.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_join_check.asp",{"proc_type":'insertUser',"user_id":id1,"pwd":pwd,"nickname":nickname,"Ybirth":Ybirth,"Mbirth":Mbirth,"Dbirth":Dbirth,"phone":hp_num,"pn_mem_id":"mBaby"},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
						self.close();
					break;
					case("1000") :
						alert('�ߺ��� ���̵� �Դϴ�.');
						return false;
					break;
					case("1001") :
						alert('�����͸� ��Ȯ�� �Է����ּ���.');
						return false;
					break;
					case("9999") :
						alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
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
		if (!check_info(pw,"�н�����")){ return false }

		mem_pw = jQuery("#pwd").val();
		mem_pw_check = jQuery("#pwd_check").val();
		if (mem_pw != mem_pw_check){
			alert('��й�ȣ�� �ٽ� Ȯ���� �ּ���');
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
