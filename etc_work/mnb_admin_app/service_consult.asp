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

	'If uId = "" Then 
	'	Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_app/login.asp"
	'End If 

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8" 

  

	 If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_APP_SERVICE_CONSULT    " 
		strSql1 = strSql1 & "  where MR_MEM_ID = '"& uId &"' and AS_CNLKBN = 'N' order by AS_SEQ desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		  ' mode = "upd"
			
		   AS_SEQ			= Rs(0)
		   MR_MEM_ID		= Rs(1)
		   MR_MEM_NM		= Rs(2)
		   AS_CONTENT		= Rs(3)
		   AS_REPLY			= Rs(4)
		   AS_CNLKBN		= Rs(5)  
		   AS_REG_DT		= Rs(6)
		   AS_LEVEL			= Rs(7) 
	 
		   arr_res_List = Rs.GetRows()

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

	<form id="sc_Form" name="sc_Form" method="post" action="service_consult_sql.asp">
		<input type="hidden" name="mem_id" id="mem_id" value="<%=uId%>" />
		<input type="hidden" name="mem_nm" id="mem_nm" value="<%=uname%>" />
		<input type="hidden" name="idx" id="idx" value="<%=AS_SEQ%>" />
		<input type="hidden" name="mode" id="mode" value="<%=mode%>" />

		<div class="info_box_01_2">
			<img src="img/caution_icon.png"/><span class="info_text_02"> 상담내용을 작성해 주세요</span>

		</div>

		<div class="info_box_01_3">
			<span class="info_text_03"> 빠른 시간 내 답변드리도록하겠습니다.</span>
		</div> 

		<div class="info_box_02_1">
			<div class="info_box_03_sub">
				<textarea rows="10" cols="5" class="textarea_01" name="service_content" id="service_content" placeholder="내용입력"></textarea>
			</div>
		 
			<div class="info_box_02_sub">
				<input type="submit" name="service_con" id="service_con" class="info_input_01" value="1:1상담신청" />
			</div>
		</div> 
	</form>

			<%
				If IsArray(arr_res_List) Then 
					For num=0 To UBound(arr_res_List,2)

						AS_SEQ			= Trim(arr_res_List(0,num))
						MR_MEM_ID		= Trim(arr_res_List(1,num))
						MR_MEM_NM		= Trim(arr_res_List(2,num))
						AS_CONTENT		= Trim(arr_res_List(3,num))
						AS_REPLY		=	   arr_res_List(4,num)
						AS_CNLKBN		= Left(arr_res_List(5,num),10) 
						AS_REG_DT		= arr_res_List(6,num) 
						AS_LEVEL		= arr_res_List(7,num) 


				If AS_REG_DT <> "" Then 
					yyyy = Left(AS_REG_DT,4)
					mm	 = Mid(AS_REG_DT,6,2)
					dd	 = Mid(AS_REG_DT,9,2)
				End If

				Dim strTest, intLength, strLeft

				strTest = AS_CONTENT
				intLength = LEN (strTest)


				If  intLength >30 Then 
					strLeft = LEFT (strTest, 30) 
					AS_CONTENT = strLeft &"..."
				Else  
					AS_CONTENT = AS_CONTENT 
				End If
				
					If AS_REPLY = "N" Then 
			%>  
						<div class="sang_box_01">
							<div class="sang_box_02">
								<%=yyyy%>년 <%=mm%>월 <%=dd%>일 
							</div>
							<div class="sang_box_03">
								답변예정
							</div>
						</div>
						
						<div class="sang_box_01_sub">
							<div class="sang_box_01_sub_1">
								<a href="service_consult_ins.asp?idx=<%=AS_SEQ%>"><%=AS_CONTENT%></a> 
							</div>
						</div>

						<div class="sang_box_01_sub" id="sang_box_01_sub_rp1_<%=AS_SEQ%>">
							  <!-- <br><br><input type="button" name="reply_close" id="reply_close" class="info_input_02_1" value="닫기" onclick="close_div('<%=AS_SEQ%>');"/> -->
						</div>
			<%
						Else 
			%>
						<div class="sang_box_01_1">
							<div class="sang_box_02_1">
								<%=yyyy%>년 <%=mm%>월 <%=dd%>일 
							</div>
							<div class="sang_box_03">
								완료
							</div>
						</div>
						
						<div class="sang_box_01_sub">
							<a href="service_consult_ins.asp?idx=<%=AS_SEQ%>"><%=AS_CONTENT%></a>
						</div>

						<div class="sang_box_01_sub" id="sang_box_01_sub_rp_<%=AS_SEQ%>" style="display:none;">
							감사합니다	 <br><br><input type="button" name="reply_close1" id="reply_close1" class="info_input_02_1" value="닫기" onclick="close_div('<%=AS_SEQ%>');"/>
						</div>
						<div class="sang_box_01_sub" id="sang_box_01_sub_rp2_<%=AS_SEQ%>" >
							 <input type="button" name="reply_close2" id="reply_close2" class="info_input_02_1" value="보기" onclick="open_div('<%=AS_SEQ%>');"/>
						</div>
			<%
						End if
					
					Next 
				End If 
			%>
 
<!--
		<div class="sang_box_01">
			<div class="sang_box_02">
				2015년 10월 26일
			</div>
			<div class="sang_box_03">
				답변예정
			</div>
		</div>
		
		<div class="sang_box_01_sub">
			<div class="sang_box_01_sub_1">
				문의드립니다. 계약을 했는데 소독서비스는 연락처를 알수가 없네요.
			</div>
		</div>
	 
 <hr>
 
		<div class="sang_box_01_1">
			<div class="sang_box_02_1">
				2015년 10월 26일
			</div>
			<div class="sang_box_03">
				완료
			</div>
		</div>
		
		<div class="sang_box_01_sub">
			문의드립니다. 계약을 했는데 소독서비스는 연락처를 알수가 없네요.
		</div>
 
 <hr>
-->

  
		
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
	<script>
  		$(document).ready(function() {	

		}); 

				function close_div(idx) {
 
						$("#sang_box_01_sub_rp_"+idx).hide();
			 
						$("#sang_box_01_sub_rp2_"+idx).show();
 	  
				}
				function open_div(idx) {
 
						$("#sang_box_01_sub_rp2_"+idx).hide();
			 
					 	$("#sang_box_01_sub_rp_"+idx).show();
 	  
				}


	</script>


</html>
