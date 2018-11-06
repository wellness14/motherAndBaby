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
		strSql1 = strSql1 & " from  MO_BRD_NOTICE    " 
		strSql1 = strSql1 & " where  BA_CNLKBN = 'N' AND BA_NOTICE_FLG='M' order by BA_IDX desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		'   mode = "upd"
	
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
		<form name="notice" id="notice" method="post" action="notice_sql.asp">
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
		</div>
  
			<%
				If IsArray(arr_notice_List) Then 
					For num=0 To UBound(arr_notice_List,2)
  
						idx					= Trim(arr_notice_List(0,num))
						b_seq				= Trim(arr_notice_List(1,num))
						b_dph				= Trim(arr_notice_List(2,num))
						b_pidx				= Trim(arr_notice_List(3,num))
						b_type				= arr_notice_List(4,num) 
						b_mem_id			= arr_notice_List(5,num) 
						b_mem_nm			= arr_notice_List(6,num) 
						b_title				= arr_notice_List(7,num) 
						b_content			= arr_notice_List(8,num) 
						b_sec_flg			= arr_notice_List(9,num) 
						b_sec_num			= arr_notice_List(10,num) 
						b_cnlkbn			= arr_notice_List(11,num) 
						b_reg_dt			= arr_notice_List(12,num) 
						b_upd_dt			= arr_notice_List(13,num) 
						b_ip				= arr_notice_List(14,num) 
						b_email				= arr_notice_List(15,num) 
						b_cnt				= arr_notice_List(16,num) 
						b_uni_nm			= arr_notice_List(17,num) 
						b_file_nm			= arr_notice_List(18,num) 
						b_file_path			= arr_notice_List(19,num) 
						b_notice_flg		= arr_notice_List(20,num) 
 
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
				<div class="info_box_02" id="info_box_03_sub_<%=idx%>">
					<div class="info_box_03_sub"> 
						<div style="width:100%;"><span class="info_text_03_1" style="font-weight:bold; margin-bottom:30px;"></span></div>
						 
						<input type="button" name="open_btn" id="open_btn_<%=idx%>" class="info_input_02_1" value="열기" onclick="open_div('<%=idx%>');" />
   
						<div class="info_box_03_sub_1"> 
							<div class="info_text_03_2"><%=b_title%></div>   
						</div>
						<br>
						<div class="info_box_03_sub_1"> 
							<div class="info_text_03_2"><%=Left(b_reg_dt,4)%>년  <%=mid(b_reg_dt,6,2)%>월 <%=mid(b_reg_dt,9,2)%>일</div>   
						</div>
					</div>
				</div>

				<div class="info_box_02" id="info_box_04_sub_<%=idx%>" style="display:none;">
					<div class="info_box_03_sub">
						<div style="width:100%;"><span class="info_text_03_1" style="font-weight:bold; margin-bottom:30px;"></span></div>
						<div class="info_box_03_sub_1">
 
							<%If b_title <> "" Then %>
								<div class="info_box_03_sub">
									<input type="text" style="width:80%;" name="ba_title" id="ba_title"  placeholder="제목입력" readonly value="<%=b_title%>"/>
								</div>
								<div class="info_box_03_sub" style="text-align:center;">
									<textarea rows="10" cols="5" class="textarea_01" name="notice_content1" id="notice_content1"  placeholder="공지사항을 등록하세요" readonly><%=b_content%></textarea>
								</div>
							<%End If %> 
							<br>

							<div style="text-align:center;margin-top:20px;">
								<input type="button" name="close_btn" id="close_btn_<%=idx%>" class="info_input_02_2" value="닫기" onclick="close_div('<%=idx%>');"/>
								
								<input type="button" name="del_btn"  id="del_btn_<%=idx%>"  class="info_input_02_2" value="삭제" onclick="del('<%=idx%>');"/>
								<input type="button" name="update_btn"  id="update_btn_<%=idx%>" class="info_input_02_2" value="수정" onclick="update('<%=idx%>');"/> 
							</div>
 
						</div>
					</div>
				</div> 
			<%
					Next 
				End If 
			%>
 
		
 
 
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
		  }); 

		jQuery("#emergency_btn").click(function() {
			if ($.trim(jQuery(".textarea_01").val()) == "") {
					alert("내용을 입력하세요");
					$('.textarea_01').focus();
					return false; 
			} 
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
			
			function update (idx) {
				location.href="./notice_update.asp?idx="+idx; 
			}
			function del (idx) {
				location.href="./notice_sql.asp?idx="+idx+"&mode=del"; 
			}

 
	</script>
	<!-- 달력추가 끝-->
</html>
