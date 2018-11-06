<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<title>마더앤베이비 산후도우미 상담신청</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
	window.onload = function() {
        // post our message to the parent
        window.parent.postMessage(
            // get height of the content
            document.body.scrollHeight
            // set target domain
            ,"*"
        )
    };

	$(document).ready(function(){
		$.datepicker.regional['ko'] = {
			closeText: '닫기',
			prevText: '이전',
			nextText: '다음',
			currentText: '오늘',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			dayNames: ['일','월','화','수','목','금','토'],
			dayNamesShort: ['일','월','화','수','목','금','토'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			weekHeader: 'Wk',
			dateFormat: 'yy-mm-dd',
			firstDay: 0,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: ''
		};

		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		$(".datepicker").attr("readonly", "true");

		$(".datepicker").datepicker({
			changeMonth: true,
			changeYear: true,
			showOtherMonths: true,
			selectOtherMonths: true,
			yearRange: "-100:+2"
		});

		$("#consultTel2, #consultTel3, #consultMobile2, #consultMobile3").keyup(function(event) {
			var id = $(this).attr("id");
			var val = $(this).val();

			val = val.replace(/([ㄱ-ㅎ|ㅏ-ㅣ|가-힣|-])/g,"");
			$(this).val(val);
		});

		$("#consultTel2, #consultTel3, #consultMobile2, #consultMobile3").keypress(function(event) {
			var code = event.keyCode;

			if (code > 47 && code < 58) {
				return;
			}
			
			event.preventDefault();
		});

		$("#addrSearch").click(function() {
			postSearch();
		}).css("cursor", "pointer");

		$("#consultOk").click(function() {
			consultOk();
		}).css("cursor", "pointer");
	});

	function consultOk() {
		if ($("#consultName").val() == "") {
			alert("성명을 입력해 주세요.");
			$("#consultName").focus();
			return false;
		}

		if ($("#consultBirth").val() == "") {
			alert("출산예정일을 입력해 주세요.");
			$("#consultBirth").focus();
			return false;
		}

		/*if ($("#consultTel1").val() == "") {
			alert("전화번호를 입력해 주세요.");
			$("#consultTel1").focus();
			return false;
		}

		if ($("#consultTel1").val() != "-" && $("#consultTel2").val() == "") {
			alert("전화번호를 입력해 주세요.");
			$("#consultTel2").focus();
			return false;
		}

		if ($("#consultTel1").val() != "-" && $("#consultTel3").val() == "") {
			alert("전화번호를 입력해 주세요.");
			$("#consultTel3").focus();
			return false;
		}*/

		if ($("#consultMobile1").val() == "") {
			alert("핸드폰번호를 입력해 주세요.");
			$("#consultMobile1").focus();
			return false;
		}

		if ($("#consultMobile2").val() == "") {
			alert("핸드폰번호를 입력해 주세요.");
			$("#consultMobile2").focus();
			return false;
		}

		if ($("#consultMobile3").val() == "") {
			alert("핸드폰번호를 입력해 주세요.");
			$("#consultMobile3").focus();
			return false;
		}

		if ($("#consultPost").val() == "") {
			alert("주소를 검색해 주세요.");
			$("#addrSearch").focus();
			return false;
		}

		if ($("#consultAddr1").val() == "") {
			alert("주소를 검색해 주세요.");
			$("#addrSearch").focus();
			return false;
		}

		if ($("#consultAddr2").val() == "") {
			alert("나머지 주소를 입력해 주세요.");
			$("#consultAddr2").focus();
			return false;
		}

		/*if ($("#consultContent").val() == "") {
			alert("상담내용을 작성해 주세요.");
			$("#consultContent").focus();
			return false;
		}*/

		if (!$("#agree").is(":checked")) {
			alert("개인정보 수집 동의를 해주세요.");
			$("#agree").focus();
			return false;
		}

		$("#frm").submit();
	}

	function postSearch() {
		new daum.Postcode({
			shorthand: false,
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백("")값을 가지므로, 이를 참고하여 분기 한다.
				var fullAddr = ""; // 최종 주소 변수
				var extraAddr = ""; // 조합형 주소 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
					fullAddr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					fullAddr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
				if(data.userSelectedType === "R"){
					//법정동명이 있을 경우 추가한다.
					if(data.bname !== ""){
						extraAddr += data.bname;
					}
					// 건물명이 있을 경우 추가한다.
					if(data.buildingName !== ""){
						extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
					}
					// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (extraAddr !== "" ? " ("+ extraAddr +")" : "");
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				//$("#address01").val(data.zonecode); //5자리 새우편번호 사용
				//$("#address02").val(data.postcode);

				//var postcodeArr = data.postcode.split("-");
				//$("#siPost").val(postcodeArr[0]);
				//$("#siPost").val(postcodeArr[1]);

				$("#consultPost").val(data.postcode);
				$("#consultAddr1").val(fullAddr);

				// 커서를 상세주소 필드로 이동한다.
				$("#consultAddr2").val("");
				$("#consultAddr2").focus();

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
				document.getElementById("layer").style.display = "none";
				$("body").css("overflow", "visible");
			},
			width : "100%",
			height : "100%"
		}).embed(document.getElementById("layer"));

		document.getElementById("layer").style.display = "block";
		$("body").css("overflow", "hidden");

		initLayerPosition();
	}

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

	function result() {
		alert("산후도우미 상담신청이 완료 되었습니다.");
		window.location.href = "consultRequest.asp";
	}
</script>

</head>
<body>
<div class="contentWrap">
	<img src="img/consultRequest.png" alt="마더앤베이비 산후도우미 소개이미지">
	<form name="frm" id="frm" class="frm" method="post" target="blankFrm" action="consultRequestProc.asp">
		<table>
			<tr>
				<td>
					<label for="consultName">성명</label>
					<input type="text" name="consultName" id="consultName" maxlength="10" placeholder="성명">
				</td>
			</tr>
			<tr>
				<td>
					<label for="consultBirth">출산예정일</label>
					<input type="text" name="consultBirth" id="consultBirth" class="datepicker" maxlength="10" placeholder="출산예정일">
				</td>
			</tr>
			<tr style="display:none;">
				<td>
					<label for="consultTel1">전화번호</label>
					<select name="consultTel1" id="consultTel1">
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
						<option value="-">없음</option>
					</select><span>-</span> 
					<input type="text" name="consultTel2" id="consultTel2" maxlength="4"><span>-</span> 
					<input type="text" name="consultTel3" id="consultTel3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>
					<label for="consultMobile1">핸드폰번호</label>
					<select name="consultMobile1" id="consultMobile1">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select><span>-</span> 
					<input type="text" name="consultMobile2" id="consultMobile2" maxlength="4"><span>-</span> 
					<input type="text" name="consultMobile3" id="consultMobile3" maxlength="4">
				</td>
			</tr>
			<tr>
				<td>
					<label for="addrSearch">주소</label>
					<input type="text" name="consultPost" id="consultPost" maxlength="7" readonly placeholder="우편번호" class="postalcode"><a id="addrSearch">검색</a>
					<input type="text" name="consultAddr1" id="consultAddr1" maxlength="50" readonly placeholder="주소" class="addr01">
					<input type="text" name="consultAddr2" id="consultAddr2" maxlength="50" placeholder="나머지 주소" class="addr02">
				</td>
			</tr>
			<tr>
				<td>
					<label for="">상담내용(선택입력)</label>
					<textarea name="consultContent" id="consultContent" maxlength="250" placeholder="상담내용을 작성해 주세요."></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<div class="agreeCheck">
						개인정보 수집 동의
						<input type="checkbox" name="agree" id="agree" checked>
						<br/>
						<textarea style="width:100%; height:50px; margin-top:10px;" disabled>㈜웰니스인텔리전스의 본 이벤트 개인정보 수집 ·이용에 관한 안내입니다.

* 개인정보 수집 및 이용목적에 대하여 동의를 거부 하실 수 있으며, 동의를 거부하실 경우 서비스 이용에 제한이 될 수 있습니다.

1. 수집하는 개인정보 항목 및 수집방법
 가. 수집하는 개인정보의 항목
 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 회원가입, 산후도우미서비스이용, 상담신청, 이벤트 응모 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.

&lt;상담신청 , 이벤트 등&gt;
이름, 출산예정일, 주소, 핸드폰번호, 상담내용

둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP Address(사이트 접근 시), 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록

나. 개인정보 수집방법
 홈페이지, 서면양식, 전화, 팩스, 경품행사응모, 이벤트응모, 배송요청, 제휴사로부터의 제공

2. 개인정보의 수집 및 이용목적
 가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
 컨텐츠 제공, 특정 맞춤서비스 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 

 나. 회원 관리
 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달

 다. 마케팅 및 광고에 활용
산전산후관리 맞춤서비스 제공, 이벤트 및 광고성 정보를 전화, 이메일, 문자 등으로 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 접속 빈도 파악, 회원의 서비스이용에 대한 통계
 라. 기타
 비회원(회원을 제외한 모든 고객)의 산전 산후관리 서비스 및 경품이벤트 이용에 따른 본인확인, 개인 식별, 연령확인, 불만처리 등 민원처리, 고지사항 전달, 마케팅 및 광고성 정보를 전화, 이메일, 문자 등으로 제공

3. 개인정보의 보유 및 이용기간
수집 이용 동의일로부터 최대 1년간 보관하며, 고객의 개인 정보 삭제 요청시 02-557-3544로 전화주시면 즉시 개인정보 관련된 내용은 파기합니다.

■ 개인정보에 관한 민원서비스

회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.

▷ 고객서비스담당 부서 : 마케팅팀
전화번호 : 02-557- 3544

▷ 개인정보관리책임자 성명 : 구자열

전화번호 : 02-557- 3544

서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.

1. 개인분쟁조정위원회 (www.1336.or.kr/1336)

2. 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580- 0533~4)

3. 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480- 3600)

4. 경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392- 0330)</textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<a id="consultOk">
						<img src="img/btn.png" alt="버튼이미지">
					</a>
				</td>
			</tr>
		</table>

		<iframe name="blankFrm" id="blankFrm" frameborder="0" style="display:none;width:0px;height:0px;"></iframe>
	</form>
</div>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:10;-webkit-overflow-scrolling:touch;">
	<img src="http://i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
</body>
</html>