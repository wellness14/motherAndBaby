<%
'======================================================================
'업 무 명 : mothernbaby - 관리자
'모듈기능 : 기본 경로 정의
'파 일 명 : VarDef.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
'Response.Expires = -1
%>
<%
	If request.ServerVariables("HTTP_HOST") = "localhost" Then 
		url_main		= "http://localhost/"
		img_main		= "http://localhost/image"
	Else 
		url_main		= "http://mothernbaby.co.kr/"
		img_main		= "http://mothernbaby.co.kr/image"
	End If 

	url_admin		= url_main & "/admin"			' admin
	url_common		= url_main & "/common"			' 공통 파일


	' ▒▒▒ 이미지 경로 : 작성 규격 - img_{폴더명} ▒▒▒
	img_admin		= img_main & "/admin"			' 관리자이미지
	img_board		= img_main & "/board"			' 게시판
%>
