<!--#include virtual="/common/menu/head_iwing.asp"-->
<%
'Session("idCheck") = "N"
'id_check = fncRequest("idCheck")
 
%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<input type="hidden" id="login" name="login" value="<%=uId%>">
			 
			 
		<div class="iwing_01" style="width:740px; height:964px;">
			<img src="/image/iwing_01.jpg">
		</div>

		<div class="iwing_02">
			<div class="pt_50">
				<input type="text" class="input_01" id="cert_mnb_id" name="cert_mnb_id"   placeholder="���̵�" tabindex="1" /><!--������ ���̺� -->
				<span class="pl_50">
					<input type="text" class="input_01" id="cert_id" name="cert_id"  placeholder="���̵�" tabindex="3" /><!--������ ���̵� -->
				</span>
			</div>

			<div class="pt_15">
				<input type="password" class="input_01" id="mnb_pwd2" name="mnb_pwd2" placeholder="��й�ȣ" tabindex="2" />
				<span class="pl_50">
					<input type="password" class="input_01" id="pwd2" name="pwd2" placeholder="��й�ȣ" tabindex="4" />
				</span>
			</div>

			<div class="pt_15">
				<span class="btn1_1">
					<img src="/image/iwing_btn_01.png" id="btnMnBCert" style="cursor:pointer;" />
					<span class="pl_35">
						<img src="/image/iwing_btn_02.png" onclick="join();"style="cursor:pointer;" />
					</span>
				</span>
				
				<!-- �����غ��̺� ���� �Ϸ�� ��ü -->
				<span class="btn1_2" style="display:none; margin-right:10px;">
					<img src="/image/iwing_btn_s_01.png" />
				</span>

				<span class="btn2_1 pl_50">
					<img src="/image/iwing_btn_01.png" id="btnIdCert" style="cursor:pointer;" />
					<span class="pl_35_2">
						<img src="/image/iwing_btn_02.png" onclick="fncOpenZip();" style="cursor:pointer;" />
					</span>
				</span>
				
				<!--������ ���� �Ϸ�� ��ü-->
				<span class="btn2_2 pl_50" style="display:none;">
					<img src="/image/iwing_btn_s_02.png" />
				</span>

				<!--<span class="btn1_1">
					<img src="/image/iwing_btn_01.png"  id="btnMnBCert" style="cursor:pointer;"/>
					<span class="pl_24">
						<img src="/image/iwing_btn_02.png" onclick="join();"style="cursor:pointer;"/>
					</span>
				</span>
				
				<!--�����غ��̺� ���� �Ϸ�� ��ü--
				 <span class="btn1_2" style="padding-left:5px;display:none">
					<img src="/image/iwing_btn_s_01.png" />
				</span> 

				<span class="btn2_1 pl_50">
					<img src="/image/iwing_btn_01.png" id="btnIdCert" style="cursor:pointer;"/> <!-- ������ �Ƶ���--
					<span class="pl_24">
						<img src="/image/iwing_btn_02.png" onclick="fncOpenZip();" style="cursor:pointer;" />
					</span>
				</span>
				
				<!--������ ���� �Ϸ�� ��ü--
				<span class="btn2_2" style="padding-left:385px;margin-bottom:20px;display:none;">
					<img src="/image/iwing_btn_s_02.png" />
				</span>-->
			</div>
		</div>

		<div class="iwing_03">
			<img src="/image/iwing_03.jpg" usemap="#img3_map">

			<map name="img3_map">
				<area shape="rect" coords="264,170,376,206" href="https://itunes.apple.com/kr/app/aiwing-choegoui-donghwachaeg/id923670648?mt=8" target="_blank">
				<area shape="rect" coords="401,170,514,206" href="https://play.google.com/store/apps/details?id=kr.co.mflare.google.iwing" target="_blank">
			</map>
		</div>
			 
			</form>   
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
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
	var btnSms = jQuery("#btnSms");
	var btnSmsCheck = jQuery("#btnSmsCheck");
	var btnSubmit = jQuery("#btnSubmit");
	var btnIdCheck = jQuery("#btnIdCheck");
	var btnIdCert = jQuery("#btnIdCert");
	var btnMnBCert = jQuery("#btnMnBCert");

	 

		if (jQuery("#login").val() != ""){
				$(".btn1_1").hide();
				$(".pl_35").hide();
				$(".btn1_2").show();
		}


		btnIdCheck.click(function(){
		var id = jQuery("#mem_id").val();
		
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

		btnMnBCert.click(function(){
		var id = jQuery("#cert_mnb_id").val();
		var mnb_pw = jQuery("#mnb_pwd2").val();
		 
		 	if (id == ""){
			alert("ID�� �Է����ּ���.");
			return false;
			}if(mnb_pw == ""){
			alert("��й�ȣ�� �Է����ּ���.");
			return false;
		}else{

		jQuery.post("/common/inc/check_id_pw_ax.asp",{"cert_mnb_id":id,"mnb_pwd2":mnb_pw},function(data,testStatus){
			switch(data) {
				case("1") :
					alert('�����Ͻ� ���̵� �Է��� �ּ���.');
				break;
				case("2") :
				//	alert('�����̿Ϸ�Ǿ����ϴ�.');
						/*$(function() {
						  $(".btn1_2").css('display','block');
						  $(".btn1_1").css('display','none');
						//  $(".btn2_2").css({ 'padding-left':'140px'});
						//   $(".btn2_1").css({ 'color':'yellow','font-weight':'bolder'});
						});*/

						$(".btn1_1").hide();
						$(".btn1_2").show();


						jQuery("#idCheck").val("Y");

						//alert(jQuery("#idCheck").val());
				break;
				case("3") :
					alert('���̵� ��й�ȣ�� Ʋ�Ȱų� ��ϵ��� ���� ���̵��Դϴ�.');
				break;
				case("22") :
					alert('�̹� �̺�Ʈ�� �����ϼ̽��ϴ�. �̺�Ʈ�� �ѹ��� �����Ͻ� �� �ֽ��ϴ�.');
					return false;
				case("34") :
					alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
					return false;
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
		if (jQuery("#login").val() == ""){
			//�α��� ��������

		if (jQuery("#idCheck").val() == "N" ) {
			alert("�����غ��̺� ȸ�������� ���� ���ּ���.");
			return false;
		}
		else {
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
							//alert('������ �Ϸ�Ǿ����ϴ�.');
							$(".btn2_1").hide();
							$(".btn2_2").show();
 

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
							//window.location.href = "http://mothernbaby.co.kr/member/member_iwing.asp?mOne=6&mTwo=2";
							return false;
						break;
						case("9999") :
							alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
							return false;
						break;
					}
				});
			}
		}
		}else{
					//�α��� ������
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
								//alert('������ �Ϸ�Ǿ����ϴ�.');
								$(".btn2_1").hide();
								$(".btn2_2").show();
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
								//window.location.href = "http://mothernbaby.co.kr/member/member_iwing.asp?mOne=6&mTwo=2";
								return false;
							break;
							case("9999") :
								alert('ó���� ������ �߻��Ͽ����ϴ�. �����ڿ��� �����ϼ���');
								return false;
							break;
						}
					});
				}
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
  
		if (id1 == ""){
			alert("ID�� �Է����ּ���.");
			return false;
		}else{
			jQuery.post("/common/inc/iwing_join_check.asp",{"proc_type":'insertUser',"user_id":id1,"pwd":pwd,"nickname":nickname,"Ybirth":Ybirth,"Mbirth":Mbirth,"Dbirth":Dbirth,"phone":hp_num,"pn_mem_id":"mBaby"},function(data,testStatus){
			 
				switch(data) {
					case("0000") :
						alert('ȸ�������� �Ϸ�Ǿ����ϴ�.');
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

 
	function fncOpenZip(){
		window.open("/member/iwing.asp","pop_zipcode","width=500px, height=460px");
	}

	function join(){
		window.open('http://mothernbaby.co.kr/member/member_join.asp?mOne=6&mTwo=2', '_blank'); 
	}
</script>

<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>

 
</html>
