<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_sql.asp
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
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")

	




	If mode = "ins" Or mode = "upd" Then 


		mo_helper_seq		= Trim(fncRequest("mo_helper_seq1"))   ' 산모도우미 시퀀스
		mo_helper_name1		= Trim(fncRequest("mo_helper_name1"))  '산모도우미 이름
		mo_service_comment	= Trim(fncRequest("mo_service_comment"))   '산모도우미 서비스 비고

		mo_helper_seq_1		= Trim(fncRequest("mo_helper_seq_1"))   ' 산모도우미 시퀀스
		mo_helper_name_1	= Trim(fncRequest("mo_helper_name_1"))  '산모도우미 이름
		mo_service_comment_1= Trim(fncRequest("mo_service_comment_1"))   '산모도우미 서비스 비고

		mo_helper_seq_2		= Trim(fncRequest("mo_helper_seq_2"))   ' 산모도우미 시퀀스
		mo_helper_name_2	= Trim(fncRequest("mo_helper_name_2"))  '산모도우미 이름
		mo_service_comment_2= Trim(fncRequest("mo_service_comment_2"))   '산모도우미 서비스 비고

		mo_helper_seq_3		= Trim(fncRequest("mo_helper_seq_3"))   ' 산모도우미 시퀀스
		mo_helper_name_3	= Trim(fncRequest("mo_helper_name_3"))  '산모도우미 이름
		mo_service_comment_3= Trim(fncRequest("mo_service_comment_3"))   '산모도우미 서비스 비고






		mem_id			= fncRequest("mem_id")				' 회원ID
		mem_nm			= fncRequest("mem_nm")				' 회원명
		Ybirth			= fncRequest("Ybirth")				' 생년월일
		Mbirth			= fncRequest("Mbirth")				' 생년월일
		Dbirth			= fncRequest("Dbirth")				' 생년월일

		phone_1			= Trim(fncRequest("phone_1"))		' 전화번호
		phone_2			= Trim(fncRequest("phone_2"))		' 전화번호
		phone_3			= Trim(fncRequest("phone_3"))		' 전화번호

		hp_1			= Trim(fncRequest("hp_1"))			' 핸드폰번호
		hp_2			= Trim(fncRequest("hp_2"))			' 핸드폰번호
		hp_3			= Trim(fncRequest("hp_3"))			' 핸드폰번호

		post_1			= Trim(fncRequest("post_1"))		' 우편번호
		post_2			= Trim(fncRequest("post_2"))		' 우편번호

		addr_1			= Trim(fncRequest("addr_1"))		' 주소
		addr_2			= Trim(fncRequest("addr_2"))		' 주소

		check1			= fncRequest("check1")				' 신청서비스
		radio1			= fncRequest("radio1")				' 이용기간
		radio2			= fncRequest("radio2")				' 이용형태

		childbirth_y	= fncRequest("childbirth_y")		' 출산예정일
		childbirth_m	= fncRequest("childbirth_m")		' 출산예정일
		childbirth_d	= fncRequest("childbirth_d")		' 출산예정일

		serviceSdt_y	= fncRequest("serviceSdt_y")		' 서비스시작일
		serviceSdt_m	= fncRequest("serviceSdt_m")		' 서비스시작일
		serviceSdt_d	= fncRequest("serviceSdt_d")		' 서비스시작일

		serviceEdt_y	= fncRequest("serviceEdt_y")		' 서비스종료일
		serviceEdt_m	= fncRequest("serviceEdt_m")		' 서비스종료일
		serviceEdt_d	= fncRequest("serviceEdt_d")		' 서비스종료일

		radio3			= fncRequest("radio3")				' 조리원 이용
		radio4			= fncRequest("radio4")				' 출산경험

		check2			= fncRequest("check2")				' 특이사항
		check3			= fncRequest("check3")				' 가족사항

		payment			= fncRequest("payment")				' 선금
		radio5			= fncRequest("radio5")				' 결제수단
		radio6			= fncRequest("radio6")				' 결제상태
		payEdt_y		= fncRequest("payEdt_y")			' 결제일
		payEdt_m		= fncRequest("payEdt_m")			' 결제일
		payEdt_d		= fncRequest("payEdt_d")			' 결제일


		pay_name		= fncRequest("pay_name")			' 입금자
		cancel_yn		= fncRequest("cancel_yn")			' 취소여부
		cancel_reason	= fncRequest("cancel_reason")	    ' 취소사유

		s_happy_yn		= fncRequest("s_happy_yn")			' 서비스시작시작해피콜
		e_happy_yn		= fncRequest("e_happy_yn")			 ' 서비스종ㄽ 햐파

		textarea		= fncRequest("textarea")			' 상담내용


		

		extend_1_sy		= fncRequest("extend_1_sy")			' 서비스연장시작1
		extend_1_sm		= fncRequest("extend_1_sm")			' 
		extend_1_sd		= fncRequest("extend_1_sd")			' 

		extend_1_ey		= fncRequest("extend_1_ey")			' 서비스연장종료일1
		extend_1_em		= fncRequest("extend_1_em")			' 
		extend_1_ed		= fncRequest("extend_1_ed")			' 


		extend_2_sy		= fncRequest("extend_2_sy")			' 서비스연장시작2
		extend_2_sm		= fncRequest("extend_2_sm")			' 
		extend_2_sd		= fncRequest("extend_2_sd")			' 

		extend_2_ey		= fncRequest("extend_2_ey")			' 서비스연장종료일2
		extend_2_em		= fncRequest("extend_2_em")			' 
		extend_2_ed		= fncRequest("extend_2_ed")			' 


		extend_3_sy		= fncRequest("extend_3_sy")			' 서비스연장시작3
		extend_3_sm		= fncRequest("extend_3_sm")			' 
		extend_3_sd		= fncRequest("extend_3_sd")			' 

		extend_3_ey		= fncRequest("extend_3_ey")			' 서비스연장종료일3
		extend_3_em		= fncRequest("extend_3_em")			' 
		extend_3_ed		= fncRequest("extend_3_ed")			' 

		pdt_no			= fncRequest("pdt_no")				' 출산선물선택

		Q16_Y			= fncRequest("Q16_Y")				'  
		Q16_M			= fncRequest("Q16_M")				'  
		Q16_D			= fncRequest("Q16_D")				'  

		Q17_Y			= fncRequest("Q17_Y")				'   출산선물박스 택배일
		Q17_M			= fncRequest("Q17_M")				'   
		Q17_D			= fncRequest("Q17_D")				'   

		product_1			= fncRequest("product_1")		'   유축기
		product_2			= fncRequest("product_2")		'   유축기소모품   

		product_week		= fncRequest("product_week")		'  product_week
		product_price		= fncRequest("product_price")		'  product_week

		Q12_Y			= fncRequest("Q12_Y")				'   조사기
		Q12_M			= fncRequest("Q12_M")				'   
		Q12_D			= fncRequest("Q12_D")				'   

		massage1			= fncRequest("massage1")			'   massage1
		massage2			= fncRequest("massage2")			'   massage1
		massage3			= fncRequest("massage3")			'   massage1  

		Q14_1			= fncRequest("Q14_1")				'  Q14_1
		Q14_2			= fncRequest("Q14_2")				'  Q14_1

		Q15_Y			= fncRequest("Q15_Y")				'  Q15_Y  

		Q16_baby			= fncRequest("Q16_baby")				'  Q16_baby  


		birth_j							= fncRequest("birth")							' 생일(달력)  
		childbirth_ymd					= fncRequest("childbirth_ymd")					' 생일(달력)  
		serviceS_ymd					= fncRequest("serviceS_ymd")					' 생일(달력)  
		serviceE_ymd					= fncRequest("serviceE_ymd")					' 생일(달력)  
		product_GIFT_ymd				= fncRequest("product_GIFT_ymd")				' 생일(달력)  
		product_GIFT_BOX_ymd			= fncRequest("product_GIFT_BOX_ymd")			' 생일(달력)  
		product_OUT_ymd					= fncRequest("product_OUT_ymd")					' 생일(달력)   
		payEdt_ymd						= fncRequest("payEdt_ymd")						' 생일(달력)  
		serviceSdt_1_ymd				= fncRequest("serviceSdt_1_ymd")				' 생일(달력)  
		serviceEdt_1_ymd				= fncRequest("serviceEdt_1_ymd")				' 생일(달력)  
		serviceSdt_2_ymd				= fncRequest("serviceSdt_2_ymd")				' 생일(달력)  
		serviceEdt_2_ymd				= fncRequest("serviceEdt_2_ymd")				' 생일(달력)  
		serviceSdt_3_ymd				= fncRequest("serviceSdt_3_ymd")				' 생일(달력)  
		serviceEdt_3_ymd				= fncRequest("serviceEdt_3_ymd")				' 생일(달력)
		
		massage_mng			= fncRequest("massage_mng")			' 생일(달력)
		massage_hp1			= fncRequest("massage_hp1")			' 생일(달력)
		massage_hp2			= fncRequest("massage_hp2")			' 생일(달력)
		massage_hp3			= fncRequest("massage_hp3")			' 생일(달력)
		Q14_mng				= fncRequest("Q14_mng")				' 생일(달력)
		Q14_hp1				= fncRequest("Q14_hp1")				' 생일(달력)
		Q14_hp2				= fncRequest("Q14_hp2")				' 생일(달력)
		Q14_hp3				= fncRequest("Q14_hp3")				' 생일(달력)
		Q15_mng				= fncRequest("Q15_mng")				' 생일(달력)
		Q15_hp1				= fncRequest("Q15_hp1")				' 생일(달력)
		Q15_hp2				= fncRequest("Q15_hp2")				' 생일(달력)
		Q15_hp3				= fncRequest("Q15_hp3")				' 생일(달력)
		 
	End If 
'-----------------------------------------------------------------------------
%>
 
<%

'----------------------------------------------------------------------------- 

'--------달력추가로 수정 ----------------------------------------------------------
'	1 생년월일
	If birth_j <> "" Then 
		birth_j_arr=split(birth_j,"-") 
		birth_y = birth_j_arr(0)
		birth_m = birth_j_arr(1)
		birth_d = birth_j_arr(2)
		birth = birth_y &  birth_m  &  birth_d 
	End If 

'	2 출산예정일
	If childbirth_ymd <> "" Then 
		childbirth_ymd_arr=split(childbirth_ymd,"-") 
		childbirth_y = childbirth_ymd_arr(0)
		childbirth_m = childbirth_ymd_arr(1)
		childbirth_d = childbirth_ymd_arr(2)
		childbirth = childbirth_y &  childbirth_m  &  childbirth_d 
	End If 

'	3 서비스시작일
	If serviceS_ymd <> "" Then 
		serviceS_ymd_arr=split(serviceS_ymd,"-") 
		serviceS_y = serviceS_ymd_arr(0)
		serviceS_m = serviceS_ymd_arr(1)
		serviceS_d = serviceS_ymd_arr(2)
		serviceSdt = serviceS_y &  serviceS_m  &  serviceS_d 
	End If 

'	4 서비스종료일
	If serviceE_ymd <> "" Then 
		serviceE_ymd_arr=split(serviceE_ymd,"-") 
		serviceE_y = serviceE_ymd_arr(0)
		serviceE_m = serviceE_ymd_arr(1)
		serviceE_d = serviceE_ymd_arr(2)
		serviceEdt = serviceE_y &  serviceE_m  &  serviceE_d 
	End If 

'	5 출산선물선택 택배일
	If product_GIFT_ymd <> "" Then 
		product_GIFT_arr=split(product_GIFT_ymd,"-") 
		product_GIFT_y = product_GIFT_arr(0)
		product_GIFT_m = product_GIFT_arr(1)
		product_GIFT_d = product_GIFT_arr(2)
		Q16_YMD = product_GIFT_y &  product_GIFT_m  &  product_GIFT_d 
	End If 

'	6 출산선물박스 택배일
	If product_GIFT_BOX_ymd <> "" Then 
		product_GIFT_BOX_arr=split(product_GIFT_BOX_ymd,"-") 
		product_GIFT_BOX_y = product_GIFT_BOX_arr(0)
		product_GIFT_BOX_m = product_GIFT_BOX_arr(1)
		product_GIFT_BOX_d = product_GIFT_BOX_arr(2)
		Q17_YMD = product_GIFT_BOX_y &  product_GIFT_BOX_m  &  product_GIFT_BOX_d 
	End If 

'	7 조사기
	If product_OUT_ymd <> "" Then 
		product_OUT_arr=split(product_OUT_ymd,"-") 
		product_OUT_y = product_OUT_arr(0)
		product_OUT_m = product_OUT_arr(1)
		product_OUT_d = product_OUT_arr(2)
		Q12_YMD = product_OUT_y &  product_OUT_m  &  product_OUT_d 
	End If 

'	8 
	If payEdt_ymd <> "" Then 
		payEdt_arr=split(payEdt_ymd,"-") 
		payEdt_y = payEdt_arr(0)
		payEdt_m = payEdt_arr(1)
		payEdt_d = payEdt_arr(2)
		payDate = payEdt_y &  payEdt_m  &  payEdt_d 
	End If 

'	9 서비스연장 1 시직
	If serviceSdt_1_ymd <> "" Then 
		serviceSdt_1_arr=split(serviceSdt_1_ymd,"-") 
		serviceSdt_1_y = serviceSdt_1_arr(0)
		serviceSdt_1_m = serviceSdt_1_arr(1)
		serviceSdt_1_d = serviceSdt_1_arr(2)
		serviceSdt_1 = serviceSdt_1_y &  serviceSdt_1_m  &  serviceSdt_1_d 
	End If
	
'	10 서비스연장 1 종료
	If serviceEdt_1_ymd <> "" Then 
		serviceEdt_1_arr=split(serviceEdt_1_ymd,"-") 
		serviceEdt_1_y = serviceEdt_1_arr(0)
		serviceEdt_1_m = serviceEdt_1_arr(1)
		serviceEdt_1_d = serviceEdt_1_arr(2)
		serviceEdt_1 = serviceEdt_1_y &  serviceEdt_1_m  &  serviceEdt_1_d 
	End If 

'	11 서비스연장 2 시작
	If serviceSdt_2_ymd <> "" Then 
		serviceSdt_2_arr=split(serviceSdt_2_ymd,"-") 
		serviceSdt_2_y = serviceSdt_2_arr(0)
		serviceSdt_2_m = serviceSdt_2_arr(1)
		serviceSdt_2_d = serviceSdt_2_arr(2)
		serviceSdt_2 = serviceSdt_2_y &  serviceSdt_2_m  &  serviceSdt_2_d 
	End If 

'	12 서비스연장 2 종료
	If serviceEdt_2_ymd <> "" Then 
		serviceEdt_2_arr=split(serviceEdt_2_ymd,"-") 
		serviceEdt_2_y = serviceEdt_2_arr(0)
		serviceEdt_2_m = serviceEdt_2_arr(1)
		serviceEdt_2_d = serviceEdt_2_arr(2)
		serviceEdt_2 = serviceEdt_2_y &  serviceEdt_2_m  &  serviceEdt_2_d 
	End If 

'	13 서비스연장 3 시작
	If serviceSdt_3_ymd <> "" Then 
		serviceSdt_3_arr=split(serviceSdt_3_ymd,"-") 
		serviceSdt_3_y = serviceSdt_3_arr(0)
		serviceSdt_3_m = serviceSdt_3_arr(1)
		serviceSdt_3_d = serviceSdt_3_arr(2)
		serviceSdt_3 = serviceSdt_3_y &  serviceSdt_3_m  &  serviceSdt_3_d 
	End If 

'	14 서비스연장 3 종료
	If serviceEdt_3_ymd <> "" Then 
		serviceEdt_3_arr=split(serviceEdt_3_ymd,"-") 
		serviceEdt_3_y = serviceEdt_3_arr(0)
		serviceEdt_3_m = serviceEdt_3_arr(1)
		serviceEdt_3_d = serviceEdt_3_arr(2)
		serviceEdt_3 = serviceEdt_3_y &  serviceEdt_3_m  &  serviceEdt_3_d 
	End If 
 
 
'--------달력추가로 수정 ----------------------------------------------------------
 
 
'	데이터 확인
'	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2 

	massage_hp	= massage_hp1 & "-" & massage_hp2 & "-" & massage_hp3
	nurse_hp	= Q14_hp1 & "-" & Q14_hp2 & "-" & Q14_hp3
	sodok_hp	= Q15_hp1 & "-" & Q15_hp2 & "-" & Q15_hp3

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")

'	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d) 
'	serviceSdt = serviceSdt_y & fncSetNumber(serviceSdt_m) & fncSetNumber(serviceSdt_d)
'	serviceEdt = serviceEdt_y & fncSetNumber(serviceEdt_m) & fncSetNumber(serviceEdt_d)

	If extend_1_sy <> "" And extend_1_sm <> "" And extend_1_sd <> "" Then 
		serviceSdt_1 = extend_1_sy & fncSetNumber(extend_1_sm) & fncSetNumber(extend_1_sd)
	End If 

	If extend_1_ey <> "" And extend_1_em <> "" And extend_1_ed <> "" Then 
		serviceEdt_1 = extend_1_ey & fncSetNumber(extend_1_em) & fncSetNumber(extend_1_ed)
	End If 

	If extend_2_sy <> "" And extend_2_sm <> "" And extend_2_sd <> "" Then 
		serviceSdt_2 = extend_2_sy & fncSetNumber(extend_2_sm) & fncSetNumber(extend_2_sd)
	End If 

	If extend_2_ey <> "" And extend_2_em <> "" And extend_2_ed <> "" Then 
		serviceEdt_2 = extend_2_ey & fncSetNumber(extend_2_em) & fncSetNumber(extend_2_ed)
	End If 


	If extend_3_sy <> "" And extend_3_sm <> "" And extend_3_sd <> "" Then 
		serviceSdt_3 = extend_3_sy & fncSetNumber(extend_3_sm) & fncSetNumber(extend_3_sd)
	End If 

	If extend_3_ey <> "" And extend_3_em <> "" And extend_3_ed <> "" Then 
		serviceEdt_3 = extend_3_ey & fncSetNumber(extend_3_em) & fncSetNumber(extend_3_ed)
	End If 


'	If payEdt_y <> "" And payEdt_m <> "" And payEdt_d <> "" Then 
'		payDate	   = payEdt_y & fncSetNumber(payEdt_m) & fncSetNumber(payEdt_d)
'	End If 

	If Q12_Y <> "" And Q12_M <> "" And Q12_D <> "" Then 
	Q12_YMD = Q12_Y & fncSetNumber(Q12_M) & fncSetNumber(Q12_D) '조사기
	End If 

	If Q16_Y <> "" And Q16_M <> "" And Q16_D <> "" Then 
	Q16_YMD = Q16_Y & fncSetNumber(Q16_M) & fncSetNumber(Q16_D) '출산선물선택 택배일
	End If 

	If Q17_Y <> "" And Q17_M <> "" And Q17_D <> "" Then 
	Q17_YMD = Q17_Y & fncSetNumber(Q17_M) & fncSetNumber(Q17_D) '출산선물박스 택배일
	End If 
'-----------------------------------------------------------------------------	

	If mode = "ins" And mem_id = "" Then 
		intMsg = 1
	Else 
 

 

		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_RESERVATION ( "
				strSql = strSql & "         MR_MEM_ID,MR_MEM_NM,MR_BIRTH,MR_PHONE,MR_HP,MR_POST,MR_ADDR1,MR_ADDR2, "
				strSql = strSql & "         MR_SERVICE,MR_PERIOD,MR_TYPE,MR_CHILDBIRTH,MR_SERVICESDT,MR_SERVICEEDT,MR_CLINIC, "
				strSql = strSql & "         MR_EXPER,MR_UNIQUE,MR_FAMILY,MR_PAY_MENT,MR_PAY_TYPE,MR_PAY_STATE,MR_PAY_DT,MR_CONTENT, "
				strSql = strSql & "			MR_SERVICESDT1, MR_SERVICEEDT1, MR_SERVICESDT2, MR_SERVICEEDT2, MR_SERVICESDT3, MR_SERVICEEDT3,  "
				strSql = strSql & "         MR_PAY_NAME, MR_CANCEL_YN, MR_CANCEL_REASON , MR_START_HAPPY_CALL , MR_END_HAPPY_CALL "
				strSql = strSql & "         ,MR_PRODUCT_CHOICE_1, MR_PRODUCT_CHOICE_2, MR_PRODUCT_CHOICE_WEEK, MR_PRODUCT_CHOICE_PRICE  "
				strSql = strSql & "         ,MR_PRODUCT_OUT_DAY , MR_MASSAGE_BEFORE, MR_MASSAGE_AFTER, MR_MASSAGE_ADD, MR_VISIT_NURSE_BEFORE  "
				strSql = strSql & "         ,MR_VISIT_NURSE_AFTER, MR_SODOK_SERVICE, MR_GIFT_CHOICE, MR_GIFT_CHOICE_SEND, MR_GIFT_CHOICE_BABY "
				strSql = strSql & "         ,MR_GIFT_BOX_SEND, MR_MASSAGE_MNG , MR_MASSAGE_HP, MR_VISIT_NURSE_MNG, MR_VISIT_NURSE_HP "
				strSql = strSql & "         ,MR_SODOK_MNG, MR_SODOK_HP  "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "	'"& mem_id &"','"& mem_nm &"','"& birth &"','"& phone &"','"& hp &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "	'"& check1 &"','"& radio1 &"','"& radio2 &"','"& childbirth &"','"& serviceSdt &"','"& serviceEdt &"','"& radio3 &"', "
				strSql = strSql & "	'"& radio4 &"','"& check2 &"','"& check3 &"','"& payment &"','"& radio5 &"','"& radio6 &"','"& payDate &"' "
				strSql = strSql & "	,'"& textarea &"','"& serviceSdt_1 &"','"& serviceEdt_1 &"','"& serviceSdt_2 &"','"& serviceEdt_2 &"' "
				strSql = strSql & "	,'"& serviceSdt_3 &"','"& serviceEdt_3 &"','"& pay_name &"','"& cancel_yn &"','"& cancel_reason &"' "
				strSql = strSql & " ,'"& s_happy_yn &"','"& e_happy_yn &"','"& product_1 &"','"& product_2 &"','"& product_week &"'"
				strSql = strSql & " ,'"& product_price &"','"& Q12_YMD &"','"& massage1 &"','"& massage2 &"','"& massage3 &"'"
				strSql = strSql & " ,'"& Q14_1 &"','"& Q14_2 &"','"& Q15_Y &"','"& pdt_no &"','"& Q16_YMD &"','"& Q16_baby &"','"& Q17_YMD &"'"
				strSql = strSql & " ,'"& massage_mng &"','"& massage_hp &"','"& Q14_mng &"','"& nurse_hp &"','"& Q15_mng &"','"& sodok_hp &"';"
 
	'			response.Write strSql
	'			response.End 
 
	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2


			If uId = "wellness14" And pdt_no <> "" Then 
					strSql = ""
					strSql = strSql & " INSERT INTO MO_RESERVATION_GIFT_OUT ( "
					strSql = strSql & "       MD_GIFT_SEQ "
					strSql = strSql & ",      MD_GIFT_OUT_SEQ "
					strSql = strSql & ",      MD_GIFT_MEM_ID "
					strSql = strSql & ",      MD_GIFT_OUT_DATE "
					strSql = strSql & ",      MD_GIFT_OUT_EA "

					strSql = strSql & " )  "
					strSql = strSql & " VALUES "
					strSql = strSql & "			(  '"& pdt_no &"'   "
					strSql = strSql & "	,(SELECT ISNULL(MAX([MD_GIFT_OUT_SEQ] ),0)+1 from  [MO_RESERVATION_GIFT_OUT] where [MD_GIFT_SEQ] = '"& pdt_no &"') "
					strSql = strSql & "	,		'"& mem_id &"'   "
					strSql = strSql & "	,		'"& Q16_YMD &"'   "
					strSql = strSql & "	,		'1') ; " ' 재고수량 1개만 선택되므로 1로
					'			response.Write strSql
					'			response.End 

						Call DBExec(strSql, "main") : Call DBClose(DBCon)
					'	intMsg = 2
			End if


	 
 


' select ISNULL(MAX(MO_EXTEND),0)  FROM MO_HELPER_SERVICE   where  MD_HELPER_SEQ = '169' 도우미 시퀀스로 연장횟수 구하기

		If mo_helper_seq <> "" Then 
		
				strSql = ""
				strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
				strSql = strSql & "        MD_HELPER_SEQ, "
				strSql = strSql & "        MR_IDX, "
				strSql = strSql & "        MO_SEQ, "
				strSql = strSql & "        MD_HELPER_COMMENT, "
				strSql = strSql & "        MO_EXTEND "
				strSql = strSql & " )  "
				strSql = strSql & " VALUES ( " & mo_helper_seq  
				strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
				strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)+ 1 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
				strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
				strSql = strSql & " ,  '"& mo_service_comment &"'  "

				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
				strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   "
				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		

				Call DBExec(strSql, "main") : Call DBClose(DBCon)
		End If 


	'서비스 연장 인서트 1

	If mo_helper_seq_1 <> "" Then 

	'MO_EXTEND 값 구해서 연장할때 인서트 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT1   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then
				
				MO_EXTEND				    = Rs(0)

			
	 
			End If 

			Call RSClose(Rs)

 
	
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_1  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_1 &"'  "
			
		If extend_1_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 

	' 서비스 연장 인서트 2

			If mo_helper_seq_2 <> "" Then 

	'MO_EXTEND 값 구해서 연장할때 인서트 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT2   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then
				
				MO_EXTEND				    = Rs(0)

			
	 
			End If 

			Call RSClose(Rs)
 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_2  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_2 &"'  "
			
		If extend_2_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX =   "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 

 
	'서비스연장 인서트 3

			If mo_helper_seq_3 <> "" Then 

	'MO_EXTEND 값 구해서 연장할때 인서트 

			strSql = ""
			strSql = strSql & " select MR_SERVICESDT3   "
			strSql = strSql & " FROM "
			strSql = strSql & " MO_RESERVATION "
			strSql = strSql & " where "
			strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then

				MO_EXTEND				    = Rs(0)


			End If 

			Call RSClose(Rs)
 

	
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
			strSql = strSql & "        MD_HELPER_SEQ, "
			strSql = strSql & "        MR_IDX, "
			strSql = strSql & "        MO_SEQ, "
			strSql = strSql & "        MD_HELPER_COMMENT, "
			strSql = strSql & "        MO_EXTEND "
			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( " & mo_helper_seq_3  
			strSql = strSql & " ,(SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)  from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
			strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)   FROM  MO_HELPER_SERVICE) )"
			strSql = strSql & " ,  '"& mo_service_comment_3 &"'  "
			
		If extend_3_sy <> ""   Then	
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX =  "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
		Else
			strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX =  "
			strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
			strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
		End if

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
	End If 
 
	

			Case "upd" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_RESERVATION SET "
					strSql = strSql & "		MR_MEM_NM = '"& mem_nm &"' "
					strSql = strSql & "		,MR_BIRTH = '"& birth &"' "
					strSql = strSql & "		,MR_PHONE = '"& phone &"' "
					strSql = strSql & "		,MR_HP = '"& hp &"' "
					strSql = strSql & "		,MR_POST = '"& post &"' "
					strSql = strSql & "		,MR_ADDR1 = '"& addr_1 &"' "
					strSql = strSql & "		,MR_ADDR2 = '"& addr_2 &"' "
					strSql = strSql & "		,MR_SERVICE = '"& check1 &"' "
					strSql = strSql & "		,MR_PERIOD = '"& radio1 &"' "
					strSql = strSql & "		,MR_TYPE = '"& radio2 &"' "
					strSql = strSql & "		,MR_CHILDBIRTH = '"& childbirth &"' "
					strSql = strSql & "		,MR_SERVICESDT = '"& serviceSdt &"' "
					strSql = strSql & "		,MR_SERVICEEDT = '"& serviceEdt &"' "
					strSql = strSql & "		,MR_CLINIC = '"& radio3 &"' "
					strSql = strSql & "		,MR_EXPER = '"& radio4 &"' "
					strSql = strSql & "		,MR_UNIQUE = '"& check2 &"' "
					strSql = strSql & "		,MR_FAMILY = '"& check3 &"' "
					strSql = strSql & "		,MR_PAY_MENT = '"& payment &"' "
					strSql = strSql & "		,MR_PAY_TYPE = '"& radio5 &"' "
					strSql = strSql & "		,MR_PAY_STATE = '"& radio6 &"' "
					strSql = strSql & "		,MR_PAY_DT = '"& payDate &"' "
					strSql = strSql & "		,MR_CONTENT = '"& textarea &"' "
					strSql = strSql & "		,MR_SERVICESDT1 = '"& serviceSdt_1 &"' "
					strSql = strSql & "		,MR_SERVICEEDT1 = '"& serviceEdt_1 &"' "
					strSql = strSql & "		,MR_SERVICESDT2 = '"& serviceSdt_2 &"' "
					strSql = strSql & "		,MR_SERVICEEDT2 = '"& serviceEdt_2 &"' "
					strSql = strSql & "		,MR_SERVICESDT3 = '"& serviceSdt_3 &"' "
					strSql = strSql & "		,MR_SERVICEEDT3 = '"& serviceEdt_3 &"' "
					strSql = strSql & "		,MR_PAY_NAME = '"& pay_name &"' "
					strSql = strSql & "		,MR_CANCEL_YN = '"& cancel_yn &"' "
					strSql = strSql & "		,MR_CANCEL_REASON = '"& cancel_reason &"' "
					strSql = strSql & "		,MR_START_HAPPY_CALL = '"& s_happy_yn &"' "
					strSql = strSql & "		,MR_END_HAPPY_CALL = '"& e_happy_yn &"' "
 
					strSql = strSql & "		,MR_PRODUCT_CHOICE_1 = '"& product_1 &"' "
					strSql = strSql & "		,MR_PRODUCT_CHOICE_2 = '"& product_2 &"' "
					strSql = strSql & "		,MR_PRODUCT_CHOICE_WEEK = '"& product_week &"' "
					strSql = strSql & "		,MR_PRODUCT_CHOICE_PRICE = '"& product_price &"' "
					strSql = strSql & "		,MR_PRODUCT_OUT_DAY = '"& Q12_YMD &"' "
					strSql = strSql & "		,MR_MASSAGE_BEFORE = '"& massage1 &"' "
					strSql = strSql & "		,MR_MASSAGE_AFTER = '"& massage2 &"' "
					strSql = strSql & "		,MR_MASSAGE_ADD = '"& massage3 &"' "
					strSql = strSql & "		,MR_VISIT_NURSE_BEFORE = '"& Q14_1 &"' "
					strSql = strSql & "		,MR_VISIT_NURSE_AFTER = '"& Q14_2 &"' "
					strSql = strSql & "		,MR_SODOK_SERVICE = '"& Q15_Y &"' "
					strSql = strSql & "		,MR_GIFT_CHOICE = '"& pdt_no &"' "
					strSql = strSql & "		,MR_GIFT_CHOICE_SEND = '"& Q16_YMD &"' "
					strSql = strSql & "		,MR_GIFT_CHOICE_BABY = '"& Q16_baby &"' "
					strSql = strSql & "		,MR_GIFT_BOX_SEND = '"& Q17_YMD &"' "
	
					strSql = strSql & "		,MR_MASSAGE_MNG		= '"& massage_mng &"' "
					strSql = strSql & "		,MR_MASSAGE_HP		= '"& massage_hp &"' "
					strSql = strSql & "		,MR_VISIT_NURSE_MNG = '"& Q14_mng &"' "
					strSql = strSql & "		,MR_VISIT_NURSE_HP	= '"& nurse_hp &"' "
					strSql = strSql & "		,MR_SODOK_MNG		= '"& Q15_mng &"' "
					strSql = strSql & "		,MR_SODOK_HP		= '"& sodok_hp &"' "
 
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					'response.Write strSql

					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3
  
			If uId = "wellness14" And pdt_no <> "" Then

					strSql = ""
					strSql = strSql & " UPDATE MO_RESERVATION_GIFT_OUT SET "
					strSql = strSql & "		MD_GIFT_SEQ ='"& pdt_no &"' "
					strSql = strSql & "		,MD_GIFT_OUT_DATE ='"& Q16_YMD &"' "
				 
					strSql = strSql & "	WHERE MD_GIFT_MEM_ID='"& mem_id &"'; "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
				'	intMsg = 3
			End if
			  
					 


'업데이트시 산모도우미 검색후 저장하기 MO_EXTEND 0
 

			If mo_helper_seq <> "" Then 
		

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0) from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment &"' "
				
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   "
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'업데이트시 산모도우미 검색후 저장하기 MO_EXTEND 1
 

			If mo_helper_seq_1 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT1   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_1  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)+1 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_1 &"'  "
				If extend_1_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'업데이트시 산모도우미 검색후 저장하기 MO_EXTEND 2
 

			If mo_helper_seq_2 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT2   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_2  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0)+2 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq_2 &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_2 &"' "
			
				
				If extend_2_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 2 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
				
				
				
				
	'			If extend_2_sy <> ""   Then	
	'				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
	'				strSql = strSql & "  '"& intIDX &"'    " 
	'				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
	'			Else
	'				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
	'				strSql = strSql & "  '"& intIDX &"'   " 
	'				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
	'			End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 


			'업데이트시 산모도우미 검색후 저장하기 MO_EXTEND 3
 

			If mo_helper_seq_3 <> "" Then 

				strSql = ""
				strSql = strSql & " select MR_SERVICESDT3   "
				strSql = strSql & " FROM "
				strSql = strSql & " MO_RESERVATION "
				strSql = strSql & " where "
				strSql = strSql & "  MR_IDX = '"& intIDX &"' ; " 

				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then
					
					MO_EXTEND				    = Rs(0)

				
		 
				End If 

				Call RSClose(Rs)

					strSql = ""
					strSql = strSql & " INSERT INTO MO_HELPER_SERVICE ( "
					strSql = strSql & "        MD_HELPER_SEQ, "
					strSql = strSql & "        MR_IDX, "
					strSql = strSql & "        MO_SEQ, "
					strSql = strSql & "        MD_HELPER_COMMENT, "
					strSql = strSql & "        MO_EXTEND "
					strSql = strSql & " )  "
					strSql = strSql & " VALUES ( " & mo_helper_seq_3  
					strSql = strSql & " ,  " & intIDX 
					strSql = strSql & " ,(SELECT ISNULL(MAX(MO_SEQ), 0) + 3 from  MO_HELPER_SERVICE  where  MD_HELPER_SEQ = '"& mo_helper_seq_3 &"' "
					strSql = strSql & " and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM  MO_HELPER_SERVICE) )"
					strSql = strSql & " ,  '"& mo_service_comment_3 &"' "
				
				
				If extend_3_sy <> ""   Then	
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 3 from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
				Else
					strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
					strSql = strSql & "  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION)   " 
					strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
				End if
				
				
				
				
	'			If extend_3_sy <> ""   Then	
	'				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0) + 1 from  MO_HELPER_SERVICE where MR_IDX = "
	'				strSql = strSql & "  '"& intIDX &"'    " 
	'				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) )  "  
	'			Else
	'				strSql = strSql & " , (SELECT  ISNULL(MAX(MO_EXTEND ),0)  from  MO_HELPER_SERVICE where MR_IDX = "
	'				strSql = strSql & "  '"& intIDX &"'   " 
	'				strSql = strSql & "	  and    MR_IDX = (SELECT ISNULL(MAX(MR_IDX), 0)  FROM MO_HELPER_SERVICE) ) ) "
	'			End if
		
 
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
			End If 
		End If 
%>
 
<%


			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_RESERVATION SET "
					strSql = strSql & "		MR_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 




			Case "delete" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_RESERVATION  "
					strSql = strSql & "	WHERE MR_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 

		End Select 
	End If 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('회원정보를 확인해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "./data_res_list_test_ctm_app.asp?<%=strParam%>"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./data_res_list_test_ctm_app.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./data_res_list_test_ctm_app.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
