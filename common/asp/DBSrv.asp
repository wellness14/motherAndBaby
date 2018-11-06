<%
'======================================================================
'업 무 명 : mothernbaby - 관리자
'모듈기능 : 서버 디비 연결자 설정
'파 일 명 : DBSrv.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================

'=======================================================================
'Response.Expires = -1
%>
<%
	'DBConMothernbaby	= "Provider=SQLOLEDB;User Id=wellness14;PWD=wellness141414;Data Source=wellness14.cafe24.com;Initial Catalog=wellness14;"				'CAFE24 디비연결
	DBConMothernbaby	= "Provider=SQLOLEDB;User Id=wellness14;PWD=dnpfsltm14!db;Data Source=db49.godohosting.com;Initial Catalog=wellness14_godohosting_com;"				'고도몰 디비연결
%>

