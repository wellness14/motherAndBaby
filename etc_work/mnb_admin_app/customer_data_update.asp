<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/etc_work/mnb_admin_app/checkUser.asp"-->
 
<%
	Dim mode : mode = "ins"

	uId			= Trim(fncRequestCookie("uid"))				'회원	아이디

	If uId = "" Then
		Response.Redirect "http://www.mothernbaby.co.kr/etc_work/mnb_admin_app/login.asp"
	End If

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"
    
 	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strTable = " FROM MO_APP_MY_DATA_HISTORY A WITH(NOLOCK) "
	strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MH_ID = MD_MEM_ID "
	strTable = strTable & " INNER JOIN MO_MEM_MAS WITH(NOLOCK) ON MH_ID = MM_MEM_ID "
	strWhere = " where MH_ID is not null "

	'	strSql = strSql & strTable
	'	strSql = strSql & strWhere 

	If sword <> "" Then 
		Select Case smode
			Case "1" : strWhere = strWhere & "  AND MH_ID like '%"& sword &"%' order by MH_ID asc"
			Case "2" : strWhere = strWhere & "  AND MM_MEM_NM like '%"& sword &"%' order by MM_MEM_NM asc"
			Case "3" : strWhere = strWhere & "  AND MH_ID like '%"& sword &"%' or MM_MEM_NM like '%"& sword &"%' or MD_HP like '%"& sword &"%' order by MM_MEM_NM asc"
			Case "4" : strWhere = strWhere & "  AND MD_HP like '%"& sword &"%' order by MD_HP asc"
		End Select 
	End If 

	If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "

	If sword <> "" Then  
		
		strSql1 = strSql1 & strTable
		strSql1 = strSql1 & strWhere

	else
	
		strSql1 = strSql1 & " from  MO_APP_MY_DATA_HISTORY    " 
		strSql1 = strSql1 & " order by MH_REGDATE desc "

	End If
	
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		 '  mode = "upd"
			
			MH_SEQ			= Rs(0)
			MR_IDX			= Rs(1)
			MH_NAME			= Rs(2) '컬럼네임
			MH_OLD_CONTENT	= Rs(3) 
			MH_NEW_CONTENT	= Rs(4) '바뀐정보
			MH_ID			= Rs(5) '아이디
			MH_REGDATE		= Rs(6) '등록일
			MH_CHECK		= Rs(7) '등록일
 
		   arr_es_List = Rs.GetRows()

		End If    
		Call RSClose(Rs)
	End If 

	NowDate = Date()    '2011-07-08

	Now_arr=split(NowDate,"-") 
		Now_y = Now_arr(0)
		Now_m = Now_arr(1)
		Now_d = Now_arr(2)
	Now_ymd = Now_y & Now_m & Now_d

	If helper_visit_time <> "" then
		class_value = helper_visit_time
		dim myarray                          
		myarray=split(class_value,":")
		visit_time	=	myarray(0)      
		visit_minute=	myarray(1)
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
	 <script src="js/jquery.raty.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
	<script type="text/javascript">  
  
			function open_div (seq,C_NAME) {
				$("#info_box_04_sub_"+seq).show();

				$("#info_box_03_sub_"+seq).hide(); 
				
				jQuery.post("./customer_list_sql.asp",{"check":"Y","SEQ":seq,"check_flg":C_NAME},function(data,testStatus){
					if (data == 1) {
					//	alert("11111.");
					} else {
					//	alert("22222.");
					//	location.reload();
					}
				});   
			}

			function close_div (idx) { 
				$("#info_box_04_sub_"+idx).hide();
	 
				$("#info_box_03_sub_"+idx).show(); 
			}
 
</script> 
</head> 
<body style="background-color:#dfdfdf;">
<input type="hidden" name="mr_idx" id="mr_idx" value="<%=MR_IDX%>">
<!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 
	<div class="container">  
 
 

			<form id="sFrm" name="sFrm" method="get" action="#">
				<div class="selection" style="margin-top:70px;">
					<select name="smode" class="box" style="background:#fff;height:35px; border:1px solid #455364;">
						<option value="3"<%=fncSetSelectBox(smode,"3")%>>전체검색</option>
						<option value="1" <%=fncSetSelectBox(smode,"1")%>>회원ID</option>
						<option value="2" <%=fncSetSelectBox(smode,"2")%>>회원명</option>
						<option value="4" <%=fncSetSelectBox(smode,"4")%>>휴대폰</option>
					</select>
					<input type="text" name="sword" size="10" maxlength="10" value="<%=sword%>" style="height:35px;border:1px solid #455364;"/>

					<a onClick="jQuery('#sFrm').submit();" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:50px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">검색</a>
					<% If smode <> "" And sword <> "" Then %>
						<a onClick="location.href='./customer_data_update.asp';" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:80px;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">전체리스트</a>
					<% End If %>
				</div>
			</form> 
 
<!--   
1		mr_clinic_date = Rs("MR_CLINIC_DATE")'			(조리원입실일) N
1		mr_clinic_period = Rs("MR_CLINIC_PERIOD")'		(조리원이용기간) N
1		mr_unique = Rs("MR_UNIQUE")'					(쌍둥이)
1		mr_childbirth = Rs("MR_CHILDBIRTH")'			(출산예정일)
1		mr_childbirth_form = Rs("MR_CHILDBIRTH_FORM")'	(분만형태) N
1		mr_breast_feeding = Rs("MR_BREAST_FEEDING")'	(수유형태) N
1		mr_exper = Rs("MR_EXPER")'						(출산경험)
1		mr_care_place_post = Rs("MR_CARE_PLACE_POST")'	(산후조리장소 우편번호) N
1		mr_care_place_addr1 = Rs("MR_CARE_PLACE_ADDR1")'(산후조리장소 주소) N
1		mr_care_place_addr2 = Rs("MR_CARE_PLACE_ADDR2")'(산후조리장소 상세주소) N
1		mr_care_place = Rs("MR_CARE_PLACE")'			(산후조리장소) N

 -->
 
	<table class="table" style="margin-top:10px; background:#ffffff;">
		<colgroup>
			<col width="22%" />
			<col width="25%" />
			<col width="25%" />
			<col width="25%" />
			<col width="3%" />
		</colgroup>
		<tbody>
			<tr style="height:40px;">
				<th style="text-align:center;">상태</th>
				<th style="text-align:center;">이름</th>
				<th style="text-align:center;">변경내용</th>
				<th style="text-align:center;">변경일</th>
				<th style="text-align:center;"></th>
			</tr>
		</tbody>
<%
	If IsArray(arr_es_List) Then 
		For num=0 To UBound(arr_es_List,2)	 

			SEQ			= arr_es_List(0,num)
			IDX			= arr_es_List(1,num)
			C_NAME		= arr_es_List(2,num) '컬럼네임
			OLD_CONTENT	= arr_es_List(3,num) 
			NEW_CONTENT	= arr_es_List(4,num) '바뀐정보
			ID			= arr_es_List(5,num) '아이디
			REGDATE		= arr_es_List(6,num) '등록일
			check_flg	= arr_es_List(7,num) '확인여부 
  
			check_org_name = C_NAME

		If C_NAME = "MR_CLINIC"						Then	C_NAME = "조리원이용"			End If
		If C_NAME = "MR_FAMILY"						Then	C_NAME = "가족사항"			End If
		If C_NAME = "MR_CLINIC_DATE"				Then	C_NAME = "조리원입실일"			End If 
		If C_NAME = "MR_CLINIC_PERIOD"				Then	C_NAME = "조리원이용기간"		End If 
		If C_NAME = "MR_UNIQUE"						Then	C_NAME = "쌍둥이"				End If 
		If C_NAME = "MR_CHILDBIRTH"					Then	C_NAME = "출산예정일"			End If 
		If C_NAME = "MR_CHILDBIRTH_FORM"			Then	C_NAME = "분만형태"			End If 
		If C_NAME = "MR_BREAST_FEEDING"				Then	C_NAME = "수유형태"			End If 
		If C_NAME = "MR_EXPER"						Then	C_NAME = "출산경험"			End If 
		If C_NAME = "MR_CARE_PLACE_POST"			Then	C_NAME = "산후조리장소 우편번호"	End If 
		If C_NAME = "MR_CARE_PLACE_ADDR1"			Then	C_NAME = "산후조리장소 주소"		End If 
		If C_NAME = "MR_CARE_PLACE_ADDR2"			Then	C_NAME = "산후조리장소 상세주소"	End If 
		If C_NAME = "MR_CARE_PLACE"					Then	C_NAME = "산후조리장소"			End If  

		If ID <> "" Then
			strTable = " FROM MO_RESERVATION WITH(NOLOCK) "

			strWhere = " WHERE MR_CNLKBN='N' AND MR_MEM_ID = '"& ID &"' order by mr_idx desc " 
			strSql = ""
			strSql = strSql & "	;SELECT * "
			strSql = strSql & strTable
			strSql = strSql & strWhere
			Set Rs = DBExec(strSql,"main")	
			If Not Rs.EOF Then
	 
				cus_name = Rs("MR_MEM_NM")
				mr_idx = Rs("MR_IDX")
				service_name = Rs("MR_SERVICE")
				mr_hp = Rs("MR_HP")
				service_period = Rs("MR_PERIOD")
				service_type = Rs("MR_TYPE")
				servicesdt = Rs("MR_SERVICESDT")
				serviceedt = Rs("MR_SERVICEEDT")
				mr_family = Rs("MR_FAMILY")
				mr_clinic = Rs("MR_CLINIC")
				mr_clinic_date = Rs("MR_CLINIC_DATE")'(조리원입실일) N
				mr_clinic_period = Rs("MR_CLINIC_PERIOD")'(조리원이용기간) N
				mr_unique = Rs("MR_UNIQUE")'(쌍둥이)
				mr_childbirth = Rs("MR_CHILDBIRTH")'(출산예정일)
				mr_childbirth_form = Rs("MR_CHILDBIRTH_FORM")'(분만형태) N
				mr_breast_feeding = Rs("MR_BREAST_FEEDING")'(수유형태) N
				mr_exper = Rs("MR_EXPER")'(출산경험)
				mr_care_place_post = Rs("MR_CARE_PLACE_POST")'(산후조리장소 우편번호) N
				mr_care_place_addr1 = Rs("MR_CARE_PLACE_ADDR1")'(산후조리장소 주소) N
				mr_care_place_addr2 = Rs("MR_CARE_PLACE_ADDR2")'(산후조리장소 상세주소) N
				mr_care_place = Rs("MR_CARE_PLACE")'(산후조리장소) N

				mode = "upd"
				arrList = Rs.getRows()
			End If 
			Call RSClose(Rs)
	  
		End If  

		mr_unique = Replace(mr_unique,"||",",")
		service_name = Replace(service_name,"||",",")
		mr_family = Replace(mr_family,"||",",")
%>
	
	<tr class="change-list" style="height:40px;" seq="<%=SEQ%>">
		<td style="text-align:center; font-weight:bold;"><% If check_flg = "Y" Then %>확인<% Else %>확인전<% End If %></td>
		<td style="text-align:center;"><%=cus_name%></td>
		<td style="text-align:center;"><%=C_NAME%></td>
		<td style="text-align:center;"><%=Left(REGDATE,4)%>년  <%=mid(REGDATE,6,2)%>월 <%=mid(REGDATE,9,2)%>일</td>
		<td style="text-align:center; font-size:15pt;">▼</td>
	</tr>
	<tr class="change-view-<%=SEQ%>" style="display:none;">
		<td colspan="5">
			<table class="table">
				<colgroup>
					<col width="50%" />
					<col width="50%" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align:center;">구분</th>
						<th style="text-align:center;">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">휴대폰</span></th>
						<td style="padding-left:20px;"><a href="tel:<%=mr_hp%>"><span style="color: #2185c5;"><%=mr_hp%></span></a> </td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">서비스프로그램</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=service_name%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">이용기간</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=service_period%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">이용형태</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=service_type%></span></td>
					</tr>

					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">서비스시작일</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><% If servicesdt <> "" Then %><span style="color: #2185c5;"><%=Left(servicesdt,4)%>.<%=mid(servicesdt,5,2)%>.<%=right(servicesdt,2)%></span><% End If %> </td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;">서비스종료일</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><% If serviceedt <> "" Then %><span style="color:#2185c5;"><%=Left(serviceedt,4)%>.<%=mid(serviceedt,5,2)%>.<%=right(serviceedt,2)%> <% End If %> </td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CLINIC" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">조리원이용</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_clinic%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CLINIC_DATE" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">조리원입실일</span></th>
						<td style="padding-left:20px;"><% If mr_clinic_date <> "" Then %><span style="color: #2185c5;"><%=Left(mr_clinic_date,4)%>.<%=mid(mr_clinic_date,5,2)%>.<%=right(mr_clinic_date,2)%></span><% End If %> </td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CLINIC_PERIOD" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">조리원이용기간</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_clinic_period%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_UNIQUE" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">특이사항</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_unique%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_FAMILY" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">가족사항</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_family%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CHILDBIRTH" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">출산예정일</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><% If mr_childbirth <> "" Then %><%=Left(mr_childbirth,4)%>.<%=mid(mr_childbirth,5,2)%>.<%=right(mr_childbirth,2)%><% End If %> </td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CHILDBIRTH_FORM" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">분만형태</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_childbirth_form%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_BREAST_FEEDING" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">수유형태</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_breast_feeding%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_EXPER" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">출산경험</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_exp%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CARE_PLACE_POST" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">산후조리장소<br> 우편번호</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_care_place_post%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CARE_PLACE_ADDR1" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">산후조리장소<br> 주소</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_care_place_addr1%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CARE_PLACE_ADDR2" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">산후조리장소<br> 상세주소</span> </th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_care_place_addr2%></span></td>
					</tr>
					<tr>
						<th style="padding-left:20px;"><span style="color:#717171;<% If check_org_name = "MR_CARE_PLACE" Then  %>color:#ff9900;text-decoration:underline;<%End if%>">산후조리장소</span></th>
						<td style="padding-left:20px;"><span style="color: #2185c5;"><%=mr_care_place%></span></td>
					</tr>

					<% If IsNull(check_flg) Or check_flg = "N" Then %>
					<tr>
						<td colspan="2">
							<div class="info_text_03_2" style="margin-bottom:10px;">
								<a onClick="confirmUpdate('<%=SEQ%>');" style="border-radius: 5px;border:1px solid #455364; line-height:35px; height:35px;width:90%;display:inline-block; text-align:center; background:#ffffff;font-weight:bold;" class="button">확인</a>
							</div>
						</td>
					</tr>
					<% End If %>

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
			<td style="text-align:center;" colspan="5">변경된 정보가 없습니다.</td>
		</tr>
<%
	End If
%>
	</table>


    </div><!-- /.container -->
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->

	  
  </body>

    <script src="js/leftmenu.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
	<script> 
		$(document).ready(function() {	   
			$(".change-list").each(function() {
				$(this).click(function() {
					var seq = $(this).attr("seq");

					var changeView = $(".change-view-" + seq).css("display");

					if (changeView == "none") {
						$(this).css("background", "#c8c8c8");
						$(this).find("td:eq(4)").text("▲");
						$(".change-view-" + seq).show();
					} else {
						$(this).css("background", "#ffffff");
						$(this).find("td:eq(4)").text("▼");
						$(".change-view-" + seq).hide();
					}
				});
			});
		}); 

		function confirmUpdate(idx) {
			jQuery.post("./customer_change_sql.asp",{"idx":idx,"flg":"Y"},function(data,testStatus){
					if (data == 2) {
						alert("정보변경이 확인 되었습니다.");
						location.reload();
					} else {
						alert("오류가 발생하였습니다. 관리자에게 문의하세요");
						location.reload();
					}
			});
		}
	</script>
 
</html>
