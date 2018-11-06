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

	 If idx <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_BRD_NOTICE    " 
		strSql1 = strSql1 & " where  BA_CNLKBN = 'N' AND BA_NOTICE_FLG='M' and BA_IDX='"& idx &"' order by BA_IDX desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		   mode = "upd"
  
									 ' 들어가야할 값
			BA_IDX			= Rs(0)	 ' 자동증가
			BA_SEQ			= Rs(1)  '+1
			BA_DPH			= Rs(2)  '1 고정값
			BA_PIDX			= Rs(3)	 '+1
			BA_TYPE			= Rs(4)  '공지
			BA_MEM_ID		= Rs(5)  ' 
			BA_MEM_NM		= Rs(6)  '
			BA_TITLE		= Rs(7)  '제목 
			BA_CONTENT		= Rs(8)  '내용
			BA_SEC_FLG		= Rs(9)		' N 고정값
			BA_SEC_NUM		= Rs(10)	'널
			BA_CNLKBN		= Rs(11)	'삭제구분
			BA_REG_DT		= Rs(12) '등로날짜
			BA_UPD_DT		= Rs(13)  '수정날짜
			BA_IP			= Rs(14) 'IP
			BA_EMAIL		= Rs(15) 
			BA_CNT			= Rs(16) 
			BA_UNI_NM		= Rs(17) '널
			BA_FILE_NM		= Rs(18) '널
			BA_FILE_PATH	= Rs(19) '널
			BA_NOTICE_FLG	= Rs(20) 'M 모바일 


 
	   arr_notice_List = Rs.GetRows()

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

  <body>


  <!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 
 
    <div class="container">
		<div class="info_box_01_2">
			 
		</div> 
			<form name="notice_update" id="notice_update" method="post" action="notice_update_sql.asp">
			<input type="hidden" name="mode" value="<%=mode%>"/>
			<input type="hidden" name="idx" value="<%=idx%>"/>
				<div class="info_box_02" id="info_box_04_sub_<%=idx%>">
					<div class="info_box_03_sub">

						<div style="width:100%;"><span class="info_text_03_1" style="font-weight:bold; margin-bottom:30px;"></span></div>
						<div class="info_box_03_sub">
							<input type="text" style="width:80%;" name="ba_title" id="ba_title"  placeholder="제목입력"  value="<%=BA_TITLE%>"/>
						</div>
						<div class="info_box_03_sub_1"> 
							<div class="info_box_03_sub">
								<textarea rows="10" cols="5" class="textarea_01" name="notice_content" id="notice_content"  placeholder="내용입력"><%=BA_CONTENT%></textarea>
							</div> 
							<br>
							<div style="text-align:center;margin-top:20px;">
								
								<input type="button" name="save_btn"  id="save_btn"  class="info_input_02_2" value="삭제" onclick="reply('<%=idx%>');"/>
								<input type="button" name="save_btn"  id="save_btn"  class="info_input_02_2" value="취소" onclick="history.back(-1);"/>
								<input type="submit" name="close_btn" id="close_btn" class="info_input_02_2" value="수정" />
							</div>
 
						</div>
					</div>
				</div> 
			</form>

		<div class="plan_margin_1"></div>

		<div class="login_input">
				<span class="login_text_3"> 서비스 이용약관 | 개인정보취급방침 </span>
		</div>

		<div class="login_input">
				<span class="login_text"> 웰니스인텔리전스(주) | 사업자번호 220-88-73478<br>copyrightⓒ 2015 <span class="login_text_5">mother&baby.</span>All rights reserved.</span> 
		</div>
 
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


			function open_div (idx) {
				$("#info_box_04_sub_"+idx).show();

				$("#info_box_03_sub_"+idx).hide();
 
			}

			function close_div (idx) {
 
				$("#info_box_04_sub_"+idx).hide();
	 
				$("#info_box_03_sub_"+idx).show();
 
			}

			function reply (idx,reply_ctt,reply_flg) {
 
				jQuery.post("./service_consult_reply_sql.asp",{"idx":idx,"as_reply_content":$("#as_reply_content_"+idx).val(),"reply_flg":reply_flg},function(data,testStatus){
						if (data == 2) {
							alert("답변이 수정되었습니다.");
							location.reload();
						} else if (data == 3) {
							alert("답변이 등록되었습니다.");
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
