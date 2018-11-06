<%
'======================================================================
'업 무 명 : 마더앤베이 - 서비스
'모듈기능 : 회원 가입
'파 일 명 : member_sql.asp
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
	mode = fncRequest("mode")
	seq = Trim(fncRequest("idx"))
	name = Trim(fncRequest("name"))
	phone = Trim(fncRequest("phone"))
	tel = Trim(fncRequest("tel"))
	addrtype = Trim(fncRequest("addrtype"))
	post = Trim(fncRequest("post"))
	addr1 = Trim(fncRequest("addr1"))
	addr2 = Trim(fncRequest("addr2"))
	schildbirth = Trim(fncRequest("schildbirth"))
	childbirth = Trim(fncRequest("childbirth"))
	bmtype = Trim(fncRequest("bmtype"))
	gender = Trim(fncRequest("gender"))
	twins = Trim(fncRequest("twins"))
	weight = Trim(fncRequest("weight"))
	natalhospital = Trim(fncRequest("natalhospital"))
	carecenteruse = Trim(fncRequest("carecenteruse"))
	term = Trim(fncRequest("term"))
	centername = Trim(fncRequest("centername"))
	carecenteruse = carecenteruse & "|" & term & "|" & centername
	servicedt = Trim(fncRequest("servicedt"))
	managercareer = Trim(fncRequest("managercareer"))
	voucher = Trim(fncRequest("voucher"))
	careprogram1 = Trim(fncRequest("careprogram1"))
	careprogram1_private = Trim(fncRequest("private"))
	careprogram1 = careprogram1 & " [" & careprogram1_private & "]"
	careprogram2 = Trim(fncRequest("careprogram2"))
	careprogram2_workingmom = Trim(fncRequest("workingmom"))
	careprogram2 = careprogram2 & " [" & careprogram2_workingmom & "]"
	careprogram3 = Trim(fncRequest("careprogram3"))
	careprogram3_carecenterhome = Trim(fncRequest("carecenterhome"))
	careprogram3 = careprogram3 & " [" & careprogram3_carecenterhome & "]"
	careprogram4 = Trim(fncRequest("careprogram4"))
	careprogram5 = Trim(fncRequest("careprogram5"))
	period = Trim(fncRequest("period"))
	periodinweek = Trim(fncRequest("periodinweek"))
	periodinday = Trim(fncRequest("periodinday"))
	periodoutweek = Trim(fncRequest("periodoutweek"))
	periodoutday = Trim(fncRequest("periodoutday"))
	period = period & "|" & periodinweek & "|" & periodinday & "|" & periodoutweek & "|" & periodoutday
	serviceweek = Trim(fncRequest("serviceweek"))
	serviceweeketc = Trim(fncRequest("serviceweeketc"))
	serviceweek = serviceweek & "|" & serviceweeketc
	addfamily = Trim(fncRequest("addfamily"))
	addfamily1 = Trim(fncRequest("addfamily1"))
	addfamily2 = Trim(fncRequest("addfamily2"))
	addfamily3 = Trim(fncRequest("addfamily3"))
	addfamily4 = Trim(fncRequest("addfamily4"))
	addfamily5 = Trim(fncRequest("addfamily5"))
	addfamily = addfamily & "|" & addfamily1 & "|" & addfamily2 & "|" & addfamily3 & "|" & addfamily4 & "|" & addfamily5
	addcost = Trim(fncRequest("addcost"))
	etccost = Trim(fncRequest("etccost"))
	tendency = Trim(fncRequest("tendency"))
	product1 = Trim(fncRequest("product1"))
	product2 = Trim(fncRequest("product2"))
	productweek = Trim(fncRequest("productweek"))
	productcost = Trim(fncRequest("productcost"))
	productjosa = Trim(fncRequest("productjosa"))
	wholemassagebefore = Trim(fncRequest("wholemassagebefore"))
	wholemassageafter = Trim(fncRequest("wholemassageafter"))
	wholemassageadd = Trim(fncRequest("wholemassageadd"))
	visitnursebefore = Trim(fncRequest("visitnursebefore"))
	visitnurseafter = Trim(fncRequest("visitnurseafter"))
	disinfect = Trim(fncRequest("disinfect"))
	gift = Trim(fncRequest("gift"))
	giftdate = Trim(fncRequest("giftdate"))
	paulsbaby = Trim(fncRequest("paulsbaby"))
	giftboxdate = Trim(fncRequest("giftboxdate"))
	comment = Trim(fncRequest("comment"))
	explain1 = Trim(fncRequest("explain1"))
	explain2 = Trim(fncRequest("explain2"))
	explain3 = Trim(fncRequest("explain3"))
	explain4 = Trim(fncRequest("explain4"))
	explain = explain1 & "|" & explain2 & "|" & explain3 & "|" & explain4
	etccost1 = Trim(fncRequest("etccost1"))
	etccost2 = Trim(fncRequest("etccost2"))
	etccost3 = Trim(fncRequest("etccost3"))
	etccost4 = Trim(fncRequest("etccost4"))
	id = fncRequestCookie("userid")
	ip = Request.ServerVariables("REMOTE_ADDR")
	
	If mode = "ins" Then
		strSql = " INSERT INTO dbo.MO_COUNSELLING_RECORD "
		strSql = strSql & " ( "
		strSql = strSql & " MO_NAME "
		strSql = strSql & " , MO_PHONE "
		strSql = strSql & " , MO_TEL "
		strSql = strSql & " , MO_POST "
		strSql = strSql & " , MO_ADDR1 "
		strSql = strSql & " , MO_ADDR2 "
		strSql = strSql & " , MO_ADDR_TYPE "
		strSql = strSql & " , MO_SCHE_CHILD_DATE "
		strSql = strSql & " , MO_CHILD_DATE "
		strSql = strSql & " , MO_CHILDBIRTH_TYPE "
		strSql = strSql & " , MO_BABY_GENDER "
		strSql = strSql & " , MO_BABY_TWINS "
		strSql = strSql & " , MO_BABY_WEIGHT "
		strSql = strSql & " , MO_CHILDBIRTH_HOSPITAL "
		strSql = strSql & " , MO_CARECENTER_USE "
		strSql = strSql & " , MO_SERVICE_SCHE_DATE "
		strSql = strSql & " , MO_MANAGER_CAREER "
		strSql = strSql & " , MO_VOUCHER "
		strSql = strSql & " , MO_FOCUS_PROGRAM1 "
		strSql = strSql & " , MO_FOCUS_PROGRAM2 "
		strSql = strSql & " , MO_FOCUS_PROGRAM3 "
		strSql = strSql & " , MO_FOCUS_PROGRAM4 "
		strSql = strSql & " , MO_FOCUS_PROGRAM5 "
		strSql = strSql & " , MO_SERVICE_TYPE "
		strSql = strSql & " , MO_SERVICE_WEEK "
		strSql = strSql & " , MO_ADD_FAMILY "
		strSql = strSql & " , MO_ADD_COST "
		strSql = strSql & " , MO_ETC_COST "
		strSql = strSql & " , MO_TENDENCY_MANAGER "
		strSql = strSql & " , MO_BREAST_PUMP1 "
		strSql = strSql & " , MO_BREAST_PUMP2 "
		strSql = strSql & " , MO_BREAST_PUMP_WEEK "
		strSql = strSql & " , MO_BREAST_PUMP_COST "
		strSql = strSql & " , MO_BREAST_PUMP_JOSA "
		strSql = strSql & " , MO_WHOLE_MASSAGE_BEFORE "
		strSql = strSql & " , MO_WHOLE_MASSAGE_AFTER "
		strSql = strSql & " , MO_WHOLE_MASSAGE_ADD "
		strSql = strSql & " , MO_VISIT_NURSE_BEFORE "
		strSql = strSql & " , MO_VISIT_NURSE_AFTER "
		strSql = strSql & " , MO_DISINFECT "
		strSql = strSql & " , MO_GIFT "
		strSql = strSql & " , MO_GIFT_DATE "
		strSql = strSql & " , MO_GIFT_PAULS_BABY "
		strSql = strSql & " , MO_GIFTBOX_DATE "
		strSql = strSql & " , MO_COMMENT "
		strSql = strSql & " , MO_EXPLAIN "
		strSql = strSql & " , MO_ETC_COST1 "
		strSql = strSql & " , MO_ETC_COST2 "
		strSql = strSql & " , MO_ETC_COST3 "
		strSql = strSql & " , MO_ETC_COST4 "
		strSql = strSql & " , MO_REG_ID "
		strSql = strSql & " , MO_REG_IP "
		strSql = strSql & " , MO_MOD_ID "
		strSql = strSql & " , MO_MOD_IP "
		strSql = strSql & " ) "
		strSql = strSql & " VALUES "
		strSql = strSql & " ( "
		strSql = strSql & "'" & name & "'"
		strSql = strSql & ", '" & phone & "'"
		strSql = strSql & ", '" & tel & "'"
		strSql = strSql & ", '" & post & "'"
		strSql = strSql & ", '" & addr1 & "'"
		strSql = strSql & ", '" & addr2 & "'"
		strSql = strSql & ", '" & addrtype & "'"
		strSql = strSql & ", '" & schildbirth & "'"
		strSql = strSql & ", '" & childbirth & "'"
		strSql = strSql & ", '" & bmtype & "'"
		strSql = strSql & ", '" & gender & "'"
		strSql = strSql & ", '" & twins & "'"
		strSql = strSql & ", '" & weight & "'"
		strSql = strSql & ", '" & natalhospital & "'"
		strSql = strSql & ", '" & carecenteruse & "'"
		strSql = strSql & ", '" & servicedt & "'"
		strSql = strSql & ", '" & managercareer & "'"
		strSql = strSql & ", '" & voucher & "'"
		strSql = strSql & ", '" & careprogram1 & "'"
		strSql = strSql & ", '" & careprogram2 & "'"
		strSql = strSql & ", '" & careprogram3 & "'"
		strSql = strSql & ", '" & careprogram4 & "'"
		strSql = strSql & ", '" & careprogram5 & "'"
		strSql = strSql & ", '" & period & "'"
		strSql = strSql & ", '" & serviceweek & "'"
		strSql = strSql & ", '" & addfamily & "'"
		strSql = strSql & ", '" & addcost & "'"
		strSql = strSql & ", '" & etccost & "'"
		strSql = strSql & ", '" & tendency & "'"
		strSql = strSql & ", '" & product1 & "'"
		strSql = strSql & ", '" & product2 & "'"
		strSql = strSql & ", '" & productweek & "'"
		strSql = strSql & ", '" & productcost & "'"
		strSql = strSql & ", '" & productjosa & "'"
		strSql = strSql & ", '" & wholemassagebefore & "'"
		strSql = strSql & ", '" & wholemassageafter & "'"
		strSql = strSql & ", '" & wholemassageadd & "'"
		strSql = strSql & ", '" & visitnursebefore & "'"
		strSql = strSql & ", '" & visitnurseafter & "'"
		strSql = strSql & ", '" & disinfect & "'"
		strSql = strSql & ", '" & gift & "'"
		strSql = strSql & ", '" & giftdate & "'"
		strSql = strSql & ", '" & paulsbaby & "'"
		strSql = strSql & ", '" & giftboxdate & "'"
		strSql = strSql & ", '" & comment & "'"
		strSql = strSql & ", '" & explain & "'"
		strSql = strSql & ", '" & etccost1 & "'"
		strSql = strSql & ", '" & etccost2 & "'"
		strSql = strSql & ", '" & etccost3 & "'"
		strSql = strSql & ", '" & etccost4 & "'"
		strSql = strSql & ", '" & id & "'"
		strSql = strSql & ", '" & ip & "'"
		strSql = strSql & ", '" & id & "'"
		strSql = strSql & ", '" & ip & "'"
		strSql = strSql & " ) "

		Call DBExec(strSql, "main") : Call DBClose(DBCon)

		intMsg = 1
	Else
		strSql = " UPDATE dbo.MO_COUNSELLING_RECORD SET "
		strSql = strSql & " MO_NAME = '" & name & "' "
		strSql = strSql & " , MO_PHONE = '" & phone & "' "
		strSql = strSql & " , MO_TEL = '" & tel & "' "
		strSql = strSql & " , MO_POST = '" & post & "' "
		strSql = strSql & " , MO_ADDR1 = '" & addr1 & "' "
		strSql = strSql & " , MO_ADDR2 = '" & addr2 & "' "
		strSql = strSql & " , MO_ADDR_TYPE = '" & addrtype & "' "
		strSql = strSql & " , MO_SCHE_CHILD_DATE = '" & schildbirth & "' "
		strSql = strSql & " , MO_CHILD_DATE = '" & childbirth & "' "
		strSql = strSql & " , MO_CHILDBIRTH_TYPE = '" & bmtype & "' "
		strSql = strSql & " , MO_BABY_GENDER = '" & gender & "' "
		strSql = strSql & " , MO_BABY_TWINS = '" & twins & "' "
		strSql = strSql & " , MO_BABY_WEIGHT = '" & weight & "' "
		strSql = strSql & " , MO_CHILDBIRTH_HOSPITAL = '" & natalhospital & "' "
		strSql = strSql & " , MO_CARECENTER_USE = '" & carecenteruse & "' "
		strSql = strSql & " , MO_SERVICE_SCHE_DATE = '" & servicedt & "' "
		strSql = strSql & " , MO_MANAGER_CAREER = '" & managercareer & "' "
		strSql = strSql & " , MO_VOUCHER = '" & voucher & "' "
		strSql = strSql & " , MO_FOCUS_PROGRAM1 = '" & careprogram1 & "' "
		strSql = strSql & " , MO_FOCUS_PROGRAM2 = '" & careprogram2 & "' "
		strSql = strSql & " , MO_FOCUS_PROGRAM3 = '" & careprogram3 & "' "
		strSql = strSql & " , MO_FOCUS_PROGRAM4 = '" & careprogram4 & "' "
		strSql = strSql & " , MO_FOCUS_PROGRAM5 = '" & careprogram5 & "' "
		strSql = strSql & " , MO_SERVICE_TYPE = '" & period & "' "
		strSql = strSql & " , MO_SERVICE_WEEK = '" & serviceweek & "' "
		strSql = strSql & " , MO_ADD_FAMILY = '" & addfamily & "' "
		strSql = strSql & " , MO_ADD_COST = '" & addcost & "' "
		strSql = strSql & " , MO_ETC_COST = '" & etccost & "' "
		strSql = strSql & " , MO_TENDENCY_MANAGER = '" & tendency & "' "
		strSql = strSql & " , MO_BREAST_PUMP1 = '" & product1 & "' "
		strSql = strSql & " , MO_BREAST_PUMP2 = '" & product2 & "' "
		strSql = strSql & " , MO_BREAST_PUMP_WEEK = '" & productweek & "' "
		strSql = strSql & " , MO_BREAST_PUMP_COST = '" & productcost & "' "
		strSql = strSql & " , MO_BREAST_PUMP_JOSA = '" & productjosa & "' "
		strSql = strSql & " , MO_WHOLE_MASSAGE_BEFORE = '" & wholemassagebefore & "' "
		strSql = strSql & " , MO_WHOLE_MASSAGE_AFTER = '" & wholemassageafter & "' "
		strSql = strSql & " , MO_WHOLE_MASSAGE_ADD = '" & wholemassageadd & "' "
		strSql = strSql & " , MO_VISIT_NURSE_BEFORE = '" & visitnursebefore & "' "
		strSql = strSql & " , MO_VISIT_NURSE_AFTER = '" & visitnurseafter & "' "
		strSql = strSql & " , MO_DISINFECT = '" & disinfect & "' "
		strSql = strSql & " , MO_GIFT = '" & gift & "' "
		strSql = strSql & " , MO_GIFT_DATE = '" & giftdate & "' "
		strSql = strSql & " , MO_GIFT_PAULS_BABY = '" & paulsbaby & "' "
		strSql = strSql & " , MO_GIFTBOX_DATE = '" & giftboxdate & "' "
		strSql = strSql & " , MO_COMMENT = '" & comment & "' "
		strSql = strSql & " , MO_EXPLAIN = '" & explain & "' "
		strSql = strSql & " , MO_ETC_COST1 = '" & etccost1 & "' "
		strSql = strSql & " , MO_ETC_COST2 = '" & etccost2 & "' "
		strSql = strSql & " , MO_ETC_COST3 = '" & etccost3 & "' "
		strSql = strSql & " , MO_ETC_COST4 = '" & etccost4 & "' "
		strSql = strSql & " , MO_MOD_ID = '" & id & "' "
		strSql = strSql & " , MO_MOD_IP = '" & ip & "' "
		strSql = strSql & " , MO_MOD_DATE = GETDATE() "
		strSql = strSql & " WHERE MO_SEQ = '" & seq & "' "

		Call DBExec(strSql, "main") : Call DBClose(DBCon)

		intMsg = 2
	End If
%>
<script type="text/javascript">
	function init(e) {
		switch(e) {
			case(1) :
				alert('정상적으로 등록되었습니다.');
				parent.window.location.href = "./service_call_list.asp"
			break;
			case(2) :
				alert('수정 등록되었습니다.');
				parent.window.location.href = "./service_call_list.asp"
			break;
		}
	}

	init(<%=intMsg%>);
</script>