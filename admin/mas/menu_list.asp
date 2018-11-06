<%@ Language=VBScript %>
<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 관리자 메뉴 관리
'파 일 명 : menu_list.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'=======================================================================
%>
<HTML>
<HEAD>
	<title> :: MotherNBaby  Back Office :: </title>
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="/common/js/ext-2.2/resources/css/ext-all.css" />
	<script type="text/javascript" src="/common/js/ext-2.2/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/ext-all.js"></script>
	<script type="text/javascript" src="/common/js/ext-2.2/ext-patch.js"></script>    
	<script type="text/javascript" src="js/menu_list.js"></script>  

    <style type="text/css">
    #treeDiv {
	    float:left;
	    margin:20;
	    border:0px solid #c3daf9;
	    width:300px;
	    height:600px;
    }
    
    #formDiv {
	    float:left;
	    margin:20;
	    border:0px solid #c3daf9;	
	    width:300px;
	    height:350px;
    }
    </style>
</HEAD>
<body bgcolor="#FFFFFF" leftmargin="0" marginheight="0" marginwidth="0" topmargin="0">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr align="left">
		<td bgcolor="#90bcd8" height="24">&nbsp;&nbsp;<font color="white">마스터 &gt; 관리자 메뉴 관련 &gt; 메뉴마스터 관리</font></td>
	</tr>
	</table>

	<div id="treeDiv"></div>
	<div id="formDiv"></div>
</body>
</html>