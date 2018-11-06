<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"
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
<!-- #include virtual = "/mobile/common/asp/RSexec.asp" -->
<!-- #include virtual = "/mobile/common/asp/FunDef.asp"-->
<%	
'-----------------------------------------------------------------------------
'	Request
	
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
		radio4			= fncRequest("radio4")				' 출산경험

		check2			= fncRequest("check2")				' 특이사항
		check3			= fncRequest("check3")				' 가족사항

		textarea		= fncRequest("textarea")			' 상담내용

		check4			= fncRequest("check4")				' 이용약관
		check5			= fncRequest("check5")				' 개인정보취급방침
		part			    = fncRequest("part")				'  거점
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	birth = Ybirth & fncSetNumber(Mbirth) & fncSetNumber(Dbirth)
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	check1 = Replace(check1,",","||")
	check2 = Replace(check2,",","||")
	check3 = Replace(check3,",","||")

	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	serviceDt = serviceDt_y & fncSetNumber(serviceDt_m) & fncSetNumber(serviceDt_d)

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
				strSql = strSql & "         MS_EXPER,MS_UNIQUE,MS_FAMILY,MS_CONTENT,MS_PROVISION_1,MS_PROVISION_2, MD_LOCAL "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'','"& mem_nm &"','"& birth &"','"& phone &"','"& hp &"','"& post &"','"& addr_1 &"','"& addr_2 &"', "
				strSql = strSql & "			'"& check1 &"','"& radio1 &"','"& radio2 &"','"& childbirth &"','"& serviceDt &"','"& radio3 &"', "
				strSql = strSql & "			'"& radio4 &"','"& check2 &"','"& check3 &"','"& textarea &"','"& check4 &"','"& check5 &"','"& part &"'; "
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
					strSql = strSql & "		,MS_CHILDBIRTH = '"& childbirth &"' "
					strSql = strSql & "		,MS_SERVICEDT = '"& serviceDt &"' "
					strSql = strSql & "		,MS_CLINIC = '"& radio3 &"' "
					strSql = strSql & "		,MS_EXPER = '"& radio4 &"' "
					strSql = strSql & "		,MS_UNIQUE = '"& check2 &"' "
					strSql = strSql & "		,MS_FAMILY = '"& check3 &"' "
					strSql = strSql & "		,MS_CONTENT = '"& textarea &"' "
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
				parent.location.href = "info_01.asp"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "/admin/member/service_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "/admin/member/service_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
