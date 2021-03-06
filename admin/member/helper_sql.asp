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
	hp_seq			= Trim(fncRequest("hp_seq"))		' 사용자ID
	




	If mode = "ins" Or mode = "upd" Then 
		
		filePath	= Trim(fncRequest("filePath"))
		varFileNm	= Trim(fncRequest("varFileNm")) 

		hp_name		    = Trim(fncRequest("hp_name"))				' 관리사 이름
		jumin1          = Trim(fncRequest("jumin1"))			' 주민번호앞자리
		jumin2          = Trim(fncRequest("jumin2"))				' 주민번호뒷자리

		hp_1            = Trim(fncRequest("hp_1"))				' 핸폰앞자리
		hp_2            = Trim(fncRequest("hp_2"))				' 핸폰가운대자리
		hp_3            = Trim(fncRequest("hp_3"))				' 핸폰뒷자리

		phone_1         = Trim(fncRequest("phone_1"))				' 집폰앞자리
		phone_2         = Trim(fncRequest("phone_2"))				' 집폰가운대자리
		phone_3         = Trim(fncRequest("phone_3"))				' 집폰뒷자리

		local          = fncRequest("local")				    ' 지점명
		part          = fncRequest("part")				    ' 지점명 디테일

		post_1         = Trim(fncRequest("post_1"))				' 우편번호앞
		post_2         = Trim(fncRequest("post_2"))				' 우편번호뒷
		addr_1         = Trim(fncRequest("addr_1"))				' 주소
		addr_2         = Trim(fncRequest("addr_2"))				' 상세주소

		hp_type			= fncRequest("hp_type")				' 도우미 분류
		hope_work		= fncRequest("hope_work")			' 희망근무형태  
		bank			= Trim(fncRequest("bank"))				' 계좌정보 

		account		    = Trim(fncRequest("account"))		        ' 계좌번호 
		account_name	= Trim(fncRequest("account_name"))		' 예금주 
		hp_hope     	= fncRequest("hp_hope")		        ' 희망근무지역 


		hp_near	        = fncRequest("hp_near")		        ' 가까운지하철역 
		edu_org     	= fncRequest("edu_org")		        ' 교육수료기관 
		dip_no      	= Trim(fncRequest("dip_no"))		        ' 기수     


		license     	= fncRequest("license")	        	' 자격증 

		license1     	= fncRequest("license1")	        	' 자격증 
		license2     	= fncRequest("license2")	        	' 자격증 
		license3     	= fncRequest("license3")	        	' 자격증 
		license4     	= fncRequest("license4")	        	' 자격증 
		license5     	= fncRequest("license5")	        	' 자격증 
		license6     	= fncRequest("license6")

		license_no1   	= fncRequest("license1_gb")		    ' 급수 
		license_no2   	= fncRequest("license2_gb")		    ' 급수 
		license_no3   	= fncRequest("license3_gb")		    ' 급수 
		license_no4   	= fncRequest("license4_gb")		    ' 급수 
		license_no5   	= fncRequest("license5_gb")		    ' 급수 
		license_no6   	= fncRequest("license6_gb")		    ' 급수 


		license_no   	= fncRequest("license_no")		    ' 급수 
		hp_riligion	    = fncRequest("hp_riligion")		    ' 종교 

		INSURANCE_FLG	= fncRequest("INSURANCE_FLG")		' 배상보험 가입유무  
		INSURANCE_NO	= Trim(fncRequest("INSURANCE_NO"))		' 증권번호 


		startY			= fncRequest("startY")				' 수혜기간시작년 
		startM			= fncRequest("startM")				' 수혜기간시작월 
		startD			= fncRequest("startD")				' 수혜기간시작일 


		endY			= fncRequest("endY")				' 수혜기간마지막년 
		endM			= fncRequest("endM")				' 수혜기간마지막월 
		endD			= fncRequest("endD")				' 수혜기간마지막일 

		INSURANCE_NOW	= fncRequest("INSURANCE_NOW")		' 상태 
		hp_picture		= fncRequest("hp_picture")			' 관리사 사진 

		QUALIFICTION	= fncRequest("QUALIFICTION")		' 자격사항 
		QnA				= fncRequest("QnA")					' 기타문의 

		i_start				= fncRequest("i_start_date")			' 생일(달력)  
		i_end				= fncRequest("i_end_date")				' 생일(달력)  

		health_flg				= fncRequest("health_flg")				' 건강진단유무

		If part <> "" then
			class_value = part
			dim myarray                          
			myarray=split(class_value,":")
			class_value_1=myarray(0)      
			title_value_1=myarray(1)
		End if

	End If 
'-----------------------------------------------------------------------------
 



 '--------달력추가로 수정 ----------------------------------------------------------
If i_start <> "" Then  
	i_start_arr=split(i_start,"-") 
	i_start_y = i_start_arr(0)
	i_start_m = i_start_arr(1)
	i_start_d = i_start_arr(2)
	i_start_ymd = i_start_y &  i_start_m  &  i_start_d 

End If 

If i_end <> "" then
	i_end_arr=split(i_end,"-") 
	i_end_y = i_end_arr(0)
	i_end_m = i_end_arr(1)
	i_end_d = i_end_arr(2)
	i_end_ymd = i_end_y &  i_end_m  &  i_end_d 
 End If 

'--------달력추가로 수정 ----------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	If startY <> "" And startM <> "" And startD <> "" Then 
	startYMD = startY & fncSetNumber(startM) & fncSetNumber(startD)
	End If 


	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2
	

	If INSURANCE_FLG = "" Then INSURANCE_FLG = "N"


	If endY <> "" And endM <> "" And endD <> "" Then 
	endYMD = endY & fncSetNumber(endM) & fncSetNumber(endD)
	End If 

'-----------------------------------------------------------------------------	

	Select Case mode 
		Case "ins" : 
			strSql = ""
			strSql = strSql & " INSERT INTO MO_HELPER ( "
			strSql = strSql & " MD_HELPER_SEQ, MD_HELPER_NAME, MD_HELPER_JUMIN1, MD_HELPER_JUMIN2, MD_HELPER_PHONE, MD_HELPER_HP, MD_HELPER_LOCAL, MD_HELPER_LOCAL_ORIGINAL,  "
			strSql = strSql & "       MD_HELPER_POST, MD_HELPER_ADDR1, MD_HELPER_ADDR2, MD_HELPER_FLG, MD_HELPER_WORK_FLG, MD_HELPER_BANK,   "
			strSql = strSql & "       MD_HELPER_ACCOUNT,MD_HELPER_ACCOUNT_NAME, MD_HELPER_HOPE, MD_HELPER_NEAR, MD_HELPER_EDU,  "
			strSql = strSql & "       MD_HELPER_DIPLOMA_NO, MD_HELPER_LICENSE, MD_HELPER_LICENSE_NO, MD_HELPER_RELIGION, MD_HELPER_INSURANCE_FLG,   "
			strSql = strSql & "       MD_HELPER_INSURANCE_NO, MD_HELPER_INSURANCE_START, MD_HELPER_INSURANCE_END, MD_HELPER_INSURANCE_NOW_FLG,   "
			strSql = strSql & "       MD_HELPER_PICTURE, MD_HELPER_QUALIFICTION, MD_HELPER_QnA , MD_HELPER_LICENSE_1, MD_HELPER_LICENSE_2, "
			strSql = strSql & " MD_HELPER_LICENSE_3,MD_HELPER_LICENSE_4, MD_HELPER_LICENSE_5, MD_HELPER_LICENSE_NO_1, MD_HELPER_LICENSE_NO_2  "
			strSql = strSql & "  , MD_HELPER_LICENSE_NO_3, MD_HELPER_LICENSE_NO_4, MD_HELPER_LICENSE_NO_5 , MD_HELPER_HEALTH"
			strSql = strSql & "   "
			strSql = strSql & "   "
			strSql = strSql & "   "
  

			strSql = strSql & " )  "
			strSql = strSql & " VALUES ( (SELECT ISNULL(MAX(MD_HELPER_SEQ), 0) + 1 FROM MO_HELPER)"
			strSql = strSql & ",'"& hp_name &"','"& jumin1 &"','"& jumin2 &"','"& phone &"','"&  hp &"','"&  class_value_1 &"','"&  title_value_1 &"','"& post &"','"& addr_1 &"','"& addr_2 &"', '"
			strSql = strSql & hp_type &"','"& hope_work &"','"& bank &"','"& account &"','"& account_name &"','"& hp_hope &"','"& hp_near &"','"& edu_org &"', '"
			strSql = strSql & dip_no &"','"& license1 &"','"& license_no1 &"','"& hp_riligion &"','"& INSURANCE_FLG &"','"& INSURANCE_NO &"','"& i_start_ymd &"','"& i_end_ymd &"', '"
			strSql = strSql & INSURANCE_NOW &"','"& filePath &"','"& QUALIFICTION &"','"& QnA &"', '"
			strSql = strSql & license2 &"','"& license3 &"','"& license4 &"','"& license5 &"','"& license6 & "', '"
			strSql = strSql & license_no2 &"','"& license_no3 &"','"& license_no4 &"','"& license_no5 & "', '"& license_no6 & "','"
			strSql = strSql & health_flg &"');"

'          response.Write strSql
'		   response.End 

%>
 
<%
			Call DBExec(strSql, "main") : Call DBClose(DBCon)
			intMsg = 2

		Case "upd" : 

 

				strSql = ""

				strSql = strSql & " UPDATE MO_HELPER SET "
				strSql = strSql & "		MD_HELPER_NAME ='"& hp_name &"' "
				strSql = strSql & "		,MD_HELPER_JUMIN1 ='"& jumin1 &"' "
				strSql = strSql & "		,MD_HELPER_JUMIN2 ='"& jumin2 &"' "
				strSql = strSql & "		,MD_HELPER_PHONE ='"& phone &"' "
				strSql = strSql & "		,MD_HELPER_HP ='"& hp &"' "
				strSql = strSql & "		,MD_HELPER_LOCAL ='"& class_value_1 &"' "
				strSql = strSql & "		,MD_HELPER_LOCAL_ORIGINAL ='"& title_value_1 &"' "
				strSql = strSql & "		,MD_HELPER_POST ='"& post &"' "
				strSql = strSql & "		,MD_HELPER_ADDR1 ='"& addr_1 &"' "
				strSql = strSql & "		,MD_HELPER_ADDR2 ='"& addr_2 &"' "
				strSql = strSql & "		,MD_HELPER_FLG ='"& hp_type &"' "
				strSql = strSql & "		,MD_HELPER_WORK_FLG ='"& hope_work &"' "
				strSql = strSql & "		,MD_HELPER_BANK ='"& bank &"' "
				strSql = strSql & "		,MD_HELPER_ACCOUNT ='"& account &"' "
				strSql = strSql & "		,MD_HELPER_ACCOUNT_NAME ='"& account_name &"' "
				strSql = strSql & "		,MD_HELPER_HOPE ='"& hp_hope &"' "
				strSql = strSql & "		,MD_HELPER_NEAR ='"& hp_near &"' "
				strSql = strSql & "		,MD_HELPER_EDU ='"& edu_org &"' "
				strSql = strSql & "		,MD_HELPER_DIPLOMA_NO ='"& dip_no &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE ='"& license1 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO ='"& license_no1 &"' "
				strSql = strSql & "		,MD_HELPER_RELIGION ='"& hp_riligion &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_FLG ='"& INSURANCE_FLG &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_NO ='"& INSURANCE_NO &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_START ='"& i_start_ymd &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_END ='"& i_end_ymd &"' "
				strSql = strSql & "		,MD_HELPER_INSURANCE_NOW_FLG ='"& INSURANCE_NOW &"' "
				strSql = strSql & "		,MD_HELPER_PICTURE ='"& filePath &"' "
				strSql = strSql & "		,MD_HELPER_QUALIFICTION ='"& QUALIFICTION &"' "
				strSql = strSql & "		,MD_HELPER_QnA ='"& QnA &"' "
 
				strSql = strSql & "		,MD_HELPER_LICENSE_1 ='"& license2 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_2 ='"& license3 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_3 ='"& license4 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_4 ='"& license5 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_5 ='"& license6 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_1 ='"& license_no1 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_2 ='"& license_no2 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_3 ='"& license_no3 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_4 ='"& license_no4 &"' "
				strSql = strSql & "		,MD_HELPER_LICENSE_NO_5 ='"& license_no5 &"' "
				strSql = strSql & "		,MD_HELPER_HEALTH ='"& health_flg &"' "
 
				strSql = strSql & "	WHERE MD_HELPER_SEQ='"& hp_seq &"'; "
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 3
	 
		
		Case "del" : 
 
				strSql = ""
				strSql = strSql & " delete from MO_HELPER  "
				strSql = strSql & "	WHERE MD_HELPER_SEQ ='"& hp_seq &"'; "
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
				parent.location.href = "./helper_list.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "./helper_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "./helper_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
