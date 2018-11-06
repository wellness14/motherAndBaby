<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 
response.charset = "utf-8"

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
<!-- #include virtual = "/mobileweb/common/asp/RSexec.asp" -->
<!-- #include virtual = "/mobileweb/common/asp/FunDef.asp"-->
<!--#include virtual="/mobileweb/common/inc/member_email_send.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")
 


	If mode = "ins" Or mode = "upd" Then 

		

		post_11			= Trim(fncRequest("post_11"))		' 우편번호1
		post_22			= Trim(fncRequest("post_22"))		' 우편번호2

		addr_11			= Trim(fncRequest("addr_11"))		' 주소1
		addr_22			= Trim(fncRequest("addr_22"))		' 주소2

		company			= fncRequest("company")				' 임대인

		hp_11			= Trim(fncRequest("hp_11"))			' 임대인 연락처
		hp_22			= Trim(fncRequest("hp_22"))			' 임대인 연락처
		hp_33			= Trim(fncRequest("hp_33"))			' 임대인 연락처

		'im_cha_name			= fncRequest("im_cha_name")	    ' 임차인

		mem_id			= fncRequest("mem_id")				' 회원ID
		mem_nm			= fncRequest("mem_nm")				' 임차인(회원명)

		hp_1			= Trim(fncRequest("hp_1"))			' 임차인핸드폰번호
		hp_2			= Trim(fncRequest("hp_2"))			' 임차인핸드폰번호
		hp_3			= Trim(fncRequest("hp_3"))			' 임차인핸드폰번호

		post_1			= Trim(fncRequest("post_1"))		' 임차인우편번호
		post_2			= Trim(fncRequest("post_2"))		' 임차인우편번호

		addr_1			= Trim(fncRequest("addr_1"))		' 임차인주소
		addr_2			= Trim(fncRequest("addr_2"))		' 임차인주소

		contract_product	 = fncRequest("contract_product") ' 계약물품

		contract_date_y			= fncRequest("contract_date_y")				' 계약년월일
		contract_date_m			= fncRequest("contract_date_m")				' 계약년월일
		contract_date_d			= fncRequest("contract_date_d")				' 계약년월일

		tel_1			= Trim(fncRequest("tel_1"))			' 전화 
		tel_2			= Trim(fncRequest("tel_2"))			' 전화 
		tel_3			= Trim(fncRequest("tel_3"))			' 전화     

		imda_type			= Trim(fncRequest("imda_type"))			' 임대경유      

		bank			= Trim(fncRequest("bank"))			' 은행     
		account			= Trim(fncRequest("account"))			' account    


		start_date_y			= Trim(fncRequest("start_date_y"))			'start_date_y
		start_date_m			= Trim(fncRequest("start_date_m"))			'start_date_y
		start_date_d			= Trim(fncRequest("start_date_d"))			'start_date_y

		end_date_y				= Trim(fncRequest("end_date_y"))			'start_date_y
		end_date_m				= Trim(fncRequest("end_date_m"))			'start_date_y
		end_date_d				= Trim(fncRequest("end_date_d"))			'product_no

		product_no				= Trim(fncRequest("product_no"))			'      

		contract_in_name		= Trim(fncRequest("contract_in_name"))		' contract_1_term
		contract_1_term			= Trim(fncRequest("contract_1_term"))		' contract_in_name     
		contract_2			    = Trim(fncRequest("contract_2"))			' contract_2    
		contract_3			    = Trim(fncRequest("contract_3"))			' contract_3    

		contract_11_pay			    = Trim(fncRequest("contract_11_pay"))			' contract_11_pay 
		contract_11_deposit			= Trim(fncRequest("contract_11_deposit"))		' contract_11_deposit 
		contract_11_set			    = Trim(fncRequest("contract_11_set"))			' contract_11_pay 
		contract_11_out			    = Trim(fncRequest("contract_11_out"))			' contract_11_pay 
		contract_11_total			= Trim(fncRequest("contract_11_total"))			' contract_11_pay 

		contract_11_yy			= Trim(fncRequest("contract_11_yy"))			'contract_11_yy
		contract_11_mm			= Trim(fncRequest("contract_11_mm"))			'contract_11_mm
		contract_11_dd			= Trim(fncRequest("contract_11_dd"))			'contract_11_dd

		contract_11_pay_man       = Trim(fncRequest("contract_11_pay_man"))			'영수자

		contract_11_name       = Trim(fncRequest("contract_11_name"))			'임차인 성명    


	End If 
'-----------------------------------------------------------------------------


'-----------------------------------------------------------------------------
'	데이터 확인
	'birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	hp_company = hp_11 & "-" & hp_22 & "-" & hp_33

	tel = tel_1 & "-" & tel_2 & "-" & tel_3

	post = post_1 & "-" & post_2

	post_company = post_11 & "-" & post_22


'	check1 = Replace(check1,",","||")
'	check2 = Replace(check2,",","||")
'	check3 = Replace(check3,",","||")
 
	'contract_date = contract_date_y & fncSetNumber(contract_date_m) & fncSetNumber(contract_date_d)

	'start_date = start_date_y & fncSetNumber(start_date_m) & fncSetNumber(start_date_d)
	'end_date = end_date_y & fncSetNumber(end_date_m) & fncSetNumber(end_date_d)

	'contract_11_date = contract_11_yy & fncSetNumber(contract_11_mm) & fncSetNumber(contract_11_dd)



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
'-----------------------------------------------------------------------------	

	If mode = "ins" And mem_id = "" Then 
		intMsg = 1
	Else 


		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_CONTRACT ( "
				strSql = strSql & "       MO_CONTRACT_SEQ "
			    strSql = strSql & ",      MO_CONTRACT_NAME "
		        strSql = strSql & ",      MO_CONTRACT_POST "
				strSql = strSql & ",      MO_CONTRACT_ADDR1 "
				strSql = strSql & ",      MO_CONTRACT_ADDR2 "
				strSql = strSql & ",      MO_CONTRACT_HP "
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_ID " 
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_NAME " 
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_POST "
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_ADDR1 "
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_ADDR2 "
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_HP "
				strSql = strSql & ",      MO_CONTRACT_PRODUCT_NAME "
				strSql = strSql & ",      MO_CONTRACT_DATE "
				strSql = strSql & ",      MO_CONTRACT_TEL "
				strSql = strSql & ",      MO_CONTRACT_TYPE "
				strSql = strSql & ",      MO_CONTRACT_BANK "
				strSql = strSql & ",      MO_CONTRACT_ACCOUNT "
				strSql = strSql & ",      MO_CONTRACT_START_DATE "
				strSql = strSql & ",      MO_CONTRACT_END_DATE "
				strSql = strSql & ",      MO_CONTRACT_PRODUCT_NO "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_MAIN "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_1 "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_2 "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_3 "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_4_PRICE "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_4_DEPOSIT "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_4_SET "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_4_OUT_PAY "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_4_TOTAL_PAY "
				strSql = strSql & ",      MO_CONTRACT_CONTENT_HUMAN "
				strSql = strSql & ",      MO_CONTRACT_NOW_DATE "
				strSql = strSql & ",      MO_CONTRACT_CUSTOMER_NAME2 "
				strSql = strSql & " )  "
				strSql = strSql & " VALUES "
				strSql = strSql & "			(  (SELECT ISNULL(MAX(MO_CONTRACT_SEQ), 0) + 1 FROM MO_CONTRACT) "
				strSql = strSql & "	,		'"& company  &"' "
				strSql = strSql & "	,		'"& post_company &"'   "
				strSql = strSql & "	,		'"& addr_11	 &"' "
				strSql = strSql & "	,		'"& addr_22 &"'  "
				strSql = strSql & "	,		'"& hp_company &"' "
				strSql = strSql & "	,		'"& mem_id &"'   "
				strSql = strSql & "	,		'"& mem_nm &"' "
				strSql = strSql & "	,		'"& post &"'  "
				strSql = strSql & "	,		'"& addr_1 &"' "
				strSql = strSql & "	,		'"& addr_2 &"'   "
				strSql = strSql & "	,		'"& hp &"' "
				strSql = strSql & "	,		'"& contract_product &"'  "
				strSql = strSql & "	,		'"& contract_date &"' "
				strSql = strSql & "	,		'"& tel &"'   "
				strSql = strSql & "	,		'"& imda_type &"' "
				strSql = strSql & "	,		'"& bank &"'  "
				strSql = strSql & "	,		'"& account &"' "
				strSql = strSql & "	,		'"& start_date &"'   "
				strSql = strSql & "	,		'"& end_date &"' "
				strSql = strSql & "	,		'"& product_no &"'  "
				strSql = strSql & "	,		'"& contract_in_name &"' "
				strSql = strSql & "	,		'"& contract_1_term &"'   "
				strSql = strSql & "	,		'"& contract_2 &"' "
				strSql = strSql & "	,		'"& contract_3 &"'  "
				strSql = strSql & "	,		'"& contract_11_pay &"' "
				strSql = strSql & "	,		'"& contract_11_deposit &"'   "
				strSql = strSql & "	,		'"& contract_11_set &"' "
				strSql = strSql & "	,		'"& contract_11_out &"'  "
				strSql = strSql & "	,		'"& contract_11_total &"' "
				strSql = strSql & "	,		'"& contract_11_pay_man &"'   "
				strSql = strSql & "	,		'"& contract_11_date &"' "
				strSql = strSql & "	,		'"& contract_11_name &"') ; "
	'			response.Write strSql
	'			response.End 

 
		Call DBExec(strSql, "main") : Call DBClose(DBCon)
		intMsg = 2

' select ISNULL(MAX(MO_EXTEND),0)  FROM MO_HELPER_SERVICE   where  MD_HELPER_SEQ = '169' 도우미 시퀀스로 연장횟수 구하기

				Case "upd" : 
					If intIDX > 0 Then 
				
					strSql = ""
					strSql = strSql & " UPDATE	MO_CONTRACT SET "
					strSql = strSql & "         MO_CONTRACT_CUSTOMER_NAME  = '"& mem_nm &"' "
					strSql = strSql & ",        MO_CONTRACT_CUSTOMER_NAME2 = '"& contract_11_name &"' "
					strSql = strSql & "	WHERE   MO_CONTRACT_SEQ = '"& intIDX &"' "

					'response.Write strSql

					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3
 
		    	End If 
%> 
<%


			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_CONTRACT SET "
					strSql = strSql & "		MR_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MO_CONTRACT_SEQ='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If 


			Case "delete" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " delete from MO_CONTRACT  "
					strSql = strSql & "	WHERE MO_CONTRACT_SEQ='"& intIDX &"' "
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
				parent.location.href = "http://mothernbaby.co.kr/mobileweb/member/login.asp"
			break;
			case(3) :
				alert('임대차 계약 등록되었습니다.');
			
				parent.location.href = "http://mothernbaby.co.kr/mobileweb/main/"  
			
			//	parent.location.href = "/member/login.asp?mOne=6&mTwo=1"  http://mothernbaby.co.kr/index.asp
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "../index.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
