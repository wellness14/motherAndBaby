<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<%

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 
	Dim mode : mode = "ins"

 

	uId				= Trim(fncRequestCookie("uid"))						'회원	아이디
	uname			= Trim(fncRequestCookie("uname"))				'회원	아이디 

	 If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_MEM_DTL    " 
		strSql1 = strSql1 & "  where MD_MEM_ID = '"& uId &"' "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		  ' mode = "upd"
			
			MD_HP			= Rs("MD_HP") 
		   arr_mem_List = Rs.GetRows()

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

  <body  style="background-color:#dfdfdf;">


 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
 
    <div>   
		<!-- <div class="info_box_01_3">
			<span class="info_text_03"> 11</span>
		</div> --> 
 
		<form id="em_Form" name="em_Form" method="post" action="service_res_consult_sql.asp"> 
		<input type="hidden" name="mode" id="mode" value="<%=mode%>" />

			<div class="info_box_011" style="background:#fff;"> 
				<div class="input" style="padding-left:20px;">
					<span style="margin-right:69px; color:#888888;">이름</span> 
					<input type="text" name="mem_nm" id="mem_nm" style="width:186px;height:30px;border:1px solid #C8C8C8;font-size:12pt;font-weight:350;padding-left:15px;color:#888888" placeholder="이름을 입력하세요" <%If uId <> "" Then %> value="<%=uname%>" readonly <% Else %> value="" <% End If %>/>  
				</div>

				<div class="input" style="padding-left:20px;">
					<div class="input2">
						<span style="margin-right:6.8px;">전화상담타입</span>
						<select class="select4"  name="call_service" id="call_service" class="info_hp1" style="padding-left:15px;font-size:12pt;background:#fff;height:30px;width:186px;color:#888888;">
							<option value="">선택</option>
							<option value="서비스일정변경">서비스일정변경</option>
							<option value="출산일변경">출산일변경</option>
							<option value="서비스프로그램변경">서비스프로그램변경</option>
							<option value="출산선물변경">출산선물변경</option>
							<option value="서비스가입문의">서비스가입문의</option>
							<option value="기타">기타</option>
						</select> 
					</div>
				</div>

<% If MD_HP <> "" Then  
					arrHp = Split(MD_HP,"-")
%>
				<div class="input" style="padding-left:20px;">
					<div class="input2">
					<span style="margin-right:53px;">휴대폰</span> 
					<select class="select4"  name="hp1" id="hp1" class="info_hp1" style="background:#fff;height:30px;width:53px;color:#888888;font-size:12pt;">
						<option value="">선택</option>
						<option value="010"<%=fncSetSelectBox("010",arrHp(0))%>>010</option>
						<option value="011"<%=fncSetSelectBox("011",arrHp(0))%>>011</option>
						<option value="016"<%=fncSetSelectBox("016",arrHp(0))%>>016</option>
						<option value="017"<%=fncSetSelectBox("017",arrHp(0))%>>017</option>
						<option value="018"<%=fncSetSelectBox("018",arrHp(0))%>>018</option>
						<option value="019"<%=fncSetSelectBox("019",arrHp(0))%>>019</option>
					</select>
					<input type="text" name="hp2" id="hp2" style="height:30px;padding-left:5px;width:62px;" value="<%=arrHp(1)%>" maxlength="4" class="info_hp1"/>
					<input type="text" name="hp3" id="hp3" style="height:30px;padding-left:5px;width:63px;" value="<%=arrHp(2)%>" maxlength="4" class="info_hp1"/>
					</div>  
				</div>  
<%Else %>
				<div class="input" style="padding-left:20px;">
					<div class="input2">
						<span style="margin-right:53px;">휴대폰</span>
						<select class="select4"  name="hp1" id="hp1" class="info_hp1" style="background:#fff;height:30px;width:53px;color:#888888;font-size:12pt;">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" name="hp2" id="hp2" value="" maxlength="4" class="info_hp1" style="height:30px;padding-left:5px;width:62px;"/>
						<input type="text" name="hp3" id="hp3" value="" maxlength="4" class="info_hp1" style="height:30px;padding-left:5px;width:63px;"/>
					</div>
				</div>
<%End if%>
				<div class="input" style="padding-left:20px;">
					<div class="input2">
						<span style="margin-right:4px; color:#888888;">상담가능날짜</span>  <input type="text" id="datepicker" name="psb_con_date" value="" class="info_input_04" style="width:186px;margin-left:3px;height:30px;color:#888888" placeholder="날짜를 입력하세요" readonly>
					</div>
				</div>

				<div class="input" style="padding-left:20px;">
					<div class="input2">
						<span style="margin-right:7px;">상담가능시간</span>
						<select class="select4"  name="con_time" id="con_time" class="info_hp1" style="padding-left:15px;background:#fff;height:30px;width:53px;color:#888888;font-size:12pt;width:95px;">
							<option value="">선택</option>
							<%
								For num=9 To 18		 
							%>
								<option value="<%=num%>시"><%=num%>시</option> 
							<%
								next
							%>
						</select>
						<select class="select4"  name="con_minute" id="con_minute" class="info_hp1" style="padding-left:15px;background:#fff;height:30px;width:53px;color:#888888;font-size:12pt;width:87px;">
							<option value="">선택</option> 
								<option value="10분">10분</option>
								<option value="20분">20분</option>
								<option value="30분">30분</option>
								<option value="40분">40분</option>
								<option value="50분">50분</option> 
						</select>
					</div>
				</div>
				 

 		
				<div class="input" style="padding-left:20px;text-align:center;">
					<div class="input2">
						<textarea rows="10" cols="5" class="textarea_01" name="contents" id="contents" style="width:287px;" placeholder="상담내용입력"></textarea>
					</div>
				</div> 

				<div class="info_box_02_sub" style="background:#fff;">
					<input type="submit" name="service_res_btn" id="service_res_btn" class="info_input_01" value="상담예약신청" />
				</div>
			</div>
		 </form>  

 

 
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

		$("#service_res_btn").click(function() {
			if ($.trim(jQuery("#mem_nm").val()) == "") {
					alert("이름을 입력하세요");
					$("#mem_nm").focus();
					return false; 
			}
			if ($.trim(jQuery("#call_service").val()) == "") {
					alert("상담타입을 입력하세요");
					$("#call_service").focus();
					return false; 
			} 
			if ($.trim(jQuery("#hp1").val()) == "") {
					alert("핸드폰번호를 입력하세요");
					$("#hp1").focus();
					return false; 
			}
			if ($.trim(jQuery("#hp2").val()) == "") {
					alert("핸드폰번호를 입력하세요");
					$("#hp2").focus();
					return false; 
			} 
			if ($.trim(jQuery("#hp3").val()) == "") {
					alert("핸드폰번호를 입력하세요");
					$("#hp3").focus();
					return false; 
			}  
			if ($.trim(jQuery("#datepicker").val()) == "") {
					alert("상담가능날짜를 입력하세요");
					$("#datepicker").focus();
					return false; 
			}
			if ($.trim(jQuery("#con_time").val()) == "") {
					alert("상담가능시간을 입력하세요");
					$("#con_time").focus();
					return false; 
			} 
			if ($.trim(jQuery("#con_minute").val()) == "") {
					alert("상담가능시간을 입력하세요");
					$("#con_minute").focus();
					return false; 
			} 
			if ($.trim(jQuery("#contents").val()) == "") {
					alert("상담내용을 입력하세요");
					$("#contents").focus();
					return false; 
			} 

		});

	  });
</script>
</html>
