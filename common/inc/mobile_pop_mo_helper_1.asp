<!--#include virtual="/common/menu/head.asp"-->
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%
 
	  mo_helper_name1		= Trim(fncRequest("mo_helper_name_1"))

 


'---------------------------------------------------------
'	Request
'	Dim page_size : page_size = 10 
	page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	salign	= fncRequest("salign")
	smethod = fncRequest("smethod")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
	strDftUrl = strDftUrl & "&salign=" & salign
	strDftUrl = strDftUrl & "&smethod=" & smethod
'---------------------------------------------------------


	strSql = ""
	strSql = strSql & "  SELECT	A.MD_HELPER_NAME         "
	strSql = strSql & "  ,A.MD_HELPER_NEAR			     "
	strSql = strSql & "  ,C.MR_MEM_NM				     "
	strSql = strSql & "  ,C.MR_SERVICE			         "
	strSql = strSql & "  ,C.MR_SERVICESDT			     "
	strSql = strSql & "  ,C.MR_SERVICEEDT			     "
	strSql = strSql & "  ,B.MD_HELPER_COMMENT			 "
	strSql = strSql & "  ,A.MD_HELPER_SEQ		      	 "
	strSql = strSql & "  ,A.MD_HELPER_LOCAL	         	 "


'	strSql = strSql & "  FROM	MO_HELPER  A  "
'	strSql = strSql & "  LEFT OUTER JOIN MO_HELPER_SERVICE B  "
'	strSql = strSql & "  ON A.MD_HELPER_SEQ = B.MD_HELPER_SEQ  "
'	strSql = strSql & "  LEFT OUTER JOIN MO_RESERVATION C  "
'	strSql = strSql & "  ON B.MR_IDX = C.MR_IDX  "
'	strSql = strSql & "  ORDER BY A.MD_HELPER_NAME ASC; "
 

 
	strTable = strTable & " FROM	MO_HELPER  A  LEFT OUTER JOIN MO_HELPER_SERVICE B  ON A.MD_HELPER_SEQ = B.MD_HELPER_SEQ  LEFT OUTER JOIN MO_RESERVATION C  ON B.MR_IDX = C.MR_IDX "
'	strWhere = "    "

	strTable_cnt = strTable_cnt & " FROM MO_HELPER where MD_HELPER_NAME like '%"& mo_helper_name1 &"%' and  MD_HELPER_LOCAL='"& grpcd &"'"

	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
'	strSql = strSql & strWhere
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		intTotalCnt = Rs1(0)
	End If 


 

	strSql = ""
	strSql = strSql & " ;SELECT  *	 					"
	strSql = strSql & " FROM							"
	strSql = strSql & " (							    "
	strSql = strSql & "	  SELECT						"
	strSql = strSql & "	  A.MD_HELPER_NAME "
	strSql = strSql & "  ,C.MR_MEM_NM				     "
	strSql = strSql & "  ,C.MR_SERVICE			         "
	strSql = strSql & "  ,C.MR_SERVICESDT			     "
	strSql = strSql & "  ,C.MR_SERVICEEDT			     "
	strSql = strSql & "  ,B.MD_HELPER_COMMENT			 "
	strSql = strSql & "  ,A.MD_HELPER_SEQ		      	 "
 
	strSql = strSql & "	 ,ROW_NUMBER( ) OVER (ORDER BY A.MD_HELPER_NAME ASC) ROWNUM "
 
	
	strSql = strSql & strTable
'	strSql = strSql & strWhere
	
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs2 = DBExec(strSql,"main")
	If Not Rs2.EOF Then 
		arrList = Rs2.GetRows()
	End If 
	'Response.write strSql

	Call DBClose(Rs2) : DBClose(Rs1)
 
%>


 

 <HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0 ,user-scalable=no , target-densitydpi=medium-dpi" />
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/mobile_admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:360px;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>
<body>
	<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
	<tr>
		<td align="center"><strong><h2>산모도우미 검색</h2></strong></td>
	</tr>
 
	<tr>
		<td style="padding-left:20px;color:#666;font-size:11px;">원하시는 도우미를 <span style="color:#E06A6A;text-decoration:underline;">클릭</span>하시면 선택이 됩니다.</td>
	</tr>
	<table  class="tb_style02">
	<tr>
		<td width="65" rowspan="2" align="center"><br/>이름</td>
		<td width="85" rowspan="2" align="center"><br/>가까운지하철</td>
		<td colspan="4" align="center">최종서비스</td>
	</tr>
	<tr>
		<td width="60" align="center"> 산모이름 </td>  <td width="210" align="center"> 서비스명 </td>  <td width="174" align="center"> 서비스기간</td>
	</tr>
</table>
	<tr>
		<td height="50" style="padding-left:5px;">
			<div style="padding-left:0px;width:358px;border:1px solid #D1D1D1;height:320px;overflow-x:hidden;overflow-y:auto;scrollbar-face-color:#FFFFFF;scrollbar-highlight-color: #FFFFFF;scrollbar-3dlight-color: #E3E3E3;scrollbar-shadow-color: #FFFFFF;scrollbar-darkshadow-color: #E3E3E3;scrollbar-track-color: #E3E3E3;scrollbar-arrow-color: #B7B7B7">

	<%		
			strSql = ""
			strSql = strSql & " SELECT COUNT(1) "
			strSql = strSql & strTable_cnt
			'	strSql = strSql & strWhere
			Set Rs1 = DBExec(strSql,"main")
			If Not Rs1.EOF Then 
				intTotalCnt1 = Rs1(0)
			End If 


			strSql = ""
			strSql = strSql & " ;SELECT * FROM ( 					"
			strSql = strSql & " SELECT  *, ROW_NUMBER( ) OVER (ORDER BY  MD_HELPER_NAME ASC) as ROWNUM1  				"
			strSql = strSql & " FROM							"
			strSql = strSql & " (							    "
			strSql = strSql & "	  SELECT						"
			strSql = strSql & "	  A.MD_HELPER_NAME "
			strSql = strSql &" ,  A.MD_HELPER_NEAR						"
			strSql = strSql & "  ,C.MR_MEM_NM				     "
			strSql = strSql & "  ,C.MR_SERVICE			         "
			strSql = strSql & "  ,C.MR_SERVICESDT			     "
			strSql = strSql & "  ,C.MR_SERVICEEDT			     "
			strSql = strSql & "  ,B.MD_HELPER_COMMENT			 "
			strSql = strSql & "  ,A.MD_HELPER_SEQ		      	 "
			strSql = strSql & "  ,A.MD_HELPER_LOCAL	         	 "

			strSql = strSql & strTable
		'	strSql = strSql & strWhere
			
			strSql = strSql & "  ) T1 "

			strSql = strSql & "  WHERE MD_HELPER_NAME LIKE'%"& mo_helper_name1 &"%' and MD_HELPER_LOCAL='"& grpcd &"') T2 "
			strSql = strSql & " 	WHERE ROWNUM1 > "& startNum &" AND ROWNUM1 <= "& endNum
			strSql = strSql & " 	ORDER BY  MD_HELPER_NAME ASC "

			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then   
				Do Until RS.EOF
	%>
 
			<a href="#_blank" onclick="fncInputAddr('<%=Rs(0)%>','<%=Rs(6)%>','<%=Rs(7)%>')" class="post_text">
				 
				 
					<p style="width:720px;"><span style="padding-left:5px;"><%=Rs(0)%> </span>
					<span style="padding-left:55px;"><%=Rs(1)%></span>
					<span style="padding-left:80px;"><%=Rs(2)%></span>
					<span style="padding-left:105px;"><%=Rs(3)%></span>
<%
If Rs(4) <> "" Then 
%>
					<span style="padding-left:50px;"><%=Rs(4)%> ~</span>
					<span style="padding-left:10px;"><%=Rs(5)%></span>
					<%
else					
					%>
					<span style="padding-left:30px;"><%=Rs(4)%>  </span>
					<span style="padding-left:50px;"><%=Rs(5)%></span></p>

  <%
  End if
  %>
					</a> 
					 
				 
		 
			 
	<%
					Rs.movenext
				Loop 
			End If 
	 
	%>
			</div>
		</td>
	</tr>
	</table>
	<div id="paging_wrap"></div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">




	function fncInputAddr(postcd1,postcd2,hp_Seq){
		opener.InputName_Comment_1(postcd1,postcd2,hp_Seq);
		self.close();
	}



	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt1%>', { nppg : '<%=page_size%>'});
	});
 


	function fnAlign(no) {
		var t = document.getElementById('salign'); 
		t.setAttribute('value',no);
		
		var m = document.getElementById('smethod'); 
		//alert(m.getAttribute('value'));
		if(m.getAttribute('value') ==''){
			m.setAttribute('value','ASC');
		}else{
			if (m.getAttribute('value') =='ASC')
			{
				m.setAttribute('value','DESC');
			}else{
				m.setAttribute('value','ASC');
			}
			
		}
		
		jQuery('#sFom').submit();

	};

</script>
</html>
