<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
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
  
	If uId <> "" Then
		strSql1 = ""
		strSql1 = strSql1 & " SELECT  *  "
		strSql1 = strSql1 & " from  MO_APP_SERVICE_DATA_CHECK    " 
		strSql1 = strSql1 & " order by MS_SEQ desc "
		Set Rs = DBExec(strSql1,"main")
		If Not Rs.EOF Then 
		 '  mode = "upd"
			
		   MS_SEQ			= Rs(0)
		   MS_IDX			= Rs(1)
		   MS_MEM_ID		= Rs(2)
		   MS_MEM_NM		= Rs(3)
		   MS_CHECK_NAME	= Rs(4)
		   MS_CHECK_FLG		= Rs(5) '분만타입
		   MS_CHANGE_FLG	= Rs(6)
		   MS_CHECK_DATE	= Rs(7)
 
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
  
			function open_div (idx,check_name) {
				$("#info_box_04_sub_"+idx).show();

				$("#info_box_03_sub_"+idx).hide(); 
				
				jQuery.post("./customer_list_sql.asp",{"check":"Y","ms_seq":idx,"check_flg":check_name},function(data,testStatus){
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
<body>
<input type="hidden" name="mr_idx" id="mr_idx" value="<%=mr_idx%>">
<!-- #include virtual = "/etc_work/mnb_admin_app/nav.asp"--> 
	<div class="container">  
 
	<div style="margin-top:40px;"></div>
 

<%
	If IsArray(arr_es_List) Then 
		For num=0 To UBound(arr_es_List,2)	 

			MS_SEQ		= arr_es_List(0,num)
			idx			= arr_es_List(1,num)
			mem_id		= arr_es_List(2,num)
			mem_nm		= arr_es_List(3,num)
			check_name	= arr_es_List(4,num)
			check_flg	= arr_es_List(5,num)
			change_flg	= arr_es_List(6,num)
			check_date	= arr_es_List(7,num)
			
			check_org_name = check_name

If check_name = "birth"				Then	check_name = "생년월일"			End If 
If check_name = "hp"				Then	check_name = "휴대폰"				End If 
If check_name = "service"			Then	check_name = "서비스이용정보"		End If 
If check_name = "use_week"			Then	check_name = "이용기간"			End If 
If check_name = "use_type"			Then	check_name = "이용형태"			End If 
If check_name = "childbirth"		Then	check_name = "출산예정일"			End If 
If check_name = "serviceSdt"		Then	check_name = "서비스희망일"			End If 
If check_name = "radio3"			Then	check_name = "조리원이용정보"		End If 
If check_name = "exp_baby"			Then	check_name = "출산경험"			End If 
If check_name = "unique_1"			Then	check_name = "특이사항"			End If 
If check_name = "fam1"				Then	check_name = "가족사항"			End If 
If check_name = "contents"			Then	check_name = "상담내용"			End If 
If check_name = "class_value_1"		Then	check_name = "지점정보"			End If 
If check_name = "hospital_date"		Then	check_name = "병원입원날짜"			End If 
'If check_name = "hospital_post"		Then	check_name = "병원우편번호"		End If 
If check_name = "hospital_address1"	Then	check_name = "병원주소"			End If 
If check_name = "gender"			Then	check_name = "성별"				End If
If check_name = "post"				Then	check_name = "우편번호"				End If 
If check_name = "address1"			Then	check_name = "주소"				End If 
If check_name = "address2"			Then	check_name = "상세주소"				End If 
%>  
 

				<%If change_flg = "Y" And check_name = "생년월일" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div> 
				
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				  
				<div class="my_box_01_1" id="info_box_04_sub_<%=MS_SEQ%>" style="display:none;">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
  
<%

    If idx <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

	 	strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& idx &"' order by MS_IDX  desc " 
		strSql = ""
		strSql = strSql & "	;SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then
  
			MS_IDX = Rs(0)
			MS_MEM_ID = Rs(1)
			MS_MEM_NM = Rs(2)
			MS_BIRTH = Rs(3)
			MS_PHONE = Rs(4)
			MS_HP = Rs(5)
			MS_POST = Rs(6)
			MS_ADDR1 = Rs(7)
			MS_ADDR2 = Rs(8)
			MS_SERVICE = Rs(9)
			MS_PERIOD = Rs(10)
			MS_TYPE = Rs(11)
			MS_CHILDBIRTH = Rs(12) 
			MS_SERVICEDT = Rs(13)
			MS_CLINIC = Rs(14)
			MS_EXPER = Rs(15)
			MS_UNIQUE = Rs(16)
			MS_FAMILY = Rs(17)
			MS_CONTENT = Rs(18)
			MS_PROVISION_1 = Rs(19)
			MS_PROVISION_2 = Rs(20)
			MS_CNLKBN = Rs(21)
			MS_REG_DT = Rs(22)
			MD_LOCAL = Rs(23) 
			MS_END = Rs(24)
			MS_JUMIN1 = Rs(25)
			MS_JUMIN2 = Rs(26)
			MS_CONTENT_2 = Rs(27)     
			MD_LOCAL_DETAIL = Rs(28)  
			hospital_date		= Rs(29) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_post		= Rs(30) ' 상담자 메모 관리자만 볼수있음. -- 사용안함
			hospital_address1	= Rs(31) ' 상담자 메모 관리자만 볼수있음. -- 사용안함 
			MS_SEX = Rs(32) 
			MS_AGREE1 = Rs(33) 
			MS_AGREE2 = Rs(34) 
			MS_AGREE3 = Rs(35) 
			MS_AGREE4 = Rs(36) 
			MS_AGREE5 = Rs(37) 

			mode = "upd"
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	 
	
	If MS_SEX = "1" Then 
		MS_SEX = "남자"
	Else
		MS_SEX = "여자"
	End if
	'	등록 상품 호출
	strSql = ""
	strSql = "; select cc_kor_nm2 from [MO_COMM_CD] where cc_comm_cd = '"& MD_LOCAL &"'  "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_name = Rs(0)
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)

	End If  

	MS_UNIQUE = Replace(MS_UNIQUE,"||",",")
	MS_FAMILY = Replace(MS_FAMILY,"||",",")
%>
   
					<div class="my_box_01_sub">
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:10px;"><%=mem_nm%> 산모님의 서비스정보입니다.</span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">서비스 프로그램 : <%=MS_SERVICE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">이용기간 : <%=MS_PERIOD%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">이용형태 : <%=MS_TYPE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">
						출산예정일 : <% If MS_CHILDBIRTH <> "" Then %> <%=Left(MS_CHILDBIRTH,4)%>.<%=mid(MS_CHILDBIRTH,5,2)%>.<%=right(MS_CHILDBIRTH,2)%> <% End If %>
						</span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">
						서비스희망일 : <% If MS_SERVICEDT <> "" Then %> <%=Left(MS_SERVICEDT,4)%>.<%=mid(MS_SERVICEDT,5,2)%>.<%=right(MS_SERVICEDT,2)%> <% End If %></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">지점 : <%=local_name%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">조리원 : <%=MS_CLINIC%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">출산경험 : <%=MS_EXPER%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">특이사항 : <%=MS_UNIQUE%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">가족사항 : <%=MS_FAMILY%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">
						입원병원날짜 :  <% If hospital_date <> "" Then %> <%=Left(hospital_date,4)%>.<%=mid(hospital_date,5,2)%>.<%=right(hospital_date,2)%> <% End If %></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">입원병원주소 : <%=hospital_address1%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">상담내용 : <%=MS_CONTENT%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">
						생년월일 :  <% If MS_BIRTH <> "" Then %><%=Left(MS_BIRTH,4)%>.<%=mid(MS_BIRTH,5,2)%>.<%=right(MS_BIRTH,2)%> <% End If %></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">성별 : <%=MS_SEX%></span></div>
						<div style="width:100%;"><span class="service_text_03" style="font-weight:bold; margin-bottom:30px;padding:2px;">휴대폰 : <%=MS_HP%></span></div> 

						<input type="button" name="close_btn" id="close_btn_<%=MS_SEQ%>" class="info_input_02_22" value="닫기" onclick="close_div('<%=MS_SEQ%>');"/>
					</div>
				</div>
				<%End If %>
					 

			<%	If change_flg = "Y" And check_name = "휴대폰" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
				
				
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "서비스이용정보" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
				
				
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "이용기간" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "이용형태" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "출산예정일" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "서비스희망일" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "조리원이용정보" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "출산경험" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "특이사항" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "가족사항" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "상담내용" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "지점정보" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "병원입원날짜" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "병원주소" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And check_name = "성별" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03">
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %> 

			<%	If change_flg = "Y" And check_name = "우편번호"	Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03"> 
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And  check_name = "주소" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03"> 
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>

			<%	If change_flg = "Y" And	check_name = "상세주소" Then %>
				<div class="my_box_01_1" id="info_box_03_sub_<%=MS_SEQ%>">
					<div class="my_box_02_2">
						<% If check_flg = "Y" Then %> 확인 <% Else %> 확인전 <% End If %>
					</div>
					<div class="my_box_03"> 
						<%=check_name%>
					</div>
					<div class="my_box_01_sub" style="padding-top: 50px;"> 
						<span class="service_text_03"><%=mem_nm%> 산모님 <%=check_name%> 변경</span><input type="button" name="open_btn" id="open_btn_<%=MS_SEQ%>" class="info_input_02_12" value="보기" onclick="open_div('<%=MS_SEQ%>','<%=check_org_name%>');" /><br> 
						<span style="float:right;padding-right:10px;font-size:10pt;"><%=Left(check_date,4)%>.<%=mid(check_date,5,2)%>.<%=right(check_date,2)%></span>
					</div>
				</div>
				 <!-- #include virtual = "/etc_work/mnb_admin_app/customer_data_update_include.asp"-->
			<% End If %>
  
<%
		Next 
	Else
%>
		<div class="my_box_01" style="margin-top: 70px;">
			<span class="service_text_03">변경된 정보가 없습니다.</span>
		</div>
<%
	End If
%>
 
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->

	  



    </div><!-- /.container -->

  </body>

    <script src="js/leftmenu.js"></script>
 
</html>
