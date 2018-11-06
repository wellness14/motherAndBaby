<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 예약확인
'파 일 명 : member_reser_list.asp
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

	page_type = fncRequest("pagetype")
'	Request
	Dim page_size : page_size = 10 
	page = fncRequest("page")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
'---------------------------------------------------------

	startNum = (page-1) * page_size
	endNum = startNum + page_size





 
	'등록상품 리스트

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''' 

  '---------------------------------------------------------------------

	strTable = "    from	mo_reservation_gift A     "
	
'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "

	'strWhere = "   WHERE  "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MR_MEM_ID='"& sword &"' "
			Case "2" : strWhere = strWhere & "  AND MR_MEM_NM='"& sword &"' "
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

<!--

SELECT [MD_GIFT_SEQ]
      ,[MD_GIFT_NAME]
      ,[MD_GIFT_CATEGORY]
      ,[MD_GIFT_USE_YN]
      ,[MD_GIFT_LOCAL]
      ,[MD_GIFT_LOCAL_DETAIL]
	  ,GIFT_SUM
	  ,GIFT_OUT
	  ,GIFT_SUM - GIFT_OUT GIFT_NOW 
	  ,ROWNUM

FROM (

select	[MD_GIFT_SEQ]
      ,[MD_GIFT_NAME]
      ,[MD_GIFT_CATEGORY]
      ,[MD_GIFT_USE_YN]
      ,[MD_GIFT_LOCAL]
      ,[MD_GIFT_LOCAL_DETAIL]
      ,[MD_GIFT_PICTURE]
	  ,(SELECT SUM(MD_GIFT_EA) FROM MO_RESERVATION_GIFT_NOW_EA WHERE MD_GIFT_SEQ = A.MD_GIFT_SEQ) GIFT_SUM
	  ,(SELECT SUM(MD_GIFT_OUT_EA) FROM MO_RESERVATION_GIFT_OUT WHERE MD_GIFT_SEQ = A.MD_GIFT_SEQ) GIFT_OUT
	  ,ROW_NUMBER( ) OVER (ORDER BY MD_GIFT_NAME ASC) ROWNUM   
  from	mo_reservation_gift A ) B WHERE   	ROWNUM>0 AND ROWNUM<=10

 
-->
<%
 
	strSql = ""
	strSql = strSql & " ;SELECT  	"
	strSql = strSql & "  MD_GIFT_SEQ, MD_GIFT_NAME, MD_GIFT_CATEGORY, MD_GIFT_USE_YN, MD_GIFT_LOCAL, MD_GIFT_LOCAL_DETAIL, GIFT_SUM "
	strSql = strSql & " GIFT_OUT, GIFT_SUM - GIFT_OUT as GIFT_NOW, ROWNUM 	"
 
	strSql = strSql & " FROM  		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			MD_GIFT_SEQ, MD_GIFT_NAME, MD_GIFT_CATEGORY, MD_GIFT_USE_YN, MD_GIFT_LOCAL, MD_GIFT_LOCAL_DETAIL,   "
	strSql = strSql & "			MD_GIFT_PICTURE	,  (SELECT SUM(MD_GIFT_EA) FROM MO_RESERVATION_GIFT_NOW_EA WHERE MD_GIFT_SEQ = A.MD_GIFT_SEQ) GIFT_SUM ,  "
	strSql = strSql & "			(SELECT SUM(MD_GIFT_OUT_EA) FROM MO_RESERVATION_GIFT_OUT WHERE MD_GIFT_SEQ = A.MD_GIFT_SEQ) GIFT_OUT    "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MD_GIFT_SEQ DESC) ROWNUM  "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) B "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
	inoutsum = Rs(8)
		arrList = Rs.GetRows()
		

	End If 
	Call DBClose(Rs) : DBClose(Rs1)
%> 
 
<%
	'-----------------------------------------------------------------------------

 
'	입고수량 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_EA from MO_RESERVATION_GIFT_NOW_EA "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		in_MD_GIFT_SEQ = Rs(0)
		arrProdt_in_ea = Rs(1)
		arrIn = Rs.getRows()
	End If 
	Call RSClose(Rs)


 
'-----------------------------------------------------------------------------
 
'-----------------------------------------------------------------------------
'	출고 수량 호출
	strSql = " select MD_GIFT_SEQ, MD_GIFT_OUT_EA from MO_RESERVATION_GIFT_OUT "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		out_MD_GIFT_SEQ = Rs(0)
		arrProdt_out_ea = Rs(1)
		arrOut = Rs.getRows()
	End If 
	Call RSClose(Rs)


 
'-----------------------------------------------------------------------------
 

%>
 
 
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>예약선물관리</strong></div>

 
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="?">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<div class="selection">
				검 색 : 
				<select name="smode" class="box">
					<option value="">검색 조건</option>
					<option value="1" <%=fncSetSelectBox(smode,"1")%>>회원ID</option>
					<option value="2" <%=fncSetSelectBox(smode,"2")%>>회원명</option>
				</select>
				<input type="text" name="sword" size="40" maxlength="40" value="<%=sword%>"/>
				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">검 색</a> <span style="margin-left:20px;">
				</span>

				<a onClick="location.href='./reservation_gift_list.asp';" style="cursor:pointer;" class="button">등록상품 목록</a>
				<a onClick="location.href='./reservation_gift_out_list.asp';" style="cursor:pointer;" class="button">출고 현황</a>
				<a onClick="location.href='./reservation_gift_now_list.asp';" style="cursor:pointer;" class="button">입고 현황</a>
				<span style="margin-left:20px;"></span>
				<span style="margin-left:20px;">
					<a onClick="location.href='./reservation_gift_ins.asp'" style="cursor:pointer;" class="button">상품등록</a>
				</span>
				<!--span style="margin-left:20px;">
					<a onClick="location.href='./reservation_gift_out_ins.asp'" style="cursor:pointer;" class="button">출고등록</a>
				</span-->
				<span style="margin-left:20px;">
					<a onClick="location.href='./reservation_gift_now_ins.asp'" style="cursor:pointer;" class="button">재고등록</a>
				</span>
			</div>
			</form>
			<br /> 
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			 
			<col />
			<col width="20%" />
			<col width="15%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>상품사용여부</th>
				<th>총 입고수량</th>
				<th>총 출고수량</th>
				<th>현재수량</th>
				 
			</tr>
			</thead>
			<tbody>
		 
<%

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			pdt_name	= arrList(1,num)
			category	= arrList(2,num)
			use_yn		= arrList(3,num)

		    tot_In_EA	= arrList(6,num)
			tot_Out_EA	= arrList(7,num)
			 
			 
			tot = tot_In_EA - tot_Out_EA 

			 
 
%>
 
			<tr onclick="location.href='./reservation_gift_ins.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=pdt_name%><br></td>
				<td><%=category%></td>
				<td><%If use_yn = "Y" Then%>사용함<%Else%>사용안함<%End If%></td>
				<td> <%=tot_In_EA%> 개</td>
				<td> <%=tot%>개</td>
				<td> <%=tot_Out_EA%> 개</td>
				
				 
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
</script>
</html>