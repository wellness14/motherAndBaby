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


	mo_helper_seq		= Trim(fncRequest("mo_helper_seq1"))		'산모도우미 시퀀스
	mo_helper_name1		= Trim(fncRequest("mo_helper_name1"))		'산모도우미 이름
	mo_service_comment	= Trim(fncRequest("mo_service_comment"))	'산모도우미 서비스 비고

	mo_helper_seq_1		= Trim(fncRequest("mo_helper_seq_1"))		'산모도우미 시퀀스
	mo_helper_name_1	= Trim(fncRequest("mo_helper_name_1"))		'산모도우미 이름
	mo_service_comment_1= Trim(fncRequest("mo_service_comment_1"))	'산모도우미 서비스 비고

	mo_helper_seq_2		= Trim(fncRequest("mo_helper_seq_2"))		'산모도우미 시퀀스
	mo_helper_name_2	= Trim(fncRequest("mo_helper_name_2"))		'산모도우미 이름
	mo_service_comment_2= Trim(fncRequest("mo_service_comment_2"))  '산모도우미 서비스 비고

	mo_helper_seq_3		= Trim(fncRequest("mo_helper_seq_3"))		'산모도우미 시퀀스
	mo_helper_name_3	= Trim(fncRequest("mo_helper_name_3"))		'산모도우미 이름
	mo_service_comment_3= Trim(fncRequest("mo_service_comment_3"))  '산모도우미 서비스 비고






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


		add_payment			= fncRequest("add_payment")				' 추가비용  
		birth_j				= fncRequest("birth")				' 생일(달력)  



	End If 
'-----------------------------------------------------------------------------

		check3_fam1=""
		check3_fam2=""
		check3_fam3=""
		check3_fam4=""
		check3_num1=""
		check3_num2=""
		check3_num3=""
		check3_num4=""
 

%>
 
<%

'-----------------------------------------------------------------------------


'--------달력추가로 수정 ----------------------------------------------------------
	birth_j_arr=split(birth_j,"-") 
	birth_y = birth_j_arr(0)
	birth_m = birth_j_arr(1)
	birth_d = birth_j_arr(2)
	birth = birth_y &  birth_m  &  birth_d 
'--------달력추가로 수정 ----------------------------------------------------------


 
'	데이터 확인
'	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")



'---------------------------------------------------------------
'코드입력
		If check2 <> "" Then 
			class_value = check2
			dim myarray                          
			myarray=split(class_value,"||") 
				For i = 0 To UBound(myarray)
				'	response.write i & "번째 : " & myarray(i) & "<br>"
						If myarray(i) = "쌍둥이" Then
							add_twin_check = "쌍둥이케어"
						End If 
					%> 
<script>
//	 alert("<%=myarray(i)%>");
</script> 
					<%
				Next 
		End If

  
		If check3 <> "" Then 
			check3_value = check3
			dim check3_array                          
			check3_array=split(check3_value,"||") 
				For i = 0 To UBound(check3_array)
				'	response.write i & "번째 : " & check3_array(i) & "<br>"
%> 
<script>
//		 alert("<%=check3_array(i)%>");	 
</script> 
<%
 
						If trim(check3_array(i)) = "미취학아동1명" Then	
							check3_fam1 = "미취학아동"	
							check3_num1  = "1"
						elseif  trim(check3_array(i)) = "미취학아동2명" Then	
							check3_fam1 = "미취학아동"
							check3_num1  = "2"
						elseif  trim(check3_array(i)) = "미취학아동3명" Then	
							check3_fam1 = "미취학아동"
							check3_num1  = "3"
						elseif  trim(check3_array(i)) = "미취학아동4명" Then
							check3_fam1 = "미취학아동"
							check3_num1  = "4"
						elseif  trim(check3_array(i)) = "미취학아동5명" Then	
							check3_fam1 = "미취학아동"
							check3_num1  = "5"
						elseif  trim(check3_array(i)) = "취학아동1명" Then
							check3_fam2 = "취학아동"
							check3_num2  = "1"
						elseif  trim(check3_array(i)) = "취학아동2명" Then
							check3_fam2 = "취학아동"
							check3_num2  = "2"
						elseif  trim(check3_array(i)) = "취학아동3명" Then
							check3_fam2 = "취학아동"
							check3_num2  = "3"
						elseif  trim(check3_array(i)) = "취학아동4명" Then
							check3_fam2 = "취학아동"
							check3_num2  = "4"
						elseif  trim(check3_array(i)) = "취학아동5명" Then
							check3_fam2 = "취학아동"
							check3_num2  = "5"
						elseif  trim(check3_array(i)) = "기타가족1명" Then
							check3_fam3 = "추가가족"
							check3_num3  = "1"
						elseif  trim(check3_array(i)) = "기타가족2명" Then
							check3_fam3 = "추가가족"	
							check3_num3  = "2"					
						elseif  trim(check3_array(i)) = "기타가족3명" Then
							check3_fam3 = "추가가족"
							check3_num3  = "3"
						ElseIf  trim(check3_array(i)) = "부모님" Then
							check3_fam4 = "추가가족"
							check3_num4  = "1"
						End If  
				Next 
%> 
<script>
 //		alert("<%=check3_fam1%>");alert("<%=check3_num1%>");
//		alert("<%=check3_fam2%>");alert("<%=check3_num2%>");
//		alert("<%=check3_fam3%>");alert("<%=check3_num3%>");
//		alert("<%=check3_fam4%>");alert("<%=check3_num4%>");  
</script> 
<%
		End If 
'----------------------------------------------------------------
%> 
<script>
 
</script> 
<%
	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d) 
	serviceSdt = serviceSdt_y & fncSetNumber(serviceSdt_m) & fncSetNumber(serviceSdt_d)
	serviceEdt = serviceEdt_y & fncSetNumber(serviceEdt_m) & fncSetNumber(serviceEdt_d)

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


	If payEdt_y <> "" And payEdt_m <> "" And payEdt_d <> "" Then 
		payDate	   = payEdt_y & fncSetNumber(payEdt_m) & fncSetNumber(payEdt_d)
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
'-----------------------------------------------------------------------------	

If mode = "ins" And mem_id = "" Then 
		intMsg = 1
Else 

 

		Select Case mode 
			Case "ins" :   
'원래쿼리  

		'서비스이름,	이용기간,		이용타입(출퇴근), 특이사항(쌍둥이), 추가가족, 
		'check1,	radio1,		radio2		  check2	 ,  check3 
		If check1 <> "" Then 
			strSql1 = ""	
			strSql1 = strSql1 & "	select code				"
			strSql1 = strSql1 & "	FROM						"
			strSql1 = strSql1 & "	MO_SERVICE_CODE				"
			strSql1 = strSql1 & "	where						"
			strSql1 = strSql1 & "	CODENAME = '"& check1 &"' AND depth=1 	"  
			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_1_CODE	= Rs(0)  '서비스 프로그램
			End If  
		End If
 

		If DEPTH_1_CODE <> "" Then 
			If radio2		= "출퇴근 + 5일" Then
				work_type	= "출퇴근"
				work_day	= "5일"
			ElseIf radio2	= "출퇴근 + 6일" Then
				work_type	= "출퇴근"
				work_day	= "6일"
			ElseIf radio2	= "입주 + 5일" Then
				work_type	= "입주"
				work_day	= "5일"
			ElseIf radio2	= "입주 + 6일" Then
				work_type	= "입주"
				work_day	= "6일"
			ElseIf radio2	= "출퇴근 + 입주 + 5일" Then
				work_type	= "출퇴근+입주"
				work_day	= "5일"
			ElseIf radio2	= "출퇴근 + 입주 + 6일" Then
				work_type	= "출퇴근+입주"
				work_day	= "6일"
		End if
 

			strSql1 = ""	
			strSql1 = strSql1 & "	;select code 															"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_1_CODE &"'	AND		CODENAME =	'"& work_type &"'	" 

			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_2_CODE	= Rs(0) '출퇴근 , 입주 
			End If  

			strSql1 = ""	
			strSql1 = strSql1 & "	;select code 															"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_2_CODE &"'	AND		CODENAME =	'"& work_day &"'	" 

			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_3_CODE	= Rs(0) '5일 6일 
			End If  
 
			strSql1 = ""	
			strSql1 = strSql1 & "	;select code, price														"
			strSql1 = strSql1 & "	FROM																	"
			strSql1 = strSql1 & "	MO_SERVICE_CODE															"
			strSql1 = strSql1 & "	where																	"
			strSql1 = strSql1 & "	up_code = '"& DEPTH_3_CODE &"' AND  CODENAME = '"& radio1 &"'			" 
			
			Set Rs = DBExec(strSql1,"main")	
			If Not Rs.EOF Then 
				DEPTH_4_CODE	= Rs(0) '1~4주
				DEPTH_4_PRICE	= Rs(1) '가격
			End If  

			'----------------------------------------------------------------------	추가비용 쌍둥이 ---------------------------------------------------------------------------- 
			If add_twin_check <> "" Then 
				strSql1 = ""	
				strSql1 = strSql1 & "	;select code 														"
				strSql1 = strSql1 & "	FROM																"
				strSql1 = strSql1 & "	MO_SERVICE_CODE														"
				strSql1 = strSql1 & "	where																"
				strSql1 = strSql1 & "	up_code = 'A0001'	AND		CODENAME =	'"& work_type &"'			" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_DEPTH_2_CODE	= Rs(0) '출퇴근 , 입주 
				End If  


				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price														"
				strSql1 = strSql1 & "	FROM																		"
				strSql1 = strSql1 & "	MO_SERVICE_CODE																"
				strSql1 = strSql1 & "	where																		"
				strSql1 = strSql1 & "	up_code = '"& ADD_DEPTH_2_CODE &"' AND  CODENAME = '"& add_twin_check &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_DEPTH_3_CODE	= Rs(0) '    쌍둥이
					ADD_DEPTH_3_PRICE	= Rs(1) '    가격  
				End If   
				
				depth = "0"

				Response.write 		DEPTH_1_CODE   &","
				Response.write 		DEPTH_2_CODE   &","
				Response.write 		DEPTH_3_CODE   &","
				Response.write 		DEPTH_4_CODE   &","
				Response.write 		DEPTH_4_PRICE  &","

				Response.write 		ADD_DEPTH_2_CODE  &","
				Response.write 		ADD_DEPTH_3_CODE  &","
				Response.write 		ADD_DEPTH_3_PRICE  &"," 
			End If
'----------------------------------------------------------------------	추가비용  추가가족 ---------------------------------------------------------------------------- 
		If check3 <> "" Then 
				strSql1 = ""	
				strSql1 = strSql1 & "	;select code 									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = 'A0001'	AND		CODENAME =	'"& work_type &"'	" 

				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM1_DEPTH_2_CODE	= Rs(0) '출퇴근 , 입주 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam1 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM2_DEPTH_3_CODE	= Rs(0) '추가가족 타입
					ADD_FAM2_DEPTH_3_PRICE	= Rs(1) '추가가족 가격
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam2 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM3_DEPTH_3_CODE	= Rs(0) '추가가족 타입
					ADD_FAM3_DEPTH_3_PRICE	= Rs(1) '추가가족 가격 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam3 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM4_DEPTH_3_CODE	= Rs(0) '추가가족 타입
					ADD_FAM4_DEPTH_3_PRICE	= Rs(1) '추가가족 가격 
				End If  

				strSql1 = ""	
				strSql1 = strSql1 & "	;select code , price									"
				strSql1 = strSql1 & "	FROM														"
				strSql1 = strSql1 & "	MO_SERVICE_CODE												"
				strSql1 = strSql1 & "	where														"
				strSql1 = strSql1 & "	up_code = '"& ADD_FAM1_DEPTH_2_CODE &"'	AND		CODENAME =	'"& check3_fam4 &"'	" 
				
				Set Rs = DBExec(strSql1,"main")	
				If Not Rs.EOF Then 
					ADD_FAM5_DEPTH_3_CODE	= Rs(0) '추가가족 타입
					ADD_FAM5_DEPTH_3_PRICE	= Rs(1) '추가가족 가격 
				End If   

		End If 
 
	End If

 
		If DEPTH_1_CODE <> "" And DEPTH_2_CODE <> "" And DEPTH_3_CODE <> "" And DEPTH_4_CODE <> "" And DEPTH_4_PRICE <> "" Then
	 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_DATA_RESERVATION ( "
			strSql = strSql & "			MR_IDX					"
			strSql = strSql & " ,       SERVICE_CODE			"
			strSql = strSql & " ,       TYPE_CODE				"
			strSql = strSql & " ,       PERIOD_CODE				"
			strSql = strSql & " ,       DAY_CODE				"
			strSql = strSql & " ,       PRICE					" 
			strSql = strSql & " ,       ADD_TYPE				"
	'		strSql = strSql & " ,       ADD_FAMILY1				"
	'		strSql = strSql & " ,       ADD_FAMILY2				"
	'		strSql = strSql & " ,       ADD_FAMILY3				"
	'		strSql = strSql & " ,       ADD_FAMILY4				"
	'		strSql = strSql & " ,       ADD_FAMILY5				"
	'		strSql = strSql & " ,       ADD_OVER_TIME			"
	'		strSql = strSql & " ,       ADD_HOLIDAY_WORK		"
			strSql = strSql & " ,       ADD_PRICE		"
			strSql = strSql & " ) "
			strSql = strSql & " VALUES (  (SELECT ISNULL(MAX(MR_IDX), 0) FROM MO_RESERVATION) "   
			strSql = strSql & " ,  '"&	DEPTH_1_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_2_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_3_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_4_CODE			&"' "
			strSql = strSql & " ,  '"&	DEPTH_4_PRICE			&"' "   
			strSql = strSql & " ,  '"&	birth		&"' "
	'		strSql = strSql & " ,  '"&	ADD_DEPTH_3_CODE		&"' "
	'		strSql = strSql & " ,  '"&	ADD_FAM2_DEPTH_3_CODE	&"' "
	'		strSql = strSql & " ,  '"&	ADD_FAM3_DEPTH_3_CODE	&"' "
		'	strSql = strSql & " ,  '"&	ADD_FAM4_DEPTH_3_CODE	&"' "
		'	strSql = strSql & " ,  '"&	ADD_FAM5_DEPTH_3_CODE	&"' "
	'		strSql = strSql & " ,  '"&		depth				&"' "
	'		strSql = strSql & " ,  '"&		depth				&"' "
			strSql = strSql & " ,  '"&		add_payment				&"' )"

			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			Response.write 		"finish"
		End if
		 




	
			If uId = "wellness14" And pdt_no <> "" Then 
				 
			End if
 

			If mo_helper_seq <> "" Then  

			End If 
 
			If mo_helper_seq_1 <> "" Then 
 
			End If 

	 
			If mo_helper_seq_2 <> "" Then 
 
			End If 
 

			If mo_helper_seq_3 <> "" Then 
		 
			End If 
		 
			

			Case "upd" : 
				  
			If uId = "wellness14" And pdt_no <> "" Then 

			End if
			   
			If mo_helper_seq <> "" Then 
		
 			End If 
 
			If mo_helper_seq_1 <> "" Then 
 
			End if
		 
			If mo_helper_seq_2 <> "" Then  

			End If  
 
%>
 
<% 
			Case "del" : 
				If intIDX > 0 Then  
					intMsg = 4
				End If 
  
			Case "delete" : 
				If intIDX > 0 Then  
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
				parent.location.href = "./member_reser_list.asp?<%=strParam%>"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./member_reser_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./member_reser_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
