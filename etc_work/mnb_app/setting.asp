<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual = "/etc_work/mnb_app/fnc.asp"-->
<%
	Dim mode : mode = "ins"

	uId	= Trim(fncRequestCookie("uid")) '회원	아이디
	uName = Trim(fncRequestCookie("uname")) '회원	아이디
	auto_login_ck = Request.Cookies("auto_login_ck")("Flag") '자동로그인 쿠키

	If uId = "" Then 
		response.Write "<script type='text/javascript'>alert('로그인이 필요한 서비스입니다.');parent.location.href='/etc_work/mnb_app/login.asp'</script>"
	End If 

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	strSql1 = ""
	strSql1 = strSql1 & " SELECT  *  "
	strSql1 = strSql1 & " from  MO_RESERVATION    " 
	strSql1 = strSql1 & " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& uId &"' order by mr_idx desc "

	Set Rs = DBExec(strSql1, "main")
	
	Dim service_contract_check

	If Rs.Eof Then
		service_contract_check = "F"
	Else
		service_contract_check = "T"

		mr_idx = Rs("MR_IDX")
		service_name = Rs("MR_SERVICE")
		service_period = Rs("MR_PERIOD")
		service_type = Rs("MR_TYPE")
		servicesdt = Rs("MR_SERVICESDT")
		serviceedt = Rs("MR_SERVICEEDT")
		mr_clinic = Rs("mr_clinic")
		mr_family = Rs("mr_family")
		mr_clinic_date = Rs("MR_CLINIC_DATE")'(조리원입실일) N
		mr_clinic_period = Rs("MR_CLINIC_PERIOD")'(조리원이용기간) N
		mr_unique = Rs("MR_UNIQUE")'(쌍둥이)
		mr_childbirth = Rs("MR_CHILDBIRTH")'(출산예정일)
		mr_childbirth_form = Rs("MR_CHILDBIRTH_FORM")'(분만형태) N
		mr_breast_feeding = Rs("MR_BREAST_FEEDING")'(수유형태) N
		mr_exper = Rs("MR_EXPER")'(출산경험)
		mr_care_place_post = Rs("MR_CARE_PLACE_POST")'(산후조리장소 우편번호) N
		mr_care_place_addr1 = Rs("MR_CARE_PLACE_ADDR1")'(산후조리장소 주소) N
		mr_care_place_addr2 = Rs("MR_CARE_PLACE_ADDR2")'(산후조리장소 상세주소) N
		mr_care_place = Rs("MR_CARE_PLACE")'(산후조리장소) N
	End If

	Call RSClose(Rs)

	strSql1 = "SELECT * FROM  MO_MEM_MAS A, MO_MEM_DTL B, MO_COMM_CD C WHERE A.MM_MEM_ID = B.MD_MEM_ID AND B.MD_LOCAL = C.CC_COMM_CD AND A.MM_MEM_ID = '"& uId &"'"

	Set Rs = DBExec(strSql1, "main")

	If Rs.Eof Then
	Else
		md_post = Rs("MD_POST")
		md_addr1 = Rs("MD_ADDR1")
		md_addr2 = Rs("MD_ADDR2")
		md_hp = Rs("MD_HP")
		md_hp_arr = Split(md_hp, "-")
		md_hp1 = md_hp_arr(0)
		md_hp2 = md_hp_arr(1)
		md_hp3 = md_hp_arr(2)

		cc_kor_nm = Rs("CC_KOR_NM")
		cc_comm_tel = Rs("CC_COMM_TEL")
	End If

	Call RSClose(Rs)
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마더앤베이비</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
	<link href="style.css" rel="stylesheet">
	<link href="leftmenu.css" rel="stylesheet">
	<!-- 달력 추가 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
	<!-- -->
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>
	

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".datepicker").datepicker({
			  dateFormat: 'yy-mm-dd',
			  changeMonth: true, 
			  changeYear: true,
			  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			});

			$("#care_area_chk").click(function() {
				var chk = $(this).is(':checked');

				if (chk) {
					$("#care_area_post").val($("#post").val());
					$("#care_area_address1").val($("#address1").val());
					$("#care_area_address2").val($("#address2").val());
				} else {
					$("#care_area_post").val("");
					$("#care_area_address1").val("");
					$("#care_area_address2").val("");
				}
			});

			imgChecked("care_area_place");
			imgChecked("childbirth_form1");
			imgChecked("childbirth_form2");
			imgChecked("breast_feeding_form");
			imgChecked("childbirth_experience");
			imgChecked("carecenter_use");
			imgChecked("carecenter_use_chk");
			checkBoxChecked("family_chk");

			$("#carecenter_use_day").change(function() {
				$("#carecenter_use img").each(function() {
					var off = $(this).attr("off");
					$(this).attr("src", "img/setting_" + off + ".png");
				});

				$("#carecenter_use_value").val($(this).val());
			});

			$("#address_save").click(function() {
				$("#command").val("address");

				if ($("#post").val() == "") {
					alert("우편번호를 검색해 주세요.");
					$("#post").focus();
				}

				if ($("#address1").val() == "") {
					alert("주소를 검색해 주세요.");
					$("#address1").focus();
				}

				if ($("#address2").val() == "") {
					alert("주소를 입력해 주세요.");
					$("#address2").focus();
				}

				$("#settingForm").submit();
			});

			$("#reser_save").click(function() {
				var family_value = "";

				$(".family_chk").each(function() {
					var chk = $(this).is(":checked");

					if (chk) {
						if (family_value == "") {
							family_value += $(this).val();
						} else {
							family_value += "|| " + $(this).val();
						}
					}
				});

				$("#family_value").val(family_value);

				$("#command").val("reser");
				$("#settingForm").submit();
			});

			$("#security_save").click(function() {
				$("#command").val("security");

				if ($("#user_pwd").val() != "") {
					if((jQuery("#user_pwd").val().length) < 6 || (jQuery("#user_pwd").val().length) > 15){
						alert("6자이상 15자 이하의 비밀번호를 입력하세요");
						$("#user_pwd").focus();
						return false;
					}

					if (jQuery("#user_pwd").val() != "" ) {
					   // 동일한 문자/숫자 4이상, 연속된 문자
						if(/(\w)\1\1\1/.test(jQuery("#user_pwd").val()) || isContinuedValue(jQuery("#user_pwd").val())) {
							alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다."); 
							return false;
						}
					}

					if ($("#user_pwd_re").val() == "") {
						alert("비밀번호 확인을 입력해 주세요.");
						$("#user_pwd_re").focus();
						return false;
					}

					if($("#user_pwd").val() != $("#user_pwd_re").val()) {
						alert("비밀번호를 확인해 주세요");
						$("#user_pwd").focus();
						return false;
					}
				}

				$("#settingForm").submit();
			});

			$("#auto_login").click(function(){
				//클릭되었으면
				if($("#auto_login").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
					jQuery.post("./login_auto_sql.asp",{"check":"Y","mem_id":"<%=uId%>","uname":"<%=uname%>"},function(data,testStatus){
						if (data == 1) {
						//	alert("11111.");
						} else {
						 
							alert("자동로그인이 설정되었습니다.");
							location.reload();
						}
					}); 
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
  
					jQuery.post("./login_auto_off_sql.asp",{"check":"Y","mem_id":"<%=uId%>","uname":"<%=uname%>"},function(data,testStatus){
						if (data == 1) {
						//	alert("11111.");
						} else {
						//	 location.reload();
							alert("자동로그인이 해제되었습니다.");
							location.reload();
						}
					}); 
				}
					 
			});

			$("#post_btn").click(function() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if(data.addressType === 'R'){
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

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						document.getElementById('layer').style.display = 'none';
						$("body").css("overflow", "visible");
					},
					width : '100%',
					height : '100%'
				}).embed(document.getElementById('layer'));

				document.getElementById('layer').style.display = 'block';
				$("body").css("overflow", "hidden");

				initLayerPosition();
			});

			$("#care_area_post_btn").click(function() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if(data.addressType === 'R'){
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
						//$("#care_area_post").val(data.zonecode); //5자리 새우편번호 사용
						$("#care_area_post").val(data.postcode);
						$("#care_area_address1").val(fullAddr);

						// 커서를 상세주소 필드로 이동한다.
						$("#care_area_address2").val("");
						$("#care_area_address2").focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						document.getElementById('layer').style.display = 'none';
						$("body").css("overflow", "visible");
					},
					width : '100%',
					height : '100%'
				}).embed(document.getElementById('layer'));

				document.getElementById('layer').style.display = 'block';
				$("body").css("overflow", "hidden");

				initLayerPosition();
			}); 
		});

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			document.getElementById('layer').style.display = 'none';
			$("body").css("overflow", "visible");
		}

        function initLayerPosition(){
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 460; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 1; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			document.getElementById('layer').style.width = width + 'px';
			document.getElementById('layer').style.height = height + 'px';
			document.getElementById('layer').style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			document.getElementById('layer').style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
			document.getElementById('layer').style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		}

		function imgChecked(obj) {
			if (obj == "childbirth_form2") {
				if ($("#" + obj + "_value").val().indexOf("쌍둥이") >= 0) {
					$("#" + obj + "_value").val("쌍둥이");
				}
			}

			if ($("#" + obj + "_value").val() != "") {
				$("#" + obj + " img").each(function() {
					var value = $(this).attr("value");
					var on = $(this).attr("on");

					if (value == $("#" + obj + "_value").val()) {
						$(this).attr("src", "img/setting_" + on + ".png");
						$(this).attr("status", "on");
					}
				});

				if (obj == "carecenter_use" && $("#" + obj + "_value").val().indexOf("일") >= 0) {
					$("#carecenter_use_day").val($("#" + obj + "_value").val());
				}

				if (obj == "carecenter_use_chk") {
					if ($("#" + obj + "_value").val() == "이용함") {
						$("#carecenter_date").attr("disabled", false);

						$("#carecenter_use img").each(function() {
							$(this).attr("disabled", false);
						});

						$("#carecenter_use_day").attr("disabled", false);
					} else if ($("#" + obj + "_value").val() == "이용안함") {
						$("#carecenter_date").val("");
						$("#carecenter_date").attr("disabled", true);
						$("#carecenter_use_value").val("");

						$("#carecenter_use img").each(function() {
							var off = $(this).attr("off");

							$(this).attr("src", "img/setting_" + off + ".png");
							$(this).attr("status", "off");
							$(this).attr("disabled", true);
						});

						$("#carecenter_use_day").val(0);
						$("#carecenter_use_day").attr("disabled", true);
					}
				}
			}

			$("#" + obj + " img").each(function() {
				$(this).click(function() {
					$("#" + obj + " img").each(function() {
						var off = $(this).attr("off");

						$(this).attr("src", "img/setting_" + off + ".png");
						$(this).attr("status", "off");
					});

					if (obj == "carecenter_use") {
						$("#carecenter_use_day").val(0);
					}

					$("#" + obj + "_value").val("");

					var status = $(this).attr("status");
					var on = $(this).attr("on");
					var off = $(this).attr("off");
					var value = $(this).attr("value");

					if (status == "on") {
						$(this).attr("src", "img/setting_" + off + ".png");
						$(this).attr("status", "off");
					} else if (status == "off") {
						$(this).attr("src", "img/setting_" + on + ".png");
						$(this).attr("status", "on");
						$("#" + obj + "_value").val(value);
					}

					if (obj == "carecenter_use_chk") {
						if ($("#" + obj + "_value").val() == "이용함") {
							$("#carecenter_date").attr("disabled", false);

							$("#carecenter_use img").each(function() {
								$(this).attr("disabled", false);
							});

							$("#carecenter_use_day").attr("disabled", false);
						} else if ($("#" + obj + "_value").val() == "이용안함") {
							$("#carecenter_date").val("");
							$("#carecenter_date").attr("disabled", true);
							$("#carecenter_use_value").val("");

							$("#carecenter_use img").each(function() {
								var off = $(this).attr("off");

								$(this).attr("src", "img/setting_" + off + ".png");
								$(this).attr("status", "off");
								$(this).attr("disabled", true);
							});

							$("#carecenter_use_day").val(0);
							$("#carecenter_use_day").attr("disabled", true);
						}
					}
				}).css("cursor", "pointer");
			});
		}

		function checkBoxChecked(obj) {
			var family_value = $("#family_value").val();
			var family_value_arr = family_value.split("|| ");

			for (var i = 0; i < family_value_arr.length; i++) {
				$("." + obj).each(function() {
					if ($(this).val() == family_value_arr[i]) {
						$(this).attr("checked", true);
					}
				});
			}
		}

		function isContinuedValue(value) {
			var intCnt1 = 0;
			var intCnt2 = 0;
			var temp0 = "";
			var temp1 = "";
			var temp2 = "";
			var temp3 = "";
	 
			for (var i = 0; i < value.length-3; i++) {
				temp0 = value.charAt(i);
				temp1 = value.charAt(i + 1);
				temp2 = value.charAt(i + 2);
				temp3 = value.charAt(i + 3);
	 
				if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
						&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
						&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
					intCnt1 = intCnt1 + 1;
				}
	 
				if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
						&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
						&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
					intCnt2 = intCnt2 + 1;
				}
			}
	 
			return (intCnt1 > 0 || intCnt2 > 0);
		}
	</script>
</head>

<body style="background-Color:#ececec">

	<!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
    <div class="container">
		<form name="settingForm" id="settingForm" method="post" target="ifrm" action="setting_sql_new.asp">
			<input type="hidden" name="user_id" id="user_id" value="<%=uId%>" />
			<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>" />
			<input type="hidden" name="command" id="command" />

			<input type="hidden" name="mr_clinic_date" id="mr_clinic_date" value="<%=mr_clinic_date%>" />
			<input type="hidden" name="mr_clinic_period" id="mr_clinic_period" value="<%=mr_clinic_period%>" />
			<input type="hidden" name="mr_unique" id="mr_unique" value="<%=mr_unique%>" />
			<input type="hidden" name="mr_childbirth" id="mr_childbirth" value="<%=mr_childbirth%>" />
			<input type="hidden" name="mr_childbirth_form" id="mr_childbirth_form" value="<%=mr_childbirth_form%>" />
			<input type="hidden" name="mr_breast_feeding" id="mr_breast_feeding" value="<%=mr_breast_feeding%>" />
			<input type="hidden" name="mr_exper" id="mr_exper" value="<%=mr_exper%>" />
			<input type="hidden" name="mr_care_place_post" id="mr_care_place_post" value="<%=mr_care_place_post%>" />
			<input type="hidden" name="mr_care_place_addr1" id="mr_care_place_addr1" value="<%=mr_care_place_addr1%>" />
			<input type="hidden" name="mr_care_place_addr2" id="mr_care_place_addr2" value="<%=mr_care_place_addr2%>" />
			<input type="hidden" name="mr_care_place" id="mr_care_place" value="<%=mr_care_place%>" />

			<div class="setting-box">
				<div class="setting-box-title">
					<img src="img/setting_03.png" valign="middle" />&nbsp;&nbsp;&nbsp;주소설정
				</div>
				
				<div class="mt20">
					<input type="text" class="setting-box-input" style="width:100px;" name="post" id="post" value="<%=md_post%>" placeholder="우편번호" readonly>&nbsp;&nbsp;&nbsp;<button class="setting-box-btn" name="post_btn" id="post_btn">주소찾기</button>
				</div>

				<div class="mt10">
					<input type="text" class="setting-box-input" style="width:250px;" name="address1" id="address1" value="<%=md_addr1%>" placeholder="주소" readonly>
				</div>

				<div class="mt10">
					<input type="text" class="setting-box-input" style="width:250px;" name="address2" id="address2" value="<%=md_addr2%>" placeholder="상세주소">
				</div>

				<div class="mt40">
					<button class="setting-box-confirm-btn" id="address_save">저장</button>
				</div>
			</div>

			<div class="setting-box" <% If service_name = "" Then %> style="display:none;" <% End If %>>
				<div class="setting-box-title">
					<img src="img/setting_06.png" valign="middle" />&nbsp;&nbsp;&nbsp;고객정보 <span style="font-size:12pt;">(<span style="color:#494949"><%=uName%></span> <span style="color:#959595">고객님</span>)</span>
				</div>
				
				<div class="mt20">
					<span class="setting-box-sub-title">가입프로그램</span> <span style="color:#959595; font-size:9pt;">서비스 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<div style="color:#4a4a4a; font-size:15pt; font-weight:bold;"><%=service_name%> / <%=service_period%> / <%=service_type%></div>
					<div style="color:#838383 ; font-size:9pt;"><%=dateConvert2(servicesdt)%> 시작예정 ~ <%=dateConvert2(serviceedt)%> 종료예정</div>
				</div>
				
				<% If cc_kor_nm <> "" Then %>
				<div class="mt40">
					<span class="setting-box-sub-title">서비스지역</span> <span style="color:#959595; font-size:9pt;">서비스지역 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20" style="position:relative;">
					<span style="color:#455364; font-size:15pt; font-weight:bold;"><%=cc_kor_nm%></span> 지점
					<br/><br/><span style="color:#ababab; font-size:10t;">전화번호: <%=cc_comm_tel%></span>
					<span style="position:absolute; top:20px; right:20px;"><a href="tel:<%=cc_comm_tel%>"><img src="img/setting_101.jpg" /></a></span>
				</div>
				<% End If %>

				<div class="mt40">
					<span class="setting-box-sub-title">출산예정일</span> <span style="color:#959595; font-size:9pt;">출산예정일 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<input type="text" class="setting-box-input datepicker" style="width:200px;" name="childbirth" id="childbirth" value="<%=mr_childbirth%>" placeholder="출산예정일" readonly>
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">조리원이용</span> <span style="color:#959595; font-size:9pt;">산후조리원 입실일 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20" id="carecenter_use_chk">
					<input type="hidden" name="carecenter_use_chk_value" id="carecenter_use_chk_value" value="<%=mr_clinic%>" />
					<img src="img/setting_90_off.png" on="90_on" off="90_off" status="off" value="이용함" />
					<img src="img/setting_91_off.png" on="91_on" off="91_off" status="off" value="이용안함" />
				</div>

				<div class="mt10">
					<input type="text" class="setting-box-input datepicker" style="width:200px;" name="carecenter_date" id="carecenter_date" value="<%=mr_clinic_date%>" placeholder="산후조리원 입실일" readonly>
				</div>

				<div class="mt10" id="carecenter_use">
					<input type="hidden" name="carecenter_use_value" id="carecenter_use_value" value="<%=mr_clinic_period%>" />
					<img src="img/setting_123.png" on="113" off="123" status="off" value="1주" />
					<img src="img/setting_120.png" on="107" off="120" status="off" value="2주" />
					<img src="img/setting_126.png" on="109" off="126" status="off" value="3주" />
					<img src="img/setting_128.png" on="111" off="128" status="off" value="4주" />

					<select style="background:#ffffff; height:27px;" name="carecenter_use_day" id="carecenter_use_day">
						<option value="0">기타선택일</option>
						<% For i = 1 To 20 %>
							<option value="<%=i%>일"><%=i%>일</option>
						<% Next %>
					</select>
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">산후조리장소</span> <span style="color:#959595; font-size:9pt;">산후조리장소 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<input type="text" class="setting-box-input" style="width:100px;" name="care_area_post" id="care_area_post" value="<%=mr_care_place_post%>" placeholder="우편번호" readonly>&nbsp;&nbsp;&nbsp;<button class="setting-box-btn" id="care_area_post_btn">주소찾기</button>
					<input type="checkbox" id="care_area_chk"> <span style="color:#959595; font-size:9pt;">입력주소지와 동일</span>
				</div>

				<div class="mt10">
					<input type="text" class="setting-box-input" style="width:250px;" name="care_area_address1" id="care_area_address1" value="<%=mr_care_place_addr1%>" placeholder="주소" readonly>
				</div>

				<div class="mt10">
					<input type="text" class="setting-box-input" style="width:250px;" name="care_area_address2" id="care_area_address2" value="<%=mr_care_place_addr2%>" placeholder="상세주소">
				</div>

				<div class="mt10" id="care_area_place">
					<input type="hidden" name="care_area_place_value" id="care_area_place_value" value="<%=mr_care_place%>" />
					<img src="img/setting_38.png" on="24" off="38" status="off" value="자택" />
					<img src="img/setting_40.png" on="26" off="40" status="off" value="친정" />
					<img src="img/setting_42.png" on="29" off="42" status="off" value="시댁" /> 
					<img src="img/setting_44.png" on="31" off="44" status="off" value="기타" />
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">가족사항</span> <span style="color:#959595; font-size:9pt;">함께하는 가족정보를 입력하세요.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<div style="border:1px solid #d4d4d4; width:250px;">
						<input type="hidden" name="family_value" id="family_value" value="<%=mr_family%>" />
						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="부모님" /> 부모님</span>
						</div>
						<div style="border-bottom:1px solid #d4d4d4; height:1px;"></div>

						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="남편" /> 남편</span>
						</div>
						<div style="border-bottom:1px solid #d4d4d4; height:1px;"></div>

						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="큰아이 1명" /> 큰아이 1명</span>
						</div>
						<div style="border-bottom:1px solid #d4d4d4; height:1px;"></div></span>

						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="큰아이 2명이상" /> 큰아이 2명이상</span>
						</div>
						<div style="border-bottom:1px solid #d4d4d4; height:1px;"></div>

						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="기타가족" /> 기타가족</span>
						</div>
						<div style="border-bottom:1px solid #d4d4d4; height:1px;"></div>

						<div style="height:40px; line-height:40px; vertical-align:center; padding-left:10px;">
							<span style="color:#959595;"><input type="checkbox" name="family_chk" class="family_chk" value="반려견" /> 반려견</span>
						</div>
					</div>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt40">
					<span class="setting-box-sub-title">출산경험</span> <span style="color:#959595; font-size:9pt;">출산경험 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20" id="childbirth_experience">
					<input type="hidden" name="childbirth_experience_value" id="childbirth_experience_value" value="<%=mr_exper%>" />
					<img src="img/setting_100.png" on="92" off="100" status="off" value="초산모" />
					<img src="img/setting_102.png" on="95" off="102" status="off" value="경산모" />
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">분만형태</span> <span style="color:#959595; font-size:9pt;">분만형태 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20" id="childbirth_form1">
					<input type="hidden" name="childbirth_form1_value" id="childbirth_form1_value" value="<%=mr_childbirth_form%>" />
					<img src="img/setting_61.png" on="51" off="61" status="off" value="자연분만" />
					<img src="img/setting_63.png" on="54" off="63" status="off" value="제왕절개" />
				</div>

				<div class="mt10" id="childbirth_form2">
					<input type="hidden" name="childbirth_form2_value" id="childbirth_form2_value" value="<%=mr_unique%>" />
					<img src="img/setting_65.png" on="56" off="65" status="off" value="쌍둥이" />
					<span style="color:#959595; font-size:9pt;">쌍둥이신 경우 선택해 주세요.</span>
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">수유형태</span> <span style="color:#959595; font-size:9pt;">수유형태 정보입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20" id="breast_feeding_form">
					<input type="hidden" name="breast_feeding_form_value" id="breast_feeding_form_value" value="<%=mr_breast_feeding%>" />
					<img src="img/setting_80.png" on="71" off="80" status="off" value="모유" />
					<img src="img/setting_83.png" on="74" off="83" status="off" value="분유" />
					<img src="img/setting_86.png" on="76" off="86" status="off" value="혼합" />
				</div>

				<div class="mt40">
					<button class="setting-box-confirm-btn" id="reser_save">변경사항 저장</button>
				</div>
			</div>

			<div class="setting-box">
				<div class="setting-box-title">
					<img src="img/setting_08.png" valign="middle" />&nbsp;&nbsp;&nbsp;보안정보 변경 <span style="font-size:12pt;">(<span style="color:#494949"><%=uName%></span> <span style="color:#959595">고객님</span>)</span>
				</div>
				
				<div class="mt20">
					<span class="setting-box-sub-title">비밀번호 변경</span> <span style="color:#959595; font-size:9pt;">변경하실 비밀번호를 입력해주세요.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<input type="password" class="setting-box-input" style="width:200px;" name="user_pwd" id="user_pwd" placeholder="변경할 비밀번호">
				</div>

				<div class="mt10">
					<input type="password" class="setting-box-input" style="width:200px;" name="user_pwd_re" id="user_pwd_re" placeholder="비밀번호 확인">
				</div>

				<div class="mt10">
					<span style="color:#ea5545; font-size:10pt;">6~15자 이상의 비밀번호를 입력하세요.<br/>4개이상의 연속된 숫자 및 문자는 제한합니다.</span>
				</div>

				<div class="mt40">
					<span class="setting-box-sub-title">전화번호 변경</span> <span style="color:#959595; font-size:9pt;">변경하실 전화번호를 입력해주세요.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<select name="hp1" id="hp1" style="background:#ffffff; height:35px; width:70px;">
						<option value="">휴대폰</option>
						<option value="010" <% If md_hp1 = "010" Then %> selected <% End If %>>010</option>
						<option value="011" <% If md_hp1 = "011" Then %> selected <% End If %>>011</option>
						<option value="016" <% If md_hp1 = "016" Then %> selected <% End If %>>016</option>
						<option value="017" <% If md_hp1 = "017" Then %> selected <% End If %>>017</option>
						<option value="018" <% If md_hp1 = "018" Then %> selected <% End If %>>018</option>
						<option value="019" <% If md_hp1 = "019" Then %> selected <% End If %>>019</option>
					</select>
					<input type="text" class="setting-box-input" style="width:100px;" name="hp2" id="hp2" value="<%=md_hp2%>" maxlength="4" placeholder="중간번호" />
					<input type="text" class="setting-box-input" style="width:100px;" name="hp3" id="hp3" value="<%=md_hp3%>" maxlength="4" placeholder="뒷번호" />
				</div>

				<div class="mt40">
					<button class="setting-box-confirm-btn" id="security_save">저장</button>
				</div>
			</div>

			<div class="setting-box" style="display:none;">
				<div class="setting-box-title">
					<img src="img/setting_10.png" valign="middle" />&nbsp;&nbsp;&nbsp;PUSH알림 설정
				</div>
				
				<div class="mt20">
					<span style="color:#959595; font-size:9pt;">PUSH알림 설정을 하시면 더욱 편리하게 서비스를 이용하실 수 있습니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<span style="color:#959595; font-size:13pt;">PUSH알림 ON/OFF</span>
				</div>
			</div>

			<div class="setting-box">
				<div class="setting-box-title">
					<img src="img/setting_12.png" valign="middle" />&nbsp;&nbsp;&nbsp;로그인 정보
				</div>
				
				<div class="mt20">
					<span style="color:#959595; font-size:9pt;">로그인 설정입니다.</span>
				</div>

				<div class="setting-box-line mt20"></div>

				<div class="mt20">
					<span style="color:#959595; font-size:13pt;"><%=uId%></span>
				</div>

				<div class="mt20">
					<input type="checkbox" name="auto_login" id="auto_login" value="Y" <% If auto_login_ck = "on" Then %> checked <% End If %>> <span style="color:#959595; font-size:9pt;">자동로그인</span>
				</div>

				<div class="mt40">
					<a href="logout.asp"><button class="setting-box-confirm-btn">로그아웃</button></a>
				</div>
			</div>
		</form>

		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>
	</div>

	<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>

	<!-- #include virtual = "/etc_work/mnb_app/footer.asp" -->

	<script src="js/leftmenu.js"></script>
</html>