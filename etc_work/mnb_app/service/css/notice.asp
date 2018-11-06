<%@Language="VBScript" CODEPAGE="65001" %>
 
<!--#include virtual="/common/asp/RSexec.asp"-->
<!--#include virtual="/common/asp/VarDef.asp"-->
<!--#include virtual="/common/asp/FunDef.asp"-->

 

<%
	Dim page_size : page_size = 10

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
	brd_id = "NOTICE"

	page = fncRequest("page")
	If page = "" Then page = 1
	
	startNum = (page-1) * page_size
	endNum = startNum + page_size

'--------------------------------------------------------------------------
'	공지사항 리스트 호출
	strSql = "SELECT COUNT(BA_IDX) "
	strSql = strSql & "FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "WHERE BA_CNLKBN='N' AND BA_DPH='1' "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		intTotalCnt = Rs(0)
	End If 
	Call RSClose(Rs)

	strSql = " SELECT *	"
	strSql = strSql & " FROM		"
	strSql = strSql & " (	 "
	strSql = strSql & "		SELECT "
	strSql = strSql & "			BA_IDX "
	strSql = strSql & "			,BA_TYPE "
	strSql = strSql & "			,BA_MEM_NM  "
	strSql = strSql & "			,BA_TITLE   "
	strSql = strSql & "			,BA_SEC_FLG "
	strSql = strSql & "			,BA_REG_DT	"
	strSql = strSql & "			,BA_CONTENT   "
	strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
	strSql = strSql & "		FROM MO_BRD_NOTICE WITH(NOLOCK) "
	strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_DPH='1' and BA_NOTICE_FLG='M' "
	strSql = strSql & "  ) T1 "
	strSql = strSql & " WHERE  "
	strSql = strSql & " 	ROWNUM>"& startNum &" AND ROWNUM<="& endNum
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		content		= Re_sqlFilter(Rs("BA_CONTENT"))
		arrNoticList = Rs.getRows()
	End If 
	Call RSClose(Rs)
'--------------------------------------------------------------------------
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

 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->




    <div class="container">

		<div class="info_box_01_2">
			<img src="img/notice_icon.png"/><span class="info_text_02"> 공지사항</span> 
		</div>
 
 <!--
		<div class="info_box_02">
			<div class="info_box_03_sub">
				<span class="info_text_03_1">2015년 10월 30일</span> <input type="button" name="open_btn" id="open_btn" class="info_input_02_1" value="열기" />
				<div class="info_box_03_sub_1">
					<div class="info_text_03_2">마더앤베이비 쇼핑몰 오픈안내</div>  
				</div>
			</div>
			<div class="info_box_04_sub">
				<textarea rows="10" cols="5" class="textarea_02" placeholder="내용입력"></textarea>
			</div>
		</div>
 -->
			<%
				If IsArray(arrNoticList) Then 
					For num=0 To UBound(arrNoticList,2)
						intNum		= intTotalCnt - (page-1) * page_size - num
						idx			= Trim(arrNoticList(0,num))
						ba_type		= Trim(arrNoticList(1,num))
						mem_nm		= Trim(arrNoticList(2,num))
						title		= Trim(arrNoticList(3,num))
						sec_flg		= arrNoticList(4,num)
						reg_dt		= Left(arrNoticList(5,num),10) 
						contents    = Re_sqlFilter(arrNoticList(6,num))

				Dim strTest, intLength, strLeft

				strTest = title
				intLength = LEN (strTest)


				If  intLength >18 Then
				
				strLeft = LEFT (strTest, 18)

				title = strLeft
				
				Else 

				title = title
				  
				End if

			%>  
				<div class="info_box_02" id="info_box_03_sub_<%=idx%>">
					<div class="info_box_03_sub"> 
						<span class="info_text_03_1"><%=reg_dt%></span><input type="button" name="open_btn" id="open_btn_<%=idx%>" class="info_input_02_1" value="열기" onclick="open_div('<%=idx%>');" />
						<div class="info_box_03_sub_1">

							<div class="info_text_03_2"><%=title%></div>  

						</div>
					</div>
				</div>

				<div class="info_box_02" id="info_box_04_sub_<%=idx%>" style="display:none;">
					<div class="info_box_04_sub">
						<span class="info_text_03_1"><%=reg_dt%></span> <input type="button" name="close_btn" id="close_btn_<%=idx%>" class="info_input_02_2" value="닫기" onclick="close_div('<%=idx%>');"/>
						<div class="info_box_03_sub_1">
							<div class="info_text_03_2" style="font-weight:bold; margin-bottom:30px;"><%=title%></div>
							<div class="info_text_03_3"><%=contents%></div>
						</div>
					</div>
				</div> 
			<%
					Next 
				End If 
			%>

<!--
		<div class="info_box_02">
			<div class="info_box_03_sub">
				<span class="info_text_03_1">2015년 10월 30일</span> <input type="button" name="open_btn" id="open_btn" class="info_input_02_1" value="열기" />
				<div class="info_box_03_sub_1">
					<div class="info_text_03_2">마더앤베이비 쇼핑몰 오픈안내</div>  
				</div>
			</div>
			<div class="info_box_03_sub_close">
				<span class="info_text_03_1">2015년 10월 30일</span> <input type="button" name="open_btn" id="open_btn" class="info_input_02_2" value="닫기" />
				<div class="info_box_03_sub_1">
					<div class="info_text_03_2">마더앤베이비 쇼핑몰 오픈안내</div>  
				</div>
			</div>
			<div class="info_box_04_sub_1">
				<textarea rows="10" cols="5" class="textarea_02" placeholder="내용입력"></textarea>
			</div>
		</div>

		<div class="info_box_02">
			<div class="info_box_03_sub">
				<span class="info_text_03_1">2015년 10월 30일</span> <input type="button" name="open_btn" id="open_btn" class="info_input_02_1" value="열기" />
				<div class="info_box_03_sub_1">
					<div class="info_text_03_2">마더앤베이비 쇼핑몰 오픈안내</div>  
				</div>
			</div>
			<div class="info_box_04_sub">
				<textarea rows="10" cols="5" class="textarea_02" placeholder="내용입력"></textarea>
			</div>
		</div>
-->
  
		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
 
    </div><!-- /.container -->

  </body>
  
  <script src="js/leftmenu.js"></script>
  <script>  
	$(document).ready(function() {	 
 

/*
		$("#open_btn_<%=idx%>").click(function() {
			$("#info_box_04_sub_<%=idx%>").show();

			$("#info_box_03_sub_<%=idx%>").hide();
		});
 
		$("#close_btn_<%=idx%>").click(function() {
			$("#info_box_04_sub_<%=idx%>").hide();
 
			$("#info_box_03_sub_<%=idx%>").show();
		});

*/
 
	});

		function open_div (idx) {
				$("#info_box_04_sub_"+idx).show();

				$("#info_box_03_sub_"+idx).hide();
 
		}

		function close_div (idx) {
	//		$("#close_btn_"+idx).click(function() {
				$("#info_box_04_sub_"+idx).hide();
	 
				$("#info_box_03_sub_"+idx).show();
	//		}); 
		}

 
	</script>

</html>
