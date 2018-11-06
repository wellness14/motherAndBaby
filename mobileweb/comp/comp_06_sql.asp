<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

'======================================================================
'업 무 명 : 마더앤베이 - 서비스
'모듈기능 : 제휴 글 작성
'파 일 명 : comp_06_sql.asp
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
<%	
'-----------------------------------------------------------------------------
'	Request
	menuCode1		= fncRequest("menuCode1")
	menuCode2		= fncRequest("menuCode2")
	
    mode		= fncRequest("mode")				'처리구분(등록/수정)
	intIDX		= fncRequest("idx")

	If mode = "ins" Or mode = "upd" Then 
		txtCop			= fncRequest("txtCop")				' 업체명
		txtNm			= fncRequest("txtNm")				' 담당자
		
		hp_1			= Trim(fncRequest("hp_1"))			' 핸드폰번호
		hp_2			= Trim(fncRequest("hp_2"))			' 핸드폰번호
		hp_3			= Trim(fncRequest("hp_3"))			' 핸드폰번호

		textarea		= fncRequest("textarea")			' 상담내용
	End If 
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
'	데이터 확인
	hp = hp_1 & "-" & hp_2 & "-" & hp_3
	
	strParam = "menuCode1=" & menuCode1
	strParam = strParam & "&menuCode2=" & menuCode2
'-----------------------------------------------------------------------------	

	If mode = "ins" And (txtCop = "" Or txtNm = "") Then 
		intMsg = 1
	Else 
		Select Case mode 
			Case "ins" : 
				strSql = ""
				strSql = strSql & " INSERT INTO MO_BRD_CONTACT ( "
				strSql = strSql & "         MC_COP,MC_COP_NM,MC_HP,MC_CONTENT "
				strSql = strSql & " )  "
				strSql = strSql & " SELECT "
				strSql = strSql & "			'"& txtCop &"','"& txtNm &"','"& hp &"','"& textarea &"' "
	'			response.Write strSql
	'			response.End 
				Call DBExec(strSql, "main") : Call DBClose(DBCon)
				intMsg = 2
			
			Case "upd" : 
'				If intIDX > 0 Then 
'					strSql = ""
'					strSql = strSql & " UPDATE MO_BRD_SERVICE SET "
'					strSql = strSql & "		MS_MEM_NM = '"& mem_nm &"' "
'					strSql = strSql & "		,MS_BIRTH = '"& birth &"' "
'					strSql = strSql & "		,MS_PHONE = '"& phone &"' "
'					strSql = strSql & "		,MS_HP = '"& hp &"' "
'					strSql = strSql & "		,MS_POST = '"& post &"' "
'					strSql = strSql & "		,MS_ADDR1 = '"& addr_1 &"' "
'					strSql = strSql & "		,MS_ADDR2 = '"& addr_2 &"' "
'					strSql = strSql & "		,MS_SERVICE = '"& check1 &"' "
'					strSql = strSql & "		,MS_PERIOD = '"& radio1 &"' "
'					strSql = strSql & "		,MS_TYPE = '"& radio2 &"' "
'					strSql = strSql & "		,MS_CHILDBIRTH = '"& childbirth &"' "
'					strSql = strSql & "		,MS_SERVICEDT = '"& serviceDt &"' "
'					strSql = strSql & "		,MS_CLINIC = '"& radio3 &"' "
'					strSql = strSql & "		,MS_EXPER = '"& radio4 &"' "
'					strSql = strSql & "		,MS_UNIQUE = '"& check2 &"' "
'					strSql = strSql & "		,MS_FAMILY = '"& check3 &"' "
'					strSql = strSql & "		,MS_CONTENT = '"& textarea &"' "
'					strSql = strSql & "	WHERE MS_IDX='"& intIDX &"' "
'					Call DBExec(strSql, "main") : Call DBClose(DBCon)
'					intMsg = 3
'				End If 
			Case "del" : 
				If intIDX > 0 Then 
					strSql = ""
					strSql = strSql & " UPDATE MO_BRD_CONTACT SET "
					strSql = strSql & "		MC_CNLKBN = 'Y' "
					strSql = strSql & "	WHERE MC_IDX='"& intIDX &"' "
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
				alert('등록 정보를 다시 확인해 주세요');
				history.go(-1);
			break;
			case(2) :
				alert('정상적으로 등록되었습니다.');
				parent.location.href = "comp.asp?<%=strParam%>"
			break;
			case(3) :
				alert('수정 등록되었습니다.');
				parent.location.href = "/admin/member/contact_list.asp"
			break;
			case(4) :
				alert('삭제 되었습니다.');
				parent.location.href = "/admin/member/contact_list.asp"
			break;
		}
	}
//	---------	Page OnLoad Event 처리
	window.onload = function()
	{
		Init(<%=intMsg%>);
	}
</script>
