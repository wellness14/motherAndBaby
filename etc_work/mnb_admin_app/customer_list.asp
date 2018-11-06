<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/etc_work/mnb_admin_app/checkUser.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId				= Trim(fncRequestCookie("uid"))				'회원	아이디 
	uname			= Trim(fncRequestCookie("uname"))				'회원	아이디 
	idx				= fncRequest("idx")   

 

	If uId = "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_admin_app/login.asp"
	End If

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 
 
	'---------------------------------------------------------
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

	strTable = " FROM MO_RESERVATION A WITH(NOLOCK) "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MR_MEM_ID = MD_MEM_ID "
	strWhere = " WHERE MR_CNLKBN='N' "

	If grpcd <> "" And grpcd <> "1" Then strWhere = strWhere & " AND MD_LOCAL = '"& grpcd &"' "
	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MR_MEM_ID like '%"& sword &"%' "
			Case "2" : strWhere = strWhere & "  AND MR_MEM_NM like '%"& sword &"%' "
			Case "3" : strWhere = strWhere & "  AND MR_MEM_NM like '%"& sword &"%' or MR_MEM_ID like '%"& sword &"%' or MR_HP like '%"& sword &"%'"
			Case "4" : strWhere = strWhere & "  AND MR_HP like '%"& sword &"%'"
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

	strSql = ""
	strSql = strSql & " ;SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			* "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY MR_IDX DESC) ROWNUM "
	strSql = strSql & strTable
	strSql = strSql & strWhere
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	Call DBClose(Rs) : DBClose(Rs1)
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

    <title>마더앤베이비</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet">
	<link href="leftmenu.css" rel="stylesheet">

	<!-- 달력 추가 -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
    <!-- -->
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
 
  </head>

  <body style="background-color:#dfdfdf;">


  <!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 
 
    <div class="container">
		<form id="sFrm" name="sFrm" method="get" action="#">
		<div class="selection" style="margin-top:70px;">
			<select name="smode" class="box" style="background:#fff;height:35px;border:1px solid #455364;">
				<option value="3"<%=fncSetSelectBox(smode,"3")%>>전체검색</option>
				<option value="1" <%=fncSetSelectBox(smode,"1")%>>회원ID</option>
				<option value="2" <%=fncSetSelectBox(smode,"2")%>>회원명</option>
				<option value="4" <%=fncSetSelectBox(smode,"4")%>>휴대폰</option>
			</select>
			<input type="text" name="sword" size="10" maxlength="5" value="<%=sword%>" style="height:35px;border:1px solid #455364;"/>

			<a onClick="jQuery('#sFrm').submit();" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:50px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">검색</a>
			<% If smode <> "" And sword <> "" Then %>
				<a onClick="location.href='./customer_list.asp';" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:80px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">전체리스트</a>
			<% End If %>
		</div>
		</form> 

		<form name="notice" id="notice" method="post" action="notice_sql.asp">
		<input type="hidden" name="mem_id" value="<%=uId%>"/>
		<input type="hidden" name="uname" value="<%=uname%>"/>
		<input type="hidden" name="mode" value="<%=mode%>"/>
  
			<table class="table" style="margin-top:10px; background:#ffffff;">
				<colgroup>
					<col width="22%" />
					<col width="20%" />
					<col width="25%" />
					<col width="25%" />
					<col width="3%" />
				</colgroup>
				<tbody>
					<tr style="height:40px;">
						<th style="text-align:center;">아이디</th>
						<th style="text-align:center;">이름</th>
						<th style="text-align:center;">서비스<br/>프로그램</th>
						<th style="text-align:center;">출산<br/>예정일</th>
						<th style="text-align:center;"></th>
					</tr>
				</tbody>
			<%
				If IsArray(arrList) Then 
					For num=0 To UBound(arrList,2)
  
						idx			= arrList(0,num)
						mem_id		= arrList(1,num)
						mem_nm		= arrList(2,num)
						mem_hp		= arrList(5,num)
						service		= arrList(9,num)
						period		= arrList(10,num)
						service_type= arrList(11,num)
						
						child_birth = arrList(12,num)
						service_sdt	= arrList(13,num)
						service_edt	= arrList(14,num)
						mr_exp	= arrList(16,num)
						unique	= arrList(17,num)

						reg_dt		= Left(arrList(20,num),10)
						pay_state	= arrList(21,num)

						service_sdt1	= arrList(26,num)
						service_edt1	= arrList(27,num)
						service_sdt2	= arrList(28,num)
						service_edt2	= arrList(29,num)
						service_sdt3	= arrList(30,num)
						service_edt3	= arrList(31,num)

						s_happy_call	= arrList(35,num)
						e_happy_call	= arrList(36,num)

						cln_date	= arrList(93,num)
						cln_pre	= arrList(94,num)
						child_form	= arrList(95,num)
						bre_feeding	= arrList(96,num)
						care_post	= arrList(97,num)
						care_addr1	= arrList(98,num)
						care_addr2	= arrList(99,num)
						care_place	= arrList(100,num)

						unique = Replace(unique,"||",",")
						service = Replace(service,"||",",")
 
				Dim strTest, intLength, strLeft, real_content
				real_content = as_content

				strTest = as_content
				intLength = LEN (strTest)

			
				If  intLength >18 Then
				
				strLeft = LEFT (strTest, 18)

				as_content = strLeft & "..."
				
				Else 

				as_content = as_content
				  
				End if
 
			%>
				<tr class="customer-list" style="height:40px;" seq="<%=idx%>">
					<td style="text-align:center; font-weight:bold;"><%=mem_id%></td>
					<td style="text-align:center;"><%=mem_nm%></td>
					<td style="text-align:center;"><%=service%></td>
					<td style="text-align:center;"><%=Left(child_birth,4)%>년 <%=mid(child_birth,5,2)%>월 <%=mid(child_birth,7,2)%>일</td>
					<td style="text-align:center; font-size:15pt;">▼</td>
				</tr>
				<tr class="customer-view-<%=idx%>" style="display:none;">
					<td colspan="5">
						<table class="table">
							<colgroup>
								<col width="40%" />
								<col width="60%" />
							</colgroup>
							<thead>
								<tr>
									<th style="text-align:center;">구분</th>
									<th style="text-align:center;">내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">이름</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=mem_nm%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">휴대폰</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=mem_hp%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">서비스프로그램</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=service%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">이용기간</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=period%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">이용형태</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=service_type%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">결제여부</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=pay_state%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">서비스시작일</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%If service_sdt <> "" Then %> <%=Left(service_sdt,4)%>.<%=mid(service_sdt,5,2)%>.<%=mid(service_sdt,7,2)%> <%End if%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">서비스종료일</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%If service_edt <> "" Then %> <%=Left(service_edt,4)%>.<%=mid(service_edt,5,2)%>.<%=mid(service_edt,7,2)%><%End if%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">조리원입실일</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%If cln_date <> "" Then %><%=Left(cln_date,4)%>.<%=mid(cln_date,5,2)%>.<%=mid(cln_date,7,2)%> <%End if%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">조리원이용기간</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=cln_pre%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">특이사항</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=unique%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">출산예정일</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%If child_birth <> "" Then %><%=Left(child_birth,4)%>.<%=mid(child_birth,5,2)%>.<%=mid(child_birth,7,2)%><%End if%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">분만형태</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=child_form%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">수유형태</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=bre_feeding%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">출산경험</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=mr_exp%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">산후조리장소<br/> 우편번호</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=care_post%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">산후조리장소<br/> 주소</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=care_addr1%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">산후조리장소<br/> 상세주소</span> </th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=care_addr2%></span></td>
								</tr>
								<tr>
									<th style="padding-left:20px;"><span style="color:#717171;">산후조리장소</span></th>
									<td style="padding-left:20px;"><span style="color:#2185c5;"><%=care_place%></span></td>
								</tr> 
								<tr>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table> 
					</td>
				</tr>
			<%
					Next 
				Else
			%>
					<tr style="height:40px;">
						<td style="text-align:center;" colspan="5">내용이 없습니다.</td>
					</tr>
			<%
				End If 
			%>

				<tr style="height:40px;">
					<td style="text-align:center;" colspan="5">
						<div id="paging_wrap" style="margin-top:20px;"></div>
					</td>
				</tr>
			</table>

    </div><!-- /.container -->
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
  </body>
  
	<script src="js/leftmenu.js"></script>
	<!-- 달력추가 시작-->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
	<script> 
		$(document).ready(function() {
			jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});

			$(".customer-list").each(function() {
				$(this).click(function() {
					var seq = $(this).attr("seq");

					var customerView = $(".customer-view-" + seq).css("display");

					if (customerView == "none") {
						$(this).css("background", "#c8c8c8");
						$(this).find("td:eq(4)").text("▲");
						$(".customer-view-" + seq).show();
					} else {
						$(this).css("background", "#ffffff");
						$(this).find("td:eq(4)").text("▼");
						$(".customer-view-" + seq).hide();
					}
				});
			});
		});
	</script>
	<script type="text/javascript" src="js/jquery-latest.js"></script>
	<script type="text/javascript" src="js/jquery.pager.js"></script>
	<!-- 달력추가 끝-->
</html>
