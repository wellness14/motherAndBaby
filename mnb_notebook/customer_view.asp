<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->

<%
	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"

	
	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

		If uId = "" Then 
		Response.Redirect "http://mothernbaby.co.kr/mnb_notebook/login.asp"
		End If 

	intIDX = fncRequest("idx")   
	mem_id = fncRequest("mem_id")
	mo_helper_seq = fncRequest("mo_helper_seq1")
    If intIDX <> "" Then
		strTable = " FROM MO_RESERVATION WITH(NOLOCK) "

		strWhere = " WHERE MR_CNLKBN='N' AND MR_IDX = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
			mode = "upd"
			 
			mr_idx		= Rs(0)
			mem_id		= Rs(1)
			mem_nm		= Rs(2)
			birth		= Rs(3)
			phone		= Rs(4)
			hp			= Rs(5)
			post		= Rs(6)
			addr_1		= Rs(7)
			addr_2		= Rs(8)
			service		= Rs(9)
			period		= Rs(10)
			service_type= Rs(11) 
			childbirth	= Rs(12)
			serviceSdt	= Rs(13)
			serviceEdt	= Rs(14)
			clinic		= Rs(15)
			exper		= Rs(16)
			unique		= Rs(17)
			family		= Rs(18)
			payment		= Rs(19)
			payType		= Rs(20)
			payState	= Rs(21)
			payEdt		= Rs(22)
			content		= Rs(23)
			serviceSdt_1= Rs(26)
			serviceEdt_1= Rs(27)
			serviceSdt_2= Rs(28)
			serviceEdt_2= Rs(29)
			serviceSdt_3= Rs(30)
			serviceEdt_3= Rs(31)
			pay_name    = Rs(32)
			cancel_yn   = Rs(33)
			cancel_reason= Rs(34)
			s_happy_call= Rs(35)
			e_happy_call= Rs(36)
			
			product_1					= Rs(37) '유축기 
			product_2					= Rs(38) '유축기 소모품
			product_CHOICE_WEEK			= Rs(39) '기간
			product_CHOICE_PRICE		= Rs(40) '가격
			product_OUT_DAY				= Rs(41) '조사기
			product_MASSAGE_BEFORE		= Rs(42) ' 마사지 산전
			product_MASSAGE_AFTER		= Rs(43) ' 산후
			product_MASSAGE_ADD			= Rs(44) ' 추가
			product_VISIT_NURSE_BEFORE	= Rs(45) ' 방문간호사 산전
			product_VISIT_NURSE_AFTER	= Rs(46) ' 산후
			product_SODOK_SERVICE		= Rs(47) ' 소독서비스
			product_GIFT_CHOICE			= Rs(48) ' 출산선물선택
			product_GIFT_CHOICE_SEND	= Rs(49) ' 택배일
			product_GIFT_CHOICE_BABY	= Rs(50) ' 폴스베이비
			product_GIFT_BOX_SEND		= Rs(51) ' 출산선물박스 택배일
			product_CONTENT2			= Rs(52) ' 상담자 메모 관리자만 볼수있음. -- 사용안함


			arr_res_List = Rs.GetRows()

		End If 
		Call RSClose(Rs)

End If 
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Mother n Baby 산모도우미 수첩</title>

    <!-- Bootstrap core CSS -->
    <link href="/mnb_notebook/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/mnb_notebook/css/style.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/mnb_notebook/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="/mnb_notebook/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/mnb_notebook/js/ie10-viewport-bug-workaround.js"></script>
  </head>

  <body>

  <!-- #include virtual = "/mnb_notebook/nav.asp"-->


    <div class="container">

		<div class="content">
				<div class="title_align_left">
					 기본정보
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">ID/이름</td>
							<td class="td2">[<%=mem_id%>] / [<%=mem_nm%>]</td>
						</tr>
						<tr>
							<td class="td1">생년월일</td>
							<td class="td2"><%=Left(birth,4)%>년<%=Mid(birth,5,2)%>월<%=Right(birth,2)%>일</td>
						</tr>
						<tr>
							<td class="td1">연락처</td>
							<td class="td2">[<%=phone%>]  [<%=hp%>]</td>
						</tr>
						<tr>
							<td class="td1">주소</td>
							<td class="td2"><%=addr_1%> <%=addr_2%></td>
						</tr>
					</tbody>
				</table>

 

				<div class="title_align_left">
					 서비스정보
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">status</td>
							<td class="td2"><% If payState = "결제완료" And s_date <=  nowymd   And e_date >= nowymd then%> 진행중 <% End if%>
											<% If payState = "결제완료" And  e_date < nowymd then%> 완료 <% End if%>
											<% If payState = "" Then %> 대기중 <%else%>대기중<% End if%></td>
						</tr>
						<tr>
							<td class="td1">신청서비스</td>
							<td class="td2">[<%=service%>]</td>
						</tr>
						<tr>
							<td class="td1">기간/이용형태</td>
							<td class="td2">[<%=period%>] / [<%=service_type%>]</td>
						</tr>
						<tr>
							<td class="td1">시작/종료일</td>
							<td class="td2"><%=Left(serviceSdt,4)%>.<%=Mid(serviceSdt,5,2)%>.<%=Right(serviceSdt,2)%>. ~ <%=Left(serviceEdt,4)%>.<%=Mid(serviceEdt,5,2)%>.<%=Right(serviceEdt,2)%></td>
						</tr>
						<tr>
							<td class="td1">전신마사지</td>
							<td class="td2"> [<%=product_MASSAGE_BEFORE%>] [<%=product_MASSAGE_AFTER%>] [<%=product_MASSAGE_ADD%>]	</td>
						</tr>
						<tr>
							<td class="td1">방문간호사</td>
							<td class="td2">[<%=product_VISIT_NURSE_BEFORE%>] [<%=product_VISIT_NURSE_AFTER%>]</td>
						</tr>
						<tr>
							<td class="td1">소독서비스</td>
							<td class="td2"><%=product_SODOK_SERVICE%></td>
						</tr>
					</tbody>
				</table>
 	 

			<div class="title_align_left">
				 추가정보
			</div>
				
				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">조리원이용</td>
							<td class="td2"><%=clinic%></td>
						</tr>
						<tr>
							<td class="td1">출산경험</td>
							<td class="td2"><%=exper%></td>
						</tr>
						<tr>
							<td class="td1">특이사항</td>
							<td class="td2">[<%=unique%>]  </td>
						</tr>
						<tr>
							<td class="td1">가족사항</td>
							<td class="td2">[<%=family%>] </td>
						</tr>
					</tbody>
				</table>
		</div>

    </div><!-- /.container -->

  </body>
</html>
