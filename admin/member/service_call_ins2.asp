<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_ins.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
	Dim mode : mode = "ins"
	
	intIDX = fncRequest("idx")
	local = fncRequest("local")   

    If intIDX <> "" Then
		strTable = " FROM MO_COUNSELLING_RECORD WITH(NOLOCK) "

		strWhere = " WHERE MO_SEQ = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")

		If Not Rs.EOF Then
			mode = "upd"

			name = Rs("MO_NAME")
			phone = Rs("MO_PHONE")
			tel = Rs("MO_TEL")
			addrtype = Rs("MO_ADDR_TYPE")
			post = Rs("MO_POST")
			addr1 = Rs("MO_ADDR1")
			addr2 = Rs("MO_ADDR2")
			schildbirth = Rs("MO_SCHE_CHILD_DATE")
			childbirth = Rs("MO_CHILD_DATE")
			bmtype = Rs("MO_CHILDBIRTH_TYPE")
			gender = Rs("MO_BABY_GENDER")
			twins = Rs("MO_BABY_TWINS")
			weight = Rs("MO_BABY_WEIGHT")
			natalhospital = Rs("MO_CHILDBIRTH_HOSPITAL")
			carecenteruseArr = Split(Rs("MO_CARECENTER_USE"), "|")
			carecenteruse = carecenteruseArr(0)
			term = carecenteruseArr(1)
			centername = carecenteruseArr(2)
			servicedt = Rs("MO_SERVICE_SCHE_DATE")
			managercareer = Rs("MO_MANAGER_CAREER")
			voucher = Rs("MO_VOUCHER")
			careprogram1Arr = Split(Rs("MO_FOCUS_PROGRAM1"), " [")
			careprogram1 = careprogram1Arr(0)
			careprogram1_private = Replace(careprogram1Arr(1), "]", "")
			careprogram2Arr = Split(Rs("MO_FOCUS_PROGRAM2"), " [")
			careprogram2 = careprogram2Arr(0)
			careprogram2_workingmom = Replace(careprogram2Arr(1), "]", "")
			careprogram3Arr = Split(Rs("MO_FOCUS_PROGRAM3"), " [")
			careprogram3 = careprogram3Arr(0)
			careprogram3_carecenterhome = Replace(careprogram3Arr(1), "]", "")
			careprogram4 = Rs("MO_FOCUS_PROGRAM4")
			careprogram5 = Rs("MO_FOCUS_PROGRAM5")
			periodArr = Split(Rs("MO_SERVICE_TYPE"), "|")
			period = periodArr(0)
			periodinweek = periodArr(1)
			periodinday = periodArr(2)
			periodoutweek = periodArr(3)
			periodoutday = periodArr(4)
			serviceweekArr = Split(Rs("MO_SERVICE_WEEK"), "|")
			serviceweek = serviceweekArr(0)
			serviceweeketc = serviceweekArr(1)
			addfamilyArr = Split(Rs("MO_ADD_FAMILY"), "|")
			addfamily = addfamilyArr(0)
			addfamily1 = addfamilyArr(1)
			addfamily2 = addfamilyArr(2)
			addfamily3 = addfamilyArr(3)
			addfamily4 = addfamilyArr(4)
			addfamily5 = addfamilyArr(5)
			addfamily6 = addfamilyArr(6)
			addcost = Rs("MO_ADD_COST")
			etccost = Rs("MO_ETC_COST")
			tendency = Rs("MO_TENDENCY_MANAGER")
			product1 = Rs("MO_BREAST_PUMP1")
			product2 = Rs("MO_BREAST_PUMP2")
			productweek = Rs("MO_BREAST_PUMP_WEEK")
			productcost = Rs("MO_BREAST_PUMP_COST")
			productjosa = Rs("MO_BREAST_PUMP_JOSA")
			wholemassagebefore = Rs("MO_WHOLE_MASSAGE_BEFORE")
			wholemassageafter = Rs("MO_WHOLE_MASSAGE_AFTER")
			wholemassageadd = Rs("MO_WHOLE_MASSAGE_ADD")
			visitnursebefore = Rs("MO_VISIT_NURSE_BEFORE")
			visitnurseafter = Rs("MO_VISIT_NURSE_AFTER")
			disinfect = Rs("MO_DISINFECT")
			gift = Rs("MO_GIFT")
			giftdate = Rs("MO_GIFT_DATE")
			paulsbaby = Rs("MO_GIFT_PAULS_BABY")
			giftboxdate = Rs("MO_GIFTBOX_DATE")
			comment = Rs("MO_COMMENT")
			explainArr = Split(Rs("MO_EXPLAIN"), "|")
			explain1 = explainArr(0)
			explain2 = explainArr(1)
			explain3 = explainArr(2)
			explain4 = explainArr(3)
			etccost1 = Rs("MO_ETC_COST1")
			etccost2 = Rs("MO_ETC_COST2")
			etccost3 = Rs("MO_ETC_COST3")
			etccost4 = Rs("MO_ETC_COST4")
		End If

		Call RSClose(Rs)
	End If

	'	지점 정보 호출   
	If intIDX <> "" Then
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
	Else
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
	End If


	'	등록 소모품 호출
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME, MO_CONSUMABLES_CATEGORY from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='M' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MO_CONSUMABLES_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	등록 소모품 보조
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='S' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_sub = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	등록 상품 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_NAME from MO_RESERVATION_GIFT order by MD_GIFT_NAME asc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MD_GIFT_NAME")
		arr_Gift_Prodt = Rs.getRows()
	End If 
	Call RSClose(Rs)
%>
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
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

		/*고객상담일지*/
		#container .consultRequestHeader{width:100%;height:200px;background-color:#ff9b9b;text-align:center;}
		#container .consultRequestHeader p.h2{padding-top:60px;text-align:center;}
		#container .consultRequestHeader p.h2 strong{color:white;width:100%;font-size:40px;font-weight:bold;}
		#container .consultRequestHeader p.h2 i{font-size:45px;color:white;padding:0 20px;}
		#container .consultRequestHeader p.small{font-size:14px;color:white;padding:10px 0;text-align:center;}

	.consultRequestCont{width:800px;margin:0 auto;}	
	.q1{padding:10px 0;width:100%;}
	.title{font-size: 20px;padding:30px 0 30px 0;}
	.title strong{font-size: 30px;}
	.title i{padding-right:10px;font-size: 28px;}
	.q1 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q1 span.addr{display: inline-block;}
	.q1 input[type="text"],input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q1 input[type="date"]{width:90%;}
	.q1 input[type="radio"]{margin-right:5px;}
	.q1 a{display: inline-block;padding:10px;background-color: pink;text-decoration: none;color:white;margin: 0 20px;box-shadow: 0px 3px 5px rgba(0,0,0,0.3)}
	.q1 input.addr01{margin-top: 10px;margin-bottom: 20px;}
	.q1 .dateLeft{float: left;width:50%;}
	.q1 .dateLeft input{width:80%;}
	.q1 .dateRight{float: right;width:50%;}
	.q1 .dateRight input{width:80%;}
	.q1 input.twins{width:50px;height:30px;text-align: center;}
	.q1 input.weight{width:50px;height:30px;margin-top: 30px;text-align: center;}
	.q1 label{margin-right:20px;}
	.q1 label.weight{margin-left: 100px;}
	.q1 label.natalhospital{margin-left: 65px;}
	.q1 input.natalhospital{width:200px;height: 30px;}
	.q1 span.delivery{margin-bottom: 20px;}
	.q1 label.nature,label.sex{height:40px;display: inline-block;}
	.q1 .left{float: left;width:50%;}
	.q1 .right{float: right;width:50%;}
	.q1 .right span{margin-bottom: 20px;}

	.q2{padding:10px 0;width:100%;}
	.q2 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q2 input[type="radio"],.q2 input[type="checkbox"]{margin-right:5px;}
	.q2 input[type="text"],input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q2 span.carecenter{margin-bottom: 20px;}
	.q2 input.term{width:40px;height:30px;text-align: center;}
	.q2 input.centername{width:330px;}
	.q2 input[type="date"]{margin-top: 20px;}
	.q2 span.career, span.focus, span.voucher{margin: 30px 0 20px 30px;}
	.q2 input.vip{margin-left: 30px;}
	.q2 input.typea{margin-left: 30px;}
	.q2 input.vip{margin-left: 30px;}
	.q2 input.first{margin-left: 30px;margin-bottom: 15px;}
	.q2 span.whatservice{margin-top: 30px;}
	.q2 input.small{width:40px;height:30px;text-align: center;margin-top: 20px;}
	.q2 label.mr{margin-right: 18px;}
	.q2 label.whatweek{margin-right: 18px;}
	.q2 span.whatweek{margin-bottom: 10px;}
	.q2 span.anotherFam{margin-bottom: 20px;}
	.q2 span.whatTendency{margin-bottom: 20px;}
	.q2 input.addGold{width:200px;}
	.q2 input.excuteday{width:200px;}
	.q2 label.nope{margin-right: 20px;}

	.q3{padding-bottom: 50px;}
	.q3 .title{margin-top: 30px;}
	.q3 span{display: inline-block;padding:10px;background-color: #e8e8e8;color:#232323;font-weight: bold;font-size:14px;}
	.q3 input[type="radio"]{margin-right:5px;}
	.q3 input[type="text"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:100%;margin:0 0 40px 0;}
	.q3 input[type="date"]{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:615px;margin:0 0 40px 0;margin-left: 20px;}
	.q3 input.delidate{border:none;border-bottom:1px solid rgba(0,0,0,0.5);height:40px;width:550px;margin:0 0 40px 0;margin-left: 30px;}
	.q3 .select{margin-bottom: 20px;}
	.q3 input.josa{width:200px;margin-left: 20px;}
	.q3 select{width:180px;height:40px;margin-left: 15px;}
	.q3 input.small{width:40px;height:30px;text-align: center;margin-top: 20px;margin-left: 20px;}
	.q3 input.small1{width:40px;height:30px;text-align: center;margin-top: 20px;}
	.q3 input.small2{width:200px;height:30px;text-align: center;margin-top: 20px;margin-right: 20px;}
	.q3 input.small3{width:120px;height:30px;text-align: center;margin-top: 20px;margin-right: 20px;}
	.q3 input.small4{width:120px;height:30px;text-align: center;margin-top: 20px;}
	.q3 input.won{width:120px;height:30px;text-align: center;margin-top: 20px;margin-left: 10px;}
	.q3 span.massage{margin-bottom: 20px;}
	.q3 .ml{margin-left: 30px;}
	.q3 span.deliverydate{margin-left: 20px;margin-top: 30px;}
	.q3 input.delidate{width:200px;}
	.q3 textarea{width:100%;height:200px;margin-bottom: 30px;}
	.q3 .noask{margin-right:20px;}

	.btnwrap{width:300px;margin:0 auto;padding-bottom: 100px;}
	.btnwrap a{display: block;width:100px;height:40px;text-align: center;line-height: 40px;text-decoration: none;box-shadow: 0px 3px 5px rgba(0,0,0,0.3)}
	.btnwrap a.save{float: left;background-color: pink;color:white;}
	.btnwrap a.cancel{float: right;background-color: rgba(0,0,0,0.5);color:white;}

	.mr{margin-right:20px;}
	label.etc{width:70px;display:inline-block;}

	</style>

	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.0.js"></script>
	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	<script type="text/javascript" src="/common/js/frm_common.js"></script>
	<script type="text/javascript" src="/common/js/ajax_common.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {	   
			$(".datepicker").datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				   yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
				  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			});

			$(".datepicker").attr("readonly", true);

			$("#addrsearch").click(function() {
				addrSearch($("#post"), $("#addr1"), $("#addr2"));
			}).css("cursor", "pointer");
		});

		function save() {
			/*if ($("#name").val() == "") {
				alert("이름을 입력해 주세요.");
				$("#name").focus();
				return;
			}

			if ($("#phone").val() == "") {
				alert("핸드폰을 입력해 주세요.");
				$("#phone").focus();
				return;
			}*/
			

			$("#oFrm").attr("target", "ifrm");
			$("#oFrm").attr("action", "service_call_sql2.asp");
			$("#oFrm").submit();
		}

		function reset() {
			window.location.href = window.location.href;
		}

		function addrSearch(post, addr1, addr2) {
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
					//post.val(data.zonecode); //5자리 새우편번호 사용
					post.val(data.postcode);
					addr1.val(fullAddr);

					// 커서를 상세주소 필드로 이동한다.
					addr2.val("");
					addr2.focus();

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					document.getElementById("layer").style.display = "none";
				},
				width : "100%",
				height : "100%"
			}).embed(document.getElementById("layer"));

			document.getElementById("layer").style.display = "block";

			initLayerPosition();
		}

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			document.getElementById('layer').style.display = 'none';
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
	</script>
</head>

<body>
	<div id="container">
		<div class="consultRequestHeader">
			<p class="h2">
				<i class="fa fa-cloud" aria-hidden="true"></i>
				<strong>고객예약 상담일지</strong>
				<i class="fa fa-cloud" aria-hidden="true"></i>
			</p>
			<p class="small">고객님께 해당하는 부분을 체크해주세요. 디테일한 상담에 도움이 됩니다.</p>
		</div>
		<div class="write">
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<input type="hidden" name="local" value="<%=grpcd%>">

				<div class="consultRequestCont">
					<div class="q1">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>고객정보</strong></div>
						<span>이름</span>
						<input type="text" name="name" id="name" maxlength="10" placeholder="이름을 입력해주세요." value="<%=name%>" />
						<span>핸드폰</span>
						<input type="text" name="phone" id="phone" maxlength="13" placeholder="예) 010-1234-5678" value="<%=phone%>">
						<span>전화번호</span>
						<input type="text" name="tel" id="tel" maxlength="13" placeholder="예) 02-1234-5678" value="<%=tel%>">
						<span class="addr">주소</span><a id="addrsearch">주소찾기</a>
						<input type="radio" name="addrtype" id="addrtype1" value="자택" <% If addrtype = "자택" Then %> checked <% End If %>><label for="addrtype1" class="myhome">자택</label>
						<input type="radio" name="addrtype" id="addrtype2" value="친정조리" <% If addrtype = "친정조리" Then %> checked <% End If %>><label for="addrtype2" class="momhome">친정조리</label>
						<input type="radio" name="addrtype" id="addrtype3" value="시댁조리" <% If addrtype = "시댁조리" Then %> checked <% End If %>><label for="addrtype3" class="anothermomhome">시댁조리</label>
						<br/><br/>
						<input type="text" name="post" id="post" placeholder="우편번호" maxlength="3" style="width:100px;" value="<%=post%>">
						<input type="text" name="addr1" id="addr1" placeholder="주소" maxlength="100" readonly value="<%=addr1%>">
						<input type="text" name="addr2" id="addr2" placeholder="상세주소" maxlength="100" value="<%=addr2%>">
						<div class="dateLeft">
							<span>분만예정일</span>
							<input type="text" name="schildbirth" class="datepicker" value="<%=schildbirth%>">
						</div>
						<div class="dateRight">
							<span>출산예정일</span>
							<input type="text" name="childbirth" class="datepicker" value="<%=childbirth%>">
						</div>
						
						<div class="left">
							<span class="delivery">분만형태</span><br/>
							<input type="radio" name="bmtype" id="bmtype1" value="자연분만" <% If bmtype = "자연분만" Then %> checked <% End If %>>
							<label for="bmtype1" class="nature">자연분만</label>
							<input type="radio" name="bmtype" id="bmtype2" value="제왕절개" <% If bmtype = "제왕절개" Then %> checked <% End If %>>
							<label for="bmtype2">제왕절개</label>
						</div>
						<div class="right">
							<span>아기성별</span><br/>
							<input type="radio" name="gender" id="gender1" value="남자" <% If gender = "남자" Then %> checked <% End If %>>
							<label for="gender1" class="sex">남자</label>
							<input type="radio" name="gender" id="gender2" value="여자" <% If gender = "여자" Then %> checked <% End If %>>
							<label for="gender2">여자</label>
						</div>
						<label for="twins">쌍둥이 : </label>
						<input type="text" class="twins" name="twins" id="twins" maxlength="1" value="<%=twins%>">명
						<label class="weight" for="weight">체중 : </label>
						<input type="text" class="weight" name="weight" id="weight" maxlength="5" value="<%=weight%>">kg
						<label class="natalhospital" for="natalhospital">분만병원 : </label>
						<input type="text" class="natalhospital" name="natalhospital" id="natalhospital" maxlength="50" value="<%=natalhospital%>">
					</div>
					<div class="q2">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>프로그램</strong></div>
						<span class="carecenter">산후조리원</span><br/>
						<input type="radio" name="carecenteruse" id="carecenteruse1" value="아니오" <% If carecenteruse = "아니오" Then %> checked <% End If %>>
						<label for="carecenteruse1" class="nope">아니오</label>
						<input type="radio" name="carecenteruse" id="carecenteruse2" value="예" <% If carecenteruse = "예" Then %> checked <% End If %>>
						<label for="carecenteruse2">예 - </label>
						조리원 입소기간<input type="text" class="term" name="term" maxlength="2" value="<%=term%>">주 / 
						<label for="centername">산후조리원명 :</label>
						<input type="text" class="centername" name="centername" id="centername" maxlength="50" value="<%=centername%>">
						<span>서비스실시 예정일</span><br/>
						<input type="text" class="excuteday datepicker" name="servicedt" value="<%=servicedt%>"><br/>
						<span>원하시는 서비스 프로그램은 무엇입니까?</span><br/>
						<span class="career">⊙ 관리사 경력기준</span><br/>
						<input type="radio" class="vip" name="managercareer" id="managercareer1" value="VIP" <% If managercareer = "VIP" Then %> checked <% End If %>><label for="managercareer1" class="mr">VIP</label>
						<input type="radio" name="managercareer" id="managercareer2" value="프리미엄" <% If managercareer = "프리미엄" Then %> checked <% End If %>><label for="managercareer2" class="mr">프리미엄</label>
						<input type="radio" name="managercareer" id="managercareer3" value="베이직" <% If managercareer = "베이직" Then %> checked <% End If %>><label for="managercareer3">베이직</label><br/>
						<span class="voucher">⊙ 바우처</span><br/>
						<input type="radio" class="typea" name="voucher" id="voucher1" value="A-가형" <% If voucher = "A-가형" Then %> checked <% End If %>><label for="voucher1" class="mr">A-가형</label>
						<input type="radio" name="voucher" id="voucher2" value="A-나형" <% If voucher = "A-나형" Then %> checked <% End If %>><label for="voucher2" class="mr">A-나형</label>
						<input type="radio" name="voucher" id="voucher3" value="A-다형" <% If voucher = "A-다형" Then %> checked <% End If %>><label for="voucher3" class="mr">A-다형</label>
						<input type="radio" name="voucher" id="voucher4" value="A-라형" <% If voucher = "A-라형" Then %> checked <% End If %>><label for="voucher4" class="mr">A-라형</label>
						<input type="radio" name="voucher" id="voucher5" value="B-가형" <% If voucher = "B-가형" Then %> checked <% End If %>><label for="voucher5" class="mr">B-가형</label>
						<input type="radio" name="voucher" id="voucher6" value="B-나형" <% If voucher = "B-나형" Then %> checked <% End If %>><label for="voucher6" class="mr">B-나형</label>
						<input type="radio" name="voucher" id="voucher7" value="B-다형" <% If voucher = "B-다형" Then %> checked <% End If %>><label for="voucher7" class="mr">B-다형</label>
						<input type="radio" name="voucher" id="voucher8" value="B-라형" <% If voucher = "B-라형" Then %> checked <% End If %>><label for="voucher8">B-라형</label><br/>
						<span class="focus">⊙ 집중관리프로그램</span><br/>
						<input type="checkbox" class="first" name="careprogram1" value="프라이빗" <% If careprogram1 = "프라이빗" Then %> checked <% End If %>>프라이빗</input>
						[<input type="radio" name="private" id="private1" value="출퇴근" <% If careprogram1_private = "출퇴근" Then %> checked <% End If %>><label for="private1">출퇴근</label>
						<input type="radio" name="private" id="private2" value="입주" <% If careprogram1_private = "입주" Then %> checked <% End If %>><label for="private2">입주</label>]<br/>
						<input type="checkbox" class="first" name="careprogram2" value="워킹맘" <% If careprogram2 = "워킹맘" Then %> checked <% End If %>>워킹맘</input>
						[<input type="radio" name="workingmom" id="workingmom1" value="출퇴근" <% If careprogram2_workingmom = "출퇴근" Then %> checked <% End If %>><label for="workingmom1">출퇴근</label>
						<input type="radio" name="workingmom" id="workingmom2" value="입주" <% If careprogram2_workingmom = "입주" Then %> checked <% End If %>><label for="workingmom2">입주</label>]<br/>
						<input type="checkbox" class="first" name="careprogram3" value="산후조리원을 내집에" <% If careprogram3 = "산후조리원을 내집에" Then %> checked <% End If %>>산후조리원을 내집에</input>
						[<input type="radio" name="carecenterhome" id="carecenterhome1" value="출퇴근" <% If careprogram3_carecenterhome = "출퇴근" Then %> checked <% End If %>><label for="carecenterhome1">출퇴근</label>
						<input type="radio" name="carecenterhome" id="carecenterhome2" value="입주" <% If careprogram3_carecenterhome = "입주" Then %> checked <% End If %>><label for="carecenterhome2">입주</label>]<br/>
						<input type="checkbox" class="first" name="careprogram4" value="35세이상 [출퇴근]" <% If careprogram4 = "35세이상 [출퇴근]" Then %> checked <% End If %>>35세이상 [출퇴근]</input><br/>
						<input type="checkbox" class="first" name="careprogram5" value="과체중 [출퇴근]" <% If careprogram5 = "과체중 [출퇴근]" Then %> checked <% End If %>>과체중 [출퇴근]</input><br/>
						<span class="whatservice">서비스 내용 중 출퇴근과 입주서비스중 어떤 서비스 이용을 원하십니까?</span><br/>
						<input type="radio" name="period" id="period1" value="출퇴근5일" <% If period = "출퇴근5일" Then %> checked <% End If %>><label for="period1" class="mr">출퇴근5일</label>
						<input type="radio" name="period" id="period2" value="출퇴근6일" <% If period = "출퇴근6일" Then %> checked <% End If %>><label for="period2" class="mr">출퇴근6일</label>
						<input type="radio" name="period" id="period3" value="입주5일" <% If period = "입주5일" Then %> checked <% End If %>><label for="period3" class="mr">입주5일</label>
						<input type="radio" name="period" id="period4" value="입주6일" <% If period = "입주6일" Then %> checked <% End If %>><label for="period4" class="mr">입주6일</label>
						<input type="radio" name="period" id="period5" value="선택" <% If period = "선택" Then %> checked <% End If %>><label for="period5">입주</label><input type="text" class="small" name="periodinweek" id="periodinweek" maxlength="2" value="<%=periodinweek%>">주/<input type="text" class="small" name="periodinday" id="periodinday" maxlength="2" value="<%=periodinday%>">일 +
						<label for="period5">출퇴근</label><input type="text" class="small" name="periodoutweek" id="periodoutweek" maxlength="2" value="<%=periodoutweek%>">주/<input type="text" class="small" name="periodoutday" id="periodoutday" maxlength="2" value="<%=periodoutday%>">일
						<span class="whatweek">산후관리사 서비스는 몇 주를 원하십니까?</span><br/>
						<input type="radio" name="serviceweek" id="serviceweek1" value="1주" <% If serviceweek = "1주" Then %> checked <% End If %>><label for="serviceweek1" class="whatweek">1주</label>
						<input type="radio" name="serviceweek" id="serviceweek2" value="2주" <% If serviceweek = "2주" Then %> checked <% End If %>><label for="serviceweek2" class="whatweek">2주</label>
						<input type="radio" name="serviceweek" id="serviceweek3" value="3주" <% If serviceweek = "3주" Then %> checked <% End If %>><label for="serviceweek3" class="whatweek">3주</label>
						<input type="radio" name="serviceweek" id="serviceweek4" value="4주" <% If serviceweek = "4주" Then %> checked <% End If %>><label for="serviceweek4" class="whatweek">4주</label>
						<input type="radio" name="serviceweek" id="serviceweek5" value="기타" <% If serviceweek = "기타" Then %> checked <% End If %>><label for="serviceweek5">기타</label>(<input type="text" class="small" name="serviceweeketc" id="serviceweeketc" maxlength="2" value="<%=serviceweeketc%>">)주<br/>
						
						<span class="anotherFam">추가가족여부</span><br/>
						<input type="checkbox" name="addfamily" value="초산" <% If InStr(addfamily, "초산") > 0 Then %>checked<% End If %>>초산
						<input type="checkbox" name="addfamily" value="경산" <% If InStr(addfamily, "경산") > 0 Then %>checked<% End If %>>경산
						미취학(<input type="text" class="small" name="addfamily1" maxlength="2" value="<%=addfamily1%>">명), 취학(<input type="text" class="small" name="addfamily2" maxlength="2" value="<%=addfamily2%>">명), 부모님(<input type="text" class="small" name="addfamily3" maxlength="2" value="<%=addfamily3%>">명), 기타(<input type="text" class="small" name="addfamily4" maxlength="2" value="<%=addfamily4%>">명), 반려동물(<input type="text" class="small" name="addfamily5" maxlength="2" value="<%=addfamily5%>">마리)<br/>
						<label for="addcost">추가금액 : </label>
						<input type="text" class="addGold" name="addcost" id="addcost" maxlength="10" value="<%=addcost%>">원<br/>
						<label for="etccost">기타금액 : </label>
						<input type="text" class="addGold" name="etccost" id="etccost" maxlength="10" value="<%=etccost%>">원<br/>
						<span class="whatTendency">어떤성향의 관리사를 원하십니까?(관리사의 업무 주안점은 무엇입니까?)</span><br/>
						<input type="checkbox" name="tendency" id="tendency1" value="신생아보육" <% If InStr(tendency, "신생아보육") > 0 Then %>checked<% End If %>><label for="tendency1" class="mr">신생아보육</label>
						<input type="checkbox" name="tendency" id="tendency2" value="모유수유" <% If InStr(tendency, "모유수유") > 0 Then %>checked<% End If %>><label for="tendency2" class="mr">모유수유</label>
						<input type="checkbox" name="tendency" id="tendency3" value="산후복귀" <% If InStr(tendency, "산후복귀") > 0 Then %>checked<% End If %>><label for="tendency3" class="mr">산후복귀</label>
						<input type="checkbox" name="tendency" id="tendency4" value="식사준비" <% If InStr(tendency, "식사준비") > 0 Then %>checked<% End If %>><label for="tendency4" class="mr">식사준비</label>
						<input type="checkbox" name="tendency" id="tendency5" value="가사위생" <% If InStr(tendency, "가사위생") > 0 Then %>checked<% End If %>><label for="tendency5" class="mr">가사위생</label>
						<input type="checkbox" name="tendency" id="tendency6" value="큰아이보육" <% If InStr(tendency, "큰아이보육") > 0 Then %>checked<% End If %>><label for="tendency6" class="mr">큰아이보육</label>
						<input type="checkbox" name="tendency" id="tendency7" value="쌍둥이" <% If InStr(tendency, "쌍둥이") > 0 Then %>checked<% End If %>><label for="tendency7">쌍둥이</label>
					</div>
					<div class="q3">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>기타</strong></div>
						<span class="select">유,무료 물품선택(택배비 본인부담)</span><br/>
						유축기
						<select name="product1">
							<option value="">선택</option>
							<%
								vCnt = UBOUND(arrProdt,2)

								For num = 0 To vCnt
							 %>
									<option value="<%=arrProdt(1,num)%>" <% If product1 = arrProdt(1,num) Then %> selected <% End If %>><%=arrProdt(1,num)%></option>
							<%	 
								 Next 
							%>
						</select>
						<select name="product2">
							<option value="">선택</option>
							<%
								vCnt = UBOUND(arrProdt_sub,2)
									For num = 0 To vCnt
							 %>
							<option value="<%=arrProdt_sub(1,num)%>" <% If product2 = arrProdt_sub(1,num) Then %> selected <% End If %>><%=arrProdt_sub(1,num)%></option>
							<%	 
								 Next 
							%>
						 </select>
						<input type="text" class="small" name="productweek" maxlength="2" value="<%=productweek%>">주<input type="text" class="won" name="productcost" maxlength="10" value="<%=productcost%>">원<br/>
						조사기<input type="text" class="josa datepicker" name="productjosa" value="<%=productjosa%>"><br/>
						<span class="massage">전신마사지</span><br/>
						<label for="wholemassagebefore">산전</label><input type="text" class="small1" name="wholemassagebefore" id="wholemassagebefore" maxlength="2" value="<%=wholemassagebefore%>">회
						<label for="wholemassageafter" class="ml">산후</label><input type="text" class="small1" name="wholemassageafter" id="wholemassageafter" maxlength="2" value="<%=wholemassageafter%>">회
						<label for="wholemassageadd" class="ml">추가</label><input type="text" class="small1" name="wholemassageadd" id="wholemassageadd" maxlength="2" value="<%=wholemassageadd%>">회<br/>
						<span class="massage">방문간호사</span><br/>
						<label for="visitnursebefore">산전</label><input type="text" class="small1" name="visitnursebefore" id="visitnursebefore" maxlength="2" value="<%=visitnursebefore%>">회
						<label for="visitnurseafter" class="ml">산후</label><input type="text" class="small1" name="visitnurseafter" id="visitnurseafter" maxlength="2" value="<%=visitnurseafter%>">회<br/>
						<span class="massage">소독서비스</span><br/>
						<input type="radio" name="disinfect" id="disinfect1" value="미신청" <% If disinfect = "미신청" Then %> checked <% End If %>><label for="disinfect1">미신청</label>
						<input type="radio" name="disinfect" id="disinfect2" value="신청" <% If disinfect = "신청" Then %> checked <% End If %>><label for="disinfect2">신청</label>
						<br/>
						<span>출산선물선택</span>
						<select name="gift" id="gift">
							<option value="">선택</option>
							<%
								vCnt = UBOUND(arr_Gift_Prodt,2)

								For num = 0 To vCnt
							 %>
									<option value="<%=arr_Gift_Prodt(1,num)%>" <% If gift = arr_Gift_Prodt(1,num) Then %> selected <% End If %>><%=arr_Gift_Prodt(1,num)%></option>
							<%	 
								 Next 
							%>
						</select>
						<span class="deliverydate">택배일</span>
						<input type="text" class="small2 datepicker" name="giftdate" value="<%=giftdate%>">폴스베이비<input type="checkbox" name="paulsbaby" id="paulsbaby" value="Y" <% If paulsbaby = "Y" Then %> checked <% End If %>><br/>
						<span>출산선물박스 택배일</span>
						<input type="text" class="delidate datepicker" name="giftboxdate" value="<%=giftboxdate%>"><br/>
						<span class="massage">하고싶은말</span><br/>
						<textarea name="comment" id="comment" cols="30" rows="10" maxlength="1000"><%=comment%></textarea><br/>
						<span class="massage">설명할 사항</span><br/>
						<input type="checkbox" name="explain1" id="explain1" value="출퇴근, 입주시간" <% If explain1 = "출퇴근, 입주시간" Then %> checked <% End If %>>
						<label for="explain1" class="mr">출퇴근, 입주시간</label>
						<input type="checkbox" name="explain2" id="explain2" value="휴일수당" <% If explain2 = "휴일수당" Then %> checked <% End If %>>
						<label for="explain2" class="mr">휴일수당</label>
						<input type="checkbox" name="explain3" id="explain3" value="휴식시간" <% If explain3 = "휴식시간" Then %> checked <% End If %>>
						<label for="explain3" class="mr">휴식시간</label>
						<input type="checkbox" name="explain4" id="explain4" value="홈페이지 가입여부" <% If explain4 = "홈페이지 가입여부" Then %> checked <% End If %>>
						<label for="explain4">홈페이지 가입여부</label><br/><br/><br/><br/>
						
						<span class="massage">기타</span><br/>
						<label class="etc" for="etccost1">예약금</label>(<input type="text" class="small4" name="etccost1" id="etccost1" maxlength="10" value="<%=etccost1%>">)<br/>
						<label class="etc" for="etccost2">총액</label>(<input type="text" class="small4" name="etccost2" id="etccost2" maxlength="10" value="<%=etccost2%>">)<br/>
						<label class="etc" for="etccost3">잔금</label>(<input type="text" class="small4" name="etccost3" id="etccost3" maxlength="10" value="<%=etccost3%>">)<br/>
						<label class="etc" for="etccost4">추가금</label>(<input type="text" class="small4" name="etccost4" id="etccost4" maxlength="10" value="<%=etccost4%>">)
					</div>
					<div class="btnwrap">
						<a href="javascript:save();" class="save">저장</a>
						<a href="javascript:reset();" class="cancel">취소</a>
					</div>
				</div>
			</form>
			<iframe id="ifrm" name="ifrm" width="0" height="0" style="width:100%;height:500px;" frameborder="1"></iframe>
		</div>
	</div>

	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="http://i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>
</body>