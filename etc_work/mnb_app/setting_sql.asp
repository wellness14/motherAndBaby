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

	part				= fncRequest("part")							' 지점 선택

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
	hp			=  fncRequest("hp") 			' 
	
	before_post		= fncRequest("before_post")
	before_addr1	= fncRequest("before_addr1")
	before_addr2	= fncRequest("before_addr2")
   
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

	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
		Now_y = Now_arr(0)
		Now_m = Now_arr(1)
		Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d


'-----------------------------------------------------------------------------

 
'-----------------------------------------------------------------------------
'	데이터 확인 

	Select Case mode 
			Case "ins" :


			 
 

			Case "upd" : 
 
  

				strSql = ""	 
				strSql = strSql & " UPDATE  MO_MEM_DTL  SET " 
			    strSql = strSql & "       MD_POST			='"& post &"' "
				strSql = strSql & ",      MD_ADDR1			='"& address1 &"' "
		        strSql = strSql & ",      MD_ADDR2			='"& address2 &"' " 
				strSql = strSql & "	WHERE MD_MEM_ID			='"& user_id &"'; "
 
	'			response.Write strSql
	'			response.End 
  
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3


 '정보변경 확인 
 



  		If post <> before_post Then 
			 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='post' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y' where MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='post'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK ( MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& user_id &"','"& user_name &"','post','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 
 
  		If address1 <> before_addr1 Then 
 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='address1' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y' where MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='address1'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK ( MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& user_id &"','"& user_name &"','address1','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 


  		If address2 <> before_addr2 Then 
 
			strSql = ""
			strSql = " select * from	MO_APP_SERVICE_DATA_CHECK	where  MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='address2' "
			 
			Set RS = DBExec(strSql, "main")
			If Not Rs.EOF Then
			
				strSql = ""
				strSql = strSql & " UPDATE MO_APP_SERVICE_DATA_CHECK  SET  MS_CHANGE_FLG='Y' where MS_MEM_ID = '"& user_id &"'  and  MS_CHECK_NAME	='address2'  " 

			Else
 
				strSql = ""
				strSql = strSql & " insert into	MO_APP_SERVICE_DATA_CHECK ( MS_MEM_ID, MS_MEM_NM, MS_CHECK_NAME, MS_CHANGE_FLG, MS_CHECK_DATE)	"
				strSql = strSql & "								   values ('"& user_id &"','"& user_name &"','address2','Y','"& Now_ymd &"')	" 

			End If 
			CALL RSCLOSE(RS)
 
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
		End If 



 
 

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
