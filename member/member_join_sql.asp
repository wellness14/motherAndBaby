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
<!--#include virtual="/common/inc/member_email_send.asp"-->

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link type="text/css" rel="stylesheet" href="/common/css/style.css">
<head>
<body>
<%	
'-----------------------------------------------------------------------------
'	Request
	mOne		= fncRequest("mOne")
	mTwo		= fncRequest("mTwo")
	
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	idCheck		= fncRequest("idCheck")				'아이디 체크 여부
'	smsCheck	= fncRequest("smsCheck")			'sms 체크 여부
	smsCheck	= "Y"
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
'		check1			= fncRequest("check1")				' 이용약관
'		check2			= fncRequest("check2")				' 개인정보취급방침
		
		check1			= "Y"
		check2			= "Y"
		
		mem_id			= Trim(fncRequest("mem_id"))		' 사용자ID
		mem_old_pw		= Trim(fncRequest("mem_old_pw"))	' 원본 비밀번호
		mem_pw			= Trim(fncRequest("mem_pw"))		' 비밀번호
		mem_nm			= Trim(fncRequest("mem_nm"))		' 사용자 이름
		radio1			= fncRequest("radio1")				' 성별

		Ybirth			= fncRequest("Ybirth")				' 생년월일
		Mbirth			= fncRequest("Mbirth")				' 생년월일
		Dbirth			= fncRequest("Dbirth")				' 생년월일

		phone_1			= Trim(fncRequest("phone_1"))		' 전화번호
		phone_2			= Trim(fncRequest("phone_2"))		' 전화번호
		phone_3			= Trim(fncRequest("phone_3"))		' 전화번호

		hp_1			= Trim(fncRequest("hp_1"))			' 핸드폰번호
		hp_2			= Trim(fncRequest("hp_2"))			' 핸드폰번호
		hp_3			= Trim(fncRequest("hp_3"))			' 핸드폰번호

		add_hp_1			= Trim(fncRequest("add_hp_1"))			' 핸드폰번호
		add_hp_2			= Trim(fncRequest("add_hp_2"))			' 핸드폰번호
		add_hp_3			= Trim(fncRequest("add_hp_3"))			' 핸드폰번호

		check3			= fncRequest("check2")				' SMS 수신동의

		post_1			= Trim(fncRequest("post_1"))		' 우편번호
		post_2			= Trim(fncRequest("post_2"))		' 우편번호

		addr_1			= Trim(fncRequest("addr_1"))		' 주소
		addr_2			= Trim(fncRequest("addr_2"))		' 주소

		email			= Trim(fncRequest("email"))			' 이메일
		check4			= fncRequest("check4")				' 이메일 수신 동의

		childbirth_y	= fncRequest("childbirth_y")		' 출산예정일
		childbirth_m	= fncRequest("childbirth_m")		' 출산예정일
		childbirth_d	= fncRequest("childbirth_d")		' 출산예정일

		radio3			= fncRequest("radio3")				' 큰아이 여부
		radio4			= fncRequest("radio4")				' 산모구분

		part			= fncRequest("part")				' 지점 선택
  
       
        
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	If Ybirth <> "" And Mbirth <> "" And Dbirth <> "" Then 
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	End If 

	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	add_phone = add_hp_1 & "-" & add_hp_2 & "-" & add_hp_3
	
	If check3 = "" Then check3 = "N" 
	If check4 = "" Then check4 = "N"

	If childbirth_y <> "" And childbirth_m <> "" And childbirth_d <> "" Then 
	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	End If 
	
	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

	If mode = "ins" And (check1 = "" Or check2 = "") Then 
		intMsg = 1
	ElseIf mode = "upd" And mem_old_pw = "" Then 
		intMsg = 5
	ElseIf mode = "ins" And idCheck = "N" Then 
		intMsg = 6
	ElseIf mode = "ins" And smsCheck = "N" Then 
		intMsg = 7
	Else 
		Select Case mode 
			Case "ins" : 


				strSql = ""
				strSql = strSql & " INSERT INTO MO_MEM_MAS ( "
				strSql = strSql & "         MM_MEM_ID,MM_MEM_TYPE,MM_MEM_NM,MM_MEM_PW "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& mem_id &"','S','"& mem_nm &"',dbo.UF_MD5('"& mem_pw &"'); "

				strSql = strSql & " INSERT INTO MO_MEM_DTL ( "
				strSql = strSql & "         MD_MEM_ID,MD_PHONE,MD_HP,MD_SEX,MD_BIRTH,MD_POST,MD_ADDR1,MD_ADDR2, "
				strSql = strSql & "         MD_EMAIL,MD_SNS_FLG,MD_EMAIL_FLG,MD_LOCAL,MD_CHILDBIRTH,MD_CHILD_FLG,MD_TYPE, MD_HP_ADD "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& mem_id &"','"& phone &"','"& hp &"','"& radio1 &"','"& birth &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "			'"& email &"','"& check3 &"','"& check4 &"','"& part &"','"& childbirth &"','"& radio3 &"','"& radio4 &"','"& add_phone &"'; "
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
			
				sMailTile	= "[마더앤베이비] 회원 가입을 축하 드립니다."
				sContent	= Left(mem_pw,Len(mem_pw)-2) & "**" 
				sContent	=  sContent & "<html><body><BR/><table style='border: 1px solid #cacaca;font-size: 12px;height:200px;width:400px; vertical-align: middle; padding-left: 8px;padding-top: 8px;'><td><h2> 마더앤베이비 서비스 이용약관</h2> <br/><br/>  "

sContent	=  sContent & "		제 1조 (목적) <br/><br/>"

sContent	=  sContent & "     이 약관은 웰니스인텔리전스㈜에서 제공되는 '마더앤베이비'의 인터넷 서비스, 임신출산관리 및 가정방문산후조리서비스(이하 '서비스'라 한다)를 이용함에 있어 서비스 이용자의 의무 및 책임사항을 규정함을 목적으로 합니다. <br/><br/>"

sContent	=  sContent & "		제 2조 (정의)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'는 임신출산관리 및 가정방문산후조리 서비스 제공을 위해 관련 정보통신설비 및 영업장을 갖추고 '마더앤베이비'를 운영하는 사업자의 의미로 사용합니다.<br/><br/>"

sContent	=  sContent & "		2. '이용자'란 '마더앤베이비'의 서비스 이용약관에 따라 '마더앤베이비'가 제공하는 서비스를 이용하는 회원을 말합니다.<br/><br/>"

sContent	=  sContent & "		3. '회원'이라 함은 '마더앤베이비'에 개인정보를 제공하여 회원등록을 한 자로서, '마더앤베이비'의 정보를 지속적으로 제공받으며, '마더앤베이비'가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br/><br/>"

sContent	=  sContent & "		제 3조 (약관의 명시와 개정)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'는 이 약관의 내용과 상호, 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 [운영되는 웹사이트]에 게시하고 이용 약관은 링크를 통하여 회원이 볼 수 있도록 합니다.<br/><br/>"

sContent	=  sContent & "		2. '마더앤베이비'는 약관의 규제에 관한 법률, 전자거래기본법, 정보통신망이용촉진 등에 관한 법률, 소비자보호법, 직업안정법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		3. '마더앤베이비'가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 [마더앤베이비 웹사이트] 에 그 적용일자 7일전부터 적용 일자 전일까지 공지합니다.<br/><br/>"

sContent	=  sContent & "		4. '마더앤베이비'가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관 조항이 그대로 적용됩니다. 다만, 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 '회사'에 송신하여 '회사'의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br/><br/>"

sContent	=  sContent & "		5. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 상 관례에 따릅니다.<br/><br/>"

sContent	=  sContent & "		제 4조 (서비스 내용 및 범위) <br/>"
sContent	=  sContent & "		1. '마더앤베이비' 서비스는 다음과 같은 서비스가 제공됩니다. <br/><br/>"

sContent	=  sContent & "		가. 케어매니저 : 케어매니저(고객 담당자)는 고객과 정기적인 연락을 통해 상담을 제공합니다.<br/><br/>"

sContent	=  sContent & "		나. 전담 방문 간호사 : 회원님이 요청하시는 경우 간호사가 정기적으로 방문하여 산모의 기본 건강 사정을 제공하고 영양 및 운동에 관한 상담을 통해 바람직한 임신출산 기간을 보낼 수 있도록 지도합니다. 출산 이후에는 신생아의 건강 사정과 더불어 영양 및 수유에 관한 교육을 제공합니다. <br/><br/>"

sContent	=  sContent & "		다. 산후관리사 : 전문적이고 체계적인 교육을 이수한 산후관리사는 산모와 신생아가 적절한 산후관리를 받으실 수 있도록 체계적인 서비스 제공 합니다. 서비스 제공의 주 내용은 산후 관리 및 신생아 돌보기를 기본으로 산모와 신생아 관련 영양 및 공간 관리, 가사 및 위생관리 전반 등 입니다. 또한 전담 방문 간호사 및 케어매니저와 함께 산모와 신생아 관련된 모든 정보를 공유하며, 양질의 서비스 제공 합니다.<br/><br/>"

sContent	=  sContent & "		라. 방문마사지 : 전문적이고 체계적인 교육을 이수하여 오랜 기간 산후 마사지 경력을 보유한 방문 마사지사는, 산모님들의 체계적인 산전/산후를 위하여 방문지도 및 마사지 업무를 수행합니다. 또한 원활한 산욕기를 보낼 수 있도록 모유수유 코치 및 바디케어 컨설팅을 수행합니다.<br/><br/>"
								 
sContent	=  sContent & "		마. 부가서비스 지원 : 회원님의 필요에 따라 다양한 분야의 전문가들을 통해 부가서비스를 지원하며 베이비시터, 국제모유수유자격증자, 반찬도우미, 베이비시터, 가사도우미, 주거환경 점검을 통한 소독 및 청소 등의 서비스를 지원합니다.  <br/><br/>"

sContent	=  sContent & "		바. 주차별 맞춤정보 제공 : 회원님의 필요에 따라 회원님의 임신과 출산에 필요한 서비스와 유아동 및 출산용품의 정보를 임신 주차별로 마더앤베이비의 관계사 및 협력기관을 통하여 제공합니다.<br/><br/>"

sContent	=  sContent & "		3. '마더앤베이비'는 [마더앤베이비 웹사이트]를 통해 서비스 안내, 예약 서비스, 결제안내, 고객상담, 건강상담 등의 인터넷 서비스를 제공합니다.<br/><br/>"

sContent	=  sContent & "		4. [마더앤베이비 웹사이트] 운영자는 필요에 따라 제공하는 서비스의 내용을 변경할 수 있으며, 이 경우 변경된 서비스의 내용 및 제공일자를 명시하여 그 제공일자 이전 7일부터 공지합니다.<br/><br/>"

sContent	=  sContent & "		5. [마더앤베이비 웹사이트] 운영자는 서비스 내용의 변경으로 인하여 이용자가 입은 손해에 대하여 배상하지 아니합니다. <br/><br/>"

sContent	=  sContent & "		6. [마더앤베이비 웹사이트]는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대해서 전자메일이나 서신우편, 전화, SMS, 푸시메일 등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		7. [마더앤베이비 웹사이트]는 운영되는 장치의 보수점검, 교체 및 고장, 통신의 두절, 기타 불가항력적 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. <br/><br/>"

sContent	=  sContent & "		8. [마더앤베이비 웹사이트] 제7항의 사유로 서비스 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여는 배상하지 아니합니다. <br/><br/>"

sContent	=  sContent & "		제 5조 (예약)<br/><br/>"

sContent	=  sContent & "		1. 서비스 신청은 인터넷, 전화, 직접방문 등의 방법을 통해 가능하며, 서비스 신청 이후 7일 이내에 명시된 서비스 금액을 무통장 입금 또는 신용카드 등의 방법으로 납부한 후, 실명(신청자명 또는 입금자명)을 통보하여 입금확인을 함으로 예약이 완료됩니다. <br/><br/>"

sContent	=  sContent & "		2. 서비스 이용금액 입금 확인 시, 회사는 이메일 또는 전화, SMS 등을 통해 이용자에게 입금 확인 통지를 합니다.<br/><br/>"

sContent	=  sContent & "  	3. 서비스는 임신 20주부터 시작됨을 원칙으로 하고, 예약 시 규정된 서비스 이용금액이 입금되어야만 서비스가 시작될 수 있습니다.<br/><br/>"

sContent	=  sContent & "		제 6조 (서비스 이용계약의 성립)<br/><br/>"

sContent	=  sContent & "		1. ‘마더앤베이비’는 제5조와 같은 서비스 예약에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다. <br/>"
sContent	=  sContent & "		 가. 신청 내용에 허위, 고의적 기재누락 이 있는 경우 <br/>"
sContent	=  sContent & "		 나. 타인 명의를 무단 도용하여 신청한 경우 <br/>"
sContent	=  sContent & "		 다. 서비스 신청 후 일정기간 내에 이용금액의 결재가 완료되지 않은 경우 <br/>"
sContent	=  sContent & "		 라. 상담/제출서류에 허위가 있는 경우 <br/>"
sContent	=  sContent & "		 마. 기타 '마더앤베이비'에 알릴 의무를 성실히 이행하지 아니한 경우 <br/>"

sContent	=  sContent & "		2. 서비스 이용계약은 이용자의 서비스 신청/예약에 대하여 제5조 제3항의 이용금액의 결재 확인 통지 형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. 단, 불 승낙 시 이용자에게 이용금액 환불 및 즉시 통보 조치합니다.<br/><br/>"

sContent	=  sContent & "		제 7조 (서비스 예약 변경)<br/><br/>"

sContent	=  sContent & "		분만일의 변동, 수술일자 변경, 서비스 이용기간 변경 등의 예약사항의 변동이 있을 시, 이용자 또는 이용자의 보호자는 최소 10일 이전에 반드시 '마더앤베이비'에 해당 사실을 통보하여야 합니다. 이를 소홀히 하여 서비스에 차질이 발생할 경우, '마더앤베이비'는 산모의 원활한 산후조리를 위해 성실의 의무를 다하나, 책임은 이용자가 집니다.<br/><br/>"

sContent	=  sContent & "		제 8조 (서비스 예약 취소 및 환불)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비' 서비스는 산전에서부터 산후까지 다양한 맞춤 서비스가 제공됨으로 모든 서비스 제공은 예약제로 진행됩니다. <br/><br/>"

sContent	=  sContent & "		2. 이용자는 부득이한 경우에 서비스 시작 전 예약을 취소 할 수 있습니다. <br/><br/>"

sContent	=  sContent & "		3. 서비스 예약 취소는 이용자가 인터넷, 전화, 직접방문 등의 방법으로 예약 취소 의사를 밝히고, '마더앤베이비'가 이를 확인함으로써 이루어집니다. <br/><br/>"

sContent	=  sContent & "		4. 고객님의 귀책사유로 서비스 예약취소 시 환불규정은 아래와 같습니다.<br/><br/>"

sContent	=  sContent & "		※    환불규정 <br/>"
sContent	=  sContent & "		가. 서비스 예약 취소는 서비스 시작 15일 이전에 '마더앤베이비'에 통보함을 원칙으로 하며, 이 때 납입된 예약금은 전액 환불 됩니다. <br/><br/>"

sContent	=  sContent & "		나. 서비스 이용예정일 15일 이전 임신 30주(7일 이전) : 예약금 전액 환불<br/><br/>"
								 
sContent	=  sContent & "		  - 임신 31주 ~ 38주 : 제공된 서비스 및 지급된 상품 금액 제외한 예약금의 나머지 금액 환불 <br/><br/>"
 

sContent	=  sContent & "		   - 임신 38주 ~ 분만 전 : 제공된 서비스 및 지급된 상품금액과 예약금의 20% 취소 수수료를 제외한 나머지 금액 환불 <br/><br/>"

sContent	=  sContent & "		- 분만 ~ 서비스 종료일 : 제공된 서비스와 지급된 상품금액 및 기간별 수수료를 제외한 나머지 금액 환불 <br/><br/>"

sContent	=  sContent & "		6. 회사는 부득이 한 경우(상품 변경, 유산, 사산, 조산 시)에 서비스 시작 전 이용자와 협의하여 예약을 취소할 수 있으며, 이 때 납입된 이용금액을 전액 환불합니다. <br/><br/>"

sContent	=  sContent & "		제 9조 (서비스 이용요금 및 결제)<br/><br/>"

sContent	=  sContent & "		1. 서비스 이용요금은 '마더앤베이비'에서 정한 이용요금을 기준으로 하며, 고객과의 상담을 통해최종적인 서비스 예약 시 '마더앤베이비'와 이용자간 합의된 금액입니다. <br/><br/>"

sContent	=  sContent & "		2. 서비스 예약 시 예약금은 서비스 신청일 기준으로 7일 이내에 무통장 또는 온라인결제로 납입하며 산후관리사 임금은 서비스 종료 시 고객님의 사정에 따라 산후관리사에게 직접 지불하거나 회사로 지급합니다. 단, 회사로 지급하는 경우에는 필요 양식과 기준에 따릅니다.<br/><br/>"

sContent	=  sContent & "		제 10조 (서비스 이용기간 및 연장)<br/><br/>"

sContent	=  sContent & "		1. 산후관리사 서비스 이용기간 은 최소 1주를 기본으로 하며, 주단위로 서비스가 제공됩니다.<br/><br/>"

sContent	=  sContent & "		2. 서비스 이용기간 연장/변경 신청 시, '마더앤베이비'는 연장/변경 가능여부를 확인하여 통보합니다. <br/><br/>"

sContent	=  sContent & "		3. 서비스 이용기간 중에 이용자가 서비스 기간을 연장 할 경우 최소 해당 서비스 종료일로부터 7일 이전에 회사 또는 지사에 연장 요청해야 합니다.<br/><br/>"

sContent	=  sContent & "		4. '마더앤베이비'는 산후관리사의 일정에 지장이 없을 경우 기존 고객에게 선 배치 하나 산후관리사의 다음일정에 따라 동일한 산후관리사를 지원할 수 없을 수 있습니다. 단, 회사는 고객님의 의사와 조건에 부합되는 인력을 서비스 할 수 있도록 최선의 노력을 경주합니다.<br/><br/>"
								 
sContent	=  sContent & "		제 11조 (서비스 중도 해지 및 환불)<br/><br/>"

sContent	=  sContent & "  	1. 이용자 및 '마더앤베이비'는 다음의 경우 산후관리사 교체 또는 서비스 중도 해지를 요청할 수있습니다. <br/><br/>"

sContent	=  sContent & "		 가. '마더앤베이비'에서 정한 서비스 프로그램을 특별한 사유 및 협의 없이 불이행한 경우<br/><br/>"

sContent	=  sContent & " 	 나. 서비스가 불성실하여 만족스럽지 못하거나, 위생 및 청결상태가 양호하지 못할 경우<br/><br/>"

sContent	=  sContent & "		 다. 산후관리사가 의료행위를 하려 하거나 강요하는 경우 <br/>"
sContent	=  sContent & "			- 산후관리사는 산모와 신생아를 대상으로 그 어떠한 의료행위도 할 수 없으며 이용자는 의료행위를 요구하거나 응해서는 안됩니다. 단, 전담 방문간호사는 해당자격이 있는 의료인으로서 간단한 응급처치를 포함하여 산모와 신생아의 건강 사정과 관련된 각종 신체 검진은 행해질 수 있습니다. 또한 산모와 신생아의 신체 검진 상 전문의 소견을 필요로 할 때에는 주치의 진료를 권유할 수 있습니다<br/><br/>"

sContent	=  sContent & " 	 라. 이용자 및 이용자 가족과 산후관리사 사이에 원만한 서비스가 보장되지 아니할 경우<br/><br/>"

sContent	=  sContent & "		2. 산후관리사는 다음의 상황이 발생할 경우 서비스 잔여기간과 상관없이 회사의 판단으로 산후관리사 교체 및 서비스 중도해지를 할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		가. 이용자 및 이용자 가족이 인격적 모독이나 신변의 위협을 느끼게 하는 경우<br/><br/>"

sContent	=  sContent & "		나. 서비스의 범위를 벗어나는 과도한 가사일을 요구하여 산후조리 서비스를 제대로 수행하기 힘들다고 판단되는 경우<br/><br/>"

sContent	=  sContent & "		다. 감기 등을 포함하여 일시적인 질병 발생시, 관혼상제 등 중대 사안이 발생한 경우<br/><br/>"

sContent	=  sContent & "		3. 서비스 중도 해지 및 환불은 부득이한 경우에 준하며, 서비스 중도 해지 시에는 실제 서비스 내역에 따라 회사와 협의하여 요금을 정산 지불합니다. <br/><br/>"
								 
sContent	=  sContent & "		제 12조 (산후조리 무료임대용품 이용)<br/><br/>"

sContent	=  sContent & "		1. 이용자는 서비스 이용기간 중 요청에 의해 회사에서 정한 산후조리용품을 무료로 임대하여 사용하실 수 있습니다. 단, 왕복 운임은 이용자 부담입니다.<br/><br/>"

sContent	=  sContent & "		2. 무료 임대 용품의 소유권은 '마더앤베이비'에 있으며, 서비스 종료 후 즉시 반납하여야 합니다.<br/><br/>"
								 
sContent	=  sContent & "		3. 무료 임대 용품 이용 시, 이용자 및 이용자 가족의 과실로 인해 파손 또는 분실 시 이용자는 이를 현금 또는 동일한 물품으로 변상하여야 합니다. <br/><br/>"

sContent	=  sContent & "		제 13조 (근무시간 및 의무)<br/><br/>"

sContent	=  sContent & "		1. 출퇴근형의 근무시간은 평일 09:00~18:00, 토요일 09:00~14:00, 일요일은 휴무입니다. <br/><br/>"

sContent	=  sContent & "		2. 입주형의 근무시간은 일요일 19:00~토요일 16:00로 하며, 토요일 16:00~일요일 19:00(27시간)까지 휴무입니다. 단, 산후관리사의 안정적인 서비스를 위해 휴식시간을 부여해야 합니다. 이용자와 협의하여 결정하며 평균 8시간당 1시간의 휴식시간을 부여 합니다.<br/><br/>"
								 
sContent	=  sContent & "		3. 주 5일 출퇴근형의 근무시간은 평일 09:00~18:00, 토/일요일은 휴무입니다.<br/><br/>"

sContent	=  sContent & "		4. 법정 공휴일은 휴무이며, 휴무된 기간만큼 자동 연장됩니다. 단, 휴무기간에 서비스 제공을 요청하시면 상황에 따라 상호 협의하여 근무를 실시하며 규정에 의해 휴일근무 비용이 추가로 발생합니다.<br/><br/>"

sContent	=  sContent & "		5. 고객센터 운영시간은 평일 09:00~18:00, 토요일, 일요일, 공휴일은 휴무입니다.<br/><br/>"

sContent	=  sContent & "		제 14조 (회원가입)<br/><br/>"

sContent	=  sContent & "		1. 이용자는 '회사'에서 정한 가입양식에 따라 회원정보를 가입한 후, 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.<br/><br/>"

sContent	=  sContent & "		2. '회사'는 다음 각 호에 해당하지 않는 한, 회원으로 등록합니다.<br/><br/>"

sContent	=  sContent & "		 가. 등록내용에 허위, 기재누락, 오기가 있는 경우<br/><br/>"

sContent	=  sContent & "		 나. 회원으로 등록하는 것이 '회사'의 업무수행상 현저히 지장이 있다고 판단하는 경우<br/><br/>"

sContent	=  sContent & "		제 15조 (회원 탈퇴 및 자격상실)<br/><br/>"

sContent	=  sContent & "		1. 회원은 언제든지 탈퇴를 요청할 수 있으며, '회사'는 즉시 탈퇴 처리합니다.<br/><br/>"

sContent	=  sContent & "		2. 다음 각 호에 해당하는 경우, '회사'는 회원자격을 제한 및 정지, 상실 시킬 수 있습니다.<br/><br/>"

sContent	=  sContent & "		 가. 가입 신청시 허위 내용을 등록한 경우<br/><br/>"

sContent	=  sContent & "		 나. 다른 사람의 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br/><br/>"

sContent	=  sContent & "		 다. '마더앤베이비 서비스'를 이용하여 공서양속에 반하는 행위를 하거나 법질서에 위배되는 행위를 하는 경우<br/><br/>"

sContent	=  sContent & "		 라. 회사에서 정한 약관을 위반한 경우<br/><br/>"

sContent	=  sContent & "		 마. 기타 부당한 목적으로 회원의 가입 탈퇴를 3회 이상 반복하는 경우<br/><br/>"

sContent	=  sContent & "		3. 회원탈퇴는 웹사이트 내에서 신청하며 고객상담센터에서 확인을 통해 진행됩니다.<br/><br/>"

sContent	=  sContent & "		4. [마더앤베이비 웹사이트]가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고 회원 등록 말소 전에 소명할 기회를 부여합니다. 단, 회원이 통지가 도달한 날로부터 7일 이내에 전자우편 등을 통해 ‘회사’에 이를 소명해야 합니다.<br/><br/>"

sContent	=  sContent & "		제 16조 (회원에 대한 통지)<br/><br/>"

sContent	=  sContent & "		1. '회사'가 서비스 제공 및 운영 관련 주요 공지사항을 회원에게 통지 하는 경우, 회원이 ‘회사에 제출한 전자우편 주소 및 휴대전화번호의 문자서비스, 직접전화로 수행 할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		2. '회사'는 불특정 다수 회원에 대한 통지의 경우, 1주일 이상 '마더앤베이비' 웹사이트 공지 게시판에 게시함으로써 개별 통지를 갈음할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		제 17조 (개인정보보호)<br/><br/>"

sContent	=  sContent & "		1. &ldquo;회사&rdquo;는 이용자의 정보수집 시 서비스 제공에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. <br/><br/>"

sContent	=  sContent & "		가. 성명 <br/>"
sContent	=  sContent & " 	나. 주민등록번호  <br/>"
sContent	=  sContent & "		다. 출산예정일 <br/>"
sContent	=  sContent & "		라. 가족사항 <br/>"
sContent	=  sContent & "		마. 주소 <br/>"
sContent	=  sContent & "		바. 자택전화번호/휴대전화번호< <br/>"
sContent	=  sContent & "		사. 비밀번호(회원의 경우) <br/>"

sContent	=  sContent & "		2. &ldquo;회사&rdquo;는 서비스제공의 이유로 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.<br/><br/>"

sContent	=  sContent & " 	3. 제공된 개인정보는 이용자의 동의 없이 별도의 목적으로 이용되거나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 '회사'가 집니다. 단, 다음의 경우에는 예외로 합니다.<br/><br/>"
								 
sContent	=  sContent & "		가. 산후관리사, 전담 방문간호사, 방문마사지사 및 무료임대용품 배송업체에게 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우<br/><br/>"

sContent	=  sContent & "		나. 통계작성, 학술연구 또는 시장조사를 위한 것으로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 <br/><br/>"

sContent	=  sContent & "		다. 체계적인 서비스 제공에 필요한 최소 정보를 협력기관과 공유하는 경우<br/><br/>"

sContent	=  sContent & "		4. '회사'는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 아래의 협력기관에 최소한의 개인정보를 제공하고 있으며, 회원은 이에 동의합니다.<br/>"
sContent	=  sContent & "		가. 미앤체힐링맘스 : 모유수유 및 바디마사지 <br/><br/>"

sContent	=  sContent & "		5. '회사'는 개인정보 보호를 위하여 개인 정보 보호 책임자를 지정 운영합니다. 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리 책임자가 신고사항에 대해 신속하고 충분한 답변을 드릴 것 입니다.<br/><br/>"

sContent	=  sContent & "		개인정보관리 책임자 : 구자열 <br/>"
sContent	=  sContent & "		전화번호 : 02-557-3579 <br/>"
sContent	=  sContent & "		이메일 : kujalm5@naver.com<br/><br/>"

sContent	=  sContent & "		제 18조 (고객상담센터 이용)<br/><br/>"

sContent	=  sContent & "		1. &ldquo;마더앤베이비&rdquo;의 고객상담센터를 통한 모든 상담은 반드시 이용자의 동의 후 녹취됩니다.<br/><br/>"

sContent	=  sContent & "		2. &ldquo;마더앤베이비&rdquo;의 고객상담센터는 동의 획득에 대한 녹취 기록을 통해서 그에 관련된 증빙자료로도 활용 가능합니다.<br/><br/>"

sContent	=  sContent & "		3. &ldquo;마더앤베이비&rdquo;의 고객상담센터는 질 높은 서비스 제공을 위해 동의된 녹취 내용을 토대로 아웃바운드 콜을 할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		제 19조 (제공된 정보의 활용)<br/><br/>"

sContent	=  sContent & "		1. '회사'는 회원이 제공한 개인정보의 일부를 필요에 따라 공지사항 및 이벤트 진행 등에 활용할 수 있습니다.<br/><br/>"

sContent	=  sContent & "		2. '회사'는 회원에 대하여 보다 향상된 서비스 제공을 위해 아래의 제휴업체에서 제공하는 메일 서비스를 제공할 수 있으며, 회원은 이에 동의합니다.<br/> "
sContent	=  sContent & "		가. 남양아이<br/> "
sContent	=  sContent & "		나. 베이비타임즈<br/> "
sContent	=  sContent & "		다. 더넥스트웨이브, 베이비타임즈<br/> "

sContent	=  sContent & "		제 20조 (개인정보 보유 및 이용기간)<br/><br/>"

sContent	=  sContent & "		1. '회사'는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다. <br/><br/>"

sContent	=  sContent & "		가. 회원가입정보의 경우 : 회원탈퇴하거나, 회원에서 제명된 때<br/><br/>"

sContent	=  sContent & "		나. 설문조사, 행사 등의 목적을 위하여 수집한 경우<br/><br/>"

sContent	=  sContent & "		제 21조 (손실보상)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'의 서비스 기간 중 산후관리사 및 전담방문간호사의 고의, 과실 등으로 인해 이용자에게 피해가 발생하였을 경우 이용자는 회사에서 가입한 ‘배상책임보험’에 의해 보상받을 수 있습니다. <br/><br/>"

sContent	=  sContent & "		2. 이용자는 제21조 1항과 같은 상황이 발생할 시에 반드시 '마더앤베이비' 상담센터에 연락을 취하여 사항을 알리도록 합니다. 회사는 이용자로부터 접수 받은 사항을 내부 사정을 통해 파악 후 보험회사의 조사과정을 거친 후 손실이 입증되면 손해배상보험의 범위 내에서 경제적 손실을 보장합니다. 또한, 향후 문제 해결을 위해 그 어떤 상황에서라도 적극 협조합니다.<br/><br/>"

sContent	=  sContent & "		제 22조 (면책사항)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'는 이용자와의 공식 계약 범위(이용기간, 이용시간, 이용요금, 이용조건) 및 서비스 외에 이용자와 산후관리사, 방문마사지사 간의 임의의 거래행위에 대해서는 사고 및 민원 발생 시 그에 대한 일체의 민, 형사상 책임을 지지 않습니다. <br/><br/>"

sContent	=  sContent & "		2. '마더앤베이비'와 산후관리사, 전담방문간호사는 산모의 건강회복과 신생아의 건강증진을 위해 주의 성실의 책무를 다해 서비스에 임하나, 그럼에도 불구하고 산모 또는 신생아에게 질병이 발생한 경우, 산후관리사의 고의 또는 중대한 과실에 의한 것으로 제3자에 의해 객관적으로 입증되지 않는 한, '마더앤베이비'나 산후관리사는 면책됩니다. <br/><br/>"

sContent	=  sContent & " 	3. '마더앤베이비'는 웹사이트상에서 하이퍼링크 방식으로 연결되어 있는 제휴업체 또는 타 업체가 독자적으로 제공하는 재화. 용역에 의하여 이용자와 행하는 거래에 대해 보증책임을 지지 않습니다.<br/><br/>"

sContent	=  sContent & "		4. '본 이용약관에 동의함으로 마더앤베이비 이용약관을 동의함을 의미합니다' '마더앤베이비는 고객의 동의를 얻어' 고객의 동의하에 회사에서 소개한 산모 신생아 건강관리사의 서비스 비용을 관리사에게 대지급을 할 수 있습니다. 이에 따른 책임은 회사는 면책됩니다.<br/><br/>"

sContent	=  sContent & "		제 23조 (저작권의 귀속 및 이용제한)<br/><br/>"

sContent	=  sContent & " 	1. '마더앤베이비'가 작성한 저작물에 대한 저작권 기타 지적재산권은 '회사'에 귀속합니다.<br/><br/>"

sContent	=  sContent & "		2. 이용자는 '마더앤베이비'를 이용함으로써 얻은 정보를 '회사'의 사전 승낙 없이 복제, 송신,   출판, 배포, 방송기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.<br/><br/>"

sContent	=  sContent & "		제 24조 (분쟁해결)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'는 이용자가 제기하는 정당한 의견이나 불만을 접수하고 이의 해결을 위해 적극 노력합니다.<br/><br/>"

sContent	=  sContent & "		2. '마더앤베이비'는 이용자와 산후관리사간 분쟁이 있을 시, 원활한 해결을 위해 중재할 수 있습니다.<br/><br/>"

sContent	=  sContent & "  	3. 쌍방의 과실이 명백히 입증되지 않는 어느 일방의 주장에 의한 도난 분실 등 사고 발생시, 사건 해결을 위해 관할 수사기관에 수사 의뢰하여 그 결과에 따라 처리합니다. 이때 문제 해결을 위해 필요한 정보를 제공합니다.<br/><br/>"

sContent	=  sContent & "		제 25조(관할기관 및 준거법)<br/><br/>"

sContent	=  sContent & "		1. '마더앤베이비'와 이용자간 발생한 분쟁의 관할은 서울중앙지방법원으로 합니다.<br/><br/>"

sContent	=  sContent & "		2. '마더앤베이비'와 이용자간 제기된 전자거래 소송에는 대한민국법을 적용합니다.<br/><br/>"

sContent	=  sContent & "		3. 본 약관에 없는 사항은 관습 또는 일반적인 상 관례에 준합니다. " 
				
sContent	=  sContent & "	</td><tr> <td><br/><br/><br/><h2>개인정보 취급방법</h2> <br/><br/>"









sContent	=  sContent & "		마더앤베이비 개인정보취급방법 <br/><br/>"


sContent	=  sContent & "	   '웰니스인텔리전스㈜'는 (이하 '회사') 고객님의 개인정보를 중요시하며 &ldquo;정보통신망 이용촉진 및 정보보호&rdquo;에 관한 법률을 준수하고 있습니다. 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br/><br/>"

sContent	=  sContent & " 	■ 수집하는 개인정보 항목 <br/><br/>"

sContent	=  sContent & "		회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다. <br/><br/>"

sContent	=  sContent & "		▷ 수집항목 : 이름, 생년월일, 성별, 로그인ID, 비밀번호, 비밀번호 질문과 답변, 자택 전화번호, 자택 주소, 휴대전화번호, 이메일, 직업, 회사명, 부서, 직책, 회사전화번호, 취미, 결혼여부, 기념일, 가족사항, 출산예정일, 출산예정산부인과, 입실예정 산후조리원, 서비스 이용기록, 접속 로그, 접속 IP 정보, 결제기록 <br/><br/>"

sContent	=  sContent & "		▷ 개인정보 수집방법 : 홈페이지(회원가입), 서면양식, 전화/팩스를 통한 회원가입, 경품행사응모, 상담게시판 外 <br/><br/>"

sContent	=  sContent & "		■ 개인정보의 수집 및 이용목적 <br/><br/>"

sContent	=  sContent & "		회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br/><br/>"
								  
sContent	=  sContent & "		▷ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 <br/><br/>"

sContent	=  sContent & "		▷ 회원 관리 : 회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 고지사항 전달 <br/><br/>"

sContent	=  sContent & "		▷ 고객상담센터 : 모든 상담은 반드시 이용자의 동의 후 녹취 <br/><br/>"
sContent	=  sContent & "		- 상담 시 동의 획득에 대한 녹취 기록을 통해서 그에 관련된 증빙자료로 활용 가능 <br/><br/>"
sContent	=  sContent & "		- 질 높은 서비스 제공을 위해 동의된 녹취 내용을 토대로 아웃바운드 콜 활용  <br/><br/>"

sContent	=  sContent & "		▷ 마케팅 및 광고에 활용 : 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 <br/><br/>"



sContent	=  sContent & "		▷ 회사는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 협력업체에 개인정보를 제공 <br/><br/>"

sContent	=  sContent & "		▷ '회사'는 회원에 대하여 보다 더 질 높은 서비스 제공을 위해 아래의 제휴업체에서 제공하는 메일 서비스 제공 <br/><br/>"

sContent	=  sContent & "		■ 개인정보의 보유 및 이용기간  <br/><br/>"

sContent	=  sContent & "		회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.  <br/><br/>"

sContent	=  sContent & "		■ 개인정보의 파기절차 및 방법  <br/><br/>"

sContent	=  sContent & "		회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.  <br/><br/>"

sContent	=  sContent & "		▷ 파기절차  <br/>"
sContent	=  sContent & "		회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기 되어 집니다. <br/><br/>"

sContent	=  sContent & "		별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로 이용되지 않습니다. <br/><br/>"

sContent	=  sContent & "		▷ 파기방법 <br/>"
sContent	=  sContent & "		전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다. <br/><br/>"

sContent	=  sContent & "		■ 개인정보 제공 <br/><br/>"

sContent	=  sContent & "		회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다. <br/><br/>"

sContent	=  sContent & "		- 이용자들이 사전에 동의한 경우 <br/><br/>"

sContent	=  sContent & "		- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우 <br/><br/>"

sContent	=  sContent & "		■ 수집한 개인정보의 위탁 <br/><br/>"

sContent	=  sContent & "		회사는 회원의 동의 없이 회원의 정보를 외부 업체에 위탁하지 않습니다. 향후 그러한 필요가 생길 경우, 위탁 대상자와 위탁 업무 내용에 대해 고객님에게 통지하고 필요한 경우 사전 동의를 받도록 합니다. <br/><br/>"

sContent	=  sContent & "		■ 이용자 및 법정대리인의 권리와 그 행사방법 <br/><br/>"

sContent	=  sContent & "		- 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입 해지를 요청할 수도 있습니다. <br/><br/>"

sContent	=  sContent & "		- 이용자 혹은 만 14세 미만 아동의 개인정보 조회/수정을 위해서는 '개인정보변경'(또는'회원정보수정'등)을 가입 해지(동의철회)를 위해서는 &ldquo;회원탈퇴&lrdquo;를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체 없이 조치합니다.  <br/><br/>"

sContent	=  sContent & "		- 회원이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자 에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 합니다. <br/><br/>"

sContent	=  sContent & "		- 회사는 회원 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 &ldquo;개인정보의 보유 및 이용기간&rdquo;에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리합니다.  <br/><br/>"

sContent	=  sContent & "		■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항 <br/><br/>"

sContent	=  sContent & "		회원의 정보를 수시로 저장하고 찾아내는 '쿠키(cookie)'를 운용합니다. 쿠키란 웹사이트를 운영하는데 이용되는 서버가 회원의 브라우저에 보내는 아주 작은 텍스트 파일로서 회원의 컴퓨터 하드디스크에 저장됩니다. 회사는 다음과 같은 목적을 위해 쿠키를 사용합니다. <br/><br/>"

sContent	=  sContent & "		▷ 쿠키 등 사용 목적  <br/>"
sContent	=  sContent & "		회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공하기 위한 자료로 이용됩니다.<br/><br/>"

sContent	=  sContent & "		회원은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 회원은 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수 있습니다. 다만, 회원님께서 쿠키 설치를 거부하셨을 경우 서비스 제공에 어려움이 있습니다. <br/><br/>"

sContent	=  sContent & "		■ 개인정보에 관한 민원서비스 <br/><br/>"

sContent	=  sContent & "		회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.  <br/>"
sContent	=  sContent & "		▷ 고객서비스담당 부서 : 마케팅팀  <br/>"
sContent	=  sContent & "		   전화번호 : 02-557-3579 <br/>"
sContent	=  sContent & "		▷ 개인정보관리책임자 성명 : 정보배  <br/>"
sContent	=  sContent & "		   전화번호 : 02-557-3579  <br/><br/>" 

sContent	=  sContent & "		서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다. <br/><br/>"

sContent	=  sContent & "		기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.  <br/>"
sContent	=  sContent & "		1. 개인분쟁조정위원회 (www.1336.or.kr/1336) <br/>"
sContent	=  sContent & "		2. 정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4) <br/>"
sContent	=  sContent & "		3. 대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600) <br/>"
sContent	=  sContent & "		4. 경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330) <br/></td></tr></table>  </body></html>"
				
				
				
				zRtn = FNC_SEND_EMAIL("마더앤베이비", "mothernbaby@mothernbaby.co.kr", email, mem_id, mem_nm, sMailTile, sContent, "JOIN")

			Case "upd" : 
				If mem_id <> "" And mem_old_pw <> "" Then 
				'---------------------------------------------------------------------
				'	비밀번호 확인
					strSql = " SELECT MM_MEM_ID FROM MO_MEM_MAS WITH(NOLOCK) WHERE MM_MEM_PW = dbo.UF_MD5('"& mem_old_pw &"') "
					Set Rs = DBExec(strSql,"main")
					If Not Rs.EOF Then 
						mem_old_id = Rs(0)
					End If 
					Call RSClose(Rs)
				'---------------------------------------------------------------------

					If mem_id = mem_old_id Then 
						strSql = ""
						strSql = strSql & " UPDATE MO_MEM_MAS SET "
						strSql = strSql & "		MM_UPD_DT = GETDATE() "
						If mem_pw <> "" Then 
						strSql = strSql & "		,MM_MEM_PW = dbo.UF_MD5('"& mem_pw &"') "
						End If 
						strSql = strSql & "	WHERE MM_MEM_ID='"& mem_id &"'; "

						strSql = strSql & " UPDATE MO_MEM_DTL SET "
						strSql = strSql & "		MD_PHONE ='"& phone &"' "
						strSql = strSql & "		,MD_HP ='"& hp &"' "
						strSql = strSql & "		,MD_POST ='"& post &"' "
						strSql = strSql & "		,MD_ADDR1 ='"& addr_1 &"' "
						strSql = strSql & "		,MD_ADDR2 ='"& addr_2 &"' "
						strSql = strSql & "		,MD_EMAIL ='"& email &"' "
						strSql = strSql & "		,MD_SNS_FLG ='"& check3 &"' "
						strSql = strSql & "		,MD_EMAIL_FLG ='"& check4 &"' "
						strSql = strSql & "		,MD_LOCAL ='"& part &"' "
						strSql = strSql & "		,MD_CHILDBIRTH ='"& childbirth &"' "
						strSql = strSql & "		,MD_CHILD_FLG ='"& radio3 &"' "
						strSql = strSql & "		,MD_TYPE ='"& radio4 &"' "
						strSql = strSql & "		,MD_HP_ADD ='"& add_phone &"' "
						strSql = strSql & "	WHERE MD_MEM_ID='"& mem_id &"'; "
						Call DBExec(strSql, "main") : Call DBClose(DBCon)
						intMsg = 3
					Else 
						intMsg = 5
					End If 
				Else 
					intMsg = 5
				End If 
			Case "del" : 
				uId = Trim(fncRequestCookie("uid"))
				If uId <> "" Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_MEM_MAS SET "
					strSql = strSql & "		MM_UPD_DT = GETDATE() "
					strSql = strSql & "		,MM_DEL_DT = GETDATE() "
					strSql = strSql & "	WHERE MM_MEM_ID='"& uId &"'; "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		End Select 
	End If 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			 
		//	case(1) :
		//		alert('이용약관에 동의해 주세요');
		//	break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				//parent.location.href = "/member/login.asp?mOne=6&mTwo=1"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "/member/login.asp?mOne=6&mTwo=1"
			break;
			case(4) :
				alert('그동안 마더앤베이비를 이용해 주셔서 감사합니다.\n회원 탈퇴 되었습니다.');
				parent.location.href = "/member/logout.asp"
			break;
			case(5) :
				alert('회원정보가 일치하지 않습니다.');
			break;
			case(6) :
				alert('아이디 중복체크를 해 주세요.');
			break;
		//	case(7) :
		//		alert('핸드폰 인증을 해 주세요.');
		//	break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
</body>
</html>