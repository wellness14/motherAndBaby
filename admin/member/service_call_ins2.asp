<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����û
'�� �� �� : service_ins.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
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

	'	���� ���� ȣ��   
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


	'	��� �Ҹ�ǰ ȣ��
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME, MO_CONSUMABLES_CATEGORY from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='M' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("MO_CONSUMABLES_NAME")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	��� �Ҹ�ǰ ����
	strSql = " select distinct MO_CONSUMABLES_SEQ, MO_CONSUMABLES_NAME from MO_CONSUMABLES where MO_CONSUMABLES_USE_YN = 'Y' and MO_CONSUMABLES_GUBUN ='S' order by MO_CONSUMABLES_SEQ desc"
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_sub = Rs.getRows()
	End If 
	Call RSClose(Rs)


	'	��� ��ǰ ȣ��
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

		/*���������*/
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
				  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
				   yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
				  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
				  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
			});

			$(".datepicker").attr("readonly", true);

			$("#addrsearch").click(function() {
				addrSearch($("#post"), $("#addr1"), $("#addr2"));
			}).css("cursor", "pointer");
		});

		function save() {
			/*if ($("#name").val() == "") {
				alert("�̸��� �Է��� �ּ���.");
				$("#name").focus();
				return;
			}

			if ($("#phone").val() == "") {
				alert("�ڵ����� �Է��� �ּ���.");
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
					// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

					// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
					// �������� ������ ���� ���� ��쿣 ����("")���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
					var fullAddr = ""; // ���� �ּ� ����
					var extraAddr = ""; // ������ �ּ� ����

					// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
					if (data.userSelectedType === "R") { // ����ڰ� ���θ� �ּҸ� �������� ���
						fullAddr = data.roadAddress;

					} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
						fullAddr = data.jibunAddress;
					}

					// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
					if(data.userSelectedType === "R"){
						//���������� ���� ��� �߰��Ѵ�.
						if(data.bname !== ""){
							extraAddr += data.bname;
						}
						// �ǹ����� ���� ��� �߰��Ѵ�.
						if(data.buildingName !== ""){
							extraAddr += (extraAddr !== "" ? ", " + data.buildingName : data.buildingName);
						}
						// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
						fullAddr += (extraAddr !== "" ? " ("+ extraAddr +")" : "");
					}

					// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
					//post.val(data.zonecode); //5�ڸ� �������ȣ ���
					post.val(data.postcode);
					addr1.val(fullAddr);

					// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
					addr2.val("");
					addr2.focus();

					// iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
					// (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
					document.getElementById("layer").style.display = "none";
				},
				width : "100%",
				height : "100%"
			}).embed(document.getElementById("layer"));

			document.getElementById("layer").style.display = "block";

			initLayerPosition();
		}

		function closeDaumPostcode() {
			// iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
			document.getElementById('layer').style.display = 'none';
		}

		function initLayerPosition(){
			var width = 300; //�����ȣ���񽺰� �� element�� width
			var height = 460; //�����ȣ���񽺰� �� element�� height
			var borderWidth = 1; //���ÿ��� ����ϴ� border�� �β�

			// ������ ������ ������ ���� element�� �ִ´�.
			document.getElementById('layer').style.width = width + 'px';
			document.getElementById('layer').style.height = height + 'px';
			document.getElementById('layer').style.border = borderWidth + 'px solid';
			// ����Ǵ� ������ ȭ�� �ʺ�� ���� ���� �����ͼ� �߾ӿ� �� �� �ֵ��� ��ġ�� ����Ѵ�.
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
				<strong>������ �������</strong>
				<i class="fa fa-cloud" aria-hidden="true"></i>
			</p>
			<p class="small">���Բ� �ش��ϴ� �κ��� üũ���ּ���. �������� ��㿡 ������ �˴ϴ�.</p>
		</div>
		<div class="write">
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="<%=mode%>">
			<input type="hidden" name="idx" value="<%=intIDX%>">
			<input type="hidden" name="local" value="<%=grpcd%>">

				<div class="consultRequestCont">
					<div class="q1">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>������</strong></div>
						<span>�̸�</span>
						<input type="text" name="name" id="name" maxlength="10" placeholder="�̸��� �Է����ּ���." value="<%=name%>" />
						<span>�ڵ���</span>
						<input type="text" name="phone" id="phone" maxlength="13" placeholder="��) 010-1234-5678" value="<%=phone%>">
						<span>��ȭ��ȣ</span>
						<input type="text" name="tel" id="tel" maxlength="13" placeholder="��) 02-1234-5678" value="<%=tel%>">
						<span class="addr">�ּ�</span><a id="addrsearch">�ּ�ã��</a>
						<input type="radio" name="addrtype" id="addrtype1" value="����" <% If addrtype = "����" Then %> checked <% End If %>><label for="addrtype1" class="myhome">����</label>
						<input type="radio" name="addrtype" id="addrtype2" value="ģ������" <% If addrtype = "ģ������" Then %> checked <% End If %>><label for="addrtype2" class="momhome">ģ������</label>
						<input type="radio" name="addrtype" id="addrtype3" value="�ô�����" <% If addrtype = "�ô�����" Then %> checked <% End If %>><label for="addrtype3" class="anothermomhome">�ô�����</label>
						<br/><br/>
						<input type="text" name="post" id="post" placeholder="�����ȣ" maxlength="3" style="width:100px;" value="<%=post%>">
						<input type="text" name="addr1" id="addr1" placeholder="�ּ�" maxlength="100" readonly value="<%=addr1%>">
						<input type="text" name="addr2" id="addr2" placeholder="���ּ�" maxlength="100" value="<%=addr2%>">
						<div class="dateLeft">
							<span>�и�������</span>
							<input type="text" name="schildbirth" class="datepicker" value="<%=schildbirth%>">
						</div>
						<div class="dateRight">
							<span>��꿹����</span>
							<input type="text" name="childbirth" class="datepicker" value="<%=childbirth%>">
						</div>
						
						<div class="left">
							<span class="delivery">�и�����</span><br/>
							<input type="radio" name="bmtype" id="bmtype1" value="�ڿ��и�" <% If bmtype = "�ڿ��и�" Then %> checked <% End If %>>
							<label for="bmtype1" class="nature">�ڿ��и�</label>
							<input type="radio" name="bmtype" id="bmtype2" value="��������" <% If bmtype = "��������" Then %> checked <% End If %>>
							<label for="bmtype2">��������</label>
						</div>
						<div class="right">
							<span>�Ʊ⼺��</span><br/>
							<input type="radio" name="gender" id="gender1" value="����" <% If gender = "����" Then %> checked <% End If %>>
							<label for="gender1" class="sex">����</label>
							<input type="radio" name="gender" id="gender2" value="����" <% If gender = "����" Then %> checked <% End If %>>
							<label for="gender2">����</label>
						</div>
						<label for="twins">�ֵ��� : </label>
						<input type="text" class="twins" name="twins" id="twins" maxlength="1" value="<%=twins%>">��
						<label class="weight" for="weight">ü�� : </label>
						<input type="text" class="weight" name="weight" id="weight" maxlength="5" value="<%=weight%>">kg
						<label class="natalhospital" for="natalhospital">�и����� : </label>
						<input type="text" class="natalhospital" name="natalhospital" id="natalhospital" maxlength="50" value="<%=natalhospital%>">
					</div>
					<div class="q2">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>���α׷�</strong></div>
						<span class="carecenter">����������</span><br/>
						<input type="radio" name="carecenteruse" id="carecenteruse1" value="�ƴϿ�" <% If carecenteruse = "�ƴϿ�" Then %> checked <% End If %>>
						<label for="carecenteruse1" class="nope">�ƴϿ�</label>
						<input type="radio" name="carecenteruse" id="carecenteruse2" value="��" <% If carecenteruse = "��" Then %> checked <% End If %>>
						<label for="carecenteruse2">�� - </label>
						������ �ԼұⰣ<input type="text" class="term" name="term" maxlength="2" value="<%=term%>">�� / 
						<label for="centername">������������ :</label>
						<input type="text" class="centername" name="centername" id="centername" maxlength="50" value="<%=centername%>">
						<span>���񽺽ǽ� ������</span><br/>
						<input type="text" class="excuteday datepicker" name="servicedt" value="<%=servicedt%>"><br/>
						<span>���Ͻô� ���� ���α׷��� �����Դϱ�?</span><br/>
						<span class="career">�� ������ ��±���</span><br/>
						<input type="radio" class="vip" name="managercareer" id="managercareer1" value="VIP" <% If managercareer = "VIP" Then %> checked <% End If %>><label for="managercareer1" class="mr">VIP</label>
						<input type="radio" name="managercareer" id="managercareer2" value="�����̾�" <% If managercareer = "�����̾�" Then %> checked <% End If %>><label for="managercareer2" class="mr">�����̾�</label>
						<input type="radio" name="managercareer" id="managercareer3" value="������" <% If managercareer = "������" Then %> checked <% End If %>><label for="managercareer3">������</label><br/>
						<span class="voucher">�� �ٿ�ó</span><br/>
						<input type="radio" class="typea" name="voucher" id="voucher1" value="A-����" <% If voucher = "A-����" Then %> checked <% End If %>><label for="voucher1" class="mr">A-����</label>
						<input type="radio" name="voucher" id="voucher2" value="A-����" <% If voucher = "A-����" Then %> checked <% End If %>><label for="voucher2" class="mr">A-����</label>
						<input type="radio" name="voucher" id="voucher3" value="A-����" <% If voucher = "A-����" Then %> checked <% End If %>><label for="voucher3" class="mr">A-����</label>
						<input type="radio" name="voucher" id="voucher4" value="A-����" <% If voucher = "A-����" Then %> checked <% End If %>><label for="voucher4" class="mr">A-����</label>
						<input type="radio" name="voucher" id="voucher5" value="B-����" <% If voucher = "B-����" Then %> checked <% End If %>><label for="voucher5" class="mr">B-����</label>
						<input type="radio" name="voucher" id="voucher6" value="B-����" <% If voucher = "B-����" Then %> checked <% End If %>><label for="voucher6" class="mr">B-����</label>
						<input type="radio" name="voucher" id="voucher7" value="B-����" <% If voucher = "B-����" Then %> checked <% End If %>><label for="voucher7" class="mr">B-����</label>
						<input type="radio" name="voucher" id="voucher8" value="B-����" <% If voucher = "B-����" Then %> checked <% End If %>><label for="voucher8">B-����</label><br/>
						<span class="focus">�� ���߰������α׷�</span><br/>
						<input type="checkbox" class="first" name="careprogram1" value="�����̺�" <% If careprogram1 = "�����̺�" Then %> checked <% End If %>>�����̺�</input>
						[<input type="radio" name="private" id="private1" value="�����" <% If careprogram1_private = "�����" Then %> checked <% End If %>><label for="private1">�����</label>
						<input type="radio" name="private" id="private2" value="����" <% If careprogram1_private = "����" Then %> checked <% End If %>><label for="private2">����</label>]<br/>
						<input type="checkbox" class="first" name="careprogram2" value="��ŷ��" <% If careprogram2 = "��ŷ��" Then %> checked <% End If %>>��ŷ��</input>
						[<input type="radio" name="workingmom" id="workingmom1" value="�����" <% If careprogram2_workingmom = "�����" Then %> checked <% End If %>><label for="workingmom1">�����</label>
						<input type="radio" name="workingmom" id="workingmom2" value="����" <% If careprogram2_workingmom = "����" Then %> checked <% End If %>><label for="workingmom2">����</label>]<br/>
						<input type="checkbox" class="first" name="careprogram3" value="������������ ������" <% If careprogram3 = "������������ ������" Then %> checked <% End If %>>������������ ������</input>
						[<input type="radio" name="carecenterhome" id="carecenterhome1" value="�����" <% If careprogram3_carecenterhome = "�����" Then %> checked <% End If %>><label for="carecenterhome1">�����</label>
						<input type="radio" name="carecenterhome" id="carecenterhome2" value="����" <% If careprogram3_carecenterhome = "����" Then %> checked <% End If %>><label for="carecenterhome2">����</label>]<br/>
						<input type="checkbox" class="first" name="careprogram4" value="35���̻� [�����]" <% If careprogram4 = "35���̻� [�����]" Then %> checked <% End If %>>35���̻� [�����]</input><br/>
						<input type="checkbox" class="first" name="careprogram5" value="��ü�� [�����]" <% If careprogram5 = "��ü�� [�����]" Then %> checked <% End If %>>��ü�� [�����]</input><br/>
						<span class="whatservice">���� ���� �� ����ٰ� ���ּ����� � ���� �̿��� ���Ͻʴϱ�?</span><br/>
						<input type="radio" name="period" id="period1" value="�����5��" <% If period = "�����5��" Then %> checked <% End If %>><label for="period1" class="mr">�����5��</label>
						<input type="radio" name="period" id="period2" value="�����6��" <% If period = "�����6��" Then %> checked <% End If %>><label for="period2" class="mr">�����6��</label>
						<input type="radio" name="period" id="period3" value="����5��" <% If period = "����5��" Then %> checked <% End If %>><label for="period3" class="mr">����5��</label>
						<input type="radio" name="period" id="period4" value="����6��" <% If period = "����6��" Then %> checked <% End If %>><label for="period4" class="mr">����6��</label>
						<input type="radio" name="period" id="period5" value="����" <% If period = "����" Then %> checked <% End If %>><label for="period5">����</label><input type="text" class="small" name="periodinweek" id="periodinweek" maxlength="2" value="<%=periodinweek%>">��/<input type="text" class="small" name="periodinday" id="periodinday" maxlength="2" value="<%=periodinday%>">�� +
						<label for="period5">�����</label><input type="text" class="small" name="periodoutweek" id="periodoutweek" maxlength="2" value="<%=periodoutweek%>">��/<input type="text" class="small" name="periodoutday" id="periodoutday" maxlength="2" value="<%=periodoutday%>">��
						<span class="whatweek">���İ����� ���񽺴� �� �ָ� ���Ͻʴϱ�?</span><br/>
						<input type="radio" name="serviceweek" id="serviceweek1" value="1��" <% If serviceweek = "1��" Then %> checked <% End If %>><label for="serviceweek1" class="whatweek">1��</label>
						<input type="radio" name="serviceweek" id="serviceweek2" value="2��" <% If serviceweek = "2��" Then %> checked <% End If %>><label for="serviceweek2" class="whatweek">2��</label>
						<input type="radio" name="serviceweek" id="serviceweek3" value="3��" <% If serviceweek = "3��" Then %> checked <% End If %>><label for="serviceweek3" class="whatweek">3��</label>
						<input type="radio" name="serviceweek" id="serviceweek4" value="4��" <% If serviceweek = "4��" Then %> checked <% End If %>><label for="serviceweek4" class="whatweek">4��</label>
						<input type="radio" name="serviceweek" id="serviceweek5" value="��Ÿ" <% If serviceweek = "��Ÿ" Then %> checked <% End If %>><label for="serviceweek5">��Ÿ</label>(<input type="text" class="small" name="serviceweeketc" id="serviceweeketc" maxlength="2" value="<%=serviceweeketc%>">)��<br/>
						
						<span class="anotherFam">�߰���������</span><br/>
						<input type="checkbox" name="addfamily" value="�ʻ�" <% If InStr(addfamily, "�ʻ�") > 0 Then %>checked<% End If %>>�ʻ�
						<input type="checkbox" name="addfamily" value="���" <% If InStr(addfamily, "���") > 0 Then %>checked<% End If %>>���
						������(<input type="text" class="small" name="addfamily1" maxlength="2" value="<%=addfamily1%>">��), ����(<input type="text" class="small" name="addfamily2" maxlength="2" value="<%=addfamily2%>">��), �θ��(<input type="text" class="small" name="addfamily3" maxlength="2" value="<%=addfamily3%>">��), ��Ÿ(<input type="text" class="small" name="addfamily4" maxlength="2" value="<%=addfamily4%>">��), �ݷ�����(<input type="text" class="small" name="addfamily5" maxlength="2" value="<%=addfamily5%>">����)<br/>
						<label for="addcost">�߰��ݾ� : </label>
						<input type="text" class="addGold" name="addcost" id="addcost" maxlength="10" value="<%=addcost%>">��<br/>
						<label for="etccost">��Ÿ�ݾ� : </label>
						<input type="text" class="addGold" name="etccost" id="etccost" maxlength="10" value="<%=etccost%>">��<br/>
						<span class="whatTendency">������� �����縦 ���Ͻʴϱ�?(�������� ���� �־����� �����Դϱ�?)</span><br/>
						<input type="checkbox" name="tendency" id="tendency1" value="�Ż��ƺ���" <% If InStr(tendency, "�Ż��ƺ���") > 0 Then %>checked<% End If %>><label for="tendency1" class="mr">�Ż��ƺ���</label>
						<input type="checkbox" name="tendency" id="tendency2" value="��������" <% If InStr(tendency, "��������") > 0 Then %>checked<% End If %>><label for="tendency2" class="mr">��������</label>
						<input type="checkbox" name="tendency" id="tendency3" value="���ĺ���" <% If InStr(tendency, "���ĺ���") > 0 Then %>checked<% End If %>><label for="tendency3" class="mr">���ĺ���</label>
						<input type="checkbox" name="tendency" id="tendency4" value="�Ļ��غ�" <% If InStr(tendency, "�Ļ��غ�") > 0 Then %>checked<% End If %>><label for="tendency4" class="mr">�Ļ��غ�</label>
						<input type="checkbox" name="tendency" id="tendency5" value="��������" <% If InStr(tendency, "��������") > 0 Then %>checked<% End If %>><label for="tendency5" class="mr">��������</label>
						<input type="checkbox" name="tendency" id="tendency6" value="ū���̺���" <% If InStr(tendency, "ū���̺���") > 0 Then %>checked<% End If %>><label for="tendency6" class="mr">ū���̺���</label>
						<input type="checkbox" name="tendency" id="tendency7" value="�ֵ���" <% If InStr(tendency, "�ֵ���") > 0 Then %>checked<% End If %>><label for="tendency7">�ֵ���</label>
					</div>
					<div class="q3">
						<div class="title"><strong><i class="fa fa-chevron-circle-right" aria-hidden="true"></i>��Ÿ</strong></div>
						<span class="select">��,���� ��ǰ����(�ù�� ���κδ�)</span><br/>
						�����
						<select name="product1">
							<option value="">����</option>
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
							<option value="">����</option>
							<%
								vCnt = UBOUND(arrProdt_sub,2)
									For num = 0 To vCnt
							 %>
							<option value="<%=arrProdt_sub(1,num)%>" <% If product2 = arrProdt_sub(1,num) Then %> selected <% End If %>><%=arrProdt_sub(1,num)%></option>
							<%	 
								 Next 
							%>
						 </select>
						<input type="text" class="small" name="productweek" maxlength="2" value="<%=productweek%>">��<input type="text" class="won" name="productcost" maxlength="10" value="<%=productcost%>">��<br/>
						�����<input type="text" class="josa datepicker" name="productjosa" value="<%=productjosa%>"><br/>
						<span class="massage">���Ÿ�����</span><br/>
						<label for="wholemassagebefore">����</label><input type="text" class="small1" name="wholemassagebefore" id="wholemassagebefore" maxlength="2" value="<%=wholemassagebefore%>">ȸ
						<label for="wholemassageafter" class="ml">����</label><input type="text" class="small1" name="wholemassageafter" id="wholemassageafter" maxlength="2" value="<%=wholemassageafter%>">ȸ
						<label for="wholemassageadd" class="ml">�߰�</label><input type="text" class="small1" name="wholemassageadd" id="wholemassageadd" maxlength="2" value="<%=wholemassageadd%>">ȸ<br/>
						<span class="massage">�湮��ȣ��</span><br/>
						<label for="visitnursebefore">����</label><input type="text" class="small1" name="visitnursebefore" id="visitnursebefore" maxlength="2" value="<%=visitnursebefore%>">ȸ
						<label for="visitnurseafter" class="ml">����</label><input type="text" class="small1" name="visitnurseafter" id="visitnurseafter" maxlength="2" value="<%=visitnurseafter%>">ȸ<br/>
						<span class="massage">�ҵ�����</span><br/>
						<input type="radio" name="disinfect" id="disinfect1" value="�̽�û" <% If disinfect = "�̽�û" Then %> checked <% End If %>><label for="disinfect1">�̽�û</label>
						<input type="radio" name="disinfect" id="disinfect2" value="��û" <% If disinfect = "��û" Then %> checked <% End If %>><label for="disinfect2">��û</label>
						<br/>
						<span>��꼱������</span>
						<select name="gift" id="gift">
							<option value="">����</option>
							<%
								vCnt = UBOUND(arr_Gift_Prodt,2)

								For num = 0 To vCnt
							 %>
									<option value="<%=arr_Gift_Prodt(1,num)%>" <% If gift = arr_Gift_Prodt(1,num) Then %> selected <% End If %>><%=arr_Gift_Prodt(1,num)%></option>
							<%	 
								 Next 
							%>
						</select>
						<span class="deliverydate">�ù���</span>
						<input type="text" class="small2 datepicker" name="giftdate" value="<%=giftdate%>">�������̺�<input type="checkbox" name="paulsbaby" id="paulsbaby" value="Y" <% If paulsbaby = "Y" Then %> checked <% End If %>><br/>
						<span>��꼱���ڽ� �ù���</span>
						<input type="text" class="delidate datepicker" name="giftboxdate" value="<%=giftboxdate%>"><br/>
						<span class="massage">�ϰ������</span><br/>
						<textarea name="comment" id="comment" cols="30" rows="10" maxlength="1000"><%=comment%></textarea><br/>
						<span class="massage">������ ����</span><br/>
						<input type="checkbox" name="explain1" id="explain1" value="�����, ���ֽð�" <% If explain1 = "�����, ���ֽð�" Then %> checked <% End If %>>
						<label for="explain1" class="mr">�����, ���ֽð�</label>
						<input type="checkbox" name="explain2" id="explain2" value="���ϼ���" <% If explain2 = "���ϼ���" Then %> checked <% End If %>>
						<label for="explain2" class="mr">���ϼ���</label>
						<input type="checkbox" name="explain3" id="explain3" value="�޽Ľð�" <% If explain3 = "�޽Ľð�" Then %> checked <% End If %>>
						<label for="explain3" class="mr">�޽Ľð�</label>
						<input type="checkbox" name="explain4" id="explain4" value="Ȩ������ ���Կ���" <% If explain4 = "Ȩ������ ���Կ���" Then %> checked <% End If %>>
						<label for="explain4">Ȩ������ ���Կ���</label><br/><br/><br/><br/>
						
						<span class="massage">��Ÿ</span><br/>
						<label class="etc" for="etccost1">�����</label>(<input type="text" class="small4" name="etccost1" id="etccost1" maxlength="10" value="<%=etccost1%>">)<br/>
						<label class="etc" for="etccost2">�Ѿ�</label>(<input type="text" class="small4" name="etccost2" id="etccost2" maxlength="10" value="<%=etccost2%>">)<br/>
						<label class="etc" for="etccost3">�ܱ�</label>(<input type="text" class="small4" name="etccost3" id="etccost3" maxlength="10" value="<%=etccost3%>">)<br/>
						<label class="etc" for="etccost4">�߰���</label>(<input type="text" class="small4" name="etccost4" id="etccost4" maxlength="10" value="<%=etccost4%>">)
					</div>
					<div class="btnwrap">
						<a href="javascript:save();" class="save">����</a>
						<a href="javascript:reset();" class="cancel">���</a>
					</div>
				</div>
			</form>
			<iframe id="ifrm" name="ifrm" width="0" height="0" style="width:100%;height:500px;" frameborder="1"></iframe>
		</div>
	</div>

	<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
		<img src="http://i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="�ݱ� ��ư">
	</div>
</body>