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
	post		= fncRequest("hospital_post")			'우편번호
	address1	= fncRequest("hospital_address1")		'주소1
	address2	= fncRequest("address2")		'주소2-상세 

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
 
  
%>
 
<%
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

			    strSql = strSql & ",      MS_SEX ='"& gender &"' " 
			    strSql = strSql & ",      MS_MAPP_AGREE1 ='"& agree_ch_1 &"' " 
				strSql = strSql & ",      MS_MAPP_AGREE2 ='"& agree_ch_2 &"'  " 
			    strSql = strSql & ",      MS_MAPP_AGREE3 ='"& agree_ch_3 &"' " 
			    strSql = strSql & ",      MS_MAPP_AGREE4 ='"& agree_ch_4 &"' " 
				strSql = strSql & ",      MS_MAPP_AGREE5 ='"& agree_ch_5 &"'   " 


				strSql = strSql & "	WHERE MS_IDX='"& idx &"' "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3




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
