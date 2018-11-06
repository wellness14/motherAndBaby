<%
'======================================================================
'업 무 명 : 마더앤베이 - 서비스
'모듈기능 : 상담신청 글 작성
'파 일 명 : info_01_sql.asp
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
<%	
'-----------------------------------------------------------------------------
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

'	Request
	mOne		= fncRequest("mOne")
	mTwo		= fncRequest("mTwo")
	
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		mem_nm			= fncRequest("mem_nm")				' 성명
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

		serviceDt_y		= fncRequest("serviceDt_y")			' 서비스시작 예정일
		serviceDt_m		= fncRequest("serviceDt_m")			' 서비스시작 예정일
		serviceDt_d		= fncRequest("serviceDt_d")			' 서비스시작 예정일

		radio3			= fncRequest("radio3")				' 조리원 이용
		radio3_1		= fncRequest("radio3_1")			' 조리원 이용기간

		If radio3 = "이용함" Then
			radio3 = radio3 & "(" & radio3_1 & ")"
		End If

		radio4			= fncRequest("radio4")				' 출산경험

		check2			= fncRequest("check2")				' 특이사항
		check3			= fncRequest("check3")				' 가족사항

		textarea		= fncRequest("textarea")			' 상담내용
		textarea_2		= fncRequest("textarea_2")			' 관리자메모

		check4			= fncRequest("check4")				' 이용약관
		check5			= fncRequest("check5")				' 개인정보취급방침
		part			= fncRequest("part")				'  거점
		consulting_end	= fncRequest("consulting_end")		'  상담완료여부
		jumin1	= fncRequest("jumin1")		'  주민번호1
		jumin2	= fncRequest("jumin2")		'  주민번호2

		birth_j					= fncRequest("birth")				' 생일(달력)
		child_birth				= fncRequest("child_birth")			' 출산예정일(달력)
		service_start			= fncRequest("service_start")		' 서비시작일(달력)

		If part <> "" Then 
			class_value = part
			dim myarray                          
			myarray=split(class_value,":")
			class_value_1=myarray(0)      
			title_value_1=myarray(1)
		End If
	ElseIf mode = "event_service" Then
		kind = fncRequest("kind")
		ms_end = fncRequest("ms_end")
		ms_contract = fncRequest("ms_contract")
		ms_contract_dt = fncRequest("ms_contract_dt")
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------

'--------달력추가로 수정 ----------------------------------------------------------
'If birth_j <> "" Then 
'	birth_j_arr=split(birth_j,"-") 
'	birth_y = birth_j_arr(0)
'	birth_m = birth_j_arr(1)
'	birth_d = birth_j_arr(2)
'	birth = birth_y &  birth_m  &  birth_d 
'End If

If birth_j <> "" Then 
	birth_j_arr=split(birth_j,"-") 
	birth_y = birth_j_arr(0)
	birth_m = birth_j_arr(1)
	birth_d = birth_j_arr(2)
	child_birth_ymd = birth_y &  birth_m  &  birth_d 
End if

'If child_birth <> "" Then 
'	child_birth_arr=split(child_birth,"-") 
'	child_y = child_birth_arr(0)
'	child_m = child_birth_arr(1)
'	child_d = child_birth_arr(2)
'	child_birth_ymd = child_y &  child_m  &  child_d 
'End if

If service_start <> "" Then 
	service_start_arr=split(service_start,"-") 
	service_y = service_start_arr(0)
	service_m = service_start_arr(1)
	service_d = service_start_arr(2)
	service_symd = service_y &  service_m  &  service_d 
End if
'--------달력추가로 수정 ----------------------------------------------------------


'	데이터 확인
'	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
'	post = post_1 & "-" & post_2
	post = post_1

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")

'	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
'	serviceDt = serviceDt_y & fncSetNumber(serviceDt_m) & fncSetNumber(serviceDt_d)

	strParam = "mOne=" & mOne
	strParam = strParam & "&mTwo=" & mTwo
'-----------------------------------------------------------------------------	

	If mode = "ins" And (check4 = "" Or check5 = "") Then 
		intMsg = 1
	Else 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_BRD_SERVICE ( "
				strSql = strSql & "         MS_MEM_ID,MS_MEM_NM,MS_BIRTH,MS_PHONE,MS_HP,MS_POST,MS_ADDR1,MS_ADDR2, "
				strSql = strSql & "         MS_SERVICE,MS_PERIOD,MS_TYPE,MS_CHILDBIRTH,MS_SERVICEDT,MS_CLINIC, "
				strSql = strSql & "         MS_EXPER,MS_UNIQUE,MS_FAMILY,MS_CONTENT,MS_PROVISION_1,MS_PROVISION_2, MD_LOCAL,MD_LOCAL_DETAIL, "
				strSql = strSql & "         MS_JUMIN1,MS_JUMIN2,MS_CONTENT_2 "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& uId & "','"& mem_nm &"','"& birth &"','"& phone &"','"& hp &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "			'"& check1 &"','"& radio1 &"','"& radio2 &"','"& child_birth_ymd &"','"& service_symd &"','"& radio3 &"', "
				strSql = strSql & "			'"& radio4 &"','"& check2 &"','"& check3 &"','"& textarea &"','"& check4 &"','"& check5 &"','"& class_value_1 &"', "
				strSql = strSql & "			'"& title_value_1 &"','"& jumin1 &"','"& jumin2 &"','"& textarea_2 &"';"
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
			
			Case "upd" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
					strSql = strSql & "		MS_MEM_NM = '"& mem_nm &"' "
					strSql = strSql & "		,MS_BIRTH = '"& birth &"' "
					strSql = strSql & "		,MS_PHONE = '"& phone &"' "
					strSql = strSql & "		,MS_HP = '"& hp &"' "
					strSql = strSql & "		,MS_POST = '"& post &"' "
					strSql = strSql & "		,MS_ADDR1 = '"& addr_1 &"' "
					strSql = strSql & "		,MS_ADDR2 = '"& addr_2 &"' "
					strSql = strSql & "		,MS_SERVICE = '"& check1 &"' "
					strSql = strSql & "		,MS_PERIOD = '"& radio1 &"' "
					strSql = strSql & "		,MS_TYPE = '"& radio2 &"' "
					strSql = strSql & "		,MS_CHILDBIRTH = '"& child_birth_ymd &"' "
					strSql = strSql & "		,MS_SERVICEDT = '"& service_symd &"' "
					strSql = strSql & "		,MS_CLINIC = '"& radio3 &"' "
					strSql = strSql & "		,MS_EXPER = '"& radio4 &"' "
					strSql = strSql & "		,MS_UNIQUE = '"& check2 &"' "
					strSql = strSql & "		,MS_FAMILY = '"& check3 &"' "
					strSql = strSql & "		,MS_CONTENT = '"& textarea &"' "
					strSql = strSql & "		,MD_LOCAL = '"& class_value_1 &"' "
					strSql = strSql & "		,MD_LOCAL_DETAIL = '"& title_value_1 &"' "
					strSql = strSql & "		,MS_END = '"& consulting_end &"' "
					strSql = strSql & "		,MS_JUMIN1 = '"& jumin1 &"' "
					strSql = strSql & "		,MS_JUMIN2 = '"& jumin2 &"' "
					strSql = strSql & "		,MS_CONTENT_2 = '"& textarea_2 &"' "
					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 3
				End If 
			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
					strSql = strSql & "		MS_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 4
				End If
			Case "event_service" : 
				If intIDX > 0 Then 
					If kind = "1" Then
						strSql = ""
						strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
						strSql = strSql & "		MS_END = '"& ms_end &"' "
						strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
					End If

					If kind = "2" Then
						If ms_contract = "" Then
							ms_contract_dt = ""
						End If

						strSql = ""
						strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
						strSql = strSql & "		MS_CONTRACT = '"& ms_contract &"' "
						strSql = strSql & "		,MS_CONTRACT_DT = '"& ms_contract_dt &"' "
						strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
					End If

					Call DBExec(strSql, "main") : Call DBClose(DBCon)
					intMsg = 5
				End If 
		End Select 
	End If 
%>
<script type="text/javascript">
	function Init(e) {
		switch(e) {
			case(1) :
				alert('이용약관에 동의해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "http://www.mothernbaby.co.kr/info/info_01.asp?<%=strParam%>"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "/admin/member/service_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "/admin/member/service_list.asp"
			break;
			case(5) :
				alert('수정 되었습니다.');
				parent.location.reload();
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
