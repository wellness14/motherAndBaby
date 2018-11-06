<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!--#include virtual="/common/inc/member_email_send.asp"-->
<!-- #include virtual = "/common/asp/DbGodo.asp"-->
<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	idx = fncRequest("idx")  
 
	mode			= fncRequest("mode")	

If mode = "ins" Or mode = "upd" Then   

	user_id				= fncRequest("user_id")						' 아이디
	user_pwd			= fncRequest("user_pwd")					' 비밀번호
 	user_name			= Trim(fncRequest("user_name"))				' 이름 
	email				= fncRequest("email")						' 이메일 
	email_check			= fncRequest("email_check")					' 이메일 수신여부
	sms_check			= fncRequest("sms_check")					' sms 수신여부

	agree_hp			= Trim(fncRequest("agree_hp"))				' 선탯동의

	over14_agree1		= Trim(fncRequest("over14_agree1"))			' 필수동의1
	agree2				= Trim(fncRequest("agree2"))				' 필수동의2
	person_data_agree3	= Trim(fncRequest("person_data_agree3"))	' 필수동의3 
	mode				= fncRequest("mode")	 
	part				= fncRequest("part")						' 지점 선택

	If part <> "" then
		class_value = part
		dim myarray                          
		myarray=split(class_value,":")
		class_value_1=myarray(0)      
		title_value_1=myarray(1) 
	End if


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
	radio3		= fncRequest("radio3")			'조리원
	exp_baby	= fncRequest("exp_baby")		'출산경험
	unique_check = fncRequest("unique_check")	'특이사항

	unique_1 = fncRequest("unique_1")	'특이사항
  
	unique_1 = Replace(unique_1,",","||") '특이사항
 
	fam1	= fncRequest("fam1")	' 가족1
 
	fam1	= Replace(fam1,",","||") '가족

	hospotal_date		= fncRequest("hospotal_date")		
	hospotal_post		= fncRequest("hospotal_post")		
	hospotal_address1	= fncRequest("hospotal_address1")	
	
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

	'휴대폰 번호
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
	If hospotal_date <> "" Then 
		hospotal_date_arr=split(hospotal_date,"-") 
		hospotal_date_y = hospotal_date_arr(0)
		hospotal_date_m = hospotal_date_arr(1)
		hospotal_date_d = hospotal_date_arr(2)
		hospotal_date = hospotal_date_y &  hospotal_date_m  &  hospotal_date_d 
	End If 


'-----------------------------------------------------------------------------

 
'-----------------------------------------------------------------------------
'	데이터 확인 

	Select Case mode 
			Case "ins" :
 

				strSql = ""
				strSql = strSql & " INSERT INTO MO_MEM_MAS ( "
				strSql = strSql & "       MM_MEM_ID  "
				strSql = strSql & ",      MM_MEM_TYPE  "
			    strSql = strSql & ",      MM_MEM_NM   "
				strSql = strSql & ",      MM_MEM_PW " 
				strSql = strSql & " )		"
				strSql = strSql & " values(  "
				strSql = strSql & "			"
				strSql = strSql & "	 		'"& user_id &"'					"
				strSql = strSql & "	,		'S'								"
				strSql = strSql & "	,		'"& user_name &"'				"
				strSql = strSql & "	,		dbo.UF_MD5('"& user_pwd &"'));	"
 

	''			strSql = strSql & " INSERT INTO MO_MEM_DTL ( "
	'			strSql = strSql & "       MD_MEM_ID  " 
	'			strSql = strSql & ",      MD_AGREE_1  "
	'			strSql = strSql & ",      MD_AGREE_2  "
	'		    strSql = strSql & ",      MD_AGREE_3  " 
	'			strSql = strSql & " )  "
	'			strSql = strSql & " values ( "
	'			strSql = strSql & "			"
	'			strSql = strSql & " 		'"& user_id				&"' "
	'			strSql = strSql & ", 		'"& over14_agree1		&"' "
	'			strSql = strSql & ", 		'"& agree2				&"' "
	''			strSql = strSql & ",	 	'"& person_data_agree3  &"');  " 
 
 
				strSql = strSql & " INSERT INTO MO_MEM_DTL ("
				strSql = strSql & "       MD_MEM_ID			"
				strSql = strSql & ",      MD_AGREE_1		"
				strSql = strSql & ",      MD_AGREE_2		"
			    strSql = strSql & ",      MD_AGREE_3		"  
			    strSql = strSql & ",      MD_HP				"
				strSql = strSql & ",      MD_SEX			" 
				strSql = strSql & ",      MD_BIRTH			"   
				strSql = strSql & ",      MD_EMAIL			"   
			    strSql = strSql & ",      MD_POST			" 
				strSql = strSql & ",      MD_ADDR1			"  
				strSql = strSql & ",      MD_ADDR2			"  
				strSql = strSql & ",      MD_LOCAL			" 
				strSql = strSql & ",      MD_LOCAL_DETAIL	"  
				strSql = strSql & ",      MD_AGREE_HP		"   
				strSql = strSql & ",      MD_SNS_FLG		"   
				strSql = strSql & ",      MD_EMAIL_FLG		"   
				strSql = strSql & " )						"
				strSql = strSql & " values ( "
				strSql = strSql & "			"
				strSql = strSql & "	 		'"& user_id				&"' "
				strSql = strSql & ", 		'"& over14_agree1		&"' "
				strSql = strSql & ", 		'"& agree2				&"' "
				strSql = strSql & ", 		'"& person_data_agree3	&"' " 
				strSql = strSql & ", 		'"& hp					&"' "
				strSql = strSql & ",	 	'"& gender				&"' "
				strSql = strSql & ",	 	'"& birth				&"' " 
				strSql = strSql & ",	 	'"& email				&"' " 
				strSql = strSql & ",	 	'"& post				&"' " 
				strSql = strSql & ",	 	'"& address1			&"' " 
				strSql = strSql & ",	 	'"& address2			&"' " 
				strSql = strSql & ",	 	'"& class_value_1		&"' "
				strSql = strSql & ",	 	'"& title_value_1		&"' " 
				strSql = strSql & ",	 	'"& agree_hp			&"' " 
				strSql = strSql & ",	 	'"& sms_check			&"' "
				strSql = strSql & ",	 	'"& email_check			&"'); "
 '요기작업
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)

				'고도몰 회원정보 연동
				godoSql = "insert into gd_member set"
				godoSql = godoSql & " m_id = '"& user_id &"',"
				godoSql = godoSql & " level = '1',"
				godoSql = godoSql & " name = '"& user_name &"',"
				godoSql = godoSql & " nickname = '"& user_name &"',"
				godoSql = godoSql & " password	= password('"& user_pwd &"'),"
				godoSql = godoSql & " password_moddt = now(),"
				godoSql = godoSql & " status = '1',"
				godoSql = godoSql & " email = '"& email &"',"
				godoSql = godoSql & " zipcode = '"& post &"',"
				godoSql = godoSql & " address = '"& address1 &"',"
				godoSql = godoSql & " address_sub = '"& address2 &"',"
				godoSql = godoSql & " phone = '"& hp &"',"
				godoSql = godoSql & " mobile = '"& hp &"',"
				godoSql = godoSql & " mailling = '"& LCase(sms_check) &"',"
				godoSql = godoSql & " sms = '"& LCase(email_check) &"',"
				godoSql = godoSql & " sex = '',"
				godoSql = godoSql & " inflow = 'mnbmobile_m',"
				godoSql = godoSql & " regdt = now()"

				dbConGodo.Execute(godoSql)

				dbConGodo.Close
				Set dbConGodo = Nothing

				intMsg = 2
			
				sMailTile	= "[마더앤베이비] 회원 가입을 축하 드립니다."
				sContent	= Left(user_pwd,Len(user_pwd)-2) & "**"
				If email <> "" Then 
				'	zRtn = FNC_SEND_EMAIL("마더앤베이비", "mothernbaby@mothernbaby.co.kr", email, user_id, user_name, sMailTile, sContent, "JOIN")
				End If 
 
  
%>
 
<%
		 

	 




			Case "delete" : 
				If idx > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE   MO_EMERGENCY_SERVICE SET "
					strSql = strSql & " MS_CNLKBN ='Y'	WHERE EM_SEQ='"& idx &"' "
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
				alert('회원가입이 완료되었습니다.');
				parent.location.href = "./login.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./login.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./login.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
