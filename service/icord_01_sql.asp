<%
'======================================================================
'업 무 명 : 마더앤베이 - 서비스
'모듈기능 : 아이코드 상담신청
'파 일 명 : icord_01_sql.asp
'작성일자 : 2015/05/27
'작 성 자 : 홍성주
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
'	Request

		mem_nm			= fncRequest("mem_nm")				' 성명

		phone_1			= Trim(fncRequest("phone_1"))		' 전화번호
		phone_2			= Trim(fncRequest("phone_2"))		' 전화번호
		phone_3			= Trim(fncRequest("phone_3"))		' 전화번호

		hp_1			= Trim(fncRequest("hp_1"))				' 핸드폰번호
		hp_2			= Trim(fncRequest("hp_2"))				' 핸드폰번호
		hp_3			= Trim(fncRequest("hp_3"))				' 핸드폰번호

		childbirth_y	= fncRequest("childbirth_y")				' 출산예정일
		childbirth_m	= fncRequest("childbirth_m")			' 출산예정일
		childbirth_d	= fncRequest("childbirth_d")				' 출산예정일

		serviceDt_y		= fncRequest("serviceDt_y")			' 상담신청일
		serviceDt_m		= fncRequest("serviceDt_m")		' 상담신청일
		serviceDt_d		= fncRequest("serviceDt_d")			' 상담신청일

		post_1			= Trim(fncRequest("post_1"))				' 우편번호
		post_2			= Trim(fncRequest("post_2"))				' 우편번호

		addr_1			= Trim(fncRequest("addr_1"))				' 주소
		addr_2			= Trim(fncRequest("addr_2"))				' 주소

		check_info			= fncRequest("check_info")		' 개인정보취급방침

'-----------------------------------------------------------------------------
'	데이터 확인
	phone = phone_1 & "-" & phone_2 & "-" & phone_3
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	post = post_1 & "-" & post_2

	childbirth = childbirth_y & fncSetNumber(childbirth_m) & fncSetNumber(childbirth_d)
	serviceDt = serviceDt_y & fncSetNumber(serviceDt_m) & fncSetNumber(serviceDt_d)
'-----------------------------------------------------------------------------	
	strSql = ""
	strSql = strSql & " INSERT INTO MO_ICORD_SERVICE ( "
	strSql = strSql & "         MI_MEM_NM, MI_PHONE, MI_HP, MI_CHILDBIRTH, MI_SERVICEDT, MI_POST, MI_ADDR1, MI_ADDR2"
	strSql = strSql & " )  VALUES ("
	strSql = strSql & "'"& mem_nm &"','"& phone &"','"& hp &"','"& childbirth &"','"& serviceDt &"','"& post &"','"& addr_1 &"','"& addr_2 &"');"
'	response.Write strSql
'	response.End 
	Call DBExec(strSql, "main") : Call DBClose(DBCon)
	intMsg = 2

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
				parent.location.href = "service_07.asp?mOne=2&mTwo=7"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
