<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/member_email_send.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then

	user_id				= fncRequest("user_id")						' 아이디 
 	user_name			= Trim(fncRequest("user_name"))				' 이름
	over14_agree1		= Trim(fncRequest("over14_agree1"))			' 필수동의1
	agree2				= Trim(fncRequest("agree2"))				' 필수동의2
	person_data_agree3	= Trim(fncRequest("person_data_agree3"))	' 필수동의3

	mode		= fncRequest("mode")	  

	'서비스를 위한 선택입력항목

	customer_nm = fncRequest("customer_nm")		'산모이름
	post		= fncRequest("post")			'우편번호
	address1	= fncRequest("address1")		'주소1
	address2	= fncRequest("address2")		'주소2-상세 

	service_nm  = fncRequest("service_nm")		'서비스 네임
	use_week	= fncRequest("use_week")		'이용기간
	use_type	= fncRequest("use_type")		'이용형태
	childbirth	= fncRequest("childbirth")		'출산예정일
	serviceSdt	= fncRequest("serviceSdt")		'서비스 희망일
	part			= fncRequest("part")		'지점 선택

	If part <> "" then
		class_value = part
		dim myarray                          
		myarray=split(class_value,":")
		class_value_1=myarray(0)      
		title_value_1=myarray(1) 
	End if
 
	radio3		= fncRequest("radio3")			'조리원 

	exp_baby	= fncRequest("exp_baby")		'출산경험
	unique_check = fncRequest("unique_check")	'특이사항

	unique_1 = fncRequest("unique_1")	'특이사항
  
	unique_1 = Replace(unique_1,",","||") '특이사항
 
	fam1	= fncRequest("fam1")	' 가족1
 
	fam1	= Replace(fam1,",","||") '가족




	hospital_date		= fncRequest("hospital_date")		
	hospital_post		= fncRequest("hospital_post")		
	hospital_address1	= fncRequest("hospital_address1")	

	contents	= fncRequest("contents")	
	
	''''서비스를 위한 선택입력항목 

	birth_j		= fncRequest("birth")		
	gender		= fncRequest("gender")				'  성별
  
	hp1			= Trim(fncRequest("hp1"))			' 
	hp2			= Trim(fncRequest("hp2"))			' 
	hp3			= Trim(fncRequest("hp3"))			' 
  
	agree_ch_1	= fncRequest("agree_ch_1")		
	agree_ch_2	= fncRequest("agree_ch_2")		
	agree_ch_3	= fncRequest("agree_ch_3")		
	agree_ch_4	= fncRequest("agree_ch_4")		
	agree_ch_5	= fncRequest("agree_ch_5")		
											
	sanmo_name	= fncRequest("sanmo_name")	 

 
 
 
 End If 

 hp = hp1 & "-" & hp2 & "-" & hp3

	' 생년월일
	If birth_j <> "" Then 
		birth_j_arr=split(birth_j,"-") 
		birth_y = birth_j_arr(0)
		birth_m = birth_j_arr(1)
		birth_d = birth_j_arr(2)
		birth = birth_y &  birth_m  &  birth_d 
	End If 

	 ' 출산
	If childbirth <> "" Then 
		childbirth_arr=split(childbirth,"-") 
		childbirth_y = childbirth_arr(0)
		childbirth_m = childbirth_arr(1)
		childbirth_d = childbirth_arr(2)
		childbirth = childbirth_y &  childbirth_m  &  childbirth_d 
	End If 

	 ' 서비스희망일
	If serviceSdt <> "" Then 
		serviceSdt_arr=split(serviceSdt,"-") 
		serviceSdt_y = serviceSdt_arr(0)
		serviceSdt_m = serviceSdt_arr(1)
		serviceSdt_d = serviceSdt_arr(2)
		serviceSdt = serviceSdt_y &  serviceSdt_m  &  serviceSdt_d 
	End If 

	 ' 서비스희망일
	If hospital_date <> "" Then 
		hospital_date_arr=split(hospital_date,"-") 
		hospital_date_y = hospital_date_arr(0)
		hospital_date_m = hospital_date_arr(1)
		hospital_date_d = hospital_date_arr(2)
		hospital_date = hospital_date_y &  hospital_date_m  &  hospital_date_d 
	End If 


'-----------------------------------------------------------------------------


 '본사용앱 관리자에서 정보변경 확인하기 위한 작업
	before_service_nm			= fncRequest("before_service_nm")		
	before_use_week				= fncRequest("before_use_week")	
	before_use_type				= fncRequest("before_use_type")	
	before_childbirth			= fncRequest("before_childbirth")	
	before_serviceSdt			= fncRequest("before_serviceSdt")	
	before_local				= fncRequest("before_local")	
	before_part					= fncRequest("before_part")	
	before_radio3				= fncRequest("before_radio3")	
	before_exp_baby				= fncRequest("before_exp_baby")	
	before_unique_1				= fncRequest("before_unique_1")	
	before_fam1					= fncRequest("before_fam1")	
	before_hospital_date		= fncRequest("before_hospital_date")	
	before_hospital_post		= fncRequest("before_hospital_post")	
	before_hospital_address1	= fncRequest("before_hospital_address1")	
	before_contents				= fncRequest("before_contents")	
	before_birth				= fncRequest("before_birth")	
	before_hp					= fncRequest("before_hp")	
	before_gender				= fncRequest("before_gender")	
 
 

 	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
		Now_y = Now_arr(0)
		Now_m = Now_arr(1)
		Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d

	 ' 서비스희망일
	If before_hospital_date <> "" Then 
		before_hospital_date_arr=split(before_hospital_date,"-") 
		before_hospital_date_y = before_hospital_date_arr(0)
		before_hospital_date_m = before_hospital_date_arr(1)
		before_hospital_date_d = before_hospital_date_arr(2)
		before_hospital_date = before_hospital_date_y &  before_hospital_date_m  &  before_hospital_date_d 
	End If 


'-----------------------------------------------------------------------------
'	데이터 확인 

	Select Case mode 
			Case "ins" : 
  
				strSql = strSql & " INSERT INTO MO_BRD_SERVICE ( "
				strSql = strSql & "       MS_MEM_ID		"
				strSql = strSql & ",      MS_MEM_NM		"
				strSql = strSql & ",      MS_BIRTH		" 
			    strSql = strSql & ",      MS_HP			"   

				strSql = strSql & ",      MS_POST " 
				strSql = strSql & ",      MS_ADDR1 " 
				strSql = strSql & ",      MS_ADDR2 " 

				strSql = strSql & ",      MS_SERVICE " 
				strSql = strSql & ",      MS_PERIOD " 
				strSql = strSql & ",      MS_TYPE " 

				strSql = strSql & ",      MS_CHILDBIRTH " 
				strSql = strSql & ",      MS_SERVICEDT " 
			'	strSql = strSql & ",      MR_SERVICEEDT " 
				strSql = strSql & ",      MS_CLINIC "  

				strSql = strSql & ",      MS_EXPER "   
				strSql = strSql & ",      MS_UNIQUE "   
			    strSql = strSql & ",      MS_FAMILY "    

				strSql = strSql & ",      MS_CONTENT "    
'				strSql = strSql & ",      MS_PROVISION_1 "    '이용약관
'				strSql = strSql & ",      MS_PROVISION_2 "    '개인정보취급방침
				strSql = strSql & ",      MD_LOCAL "     
				strSql = strSql & ",      MD_LOCAL_DETAIL "     

			    strSql = strSql & ",      MS_HOSPITAL_DATE "    
			    strSql = strSql & ",      MS_HOSPITAL_POST "   
				strSql = strSql & ",      MS_HOSPITAL_ADDRESS " 

				strSql = strSql & ",      MS_SEX "    
			    strSql = strSql & ",      MS_MAPP_AGREE1 "   
				strSql = strSql & ",      MS_MAPP_AGREE2 "
				strSql = strSql & ",      MS_MAPP_AGREE3 "    
			    strSql = strSql & ",      MS_MAPP_AGREE4 "   
				strSql = strSql & ",      MS_MAPP_AGREE5 "
 
				strSql = strSql & " )  "
				strSql = strSql & " values ( "
				strSql = strSql & "	 		'"& user_id				&"' "
				strSql = strSql & ", 		'"& user_name			&"' "
				strSql = strSql & ", 		'"& birth				&"' "
				strSql = strSql & ", 		'"& hp					&"' " 
				
				strSql = strSql & ",	 	'"& post				&"' " 
				strSql = strSql & ",	 	'"& address1			&"' " 
				strSql = strSql & ",	 	'"& address2			&"' " 
				
				strSql = strSql & ",	 	'"& service_nm			&"' "
				strSql = strSql & ",	 	'"& use_week			&"' " 
				strSql = strSql & ",	 	'"& use_type			&"' "
	 
				strSql = strSql & ",	 	'"& childbirth			&"' "
				strSql = strSql & ",	 	'"& serviceSdt			&"' "  
				strSql = strSql & ",	 	'"& radio3				&"' "

				strSql = strSql & ",	 	'"& exp_baby			&"' "
				strSql = strSql & ",	 	'"& unique_1			&"' "
				strSql = strSql & ",	 	'"& fam1				&"' "

				strSql = strSql & ",	 	'"& contents			&"' "
				strSql = strSql & ",	 	'"& class_value_1		&"' " 
				strSql = strSql & ",	 	'"& title_value_1		&"' " 
 
				strSql = strSql & ",	 	'"& hospital_date				&"' "
				strSql = strSql & ",	 	'"& hospital_post				&"' " 
				strSql = strSql & ",	 	'"& hospital_address1			&"' " 

				strSql = strSql & ",	 	'"& gender					&"' "
				strSql = strSql & ",	 	'"& agree_ch_1				&"' "
				strSql = strSql & ",	 	'"& agree_ch_2				&"' "
				strSql = strSql & ",	 	'"& agree_ch_3				&"' "
				strSql = strSql & ",	 	'"& agree_ch_4				&"' " 
				strSql = strSql & ",	 	'"& agree_ch_5				&"'); "
 
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
 
 
		Case "upd" : 

				strSql = ""	

				strSql = strSql & " UPDATE MO_BRD_SERVICE SET " 

				strSql = strSql & "       MS_BIRTH		='"& birth &"' " 
			    strSql = strSql & ",      MS_HP			='"& hp &"'	"   

				strSql = strSql & ",      MS_POST ='"& post &"' " 
				strSql = strSql & ",      MS_ADDR1 ='"& address1 &"' " 
				strSql = strSql & ",      MS_ADDR2 ='"& address2 &"' " 

				strSql = strSql & ",      MS_SERVICE ='"& service_nm &"' " 
				strSql = strSql & ",      MS_PERIOD ='"& use_week &"' " 
				strSql = strSql & ",      MS_TYPE ='"& use_type &"' " 

				strSql = strSql & ",      MS_CHILDBIRTH ='"& childbirth &"' " 
				strSql = strSql & ",      MS_SERVICEDT ='"& serviceSdt &"' " 
 
				strSql = strSql & ",      MS_CLINIC ='"& radio3 &"' " 

				strSql = strSql & ",      MS_EXPER ='"& exp_baby &"'  " 
				strSql = strSql & ",      MS_UNIQUE ='"& unique_1 &"' " 
			    strSql = strSql & ",      MS_FAMILY ='"& fam1 &"' " 

				strSql = strSql & ",      MS_CONTENT ='"& contents &"' " 
				strSql = strSql & ",      MD_LOCAL ='"& class_value_1 &"'  " 
				strSql = strSql & ",      MD_LOCAL_DETAIL ='"& title_value_1 &"' " 

			    strSql = strSql & ",      MS_HOSPITAL_DATE ='"& hospital_date &"'  " 
			    strSql = strSql & ",      MS_HOSPITAL_POST ='"& hospital_post &"' " 
				strSql = strSql & ",      MS_HOSPITAL_ADDRESS ='"& hospital_address1 &"'  " 

			    strSql = strSql & ",      MS_SEX ='"& gender &"'				" 
			    strSql = strSql & ",      MS_MAPP_AGREE1 ='"& agree_ch_1 &"'	" 
				strSql = strSql & ",      MS_MAPP_AGREE2 ='"& agree_ch_2 &"'	" 
			    strSql = strSql & ",      MS_MAPP_AGREE3 ='"& agree_ch_3 &"'	" 
			    strSql = strSql & ",      MS_MAPP_AGREE4 ='"& agree_ch_4 &"'	" 
				strSql = strSql & ",      MS_MAPP_AGREE5 ='"& agree_ch_5 &"'	" 


				strSql = strSql & "	WHERE MS_IDX='"& idx &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3 
 

 '정보변경 확인 

  		If birth <> before_birth Then 
			check_name = "birth"
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='birth' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='birth'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','birth','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 
 


  		If hp <> before_hp Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hp' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hp'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','hp','Y','"& Now_ymd &"')		" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If service_nm <> before_service_nm Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='service' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='service'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','service','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If use_week <> before_use_week Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='use_week' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='use_week'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','use_week','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If use_type <> before_use_type Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='use_type' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='use_type'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','use_type','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If childbirth <> before_childbirth Then
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='childbirth' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='childbirth'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','childbirth','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If serviceSdt <> before_serviceSdt Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='serviceSdt' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='serviceSdt'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','serviceSdt','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

  		If radio3 <> before_radio3 Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='radio3' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='radio3'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','radio3','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If exp_baby <> before_exp_baby Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='exp_baby' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='exp_baby'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','exp_baby','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If unique_1 <> before_unique_1 Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='unique_1' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='unique_1'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','unique_1','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If fam1 <> before_fam1 Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='fam1' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='fam1'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','fam1','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If contents <> before_contents Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='contents' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='contents'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','contents','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If class_value_1 <> before_part Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='class_value_1' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='class_value_1'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','class_value_1','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If hospital_date <> before_hospital_date Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_date' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_date'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','hospital_date','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If hospital_post <> before_hospital_post Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_post' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_post'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','hospital_post','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


		If hospital_address1 <> before_hospital_address1 Then  
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_address1' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='hospital_address1'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','hospital_address1','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		If gender <> before_gender Then 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='gender' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y'	where   MS_IDX = '"& idx &"'  and  MS_CHECK_NAME	='gender'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK (MS_IDX, MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)		"
				strSql = strSql & "								   values ('"& idx &"','"& user_id &"','"& user_name &"','gender','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 

		'정보수정시 본사용앱에 정보수정 표시되도록 작업
 

	'			If birth <> before_birth Then  	Response.write "같지않으면수정1" & "<br>"	End If
	'			If hp <> before_hp Then 		Response.write "같지않으면수정2" & "<br>"	End If 
	'			If service_nm <> before_service_nm Then 	Response.write "같지않으면수정6" & "<br>"	End If 
	'			If use_week <> before_use_week Then 	Response.write "같지않으면수정7" & "<br>"	End If 
	'			If use_type <> before_use_type Then	Response.write "같지않으면수정8" & "<br>"	End If 
	'			If childbirth <> before_childbirth Then 		Response.write "같지않으면수정9" & "<br>"		End If 
	'			If serviceSdt <> before_serviceSdt Then 	Response.write "같지않으면수정10" & "<br>"	End If
	'			If radio3 <> before_radio3 Then 	Response.write "같지않으면수정11" & "<br>"	End If
	'			If exp_baby <> before_exp_baby Then 	Response.write "같지않으면수정12" & "<br>"	End If 
	'			If unique_1 <> before_unique_1 Then 	Response.write "같지않으면수정13" & "<br>"	End If
	'			If fam1 <> before_fam1 Then 	Response.write "같지않으면수정14" & "<br>"	End If
	'			If contents <> before_contents Then 	Response.write "같지않으면수정15" & "<br>"	End If
	'			If class_value_1 <> before_part Then 	Response.write "같지않으면수정16" & "<br>"		End If
	'			If hospital_date <> before_hospital_date Then 	Response.write "같지않으면수정17" & "<br>"	End If
	'			If hospital_post <> before_hospital_post Then 	Response.write "같지않으면수정18" & "<br>"	End If
	'			If hospital_address1 <> before_hospital_address1 Then 	Response.write "같지않으면수정19" & "<br>"		End If
	'			If gender <> before_gender Then 		Response.write "같지않으면수정20" & "<br>"	End If
  


			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_BRD_SERVICE SET "
					strSql = strSql & " MS_CNLKBN ='Y'	WHERE MS_IDX='"& idx &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 
		
	End Select 
 
%>


<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('회원정보를 확인해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('삼담신청이 완료되었습니다.');
				parent.location.href = "./service_n_info.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./service_n_info.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./service_n_info.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
