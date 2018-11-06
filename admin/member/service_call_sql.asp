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
'-----------------------------------------------------------------------------
'	Request
    mode			= fncRequest("mode")				'처리구분(등록/수정)
	service_call_seq			= Trim(fncRequest("idx"))		' seq
	




	If mode = "ins" Or mode = "upd" Then 
		
	'	filePath	= Trim(fncRequest("filePath"))
	'	varFileNm	= Trim(fncRequest("varFileNm")) 

		know   = Trim(fncRequest("know"))	
		name = Trim(fncRequest("name"))	
		phone_1         = Trim(fncRequest("phone_1"))				' 집폰앞자리
		phone_2         = Trim(fncRequest("phone_2"))				' 집폰가운대자리
		phone_3         = Trim(fncRequest("phone_3"))				' 집폰뒷자리

		hp_1            = Trim(fncRequest("hp_1"))				' 핸폰앞자리
		hp_2            = Trim(fncRequest("hp_2"))				' 핸폰가운대자리
		hp_3            = Trim(fncRequest("hp_3"))				' 핸폰뒷자리

		post_1         = Trim(fncRequest("post_1"))				' 우편번호앞
		post_2         = Trim(fncRequest("post_2"))				' 우편번호뒷
		addr_1         = Trim(fncRequest("addr_1"))				' 주소
		addr_2         = Trim(fncRequest("addr_2"))				' 상세주소
	
		birthY			= fncRequest("childbirth_y")				'   분만예정일
		birthM			= fncRequest("childbirth_m")				'   
		birthD			= fncRequest("childbirth_d")				'   

		s_start_Y			= fncRequest("serviceDt_y")				'   서비스예정일
		s_start_M			= fncRequest("serviceDt_m")				'   
		s_start_D			= fncRequest("serviceDt_d")				'   

		exp_mo			=		Trim(fncRequest("Q5"))
		'exp_mo_2			=		Trim(fncRequest("Q5_2")) 
		'exp_mo_3			=		Trim(fncRequest("Q5_3")) 
		'exp_mo_4			=		Trim(fncRequest("Q5_4")) 

		exp_mo_people	=		Trim(fncRequest("Q5_De"))  '자녀수
		bm_type			=		Trim(fncRequest("bm_type")) '분만형태
	'	bm_type_2			=		Trim(fncRequest("bm_type_2")) '분만형태

		age			=		Trim(fncRequest("age")) '나이

		Q6			=		Trim(fncRequest("Q6")) ' 
	'	Q6_2			=		Trim(fncRequest("Q6_2")) ' 
	'	Q6_3			=		Trim(fncRequest("Q6_3")) ' 
	'	Q6_4			=		Trim(fncRequest("Q6_4")) ' 
		Q6_week		=		Trim(fncRequest("Q6_week")) ' 
		'Q6_week_2		=		Trim(fncRequest("Q6_week_2")) '
		Q7			=		Trim(fncRequest("Q7")) '     Replace(Q7,",","||")   ' 서비스
 
		service_work		= Trim(fncRequest("service_work")) ' 
		service_work_add_1  = Trim(fncRequest("service_work_add_1")) ' 
		service_work_add_2  = Trim(fncRequest("service_work_add_2")) ' 

		service_week   = Trim(fncRequest("service_week")) ' 

		add_fam1 = Trim(fncRequest("add_fam1")) ' 추가가족
		add_fam1_1 = Trim(fncRequest("add_fam1_1")) ' 추가가족 명

		add_fam2 = Trim(fncRequest("add_fam2")) ' 추가가족
		add_fam2_1 = Trim(fncRequest("add_fam2_1")) ' 추가가족 명
		
		add_fam3 = Trim(fncRequest("add_fam3")) ' 추가가족
		 
		add_fam4 = Trim(fncRequest("add_fam4")) ' 추가가족
		add_fam4_1 = Trim(fncRequest("add_fam4_1")) ' 추가가족 명
		
		add_fam5 = Trim(fncRequest("add_fam5")) ' 추가가족
		add_fam5_1 = Trim(fncRequest("add_fam5_1")) ' 추가가족 명
		add_fam5_2 = Trim(fncRequest("add_fam5_2")) ' 추가가족 명		

		If add_fam5_1 = "예)시누이" Then
			add_fam5_1 = ""
		End IF


		service_type_1    =		Trim(fncRequest("service_type_1")) ' 추가가족 명   ' 어떤 성향의 관리사를 원하십니까? (관리사의 업무 주안점은 무엇입니까?) 
		service_type_2    =		Trim(fncRequest("service_type_2"))
		service_type_3    =		Trim(fncRequest("service_type_3"))
		service_type_4    =		Trim(fncRequest("service_type_4"))
		service_type_5    =		Trim(fncRequest("service_type_5"))
		service_type_6    =		Trim(fncRequest("service_type_6"))

		part          = fncRequest("local")				    ' 지점명 디테일
		
		product_1		  = Trim(fncRequest("product_1"))
		product_2		  = Trim(fncRequest("product_2")) 
		'product_1_month		  = Trim(fncRequest("product_1_month")) '유축기 기간
		product_week	  = Trim(fncRequest("product_week"))
		product_price	  = Trim(fncRequest("product_price"))

		Q12_Y			 = Trim(fncRequest("Q12_Y"))
		Q12_M			 = Trim(fncRequest("Q12_M"))
		Q12_D			 = Trim(fncRequest("Q12_D"))

		massage1   = Trim(fncRequest("massage1"))
		massage2   = Trim(fncRequest("massage2"))
		massage3   = Trim(fncRequest("massage3"))

		Q14_1   = Trim(fncRequest("Q14_1"))
		Q14_2   = Trim(fncRequest("Q14_2"))
		 
		Q15_Y = Trim(fncRequest("Q15_Y"))
 
		Q16_Y = Trim(fncRequest("Q16_Y")) 
		Q16_M = Trim(fncRequest("Q16_M"))
		Q16_D = Trim(fncRequest("Q16_D"))

		Q16_gift = Trim(fncRequest("Q16_gift"))   '출산선물선택

		Q16_baby = Trim(fncRequest("Q16_baby"))  

		Q17_Y = Trim(fncRequest("Q17_Y"))  '출산선물박스
		Q17_M = Trim(fncRequest("Q17_M"))  '출산선물박스
		Q17_D = Trim(fncRequest("Q17_D"))  '출산선물박스

		textarea = fncRequest("textarea")

		in_out_time = fncRequest("in_out_time")

		holliday_pay = fncRequest("holliday_pay")

		break_time = fncRequest("break_time")

		homepage_join_Y = fncRequest("homepage_join_Y")




	End If 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	데이터 확인
	'exp_mo = exp_mo_1 & exp_mo_2 & exp_mo_3 & exp_mo_4

	'bm_type = bm_type_1 & bm_type_2

	'Q6 = Q6_1 & Q6_2 & Q6_3 & Q6_4

	'Q6_week = Q6_week_1 & Q6_week_2

	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	Q7			=	  Replace(Q7,",","||")   ' 서비스
	
	If birthY <> "" And birthM <> "" And birthD <> "" Then 
	birthYMD = birthY & fncSetNumber(birthM) & fncSetNumber(birthD)
	End If 

	If s_start_Y <> "" And s_start_M <> "" And s_start_D <> "" Then 
	s_start_YMD = s_start_Y & fncSetNumber(s_start_M) & fncSetNumber(s_start_D)
	End If 

	If Q12_Y <> "" And Q12_M <> "" And Q12_D <> "" Then 
	Q12_YMD = Q12_Y & fncSetNumber(Q12_M) & fncSetNumber(Q12_D)
	End If 

	If Q16_Y <> "" And Q16_M <> "" And Q16_D <> "" Then 
	Q16_YMD = Q16_Y & fncSetNumber(Q16_M) & fncSetNumber(Q16_D)
	End If 

	If Q17_Y <> "" And Q17_M <> "" And Q17_D <> "" Then 
	Q17_YMD = Q17_Y & fncSetNumber(Q17_M) & fncSetNumber(Q17_D)
	End If 
	
	





'	If INSURANCE_FLG = "" Then INSURANCE_FLG = "N"

'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
'''-------------------------------------------------------------------------------------'''
'''-------------------------------------------------------------------------------------'''

			strSql = ""
			strSql = strSql & " INSERT INTO MO_SERVICE_CALL ( "
			strSql = strSql & "  MO_CALL_SEQ "
			strSql = strSql & " ,MO_CALL_KNOW    "
			strSql = strSql & " ,MO_CALL_NM    "
			strSql = strSql & " ,MO_CALL_PHONE   "
			strSql = strSql & " ,MO_CALL_HP    "
			strSql = strSql & " ,MO_CALL_POST    "
			strSql = strSql & " ,MO_CALL_ADDR1    "
			strSql = strSql & " ,MO_CALL_ADDR2    "
			strSql = strSql & " ,MO_CALL_CHILDBIRTH    "
			strSql = strSql & " ,MO_CALL_SERVICESDT    "
			strSql = strSql & " ,MO_CALL_EXP    " 
			strSql = strSql & " ,MO_CALL_EXP_PEOPLE    " 
			strSql = strSql & " ,MO_CALL_EXP_PEOPLE_AGE    " 
			strSql = strSql & " ,MO_CALL_EXP_TYPE    "
			strSql = strSql & " ,MO_CALL_CLINIC    "
			strSql = strSql & " ,MO_CALL_CLINIC_WEEK    "
			strSql = strSql & " ,MO_CALL_SERVICE    "
			strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE    "
			strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE_WEEK_1    "
			strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE_WEEL_2   "
			strSql = strSql & " ,MO_CALL_SERVICE_WANT_WEEK    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_1    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_1_PeoPle    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_2    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_2_PeoPle    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_3    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_4    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_4_PeoPle    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_5    "
			strSql = strSql & " ,MO_CALL_ADD_FAM_5_PeoPle    "		 
			strSql = strSql & " ,MO_CALL_WANT_WORKER_1    "
			strSql = strSql & " ,MO_CALL_WANT_WORKER_2    "
			strSql = strSql & " ,MO_CALL_WANT_WORKER_3    "
			strSql = strSql & " ,MO_CALL_WANT_WORKER_4    "
			strSql = strSql & " ,MO_CALL_WANT_WORKER_5    "
			strSql = strSql & " ,MO_CALL_WANT_WORKER_6    "
			strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_1     "
			strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_2    "
			strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_WEEK    "
			strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_PRICE    "
			strSql = strSql & " ,MO_CALL_PRODUCT_OUT_DAY    "
			strSql = strSql & " ,MO_CALL_MASSAGE_BEFORE    "
			strSql = strSql & " ,MO_CALL_MASSAGE_AFTER    "
			strSql = strSql & " ,MO_CALL_MASSAGE_ADD    "
			strSql = strSql & " ,MO_CALL_VISIT_NURSE_BEFORE    "
			strSql = strSql & " ,MO_CALL_VISIT_NURSE_AFTER    "
			strSql = strSql & " ,MO_CALL_SODOK_SERVICE    "
			strSql = strSql & " ,MO_CALL_GIFT_CHOICE    "
			strSql = strSql & " ,MO_CALL_GIFT_CHOICE_SEND    "
			strSql = strSql & " ,MO_CALL_GIFT_CHOICE_BABY    "
			strSql = strSql & " ,MO_CALL_GIFT_BOX_SEND    "
			strSql = strSql & " ,MO_CALL_CONTENT    "
			strSql = strSql & " ,MO_CALL_LOCAL    "
			strSql = strSql & " ,MO_CALL_IN_OUT_TIME    "
			strSql = strSql & " ,MO_CALL_HOLIDAY_PAY    "
			strSql = strSql & " ,MO_CALL_BREAK_TIME    "
			strSql = strSql & " ,MO_CALL_JOIN_HOMEPAGE    "
			strSql = strSql & "   "


			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( (SELECT ISNULL(MAX(MO_CALL_SEQ), 0) + 1 FROM MO_SERVICE_CALL)"
			strSql = strSql & ",'"& know &"' "
			strSql = strSql & ",'"& name &"' "
			strSql = strSql & ",'"& phone &"' "
			strSql = strSql & ",'"& hp &"' "
			strSql = strSql & ",'"& post &"' "
			strSql = strSql & ",'"& addr_1 &"' "
			strSql = strSql & ",'"& addr_2 &"' "
			strSql = strSql & ",'"& birthYMD &"' "
			strSql = strSql & ",'"& s_start_YMD &"' "
			strSql = strSql & ",'"& exp_mo &"' "
			strSql = strSql & ",'"& exp_mo_people &"' "
			strSql = strSql & ",'"& age &"' "
			strSql = strSql & ",'"& bm_type &"' "
			strSql = strSql & ",'"& Q6 &"' "
			strSql = strSql & ",'"& Q6_week &"' "
			strSql = strSql & ",'"& Q7 &"' "
			strSql = strSql & ",'"& service_work &"' "
			strSql = strSql & ",'"& service_work_add_1 &"' "
			strSql = strSql & ",'"& service_work_add_2 &"' "
			strSql = strSql & ",'"& service_week &"' "
			strSql = strSql & ",'"& add_fam1 &"' "
			strSql = strSql & ",'"& add_fam1_1 &"' "
			strSql = strSql & ",'"& add_fam2 &"' "
			strSql = strSql & ",'"& add_fam2_1 &"' "
			strSql = strSql & ",'"& add_fam3 &"' "
			strSql = strSql & ",'"& add_fam4 &"' "
			strSql = strSql & ",'"& add_fam4_1 &"' "
			strSql = strSql & ",'"& add_fam5_1 &"' "
			strSql = strSql & ",'"& add_fam5_2 &"' "
			strSql = strSql & ",'"& service_type_1 &"' "
			strSql = strSql & ",'"& service_type_2 &"' "
			strSql = strSql & ",'"& service_type_3 &"' "
			strSql = strSql & ",'"& service_type_4 &"' "
			strSql = strSql & ",'"& service_type_5 &"' "
			strSql = strSql & ",'"& service_type_6 &"' "
			strSql = strSql & ",'"& product_1 &"' "
			strSql = strSql & ",'"& product_2 &"' "
			strSql = strSql & ",'"& product_week &"' "
			strSql = strSql & ",'"& product_price &"' "
			strSql = strSql & ",'"& Q12_YMD &"' "
			strSql = strSql & ",'"& massage1 &"' "
			strSql = strSql & ",'"& massage2 &"' "
			strSql = strSql & ",'"& massage3 &"' "
			strSql = strSql & ",'"& Q14_1 &"' "
			strSql = strSql & ",'"& Q14_2 &"' "
			strSql = strSql & ",'"& Q15_Y &"' "
			strSql = strSql & ",'"& Q16_gift &"' "
			strSql = strSql & ",'"& Q16_YMD &"' "
			strSql = strSql & ",'"& Q16_baby &"' "
			strSql = strSql & ",'"& Q17_YMD &"' "
			strSql = strSql & ",'"& textarea &"' "
			strSql = strSql & ",'"& part &"' "
			strSql = strSql & ",'"& in_out_time &"' "
			strSql = strSql & ",'"& holliday_pay &"' "
			strSql = strSql & ",'"& break_time &"' "

			strSql = strSql & ",'"& homepage_join_Y &"');"

'          response.Write strSql
'		   response.End 

%>
 
<%
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2

		Case "upd" : 


				strSql = ""

				strSql = strSql & " UPDATE MO_SERVICE_CALL SET "
 
				strSql = strSql & " MO_CALL_KNOW   ='"& know &"' "
				strSql = strSql & " ,MO_CALL_NM     ='"& name &"' "
				strSql = strSql & " ,MO_CALL_PHONE  ='"& phone &"' "
				strSql = strSql & " ,MO_CALL_HP     ='"& hp &"' "
				strSql = strSql & " ,MO_CALL_POST   ='"& post &"' "
				strSql = strSql & " ,MO_CALL_ADDR1   ='"& addr_1  &"' "
				strSql = strSql & " ,MO_CALL_ADDR2   ='"& addr_2  &"' "
				strSql = strSql & " ,MO_CALL_CHILDBIRTH   ='"& birthYMD  &"' "
				strSql = strSql & " ,MO_CALL_SERVICESDT   ='"& s_start_YMD  &"' "
				strSql = strSql & " ,MO_CALL_EXP   ='"& exp_mo  &"' "
				strSql = strSql & " ,MO_CALL_EXP_PEOPLE    ='"& exp_mo_people  &"' "
				strSql = strSql & " ,MO_CALL_EXP_PEOPLE_AGE   ='"& age  &"' "
				strSql = strSql & " ,MO_CALL_EXP_TYPE   ='"& bm_type  &"' "
				strSql = strSql & " ,MO_CALL_CLINIC   ='"& Q6  &"' "
				strSql = strSql & " ,MO_CALL_CLINIC_WEEK    ='"& Q6_week  &"' "
				strSql = strSql & " ,MO_CALL_SERVICE   ='"& Q7  &"' "
				strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE    ='"& service_work  &"' "
				strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE_WEEK_1   ='"& service_work_add_1  &"' "
				strSql = strSql & " ,MO_CALL_SERVICE_WANT_TYPE_WEEL_2   ='"& service_work_add_2  &"' "
				strSql = strSql & " ,MO_CALL_SERVICE_WANT_WEEK    ='"& service_week  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_1    ='"& add_fam1  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_1_PeoPle    ='"& add_fam1_1  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_2    ='"& add_fam2  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_2_PeoPle    ='"& add_fam2_1  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_3    ='"& add_fam3  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_4   ='"& add_fam4  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_4_PeoPle    ='"& add_fam4_1  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_5   ='"& add_fam5_1  &"' "
				strSql = strSql & " ,MO_CALL_ADD_FAM_5_PeoPle   ='"& add_fam5_2  &"' " 
				strSql = strSql & " ,MO_CALL_WANT_WORKER_1   ='"& service_type_1  &"' "
				strSql = strSql & " ,MO_CALL_WANT_WORKER_2   ='"& service_type_2  &"' "
				strSql = strSql & " ,MO_CALL_WANT_WORKER_3   ='"& service_type_3  &"' "
				strSql = strSql & " ,MO_CALL_WANT_WORKER_4   ='"& service_type_4  &"' "
				strSql = strSql & " ,MO_CALL_WANT_WORKER_5   ='"& service_type_5  &"' "
				strSql = strSql & " ,MO_CALL_WANT_WORKER_6   ='"& service_type_6  &"' "
				strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_1     ='"& product_1  &"' "
				strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_2   ='"& product_2 &"' "
				strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_WEEK    ='"& product_week  &"' "
				strSql = strSql & " ,MO_CALL_PRODUCT_CHOICE_PRICE   ='"& product_price  &"' "
				strSql = strSql & " ,MO_CALL_PRODUCT_OUT_DAY   ='"& Q12_YMD  &"' "
				strSql = strSql & " ,MO_CALL_MASSAGE_BEFORE    ='"& massage1  &"' "
				strSql = strSql & " ,MO_CALL_MASSAGE_AFTER    ='"& massage2  &"' "
				strSql = strSql & " ,MO_CALL_MASSAGE_ADD   ='"& massage3  &"' "
				strSql = strSql & " ,MO_CALL_VISIT_NURSE_BEFORE    ='"& Q14_1  &"' "
				strSql = strSql & " ,MO_CALL_VISIT_NURSE_AFTER   ='"& Q14_2  &"' "
				strSql = strSql & " ,MO_CALL_SODOK_SERVICE   ='"& Q15_Y  &"' "
				strSql = strSql & " ,MO_CALL_GIFT_CHOICE   ='"& Q16_gift  &"' "
				strSql = strSql & " ,MO_CALL_GIFT_CHOICE_SEND   ='"& Q16_YMD  &"' "
				strSql = strSql & " ,MO_CALL_GIFT_CHOICE_BABY   ='"& Q16_baby  &"' "
				strSql = strSql & " ,MO_CALL_GIFT_BOX_SEND    ='"& Q17_YMD  &"' "
				strSql = strSql & " ,MO_CALL_CONTENT   ='"& textarea  &"' "
				strSql = strSql & " ,MO_CALL_LOCAL   ='"& part  &"' "
				strSql = strSql & " ,MO_CALL_IN_OUT_TIME    ='"& in_out_time  &"' "
				strSql = strSql & " ,MO_CALL_HOLIDAY_PAY    ='"& holliday_pay  &"' "
				strSql = strSql & " ,MO_CALL_BREAK_TIME    ='"& break_time  &"' "
				strSql = strSql & " ,MO_CALL_JOIN_HOMEPAGE    ='"& homepage_join_Y  &"' "
 
 
				strSql = strSql & "	WHERE MO_CALL_SEQ='"& service_call_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
	 
		
		Case "del" : 
 
				strSql = ""
				strSql = strSql & " delete from MO_SERVICE_CALL  "
				strSql = strSql & "	WHERE MO_CALL_SEQ ='"& service_call_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 4
 
	End Select 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('이용약관에 동의해 주세요');
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./service_call_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_call_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_call_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
