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
	<script type="text/javascript" src="/common/js/Nwagon.js"></script>
	<script type="text/javascript" src="/common/js/Nwagon_no_vml.js"></script>
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<link type="text/css" rel="stylesheet" href="/admin/common/css/Nwagon.css" />
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

	strTable = "    from	MO_DATA A     "
	
'	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "

	strWhere = "     "

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
	strSql = strSql & " ;SELECT  *			      "
	strSql = strSql & " FROM  				      "
	strSql = strSql & " (						  "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			MO_DATA_SEQ		  "
	strSql = strSql & "		  , MO_DATA_NAME	  "
	strSql = strSql & "		  , MO_DATA_CATEGORY	  "
	strSql = strSql & "		  , MO_DATA_TERM	  "
	strSql = strSql & "		  , MO_DATA_PRICE	  "
	strSql = strSql & "		  , MO_DATA_CODE	  "
	strSql = strSql & "		  , ROW_NUMBER( ) OVER (ORDER BY MO_DATA_SEQ DESC) ROWNUM  "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) B "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
	 
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
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>통계관리</strong></div>

 
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

				<a onClick="location.href='./data_day_list.asp';" style="cursor:pointer;" class="button">일별매출관리</a>
				<a onClick="location.href='./data_month_list.asp';" style="cursor:pointer;" class="button">월별매출관리</a>
				<a onClick="location.href='./data_list.asp';" style="cursor:pointer;" class="button">서비스비용관리</a>
				<a onClick="location.href='./data_add_list.asp';" style="cursor:pointer;" class="button">추가비용관리</a>
				
				<!--a onClick="location.href='./data_statistic.asp';" style="cursor:pointer;" class="button">통계현황</a-->
				<span style="margin-left:20px;"></span>
				<!-- 서비스비용관리, 추가비용관리 리스트에 추가 해야함 !-->
				<span style="margin-left:20px;">
					<a onClick="location.href='./data_ins.asp'" style="cursor:pointer;" class="button">서비스프로그램등록</a>
				</span>


				<span style="margin-left:20px;">
					<a onClick="location.href='./data_res_list_test.asp'" style="cursor:pointer;" class="button">대기리스트 테스트</a>
				</span>
				<span style="margin-left:20px;">
					<a onClick="location.href='./data_res_list_test_ctm_app.asp'" style="cursor:pointer;" class="button">대기리스트 수정</a>
				</span>
				<!--
				<span style="margin-left:20px;">
					<a onClick="location.href='./data_add_ins.asp'" style="cursor:pointer;" class="button">추가비용등록</a>
				</span>
				-->
			</div>
			</form>
			

			<br /> 
			<table class="tb_style01">
			<colgroup>
			<col width="3%" />
			<col />
			<col width="20%" />
			<col width="15%" />
			<col width="25%" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>서비스프로그램</th>
				<th>서비스타입</th>
				<th>기간</th>
				<th>가격</th>
				<th>코드</th>
			</tr>
			</thead>
			<tbody>
			<!--div id="Nwagon"></div>
			<script>
	var options = {
		'legend': {
			names: ['EunJeong','HanSol','InSook','Eom','Pearl','SeungMin','TJ','Taegyu','YongYong'],
			hrefs: [
				'http://nuli.navercorp.com/sharing/blog/post/1132444',
				'http://nuli.navercorp.com/sharing/blog/post/1132442',
				'http://nuli.navercorp.com/sharing/blog/post/1132439',
				'http://nuli.navercorp.com/sharing/blog/post/1132426',
				'http://nuli.navercorp.com/sharing/blog/post/1115205',
				'http://nuli.navercorp.com/sharing/blog/post/1111811',
				'http://nuli.navercorp.com/sharing/blog/post/1111181',
				'http://nuli.navercorp.com/sharing/blog/post/1096163',
				'http://nuli.navercorp.com/sharing/blog/post/1079940'
			]
		},
		'dataset': {
			title: 'Playing time per day',
			values: [5,7,2,4,6,3,5,2,10],
			colorset: ['#DC143C', '#FF8C00', "#30a1ce"]
		},
		'chartDiv': 'Nwagon',
		'chartType': 'column',
		'chartSize': { width: 700, height: 300 },
		'maxValue': 10,
		'increment': 1
	};
	Nwagon.chart(options);
</script>
		 -->
<%

	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			= arrList(0,num)
			pdt_name	= arrList(1,num)
			ser_type	= arrList(2,num)
			term		= arrList(3,num)
			price		= arrList(4,num)
			code		= arrList(5,num)

%>
 
			<tr onclick="location.href='./data_ins.asp?idx=<%=idx%>'" style="cursor:pointer;">
				<td><%=intTotalCnt - CInt(page-1) * page_size - num%></td>
				<td><%=pdt_name%><br></td>
				<td><%=ser_type%></td>
				<td><%=term%></td>
				<td><%=price%></td>
				<td><%=code%></td>
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