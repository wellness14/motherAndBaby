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

	 If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_APP_SERVICE_CONSULT    " 
		strSql1 = strSql1 & " where  AS_CNLKBN = 'N' order by AS_SEQ desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		   mode = "upd"
  
		   AS_SEQ			= Rs(0) 
		   MR_MEM_ID		= Rs(1) 
		   MR_MEM_NM		= Rs(2) 
		   AS_CONTENT		= Rs(3) 
		   AS_REPLY			= Rs(4)  
		   AS_CNLKBN		= Rs(5) '삭제 구분
		   AS_REG_DT		= Rs(6) 
		   AS_LEVEL			= Rs(7) 
		   AS_REPLY_CONTENT	= Rs(8)  
	 
		   arr_as_List = Rs.GetRows()

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
  
			<%
				If IsArray(arr_as_List) Then 
					For num=0 To UBound(arr_as_List,2)
						idx				= Trim(arr_as_List(0,num))
						as_mem_id		= Trim(arr_as_List(1,num))
						as_mem_nm		= Trim(arr_as_List(2,num))
						as_content		= Trim(arr_as_List(3,num))
						as_reply		= arr_as_List(4,num) 
						as_del_flg		= arr_as_List(5,num)
						as_reg_dt		= arr_as_List(6,num)
						as_level		= arr_as_List(7,num)
						as_reply_content= arr_as_List(8,num)
 

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
  ' 여기 밑에서부터 작업
			%>  
				<div class="info_box_02" id="info_box_03_sub_<%=idx%>">
					<div class="info_box_03_sub"> 

						<span class="info_text_03_1"><%=as_content%></span>
						<input type="button" name="open_btn" id="open_btn_<%=idx%>" class="info_input_02_1" value="보기" onclick="open_div('<%=idx%>');" />
						<%If as_reply = "Y" Then %>
						<div class="info_input_02_11">답변완료</div>
						<%else%>
						<div class="info_input_02_11">답변예정</div>
						<%End If %>  

						<div class="info_box_03_sub_1"> 
							<div class="info_text_03_2"><%=Left(as_reg_dt,4)%>년  <%=mid(as_reg_dt,6,2)%>월 <%=mid(as_reg_dt,9,2)%>일</div>  
							<!-- <%If as_reply = "Y" Then %>
								<div style="float:right; margin-right:10px; text-align:center;">
									<span name="post_btn" id="post_btn" class="admin_em_flag">완료</span>
								</div>
							<%else%>
								<div style="float:right; margin-right:10px; text-align:center;">
									<span name="post_btn" id="post_btn" class="admin_em_flag">답변예정</span>
								</div>
							<%End If %> -->
						</div>
					</div>
				</div>

				<div class="info_box_02" id="info_box_04_sub_<%=idx%>" style="display:none;">
					<div class="info_box_03_sub">
						<div style="width:100%;"><span class="info_text_03_1" style="font-weight:bold; margin-bottom:30px;"><%=real_content%></span></div>
						<div class="info_box_03_sub_1">
 
							<%If as_reply = "Y" Then %>
								<div class="info_box_03_sub">
									<textarea rows="10" cols="5" class="textarea_01" name="as_reply_content" id="as_reply_content_<%=idx%>"  placeholder="내용입력"><%=as_reply_content%></textarea>
								</div>
							<%else%>
							<div class="info_box_03_sub">
								<textarea rows="10" cols="5" class="textarea_01" name="as_reply_content" id="as_reply_content_<%=idx%>"  placeholder="답변을 등록하세요"><%=as_reply_content%></textarea>
							</div>
							<%End If %> 
							<br>
							<div style="text-align:center;margin-top:20px;">
								<input type="button" name="close_btn" id="close_btn_<%=idx%>" class="info_input_02_2" value="닫기" onclick="close_div('<%=idx%>');"/>
								<input type="button" name="save_btn"  id="save_btn_<%=idx%>"  class="info_input_02_2" value="답변" onclick="reply('<%=idx%>','<%=as_reply_content%>','<%=as_reply%>');"/>
								<!-- <span name="post_btn" id="post_btn" class="info_input_02_2"><a href="tel:<%=em_hp%>"><font color="white">통화</font></a></span>   -->
							</div>
 
						</div>
					</div>
				</div> 
			<%
					Next 
				End If 
			%>
 
		
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
