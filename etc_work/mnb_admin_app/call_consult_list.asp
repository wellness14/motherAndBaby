<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
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
  
   	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strTable = " FROM MO_APP_CALL_SERVICE   " 
	strWhere = " where CALL_CNLKBN = 'N' "

	'	strSql = strSql & strTable [CALL_NAME]
	'	strSql = strSql & strWhere [CALL_HP]

	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND CALL_NAME like '%"& sword &"%' order by CALL_NAME asc"
			Case "2" : strWhere = strWhere & "  AND CALL_HP like '%"& sword &"%' order by CALL_HP asc"
			Case "3" : strWhere = strWhere & "  AND CALL_HP like '%"& sword &"%' or CALL_NAME like '%"& sword &"%' order by CALL_NAME asc"
		End Select 
	End If 



	 If uId <> "" Then


		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
	
	If sword <> "" Then  

		strSql1 = strSql1 & strTable
		strSql1 = strSql1 & strWhere

	else

		strSql1 = strSql1 & " from  MO_APP_CALL_SERVICE    " 
		strSql1 = strSql1 & " where  CALL_CNLKBN = 'N'  order by CALL_SEQ desc "

	End If

		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		'   mode = "upd"
	
										 ' 들어가야할 값
				CALL_SEQ			= Rs("CALL_SEQ")	 ' 자동증가
				MR_IDX				= Rs("MR_IDX")  '+1
				MD_MEM_ID			= Rs("MD_MEM_ID")  '1 고정값
				CALL_NAME			= Rs("CALL_NAME")	 '+1
				CALL_SERVICE_TYPE	= Rs("CALL_SERVICE_TYPE")  '공지
				CALL_WANT_DATE		= Rs("CALL_WANT_DATE")  ' 
				CALL_WANT_TIME		= Rs("CALL_WANT_TIME")  '
				CALL_WANT_MINUTE	= Rs("CALL_WANT_MINUTE")  '제목 
				CALL_HP				= Rs("CALL_HP")  '내용
				CALL_CONTENT		= Rs("CALL_CONTENT")		' N 고정값
				CALL_FINISH_FLG		= Rs("CALL_FINISH_FLG")	'널
				CALL_CNLKBN			= Rs("CALL_CNLKBN")	'삭제구분
				CALL_REG_DATE		= Rs("CALL_REG_DATE") '등로날짜 


	 
		   arr_call_List = Rs.GetRows()

		End If   
	 End If
 
	Call RSClose(Rs)


	If MR_CHILDBIRTH <> "" Then 
		birth_m = Mid(MR_CHILDBIRTH,5,2)
		birth_d = Right(MR_CHILDBIRTH,2)
		birth_ymd = Left(MR_CHILDBIRTH,4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
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
					<select name="smode" class="box" style="background:#fff;height:35px; border:1px solid #455364;">
						<option value="3"<%=fncSetSelectBox(smode,"3")%>>전체검색</option>
						<option value="1" <%=fncSetSelectBox(smode,"1")%>>회원명</option>
						<option value="2" <%=fncSetSelectBox(smode,"2")%>>휴대폰</option>
					</select>
					<input type="text" name="sword" size="10" maxlength="10" value="<%=sword%>" style="height:35px; border:1px solid #455364;"/>

					<a onClick="jQuery('#sFrm').submit();" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:50px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">검색</a>
					<% If smode <> "" And sword <> "" Then %>
						<a onClick="location.href='./call_consult_list.asp';" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:80px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">전체리스트</a>
					<% End If %>
				</div>
			</form> 

		<!-- <form name="notice" id="notice" method="post" action="notice_sql.asp">
		<input type="hidden" name="mem_id" value="<%=uId%>"/>
		<input type="hidden" name="uname" value="<%=uname%>"/>
		<input type="hidden" name="mode" value="<%=mode%>"/>
 

		<div class="info_box_03_sub_4">
			<input type="text" style="width:80%;" name="notice_title" id="notice_title"  placeholder="제목을 입력하세요"/> 
		</div>

		<div class="info_box_03_sub_4">
			<textarea rows="10" cols="5" class="textarea_01" name="notice_content" id="notice_content"  placeholder="내용작성"></textarea> 
		</form>
			 
			<input type="submit" name="emergency_btn" id="emergency_btn" class="info_input_01" value="공지작성" style="padding-bottom:10px;"/> 
		</div> -->
			
			<table class="table" style="margin-top:10px; background:#ffffff;">
				<colgroup>
					<col width="22%" />
					<col width="25%" />
					<col width="20%" />
					<col width="30%" />
					<col width="3%" />
				</colgroup>
				<tbody>
					<tr style="height:40px;">
						<th style="text-align:center;">상태</th>
						<th style="text-align:center;">문의내용</th>
						<th style="text-align:center;">이름</th>
						<th style="text-align:center;">작성일</th>
						<th style="text-align:center;"></th>
					</tr>
				</tbody>
			<%
				If IsArray(arr_call_List) Then 
					For num=0 To UBound(arr_call_List,2)
 
						c_seq				= Trim(arr_call_List(0,num))
						idx					= Trim(arr_call_List(1,num))
						c_mem_id			= Trim(arr_call_List(2,num))
						c_name				= Trim(arr_call_List(3,num))
						c_service_type		= arr_call_List(4,num) 
						c_want_date			= arr_call_List(5,num) 
						c_want_time			= arr_call_List(6,num) 
						c_want_minute		= arr_call_List(7,num) 
						c_hp				= arr_call_List(8,num) 
						c_content			= arr_call_List(9,num) 
						c_finish_flg		= arr_call_List(10,num) 
						c_cnlkbn			= arr_call_List(11,num) 
						c_reg_date			= arr_call_List(12,num) 
 
 
					Dim strTest, intLength, strLeft, real_content
					real_content = as_content

					strTest = c_content
					intLength = LEN (strTest)

				
					If  intLength >18 Then
					
					strLeft = LEFT (strTest, 18)

					c_content = strLeft & "..."
					
					Else 

					c_content = c_content
					  
					End If
			%>
				<tr class="call-request" style="height:40px;" seq="<%=c_seq%>">
					<td style="text-align:center; font-weight:bold;"><% If c_finish_flg ="N" Then %>상담대기<% Else %>상담완료<% End If %></td>
					<td style="text-align:center;"><%=c_service_type%></td>
					<td style="text-align:center;"><%=c_name%></td>
					<td style="text-align:center;"><%=Left(c_reg_date,4)%>년  <%=mid(c_reg_date,6,2)%>월 <%=mid(c_reg_date,9,2)%>일</td>
					<td style="text-align:center; font-size:15pt;">▼</td>
				</tr>
				<tr class="call-response-<%=c_seq%>" style="display:none;">
					<td style="text-align:center;" colspan="5">
						<div class="info_box_03_sub_1"> 
							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">이름</span> <%=c_name%>
							</div>

							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">전화상담타입</span> <%=c_service_type%>
							</div>

							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">휴대폰</span> <a href="tel:<%=c_hp%>"><%=c_hp%></a>
							</div>

							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">상담가능날짜</span> <%=c_want_date%>
							</div>

							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">상담가능시간</span> <%=c_want_time%>&nbsp;<%=c_want_minute%>
							</div>

							<div class="info_text_03_2" style="margin-bottom:10px;">
								<span style="width:100px;display:inline-block;margin-right:10px; font-weight:bold;">상담내용</span><br/><br/>
								<textarea rows="10" cols="5" class="textarea_01" name="notice_content1" id="notice_content1" readonly style=" color:#888888;"><%=c_content%></textarea>
							</div>
							
							<% If c_finish_flg = "N" Then %>
							<div class="info_text_03_2" style="margin-bottom:10px;">
								<a onClick="finish_call('<%=c_seq%>');" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:85%;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">상담완료</a>
							</div>
							<% End If %>
						</div>
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
			$( "#datepicker" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 

			$(".call-request").each(function() {
				$(this).click(function() {
					var seq = $(this).attr("seq");

					var responseView = $(".call-response-" + seq).css("display");

					if (responseView == "none") {
						$(this).css("background", "#c8c8c8");
						$(this).find("td:eq(4)").text("▲");
						$(".call-response-" + seq).show();
					} else {
						$(this).css("background", "#ffffff");
						$(this).find("td:eq(4)").text("▼");
						$(".call-response-" + seq).hide();
					}
				});
			});
		});

		function finish_call (idx) {
			jQuery.post("./finish_call_sql.asp",{"idx":idx,"call_fisish_flg":"Y"},function(data,testStatus){
					if (data == 2) {
						alert("상담이완료되었습니다.");
						location.reload();
					} else {
						alert("오류가 발생하였습니다. 관리자에게 문의하세요");
						location.reload();
					}
			});   

		}
	</script>
	<!-- 달력추가 끝-->
</html>
