<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 상담신청
'파 일 명 : service_list.asp
'작성일자 : 2014/04/12
'작 성 자 : 이성준
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">
		body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
	</style>
</head>
<%
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 10 
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
 
	strTable = " FROM MO_BRD_NOTICE WITH(NOLOCK) "
 	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON BA_MEM_ID = MD_MEM_ID "
 	strWhere = " WHERE BA_CNLKBN ='N' and  BA_NOTICE_FLG='M'"


	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & " AND MR_MEM_ID LIKE '%"& sword &"%' "
			Case "2" : strWhere = strWhere & " AND MR_MEM_NM LIKE '%"& sword &"%' "  
		End Select 
	End If 


	strSql = ""
	strSql = strSql & " SELECT COUNT(1) "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	Set Rs1 = DBExec(strSql,"main")
	If Not Rs1.EOF Then 
		intTotalCnt = Rs1(0)
	End If 
%> 

<%
	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			 BA_IDX "
	strSql = strSql & "			,BA_SEQ "
	strSql = strSql & "			,BA_DPH "
	strSql = strSql & "			,BA_PIDX "
	strSql = strSql & "			,BA_TYPE "
	strSql = strSql & "			,BA_MEM_ID "
	strSql = strSql & "			,BA_MEM_NM "
	strSql = strSql & "			,BA_TITLE "
	strSql = strSql & "			,BA_CONTENT "	 
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_SEC_NUM "
	strSql = strSql & "			,BA_CNLKBN "
	strSql = strSql & "			,BA_REG_DT "
	strSql = strSql & "			,BA_UPD_DT "
	strSql = strSql & "			,BA_IP "
	strSql = strSql & "			,BA_EMAIL "
	strSql = strSql & "			,BA_CNT "
	strSql = strSql & "			,BA_UNI_NM "
	strSql = strSql & "			,BA_FILE_NM "
	strSql = strSql & "			,BA_FILE_PATH "
	strSql = strSql & "			,BA_NOTICE_FLG " 
 
	If salign <> "" Then 
		Select Case salign
     		Case "0" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_IDX DESC)				 ROWNUM "
			Case "1" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_MEM_ID " & smethod & ") ROWNUM "
			Case "2" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_MEM_NM " & smethod & ") ROWNUM " 
			Case "3" : strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_REG_DT " & smethod & ") ROWNUM "
 
		End Select 
	Else
		strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_IDX DESC) ROWNUM "
	End If 
	
	strSql = strSql & strTable
	strSql = strSql & strWhere
	
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	'Response.write strSql

	Call DBClose(Rs) : DBClose(Rs1) 
%>
  
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>회원관리</strong></div>
		<div class="write">
			<div class="selection">
				<form id="sFom" name="sFom" method="post" action="?">
				<input type="hidden" name="salign" id="salign" value="<%=salign%>">
				<input type="hidden" name="smethod" id="smethod" value="<%=smethod%>">
				검색 : 
				<select name="smode">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox("1",smode)%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox("2",smode)%>>회원명</option>  
				</select>
				<input type="text" name="sword" value="<%=sword%>" >
				<a onClick="jQuery('#sFom').submit();" style="cursor:pointer;" class="button">검 색</a>
				<a onClick="location.href='./mobile_notice_list.asp'" class="button">전체 리스트</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='./mobile_notice_ins.asp'" class="button">등록</a>
				</span>
				</form>
			</div>
			<br />
			<table class="tb_style01">
			<colgroup>
			<col width="5%" /> 
			<col width="15%" />
			<col />
			<col width="15%" />
			</colgroup>
			<thead> 
			<tr>
				<th>번호</th>
				<th>작성자(ID)</th>
				<th>제목</th> 
				<th>작성일</th> 
			</tr>
			</thead>
			<tbody>

<% 
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)	
			idx					= Trim(arrList(0,num))
			b_seq				= Trim(arrList(1,num))
			b_dph				= Trim(arrList(2,num))
			b_pidx				= Trim(arrList(3,num))
			b_type				= arrList(4,num) 
			b_mem_id			= arrList(5,num) 
			b_mem_nm			= arrList(6,num) 
			b_title				= arrList(7,num) 
			b_content			= arrList(8,num) 
			b_sec_flg			= arrList(9,num) 
			b_sec_num			= arrList(10,num) 
			b_cnlkbn			= arrList(11,num) 
			b_reg_dt			= arrList(12,num) 
			b_upd_dt			= arrList(13,num) 
			b_ip				= arrList(14,num) 
			b_email				= arrList(15,num) 
			b_cnt				= arrList(16,num) 
			b_uni_nm			= arrList(17,num) 
			b_file_nm			= arrList(18,num) 
			b_file_path			= arrList(19,num) 
			b_notice_flg		= arrList(20,num) 
  
%>
			<tr onClick="location.href='./mobile_notice_ins.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=b_mem_nm%><br><%If b_mem_id <> "" Then%>(<%=b_mem_id%>)<%End If%></td>
				<td><%=b_title%></td> 
				<td><%=Left(b_reg_dt,4)%>/<%=mid(b_reg_dt,6,2)%>/<%=mid(b_reg_dt,9,2)%></td>  
			</tr>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">등록된 정보가 없습니다.</td>
			</tr>
<%
	End If
%>
			</tbody>
			</table>
			<div id="paging_wrap"></div>
		</div>
	</div>
</body>

<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
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