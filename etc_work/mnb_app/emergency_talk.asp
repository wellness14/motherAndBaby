<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId				= Trim(fncRequestCookie("uid"))				'회원	아이디 
	uname			= Trim(fncRequestCookie("uname"))				'회원	아이디 
	idx				= fncRequest("idx")   

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	If uId = "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/login.asp"
	End If

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 

	 If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_EMERGENCY_SERVICE    " 
		strSql1 = strSql1 & "  where MR_MEM_ID = '"& uId &"' and ME_CNLKBN = 'N' order by EM_SEQ desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		   mode = "upd"
			
		   EM_SEQ			= Rs(0)
		   MR_MEM_ID		= Rs(1)
		   MR_MEM_NM		= Rs(2)
		   MR_HP			= Rs(3)
		   MR_CHILDBIRTH	= Rs(4)
		   ME_TYPE			= Rs(5) '분만타입
		   ME_CHILD_GENDER	= Rs(6)
		   MR_CLINIC		= Rs(7)
		   MR_CONTENT		= Rs(8)
		   ME_CNLKBN		= Rs(9)
		   ME_REG_DT		= Rs(10)
	 
		   arr_res_List = Rs.GetRows()

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
	End if

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

  <body>


 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->




    <div class="container">

		<div class="info_box_01_2">
			<img src="img/caution_icon.png"/><span class="info_text_02"> 꼭 읽어보세요</span>

		</div>
		<div class="info_box_01_3">
			<span class="info_text_03"> 긴급상담신청을 하시게 되면 마더앤베이비 담당자가 내용을 확인 후 전화를 드리게 됩니다. 모든고객님께 답변드릴 수 없는점 양해부탁드립니다.</span>
		</div>

		<div class="info_box_01_3">
			<span class="info_text_04"> 예) 출산일이 변경됨, 산후조리원 일정변경 등</span>
		</div>
		<form id="em_Form" name="em_Form" method="post" action="emergency_sql.asp">
		<input type="hidden" name="mem_id" id="mem_id" value="<%=uId%>" />
		<input type="hidden" name="mem_nm" id="mem_nm" value="<%=uname%>" />
		<input type="hidden" name="idx" id="idx" value="<%=EM_SEQ%>" />
		<input type="hidden" name="mode" id="mode" value="<%=mode%>" />
			<div class="info_box_01">
				
				<div class="info_box_03_sub">
					<textarea rows="10" cols="5" class="textarea_01" name="contents" placeholder="내용입력"><%=MR_CONTENT%></textarea>
				</div>
				<!--<div class="info_box_03_sub_2">
					이름 : <input type="text" name="mem_nm" id="mem_nm" class="info_input_04" placeholder="이름을 입력하세요" value="<%=uname%>" />  
				</div>-->
				<%
				If MR_HP <> "" Then 
				arrPhone = Split(MR_HP,"-")
				%>
				<div class="info_box_03_sub_2">
					<div class="input2">
						<span class="input2_title">휴대폰</span>
						<select class="select2"  name="hp1" id="hp1" class="info_hp1">
							<option value="">선택</option>
							<option value="010" <%=fncSetSelectBox("010",arrPhone(0))%>>010</option>
							<option value="011" <%=fncSetSelectBox("011",arrPhone(0))%>>011</option>
							<option value="016" <%=fncSetSelectBox("016",arrPhone(0))%>>016</option>
							<option value="017" <%=fncSetSelectBox("017",arrPhone(0))%>>017</option>
							<option value="018" <%=fncSetSelectBox("018",arrPhone(0))%>>018</option>
							<option value="019" <%=fncSetSelectBox("019",arrPhone(0))%>>019</option>
						</select>
						<input type="text" name="hp2" id="hp2" maxlength="4" value="<%=arrPhone(1)%>" class="info_hp1" />
						<input type="text" name="hp3" id="hp3"  maxlength="4"  value="<%=arrPhone(2)%>" class="info_hp1" />
					</div>
				</div>
				<%Else %>
				<div class="info_box_03_sub_2">
					<div class="input2">
						<span class="input2_title">휴대폰</span>
						<select class="select2"  name="hp1" id="hp1" class="info_hp1">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<input type="text" name="hp2" id="hp2" value="" class="info_hp1" />
						<input type="text" name="hp3" id="hp3" value="" class="info_hp1" />
					</div>
				</div>
				<% End If %>
				<div class="info_box_03_sub_2">
					출산일 <input type="text" id="datepicker" name="birth" value="<%=birth_ymd%>" class="info_input_04" placeholder="날짜를 입력해주세요">
				</div>
				<div class="info_box_03_sub_2"> 
					 출산형태 <span style="margin-left:20px;"></span><input type="radio" name="ch_type" id="ch_type" value="일반분만" <%=fncSetCheckBox("일반분만",ME_TYPE)%> /> 일반분만 
							<span style="margin-left:20px;"></span><input type="radio" name="ch_type" id="ch_type" value="재왕절개" <%=fncSetCheckBox("재왕절개",ME_TYPE)%>/> 재왕절개 
				</div>
				<div class="info_box_03_sub_2"> 
					 아가성별 <span style="margin-left:20px;"></span>
								<input type="radio" name="gender" id="gender" value="남아" <%=fncSetCheckBox("남아",ME_CHILD_GENDER)%> /> 남아  
								<input type="radio" name="gender" id="gender" value="여아" <%=fncSetCheckBox("여아",ME_CHILD_GENDER)%>/> 여아 
								<input type="radio" name="gender" id="gender" value="남아쌍둥이" <%=fncSetCheckBox("남아쌍둥이",ME_CHILD_GENDER)%>/> 남아쌍둥이  
				</div>
				<div class="info_box_03_sub_2"> 
						<span style="color:#ececec;">아가성별</span><span style="margin-left:20px;"></span>
						<input type="radio" name="gender" id="gender" value="여아쌍둥이" <%=fncSetCheckBox("여아쌍둥이",ME_CHILD_GENDER)%>/> 여아쌍둥이 
								<input type="radio" name="gender" id="gender" value="이란성쌍둥이" <%=fncSetCheckBox("이란성쌍둥이",ME_CHILD_GENDER)%>/> 이란성쌍둥이 
				</div>
				<div class="info_box_03_sub_2"> 
					 조리원 <span style="margin-left:20px;"></span><input type="radio" name="radio3" id="radio3" value="이용함" <%=fncSetCheckBox("이용함",MR_CLINIC)%> /> 이용함 
					<span style="margin-left:20px;"></span><input type="radio" name="radio3" id="radio3" value="이용안함" <%=fncSetCheckBox("이용안함",MR_CLINIC)%>/> 이용안함 
				</div>


				<div class="info_box_02_sub">
					<input type="submit" name="emergency_btn" id="emergency_btn" class="info_input_01" value="긴급상담신청" />
				</div>
			</div>
		 </form>  

  
		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
    </div><!-- /.container -->

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
		  }); 

		jQuery("#emergency_btn").click(function() {
			if ($.trim(jQuery(".textarea_01").val()) == "") {
					alert("내용을 입력하세요");
					$('.textarea_01').focus();
					return false; 
			}

			if ($.trim(jQuery("#hp1").val()) == "") {
					alert("핸드폰 번호를 입력하세요");
					$('#hp1').focus();
					return false;
			}
			if ($.trim(jQuery("#hp2").val()) == "") {
					alert("핸드폰 번호를 입력하세요");
					$('#hp2').focus();
					return false;
			}
			if ($.trim(jQuery("#hp3").val()) == "") {
					alert("핸드폰 번호를 입력하세요");
					$('#hp3').focus();
					return false;
			}
		
			/*
			if ($.trim(jQuery("#datepicker").val()) == "") {
					alert("생년월일을 입력하세요.");
					$('#datepicker').focus();
					return false;
			}
			*/
 

		});


	</script>
	<!-- 달력추가 끝-->
</html>
