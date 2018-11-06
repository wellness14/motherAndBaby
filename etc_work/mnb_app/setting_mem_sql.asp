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

	mode				= fncRequest("mode")	

	user_id				= fncRequest("user_id")						'  아이디 
	user_name			= fncRequest("user_name")						'  아이디 
	post				= fncRequest("post")			'우편번호
	address1			= fncRequest("address1")		'주소1
	address2			= fncRequest("address2")		'주소2-상세

	part				= fncRequest("part")			' 지점 선택

	user_pwd			= fncRequest("user_pwd")		' 비밀번호

	If part <> "" then
		class_value = part
		dim myarray                          
		myarray=split(class_value,":")
		class_value_1=myarray(0)      
		title_value_1=myarray(1) 
	End if


	'서비스를 위한 선택입력항목
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

	hospital_date		= fncRequest("hospital_date")		
	hospital_post		= fncRequest("hospital_post")		
	hospital_address1	= fncRequest("hospital_address1")	
	
	''''서비스를 위한 선택입력항목 
	birth		= fncRequest("birth")		
	gender		= fncRequest("gender")				'  성별
	
	hp1			=  fncRequest("hp1") 	
	hp2			=  fncRequest("hp2") 	
	hp3			=  fncRequest("hp3") 	' 
	
	hp = hp1 & "-" & hp2 & "-" & hp3 
 
	 
 End If 

 
	' 생년월일
 

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

 
'-----------------------------------------------------------------------------
'	데이터 확인 

	Select Case mode 
			Case "ins" :
 
 
   

			


	 Case "upd" : 
			 
			 If user_pwd <> "" Then 
  				strSql = ""	 
				strSql = strSql & " UPDATE  MO_MEM_MAS  SET " 
			    strSql = strSql & "       MM_MEM_PW			= dbo.UF_MD5('"& user_pwd &"') "	 
				strSql = strSql & "	WHERE MM_MEM_ID			='"& user_id &"'; "
			 End if
			 
				strSql = strSql & " UPDATE  MO_MEM_DTL  SET " 
			    strSql = strSql & "       MD_HP				='"& hp &"' "
				strSql = strSql & "	WHERE MD_MEM_ID			='"& user_id &"'; " 

				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
 







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
				alert('수정 등록되었습니다.');
				parent.location.href = "setting.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "setting.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "setting.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
