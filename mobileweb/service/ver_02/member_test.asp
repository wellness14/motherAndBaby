<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

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

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#post_btn").click(function() {
					new daum.Postcode({
						oncomplete: function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if(data.userSelectedType === 'R'){
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
							$("#post").val(data.zonecode); //5자리 새우편번호 사용
							$("#address1").val(fullAddr);

							// 커서를 상세주소 필드로 이동한다.
							$("#address2").val("");
							$("#address2").focus();
						}
					}).open();
				});
			});
		</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">회원</span> <span style="color:#919194;">가입</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<!-- <div>
			<img src="/mobileweb/html/images/sub62.jpg" border="0" />
		</div> -->

		<div style="background-color:#F6F6F6;" class="tal pb50 pl5">
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" id="smsCheck" name="smsCheck" value="N">
			<div class="mt20">
				<img src="/mobileweb/html/images/text_0007.jpg" />
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0008.jpg" />
				<input type="text" id="mem_id" name="mem_id" class="textarea" size="18" style="ime-mode:disabled;" valid="E|M=10|T=아이디|A=아이디를 입력해 주세요"/>
			</div>

			<div class="mt10 pl80">
				<img src="/mobileweb/html/images/bt_0027.jpg" border="0" align="absmiddle" id="btnIdCheck" style="cursor:pointer;"/><br/>
				<img src="/mobileweb/html/images/text_0021.jpg" align="absmiddle" id="ttt"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0009.jpg" />
				<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="18" style="ime-mode:disabled;" valid="E|M=10|T=패스워드|A=패스워드를 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0010.jpg" />
				<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="18" style="ime-mode:disabled;" valid="E|M=10|T=패스워드 확인|A=패스워드 확인을 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0011.jpg" />
				<input type="text" name="mem_nm" class="textarea" size="18" valid="E|M=10|T=성명|A=성명을 입력해 주세요"/>
			</div>

			<!-- <div class="mt20">
				<img src="/mobileweb/html/images/text_0012.jpg" />
				<span class="pl20"></span>
				<input type="radio" name="radio1" value="2" valid="E|A=성별을 선택해 주세요"/>여자&nbsp;&nbsp;
				<input type="radio" name="radio1" value="1" />남자
			</div> -->

			<!-- <div class="mt20">
				<img src="/mobileweb/html/images/text_0013.jpg" />
				<select name="Ybirth" class="textarea">
					<option value="">년</option>
				<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
					<option value="<%=num%>"><%=num%></option>
				<% Next %>
				</select>
				</label>
				<label>
				<select name="Mbirth" class="textarea">
					<option value="">월</option>
				<% For num=1 To 12 %>
					<option value="<%=num%>"><%=num%>월</option>
				<% Next %>
				</select>
				</label>
				<label>
				<select name="Dbirth" class="textarea">
					<option value="">일</option>
				<% For num=1 To 31 %>
					<option value="<%=num%>"><%=num%>일</option>
				<% Next %>
				</select>
			</div> -->

			<!-- <div class="mt20">
				<img src="/mobileweb/html/images/text_0014.jpg" />
				<select name="phone_1" class="textarea" style="height:35px;">
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
				-
				<input type="text" name="phone_2" class="textarea" size="3" maxlength="4" valid="E|A=전화번호를 입력해 주세요"/>
				-
				<input type="text" name="phone_3" class="textarea" size="3" maxlength="4" valid="E|A=전화번호를 입력해 주세요"/>
			</div> -->

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0015.jpg" />
				<select id="hp_1" name="hp_1" class="textarea" style="height:35px;">
					<option value="">선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				-
				<input type="text" id="hp_2" name="hp_2" class="textarea" size="3" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
				-
				<input type="text" id="hp_3" name="hp_3" class="textarea" size="3" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
			</div>

			<div class="mt10 pl80">
				<img src="/mobileweb/html/images/bt_0028.jpg" border="0" id="btnSms" style="cursor:pointer;"/>
				<input type="checkbox" name="check3" value="Y" checked /> SMS 수신동의
			</div>

			<div class="mt10 pl80">
				<input type="text" id="cert_num"  name="cert_num" maxlength="10" class="textarea" size="10"/>
				<img src="/mobileweb/html/images/bt_0029.jpg" style="margin-top:12px;" border="0"  valign="bottom" id="btnSmsCheck" style="cursor:pointer;"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0017.jpg" />
				<input type="text" name="email" class="textarea" size="18" valid="E|A=이메일 주소를 입력해 주세요"/>
			</div>

			<div class="mt10 pl80">
				<input type="checkbox" name="check4" value="Y" checked />이메일 수신동의 
			</div>

			<div class="mt20">
				<img src="/image/text_0085.png" />
				<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;" valid="E|A=지역을 선택해 주세요">
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
				<select id="part" name="part" class="textarea" style="height:35px;" valid="E|A=지점을 선택해 주세요">
					<option value="">지점선택</option>
				</select>
			</div>
			<div class="mt20">
				<img src="/mobileweb/html/images/text_0016.jpg" /><input type="text" id="post" name="post" class="textarea" size="6" valid="E|A= 우편번호를 입력해 주세요"/> <img src="/mobileweb/html/images/bt_0004.jpg" border="0" align="absmiddle" id="post_btn" style="margin-top:12px;cursor:pointer;" border="0"  valign="bottom" /><br>
				<span style="margin-left:74px;"></span> <input type="text" id="address1" name="address1" class="textarea"   valid="E|A= 주소를 입력해 주세요"/><br>
				<span style="margin-left:74px;"></span> <input type="text" id="address2" name="address2" class="textarea"   valid="E|A= 상세주소를 입력해 주세요"/>
			</div>


			<div class="mt20">
				<b style="font-size:11pt; color:#888999;">&lt;이용약관&gt;</b><br/>
				<textarea class="textarea3" style="width:90%; height:150px;">마더앤베이비 서비스 이용약관



제 1조 (목적)

이 약관은 웰니스인텔리전스㈜에서 제공되는 '마더앤베이비'의 인터넷 서비스, 임신출산관리 및 가정방문산후조리서비스(이하 '서비스'라 한다)를 이용함에 있어 서비스 이용자의 의무 및 책임사항을 규정함을 목적으로 합니다. 

제 2조 (정의)

1. '마더앤베이비'는 임신출산관리 및 가정방문산후조리 서비스 제공을 위해 관련 정보통신설비 및 영업장을 갖추고 '마더앤베이비'를 운영하는 사업자의 의미로 사용합니다.

2. '이용자'란 '마더앤베이비'의 서비스 이용약관에 따라 '마더앤베이비'가 제공하는 서비스를 이용하는 회원을 말합니다.

3. '회원'이라 함은 '마더앤베이비'에 개인정보를 제공하여 회원등록을 한 자로서, '마더앤베이비'의 정보를 지속적으로 제공받으며, '마더앤베이비'가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

제 3조 (약관의 명시와 개정)

1. '마더앤베이비'는 이 약관의 내용과 상호, 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 [운영되는 웹사이트]에 게시하고 이용 약관은 링크를 통하여 회원이 볼 수 있도록 합니다.

2. '마더앤베이비'는 약관의 규제에 관한 법률, 전자거래기본법, 정보통신망이용촉진 등에 관한 법률, 소비자보호법, 직업안정법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

3. '마더앤베이비'가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 [마더앤베이비 웹사이트] 에 그 적용일자 7일전부터 적용 일자 전일까지 공지합니다.

4. '마더앤베이비'가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관 조항이 그대로 적용됩니다. 다만, 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 '회사'에 송신하여 '회사'의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

5. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 상 관례에 따릅니다.

제 4조 (서비스 내용 및 범위)
1. '마더앤베이비' 서비스는 다음과 같은 서비스가 제공됩니다. 

가. 케어매니저 : 케어매니저(고객 담당자)는 고객과 정기적인 연락을 통해 상담을 제공합니다.

나. 전담 방문 간호사 : 회원님이 요청하시는 경우 간호사가 정기적으로 방문하여 산모의 기본 건강 사정을 제공하고 영양 및 운동에 관한 상담을 통해 바람직한 임신출산 기간을 보낼 수 있도록 지도합니다. 출산 이후에는 신생아의 건강 사정과 더불어 영양 및 수유에 관한 교육을 제공합니다. 

다. 산후관리사 : 전문적이고 체계적인 교육을 이수한 산후관리사는 산모와 신생아가 적절한 산후관리를 받으실 수 있도록 체계적인 서비스 제공 합니다. 서비스 제공의 주 내용은 산후 관리 및 신생아 돌보기를 기본으로 산모와 신생아 관련 영양 및 공간 관리, 가사 및 위생관리 전반 등 입니다. 또한 전담 방문 간호사 및 케어매니저와 함께 산모와 신생아 관련된 모든 정보를 공유하며, 양질의 서비스 제공 합니다.

라. 방문마사지 : 전문적이고 체계적인 교육을 이수하여 오랜 기간 산후 마사지 경력을 보유한 방문 마사지사는, 산모님들의 체계적인 산전/산후를 위하여 방문지도 및 마사지 업무를 수행합니다. 또한 원활한 산욕기를 보낼 수 있도록 모유수유 코치 및 바디케어 컨설팅을 수행합니다.
 
마. 부가서비스 지원 : 회원님의 필요에 따라 다양한 분야의 전문가들을 통해 부가서비스를 지원하며 베이비시터, 국제모유수유자격증자, 반찬도우미, 베이비시터, 가사도우미, 주거환경 점검을 통한 소독 및 청소 등의 서비스를 지원합니다.  

바. 주차별 맞춤정보 제공 : 회원님의 필요에 따라 회원님의 임신과 출산에 필요한 서비스와 유아동 및 출산용품의 정보를 임신 주차별로 마더앤베이비의 관계사 및 협력기관을 통하여 제공합니다.

3. '마더앤베이비'는 [마더앤베이비 웹사이트]를 통해 서비스 안내, 예약 서비스, 결제안내, 고객상담, 건강상담 등의 인터넷 서비스를 제공합니다.

4. [마더앤베이비 웹사이트] 운영자는 필요에 따라 제공하는 서비스의 내용을 변경할 수 있으며, 이 경우 변경된 서비스의 내용 및 제공일자를 명시하여 그 제공일자 이전 7일부터 공지합니다.

5. [마더앤베이비 웹사이트] 운영자는 서비스 내용의 변경으로 인하여 이용자가 입은 손해에 대하여 배상하지 아니합니다. 

6. [마더앤베이비 웹사이트]는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대해서 전자메일이나 서신우편, 전화, SMS, 푸시메일 등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.

7. [마더앤베이비 웹사이트]는 운영되는 장치의 보수점검, 교체 및 고장, 통신의 두절, 기타 불가항력적 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. 

8. [마더앤베이비 웹사이트] 제7항의 사유로 서비스 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여는 배상하지 아니합니다. 

제 5조 (예약)

1. 서비스 신청은 인터넷, 전화, 직접방문 등의 방법을 통해 가능하며, 서비스 신청 이후 7일 이내에 명시된 서비스 금액을 무통장 입금 또는 신용카드 등의 방법으로 납부한 후, 실명(신청자명 또는 입금자명)을 통보하여 입금확인을 함으로 예약이 완료됩니다. 

2. 서비스 이용금액 입금 확인 시, 회사는 이메일 또는 전화, SMS 등을 통해 이용자에게 입금 확인 통지를 합니다.

3. 서비스는 임신 20주부터 시작됨을 원칙으로 하고, 예약 시 규정된 서비스 이용금액이 입금되어야만 서비스가 시작될 수 있습니다.

제 6조 (서비스 이용계약의 성립)

1. ‘마더앤베이비’는 제5조와 같은 서비스 예약에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.
 가. 신청 내용에 허위, 고의적 기재누락 이 있는 경우
 나. 타인 명의를 무단 도용하여 신청한 경우
 다. 서비스 신청 후 일정기간 내에 이용금액의 결재가 완료되지 않은 경우
 라. 상담/제출서류에 허위가 있는 경우 
 마. 기타 '마더앤베이비'에 알릴 의무를 성실히 이행하지 아니한 경우

2. 서비스 이용계약은 이용자의 서비스 신청/예약에 대하여 제5조 제3항의 이용금액의 결재 확인 통지 형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. 단, 불 승낙 시 이용자에게 이용금액 환불 및 즉시 통보 조치합니다.

제 7조 (서비스 예약 변경)

분만일의 변동, 수술일자 변경, 서비스 이용기간 변경 등의 예약사항의 변동이 있을 시, 이용자 또는 이용자의 보호자는 최소 10일 이전에 반드시 '마더앤베이비'에 해당 사실을 통보하여야 합니다. 이를 소홀히 하여 서비스에 차질이 발생할 경우, '마더앤베이비'는 산모의 원활한 산후조리를 위해 성실의 의무를 다하나, 책임은 이용자가 집니다.

제 8조 (서비스 예약 취소 및 환불)

1. '마더앤베이비' 서비스는 산전에서부터 산후까지 다양한 맞춤 서비스가 제공됨으로 모든 서비스 제공은 예약제로 진행됩니다. 

2. 이용자는 부득이한 경우에 서비스 시작 전 예약을 취소 할 수 있습니다. 

3. 서비스 예약 취소는 이용자가 인터넷, 전화, 직접방문 등의 방법으로 예약 취소 의사를 밝히고, '마더앤베이비'가 이를 확인함으로써 이루어집니다. 

4. 고객님의 귀책사유로 서비스 예약취소 시 환불규정은 아래와 같습니다.

※    환불규정
가. 서비스 예약 취소는 출산예정일 15일 이전에 '마더앤베이비'에 통보함을 원칙으로 하며, 이 때 납입된 예약금은 전액 환불 됩니다. 

나. 출산예정일 15일 이전 임신 30주(7일 이전) : 예약금 전액 환불
 
  - 임신 31주 ~ 38주 : 제공된 서비스 및 지급된 상품 금액 제외한 예약금의 나머지 
금액 환불 

   - 임신 38주 ~ 분만 전 : 제공된 서비스 및 지급된 상품금액과 예약금의 20% 취소 수수료를 
제외한 나머지 금액 환불

- 분만 ~ 서비스 종료일 : 제공된 서비스와 지급된 상품금액 및 기간별 수수료를 제외한 나머지 금액 환불 

6. 회사는 부득이 한 경우(상품 변경, 유산, 사산, 조산 시)에 서비스 시작 전 이용자와 협의하여 예약을 취소할 수 있으며, 이 때 납입된 이용금액을 전액 환불합니다. 

제 9조 (서비스 이용요금 및 결제)

1. 서비스 이용요금은 '마더앤베이비'에서 정한 이용요금을 기준으로 하며, 고객과의 상담을 통해최종적인 서비스 예약 시 '마더앤베이비'와 이용자간 합의된 금액입니다. 

2. 서비스 예약 시 예약금은 서비스 신청일 기준으로 7일 이내에 무통장 또는 온라인결제로 납입하며 산후관리사 임금은 서비스 종료 시 고객님의 사정에 따라 산후관리사에게 직접 지불하거나 회사로 지급합니다. 단, 회사로 지급하는 경우에는 필요 양식과 기준에 따릅니다.

제 10조 (서비스 이용기간 및 연장)

1. 산후관리사 서비스 이용기간 은 최소 1주를 기본으로 하며, 주단위로 서비스가 제공됩니다.

2. 서비스 이용기간 연장/변경 신청 시, '마더앤베이비'는 연장/변경 가능여부를 확인하여 통보합니다. 

3. 서비스 이용기간 중에 이용자가 서비스 기간을 연장 할 경우 최소 해당 서비스 종료일로부터 7일 이전에 회사 또는 지사에 연장 요청해야 합니다.

4. '마더앤베이비'는 산후관리사의 일정에 지장이 없을 경우 기존 고객에게 선 배치 하나 산후관리사의 다음일정에 따라 동일한 산후관리사를 지원할 수 없을 수 있습니다. 단, 회사는 고객님의 의사와 조건에 부합되는 인력을 서비스 할 수 있도록 최선의 노력을 경주합니다.
 
제 11조 (서비스 중도 해지 및 환불)

1. 이용자 및 '마더앤베이비'는 다음의 경우 산후관리사 교체 또는 서비스 중도 해지를 요청할 수있습니다. 

 가. '마더앤베이비'에서 정한 서비스 프로그램을 특별한 사유 및 협의 없이 불이행한 경우

 나. 서비스가 불성실하여 만족스럽지 못하거나, 위생 및 청결상태가 양호하지 못할 경우

 다. 산후관리사가 의료행위를 하려 하거나 강요하는 경우
	- 산후관리사는 산모와 신생아를 대상으로 그 어떠한 의료행위도 할 수 없으며 이용자는 의료행위를 요구하거나 응해서는 안됩니다. 단, 전담 방문간호사는 해당자격이 있는 의료인으로서 간단한 응급처치를 포함하여 산모와 신생아의 건강 사정과 관련된 각종 신체 검진은 행해질 수 있습니다. 또한 산모와 신생아의 신체 검진 상 전문의 소견을 필요로 할 때에는 주치의 진료를 권유할 수 있습니다

 라. 이용자 및 이용자 가족과 산후관리사 사이에 원만한 서비스가 보장되지 아니할 경우

2. 산후관리사는 다음의 상황이 발생할 경우 서비스 잔여기간과 상관없이 회사의 판단으로 산후관리사 교체 및 서비스 중도해지를 할 수 있습니다.

가. 이용자 및 이용자 가족이 인격적 모독이나 신변의 위협을 느끼게 하는 경우

나. 서비스의 범위를 벗어나는 과도한 가사일을 요구하여 산후조리 서비스를 제대로 수행하기 힘들다고 판단되는 경우

다. 감기 등을 포함하여 일시적인 질병 발생시, 관혼상제 등 중대 사안이 발생한 경우

3. 서비스 중도 해지 및 환불은 부득이한 경우에 준하며, 서비스 중도 해지 시에는 실제 서비스 내역에 따라 회사와 협의하여 요금을 정산 지불합니다. 
 
제 12조 (산후조리 무료임대용품 이용)

1. 이용자는 서비스 이용기간 중 요청에 의해 회사에서 정한 산후조리용품을 무료로 임대하여 사용하실 수 있습니다. 단, 왕복 운임은 이용자 부담입니다.

2. 무료 임대 용품의 소유권은 '마더앤베이비'에 있으며, 서비스 종료 후 즉시 반납하여야 합니다.
 
3. 무료 임대 용품 이용 시, 이용자 및 이용자 가족의 과실로 인해 파손 또는 분실 시 이용자는 이를 현금 또는 동일한 물품으로 변상하여야 합니다. 

제 13조 (근무시간 및 의무)

1. 출퇴근형의 근무시간은 평일 09:00~18:00, 토요일 09:00~14:00, 일요일은 휴무입니다. 

2. 입주형의 근무시간은 일요일 19:00~토요일 16:00로 하며, 토요일 16:00~일요일 19:00(27시간)까지 휴무입니다. 단, 산후관리사의 안정적인 서비스를 위해 휴식시간을 부여해야 합니다. 이용자와 협의하여 결정하며 평균 8시간당 1시간의 휴식시간을 부여 합니다.
 
3. 주 5일 출퇴근형의 근무시간은 평일 09:00~18:00, 토/일요일은 휴무입니다.

4. 법정 공휴일은 휴무이며, 휴무된 기간만큼 자동 연장됩니다. 단, 휴무기간에 서비스 제공을 요청하시면 상황에 따라 상호 협의하여 근무를 실시하며 규정에 의해 휴일근무 비용이 추가로 발생합니다.

5. 고객센터 운영시간은 평일 09:00~18:00, 토요일, 일요일, 공휴일은 휴무입니다.

제 14조 (회원가입)

1. 이용자는 '회사'에서 정한 가입양식에 따라 회원정보를 가입한 후, 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.

2. '회사'는 다음 각 호에 해당하지 않는 한, 회원으로 등록합니다.

 가. 등록내용에 허위, 기재누락, 오기가 있는 경우

 나. 회원으로 등록하는 것이 '회사'의 업무수행상 현저히 지장이 있다고 판단하는 경우

제 15조 (회원 탈퇴 및 자격상실)

1. 회원은 언제든지 탈퇴를 요청할 수 있으며, '회사'는 즉시 탈퇴 처리합니다.

2. 다음 각 호에 해당하는 경우, '회사'는 회원자격을 제한 및 정지, 상실 시킬 수 있습니다.

 가. 가입 신청시 허위 내용을 등록한 경우

 나. 다른 사람의 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우

 다. '마더앤베이비 서비스'를 이용하여 공서양속에 반하는 행위를 하거나 법질서에 위배되는 행위를 하는 경우

 라. 회사에서 정한 약관을 위반한 경우

 마. 기타 부당한 목적으로 회원의 가입 탈퇴를 3회 이상 반복하는 경우

3. 회원탈퇴는 웹사이트 내에서 신청하며 고객상담센터에서 확인을 통해 진행됩니다.

4. [마더앤베이비 웹사이트]가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고 회원 등록 말소 전에 소명할 기회를 부여합니다. 단, 회원이 통지가 도달한 날로부터 7일 이내에 전자우편 등을 통해 ‘회사’에 이를 소명해야 합니다.

제 16조 (회원에 대한 통지)

1. '회사'가 서비스 제공 및 운영 관련 주요 공지사항을 회원에게 통지 하는 경우, 회원이 ‘회사에 제출한 전자우편 주소 및 휴대전화번호의 문자서비스, 직접전화로 수행 할 수 있습니다.

2. '회사'는 불특정 다수 회원에 대한 통지의 경우, 1주일 이상 '마더앤베이비' 웹사이트 공지 게시판에 게시함으로써 개별 통지를 갈음할 수 있습니다.

제 17조 (개인정보보호)

1. "회사"는 이용자의 정보수집 시 서비스 제공에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.

가. 성명
나. 주민등록번호 
다. 출산예정일
라. 가족사항
마. 주소
바. 자택전화번호/휴대전화번호
사. 비밀번호(회원의 경우)

2. "회사"는 서비스제공의 이유로 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.

3. 제공된 개인정보는 이용자의 동의 없이 별도의 목적으로 이용되거나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '회사'가 집니다. 단, 다음의 경우에는 예외로 합니다.
 
가. 산후관리사, 전담 방문간호사, 방문마사지사 및 무료임대용품 배송업체에게 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우

나. 통계작성, 학술연구 또는 시장조사를 위한 것으로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 

다. 체계적인 서비스 제공에 필요한 최소 정보를 협력기관과 공유하는 경우

4. '회사'는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 아래의 협력기관에 최소한의 개인정보를 제공하고 있으며, 회원은 이에 동의합니다.
가. 미앤체힐링맘스 : 모유수유 및 바디마사지 

5. '회사'는 개인정보 보호를 위하여 개인 정보 보호 책임자를 지정 운영합니다. 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리 책임자가 신고사항에 대해 신속하고 충분한 답변을 드릴 것 입니다.

개인정보관리 책임자 : 구자열
전화번호 : 02-557-3579
이메일 : kujalm5@gmail.com

제 18조 (고객상담센터 이용)

1. "마더앤베이비"의 고객상담센터를 통한 모든 상담은 반드시 이용자의 동의 후 녹취됩니다.

2. "마더앤베이비"의 고객상담센터는 동의 획득에 대한 녹취 기록을 통해서 그에 관련된 증빙자료로도 활용 가능합니다.

3. "마더앤베이비"의 고객상담센터는 질 높은 서비스 제공을 위해 동의된 녹취 내용을 토대로 아웃바운드 콜을 할 수 있습니다.

제 19조 (제공된 정보의 활용)

1. '회사'는 회원이 제공한 개인정보의 일부를 필요에 따라 공지사항 및 이벤트 진행 등에 활용할 수 있습니다.

2. '회사'는 회원에 대하여 보다 향상된 서비스 제공을 위해 아래의 제휴업체에서 제공하는 메일 서비스를 제공할 수 있으며, 회원은 이에 동의합니다.
가. 남양아이
나. 베이비타임즈
다. 더넥스트웨이브, 베이비타임즈

제 20조 (개인정보 보유 및 이용기간)

1. '회사'는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 

가. 회원가입정보의 경우 : 회원탈퇴하거나, 회원에서 제명된 때

나. 설문조사, 행사 등의 목적을 위하여 수집한 경우

제 21조 (손실보상)

1. '마더앤베이비'의 서비스 기간 중 산후관리사 및 전담방문간호사의 고의, 과실 등으로 인해 이용자에게 피해가 발생하였을 경우 이용자는 회사에서 가입한 ‘배상책임보험’에 의해 보상받을 수 있습니다. 

2. 이용자는 제21조 1항과 같은 상황이 발생할 시에 반드시 '마더앤베이비' 상담센터에 연락을 취하여 사항을 알리도록 합니다. 회사는 이용자로부터 접수 받은 사항을 내부 사정을 통해 파악 후 보험회사의 조사과정을 거친 후 손실이 입증되면 손해배상보험의 범위 내에서 경제적 손실을 보장합니다. 또한, 향후 문제 해결을 위해 그 어떤 상황에서라도 적극 협조합니다.

제 22조 (면책사항)

1. '마더앤베이비'는 이용자와의 공식 계약 범위(이용기간, 이용시간, 이용요금, 이용조건) 및 서비스 외에 이용자와 산후관리사, 방문마사지사 간의 임의의 거래행위에 대해서는 사고 및 민원 발생 시 그에 대한 일체의 민, 형사상 책임을 지지 않습니다. 

2. '마더앤베이비'와 산후관리사, 전담방문간호사는 산모의 건강회복과 신생아의 건강증진을 위해 주의 성실의 책무를 다해 서비스에 임하나, 그럼에도 불구하고 산모 또는 신생아에게 질병이 발생한 경우, 산후관리사의 고의 또는 중대한 과실에 의한 것으로 제3자에 의해 객관적으로 입증되지 않는 한, '마더앤베이비'나 산후관리사는 면책됩니다. 

3. '마더앤베이비'는 웹사이트상에서 하이퍼링크 방식으로 연결되어 있는 제휴업체 또는 타 업체가 독자적으로 제공하는 재화. 용역에 의하여 이용자와 행하는 거래에 대해 보증책임을 지지 않습니다.

제 23조 (저작권의 귀속 및 이용제한)

1. '마더앤베이비'가 작성한 저작물에 대한 저작권 기타 지적재산권은 '회사'에 귀속합니다.

2. 이용자는 '마더앤베이비'를 이용함으로써 얻은 정보를 '회사'의 사전 승낙 없이 복제, 송신,   출판, 배포, 방송기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.

제 24조 (분쟁해결)

1. '마더앤베이비'는 이용자가 제기하는 정당한 의견이나 불만을 접수하고 이의 해결을 위해 적극 노력합니다.

2. '마더앤베이비'는 이용자와 산후관리사간 분쟁이 있을 시, 원활한 해결을 위해 중재할 수 있습니다.

3. 쌍방의 과실이 명백히 입증되지 않는 어느 일방의 주장에 의한 도난 분실 등 사고 발생시, 사건 해결을 위해 관할 수사기관에 수사 의뢰하여 그 결과에 따라 처리합니다. 이때 문제 해결을 위해 필요한 정보를 제공합니다.

제 25조(관할기관 및 준거법)

1. '마더앤베이비'와 이용자간 발생한 분쟁의 관할은 서울중앙지방법원으로 합니다.

2. '마더앤베이비'와 이용자간 제기된 전자거래 소송에는 대한민국법을 적용합니다.

3. 본 약관에 없는 사항은 관습 또는 일반적인 상 관례에 준합니다.
				</textarea><br/>
				<input type="checkbox" name="check1" value="Y"/> 위의 약관에 동의합니다.
			</div>

			<div class="mt20">
				<b style="font-size:11pt; color:#888999;">&lt;개인정보취급방침&gt;</b><br/>
				<textarea class="textarea3" style="width:90%; height:150px;">마더앤베이비 개인정보취급방법


'웰니스인텔리전스㈜'는 (이하 '회사') 고객님의 개인정보를 중요시하며 "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. 

■ 수집하는 개인정보 항목 

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다. 

▷ 수집항목 : 이름, 생년월일, 성별, 로그인ID, 비밀번호, 비밀번호 질문과 답변, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 직업, 회사명, 부서, 직책, 회사전화번호, 취미, 결혼여부, 기념일, 가족사항, 출산예정일, 출산예정산부인과, 입실예정 산후조리원, 서비스 이용기록, 접속 로그, 접속 IP 정보, 결제기록

▷ 개인정보 수집방법 : 홈페이지(회원가입), 서면양식, 전화/팩스를 통한 회원가입, 경품행사응모, 상담게시판 外

■ 개인정보의 수집 및 이용목적 

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 
  
▷ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송

▷ 회원 관리 : 회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 고지사항 전달

▷ 고객상담센터 : 모든 상담은 반드시 이용자의 동의 후 녹취
- 상담 시 동의 획득에 대한 녹취 기록을 통해서 그에 관련된 증빙자료로 활용 가능
- 질 높은 서비스 제공을 위해 동의된 녹취 내용을 토대로 아웃바운드 콜 활용 

▷ 마케팅 및 광고에 활용 : 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 



▷ 회사는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 협력업체에 개인정보를 제공

▷ '회사'는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 아래의 제휴업체에서 제공하는 메일 서비스 제공

■ 개인정보의 보유 및 이용기간 

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. 

■ 개인정보의 파기절차 및 방법 

회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다. 

▷ 파기절차
회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기 되어 집니다. 

별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로 이용되지 않습니다. 

▷ 파기방법
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. 

■ 개인정보 제공 

회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.

- 이용자들이 사전에 동의한 경우

- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 

■ 수집한 개인정보의 위탁 

회사는 회원의 동의 없이 회원의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 합니다. 

■ 이용자 및 법정대리인의 권리와 그 행사방법 

- 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다.

- 이용자 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 '개인정보변경'(또는'회원정보수정'등)을 가입 해지(동의철회)를 위해서는 "회원탈퇴"를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치합니다. 

- 회원이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 합니다. 

- 회사는 회원 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 "개인정보의 보유 및 이용기간"에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리합니다.  

■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 

회원의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)'를 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 회원의 브라우저에 보내는 아주 작은 텍스트 파일로서 회원의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다.

▷ 쿠키 등 사용 목적
회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공하기 위한 자료로 이용됩니다.

회원은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 회원은 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수 있습니다. 다만, 회원님께서 쿠키 설치를 거부하셨을 경우 서비스 제공에 어려움이 있습니다.

■ 개인정보에 관한 민원서비스 

회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다. 
▷ 고객서비스담당 부서 : 마케팅팀
   전화번호 : 02-557-3579
▷ 개인정보관리책임자 성명 : 구자열
   전화번호 : 02-557-3579

서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. 

기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.
1. 개인분쟁조정위원회 (www.1336.or.kr/1336)
2. 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)
3. 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)
4. 경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)
				</textarea><br/>
				<input type="checkbox" name="check2" value="Y"/> 위의 개인정보 수집 및 이용에 동의합니다.
			</div>
			</form>
		</div>
	</div>

	<div class="mt20" style="width:100%;">
		<img src="/mobileweb/html/images/bt_0003.jpg" style="width:150px; height:40px;" border="0" id="btnSubmit" style="cursor:pointer;"/>
		<img src="/mobileweb/html/images/bt_0002.jpg" style="width:150px; height:40px;" border="0" onClick="location.reload();" style="cursor:pointer;"/>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

<form id="soFrm" name="soFrm" target="ifrm" method="post" action="/mobileweb/common/inc/sms_send.asp">
<input type="hidden" name="action" value="go">
<input type="hidden" name="type" value="join">
<input type="hidden" name="testflag" value="N">
<input type="hidden" name="rphone" value="">
</form>

</body>

<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var hp = "";
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSms = jQuery("#btnSms");
	var btnSmsCheck = jQuery("#btnSmsCheck");
	var btnSubmit = jQuery("#btnSubmit");
	var btnIdCheck = jQuery("#btnIdCheck");

	btnSmsCheck.click(function(){
		cert_num = jQuery("#cert_num").val();
		if (cert_num == ""){
			alert("인증번호를 입력해 주세요");
			jQuery("#cert_num").focus();
			return false;
		}else{
			jQuery.post("/mobileweb/common/inc/sms_check.asp",{"cert_num":cert_num,"hp":hp},function(data,testStatus){
				switch(data) {
					case("1") :
						alert('인증번호를 입력해 주세요');
					break;
					case("2") :
						alert('인증받을 핸드폰 번호를 입력해 주세요');
					break;
					case("3") :
						alert('인증 되었습니다.');
						jQuery("#smsCheck").val("Y");
					break;
					case("4") :
						alert('인증번호를 다시 확인해 주세요');
					break;
				}
			});
		}
	});

	btnSms.click(function(){
		hp_1 = jQuery("#hp_1").val();
		hp_2 = jQuery("#hp_2").val();
		hp_3 = jQuery("#hp_3").val();
		hp = hp_1 +"-"+ hp_2 +"-"+ hp_3

		if (hp_1 == "" || hp_2 == "" || hp_3 == "" ){
			alert("인증받을 핸드폰 번호를 입력해 주세요");
			jQuery("#hp_1").focus();
			return false;
		}else{
			jQuery("#soFrm").children("input").eq(3).val(hp);
			jQuery("#soFrm").submit();
		}
	});

	btnIdCheck.click(function(){
		var id = jQuery("#mem_id").val();
		if (!check_info(id,"아이디")){ return false }

		jQuery.post("/mobileweb/common/inc/check_id_ax.asp",{"mem_id":id},function(data,testStatus){
			switch(data) {
				case("1") :
					alert('사용하실 아이디를 입력해 주세요.');
					jQuery("#mem_id").focus();
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
		if (!check_info(id,"아이디")){ jQuery("#mem_id").focus(); return false }

		val = jQuery("#idCheck").val();
		if (val != "Y"){
			alert("아이디 중복체크를 해 주세요.");
			return false;
		}

		var pw = jQuery("#mem_pw").val();
		if (!check_info(pw,"패스워드")){ jQuery("#mem_pw").focus(); return false }

		mem_pw = jQuery("#mem_pw").val();
		mem_pw_check = jQuery("#mem_pw_check").val();
		if (mem_pw != mem_pw_check){
			alert('비밀번호를 다시 확인해 주세요');
			return false;
		}

		val = jQuery("#smsCheck").val();
		if (val != "Y"){
			alert("핸드폰 인증을 해 주세요.");
			return false;
		}

		if  (!checkForm(frm,tar)){ return false }
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_test_sql.asp"
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
		window.open("/mobileweb/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}

	function fncOpenZip_layer(){
            
		    jQuery.get("./pop_zipcode_ax.asp",{"type":"", "idx":""},function(data,testStatus){
         
		    if (data != ""){
				jQuery("#AreaZip").html(data);
			}

		});

		document.getElementById('AreaZip').style.display = "block";

    }

	function div1_closeLayer(IdName){
	 var pop = document.getElementById(IdName);
	 pop.style.display = "none";
	}

</script>

<script type="text/javascript" src="/mobileweb/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/mobileweb/common/inc/local_ax.asp?local="+val,"#part");
		//fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>

</html>