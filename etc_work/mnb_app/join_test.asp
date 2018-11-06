<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
 
<%
	Dim mode : mode = "ins"
 
	' 11월 6일 지점부분 부터 작업해야함

	Response.CharSet="utf-8"
	Session.codepage="65001"
	Response.codepage="65001"
	Response.ContentType="text/html;charset=utf-8"  

	'	등록 상품 호출
	strSql = "  select * from  MO_SERVICE_CODE where depth=1 and  codename not in ('추가비용')  order by SERVICE_SEQ  asc "
 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrProdt_name = Rs("codename")
		arrProdt = Rs.getRows()
	End If 
	Call RSClose(Rs)


 '------달력추가로 수정----------------------------------------------------------------------------------
	'1 생년월일
	If birth <> "" Then 
		birth_m = Mid(birth,5,2)
		birth_d = Right(birth,2)
		birth_ymd = Left(birth,4) & "-" & birth_m & "-" & birth_d

		If birth_ymd = "--" Then
			birth_ymd = ""
		End If
	End if
	
	'2 출산예정일
	If childbirth <> "" Then 
		childbirth_m = Mid(childbirth,5,2)
		childbirth_d = Right(childbirth,2)
		childbirth_ymd = Left(childbirth,4) & "-" & childbirth_m & "-" & childbirth_d

		If childbirth_ymd = "--" Then
			childbirth_ymd = ""
		End If
	End If
'---------------------------------------------------------------------------------------------------
'---------------------------------------------------------------------------------------------------
'	지점 정보 호출
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		arrLocal = Rs.getRows()
	End If 
	Call RSClose(Rs)
'----------------------------------------------------------------------------------------------------
 

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
	<!-- 달력 추가 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
	<!-- -->
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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  </head>

  <body> 

 <!-- #include virtual = "/etc_work/mnb_app/nav.asp"-->
 
    <div class="container">
 
				<div class="join_box_01_2">
					 <span class="join_text_02"> 필수 입력항목</span> 
				</div>
			<form name="join_fm" id="join_fm" method="post" target="ifrm" action="join_sql.asp">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" id="mode" name="mode" value="<%=mode%>">
				<div class="input">
					<input type="text" name="user_id" id="user_id" class="input_01" maxlength="10" placeholder="아이디" />
					<input type="button" value="중복확인" id="over_chk_btn" class="join_id_btn" style="font-size:9pt;vertical-align: bottom;-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" onclick="check_id()">
				</div>

				<div class="input_txt" style="display:none;" id="id_ment">
					중복확인이 필요합니다.
				</div>

				<div class="input">
					<input type="password" name="user_pwd" id="user_pwd" class="input_02" placeholder="비밀번호" />
				</div>

				<div class="input pt_5">
					<input type="password" name="user_pwd_re" id="user_pwd_re" class="input_02" placeholder="비밀번호 확인" />
				</div> 

				<div class="input_txt">
					6~15자 이상의 비밀번호를 입력하세요.<br>4개 이상의 연속된 숫자, 문자는 제한합니다.
				</div>

				<div class="input pt_5">
					<input type="text" name="user_name" id="user_name" class="input_02" placeholder="이름(실명)" />
				</div>

				<div class="input pt_5">
 					<select class="select4" name="hp1" id="hp1" style="background:#fff;height:30px;width:53px;color:#C8C8C8;">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<input type="text" name="hp2" id="hp2" value="" maxlength="4" class="input_03" />
					<input type="text" name="hp3" id="hp3" value="" maxlength="4" class="input_03" />
					<input type="button" value="인증번호요청" id="btnSms" class="join_id_btn" style="width:80px;font-size:9pt;vertical-align: bottom;-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" onclick=""><br>
		
					
				</div>

				<div class="input pt_5">
					<input type="text" name="hp_cert" id="cert_num" value="" class="" style="padding-left:15px;height:30px;width:116px;border:1px solid #C8C8C8;color:#C8C8C8;" placeholder="인증번호입력" />
					<input type="button" value="인증번호확인" id="btnSmsCheck" class="join_id_btn" style="width:80px;font-size:9pt;vertical-align: bottom;-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" onclick="">
					<input type="checkbox" name="sms_check" value="Y" checked />SMS 수신동의		
				</div>

				<div class="input pt_5">
					<input type="text" name="email" id="email" class="input_02" placeholder="이메일주소" />
					
					<input type="checkbox" name="email_check" value="Y" checked />이메일 수신동의		
				</div>

				<div class="input">
						<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:30px;width:110px;background:#ffffff;color:#C8C8C8;padding-left:15px;">
							<option value="">지점선택</option>
						<%	 
							If IsArray(arrLocal) Then	
								For num = 0 To UBound(arrLocal,2)	
						%>	
							<option value="<%=arrLocal(0,num)%>" <% If local_nm = arrLocal(0,num) Then %>selected<%  End If %>><%=arrLocal(0,num)%></option>	
						<%	
								Next	
							End If	
						%>	
						</select>	
					<select id="part" name="part"  onChange="fncSetImg(this.value);" class="textarea" style="height:30px;width:87px;background:#ffffff;color:#C8C8C8;">
						<option value="">지점</option> 
					</select> 
				</div> 

				<div class="input pt_5">
					<input type="text" name="post" id="post" class="setting_in_text_011" value="" readonly style="background:#fff;border:1px solid #C8C8C8;color:#C8C8C8; font-weight:350;" placeholder="우편번호"/> <input type="button" name="post_btn" id="post_btn" class="setting_btn" value="주소찾기" style="vertical-align: bottom;font-size:9pt;-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" />
				</div> 
				<div class="input pt_5">
					<input type="text" name="address1" id="address1" class="setting_in_text_22" value="" readonly style="background:#fff;border:1px solid #C8C8C8;color:#C8C8C8; font-weight:350;" placeholder="주소"/> 
				</div>
				<div class="input pt_5">
					<input type="text" name="address2" id="address2" class="setting_in_text_22" value="" style="background:#fff;border:1px solid #C8C8C8;color:#C8C8C8; font-weight:350;" placeholder="상세주소"/> 
				</div>


				<br>
				<!-- <div class="chk_txt">
					<span class="input_txt">선택동의 </span><span class="input_txt"> · 휴대폰 마케팅 수신동의</span>
					<span  class="input_txt"><input type="radio" name="agree_hp" id="agree_hp" value="Y"/> 동의 <input type="radio" name="agree_hp" id="agree_hp" value="N"/> 미동의</span>
				</div> -->

				<div class="chk_txt">
					<br><span class="chk_area"><input type="checkbox" name="over14_agree1" id="over14_agree1" value="Y"/> 만 14세 이상입니다. <span class="req">(필수)</span></span>
				</div>

				<div class="chk_txt">
					<span class="chk_area"><input type="checkbox" name="agree2" id="agree2" value="Y"/> 이용약관 동의 <span class="req">(필수)</span></span> <span style="margin-left:101px;"><a href="#" data-toggle="modal" data-target="#myModal1">내용보기</a></span>
				</div>

				<div class="chk_txt">
					<span class="chk_area"><input type="checkbox" name="person_data_agree3" id="person_data_agree3" value="Y"/> 개인정보 수집 및 이용동의 <span class="req">(필수)</span></span> <span style="margin-left:30px;"><a href="#" data-toggle="modal" data-target="#myModal2">내용보기</a></span>
				</div>

				<table class="table table-bordered tb">
					<tbody>
						<tr>
							<td class="td1">구분</td>
							<td class="td2">필수</td>
						</tr>
						<tr>
							<td class="td1">목적</td>
							<td class="td2">이용자 식별, 서비스 이행을 위한 연락</td>
						</tr>
						<tr>
							<td class="td1">항목</td>
							<td class="td2">이름, 이메일, 비밀번호, 휴대폰번호</td>
						</tr>
						<tr>
							<td class="td1">보유기간</td>
							<td class="td2">회원탈퇴 후 5일까지</td>
						</tr>
					</tbody>
				</table>

				<!-- <div class="title">
					 서비스를 위한 선택 입력항목 
				</div>

				<div style="padding:20px;width:100%; border:1px solid #ef4e6f;-webkit-border-radius: 10px 10px 10px 10px; border-radius: 10px 10px 10px 10px;">

					<div class="input">
						<input type="text" name="customer_nm" id="customer_nm" class="input_01" placeholder="산모이름" /> 
					</div>
					<div class="input">
						<span class="chk_area"><input type="checkbox" name="sanmo_name" id="sanmo_name" value="Y"/> 가입자와 동일합니다. </span>
					</div>
					<div class="join_box_01_sub">
						<input type="text" name="post" id="post" class="setting_in_text_01" value="12345" /> <input type="button" name="post_btn" id="post_btn" class="setting_btn" value="주소찾기" />
					</div> 
					<div class="join_box_02_sub">
						<input type="text" name="address1" id="address1" class="setting_in_text_2" value="12345" /> 
					</div>
					<div class="join_box_02_sub_1">
						<input type="text" name="address2" id="address2" class="setting_in_text_3" value="12345" /> 
					</div>
 					<div class="input">
						<span class="input2_title">서비스선택</span>
						<select name="service_nm"   class="textarea" style="height:35px;">
						<option value=""selected>선택</option>
							<%
								vCnt = UBOUND(arrProdt,2)
									For num = 0 To vCnt
							%>
								<option value="<%=arrProdt(4,num)%>"><%=arrProdt(4,num)%></option>
							<%
								 Next
							%>
						 </select>&nbsp;&nbsp;
					</div>
 					<div class="input">
					<span class="input2_title">이용기간</span>
						<select class="select2"  name="use_week" id="use_week" class="info_hp1">
							<option value="">이용기간</option>
							<option value="1주">1주</option>
							<option value="2주">2주</option>
							<option value="3주">3주</option>
							<option value="4주">4주</option>
							<option value="6주">6주</option>
							<option value="8주">8주</option>
						</select> 
					</div>
 					<div class="input">
					<span class="input2_title">이용형태</span>
						<select class="select2"  name="use_type" id="use_type" class="info_hp1">
							<option value="">이용형태</option>
							<option value="입주 + 5일">입주+5일</option>
							<option value="입주 + 6일">입주+6일</option>
							<option value="출퇴근 + 5일">출퇴근+5일</option>
							<option value="출퇴근 + 6일">출퇴근+6일</option>
							<option value="출퇴근 + 입주 + 5일">출퇴근+입주+5일</option>
							<option value="출퇴근 + 입주 + 6일">출퇴근+입주+6일</option>
						</select> 
					</div>
					<div class="input">
						<span class="input2_title">출산예정일</span><input type="text" id="datepicker" name="childbirth" placeholder="날짜를 선택하세요" value=""> 
					</div>
					<div class="input">
						<span class="input2_title">서비스희망일</span><input type="text" id="datepicker1" name="serviceSdt" placeholder="날짜를 선택하세요" value=""> 
					</div>
					<div class="input">
					<span class="input2_title">지점선택</span>
						<select name="local" onChange="fncSetPart(this.value);" class="textarea" style="height:35px;">
							<option value="">지역</option>
						<%
							If IsArray(arrLocal) Then 
								For num = 0 To UBound(arrLocal,2)
						%>
							<option value="<%=arrLocal(0,num)%>"><%=arrLocal(0,num)%></option>
						<%
								Next 
							End If 
						%>
						</select>
					<select id="part" name="part" class="textarea" style="height:35px;">
						 
					</select>
					</div> 
					<div class="input">
							<span class="input2_title">조리원</span> <input type="radio" name="radio3" id="radio3" value="이용함"  /> 이용함 
							<span style="margin-left:20px;"></span><input type="radio" name="radio3" id="radio3" value="이용안함"  /> 이용안함 
					</div>
					<div class="input">
						 <span class="input2_title">출산경험</span> <input type="radio" name="exp_baby" id="exp_baby" value="초산모"  /> 초산모 
								<span style="margin-left:20px;"></span><input type="radio" name="exp_baby" id="exp_baby" value="경산모"  /> 경산모 
					</div>
					<div class="input">
						 <span class="input2_title">특이사항</span> <input type="radio" name="unique_check" id="unique_check" value="없음"  /> 없음 
								<span style="margin-left:20px;"></span><input type="radio" name="unique_check" id="unique_check" value="있음"  /> 있음 
						<div id="view_3" style="display:block;margin-left:105px;" >
								<input type="checkbox" name="unique_1" id="unique_1" value="다둥이"  /> 다둥이 <input type="checkbox" name="unique_1" id="unique_3" value="임신성 당뇨"  /> 임신성 당뇨 
								<input type="checkbox" name="unique_1" id="unique_2" value="부종"  /> 부종 <input type="checkbox" name="unique_1" id="unique_4" value="고혈압"  /> 고혈압
						</div>
					</div>
					<div class="input">
						 <span class="input2_title">가족사항</span>   
							<input type="checkbox" name="fam1" id="fam1" value="부모님"  /> 부모님 <input type="checkbox" name="fam1" id="fam3" value="큰아이 1명"  /> 큰아이 1명 
							<input type="checkbox" name="fam1" id="fam2" value="남편"  /> 남편	
						<div id="view_3" style="display:block;margin-left:105px;" > <input type="checkbox" name="fam1" id="fam4" value="큰아이 2명이상"  /> 큰아이 2명이상
							<input type="checkbox" name="fam1" id="fam5" value="기타가족"  /> 기타가족 
						</div>
					</div>
					<div class="join_box_02_sub">
						 <span class="input2_title">입원병원정보</span><input type="text" id="datepicker3" name="hospotal_date" value="" class="join_in_text_2" placeholder="입원날짜를 입력하세요"> 
					</div>
					<div class="join_box_01_sub">
						<span class="input3_title">입원병원정보</span><input type="text" name="hospotal_post" id="hospotal_post" class="setting_in_text_01" value="" /> <input type="button" name="post_btn" id="post_btn" class="setting_btn" value="주소찾기" />
					</div> 
					<div class="join_box_02_sub">
						<span class="input3_title">입원병원정보</span><input type="text" name="hospotal_address1" id="hospotal_address1" class="join_in_text_2" value="" /> 
					</div> 
				</div>-- 서비스 이용을 위한 정보--
			

				<div class="title">
					 선택 입력항목 
				</div>

				<div class="input2">
					<span class="input2_title">생년월일</span>
					<input type="text" id="datepicker2" name="birth" value="" placeholder="생년월일을 입력하세요."> 
				</div>

				<div class="input2">
					<span class="input2_title">성별</span>
					<input type="radio" name="gender" id="gender1" value="1"/> 남자
					<input type="radio" name="gender" id="gender2" value="2"/> 여자
				</div>

			
				<div class="input2">
					 
					<div>
						<span class="input2_title2">-생년월일 수집 및 이용동의</span>
						<span><input type="radio" name="agree_ch_1" id="agree_ch_1" value="Y"/> 동의 <input type="radio" name="agree_ch_1" id="agree_ch_1" value="N"/> 미동의</span>
					</div>
					<div>
						<span class="input2_title2">-성별 수집 및 이용동의</span>
						<span><input type="radio" name="agree_ch_2" id="agree_ch_2" value="Y"/> 동의 <input type="radio" name="agree_ch_2" id="agree_ch_2" value="N"/> 미동의</span>
					</div>
					<div>
						<span class="input2_title2">-이메일 마케팅 수신동의</span>
						<span><input type="radio" name="agree_ch_3" id="agree_ch_3" value="Y"/> 동의 <input type="radio" name="agree_ch_3" id="agree_ch_3" value="N"/> 미동의</span>
					</div>
					<div>
						<span class="input2_title2">-휴대폰 마케팅 수신동의</span>
						<span><input type="radio" name="agree_ch_4" id="agree_ch_4" value="Y"/> 동의 <input type="radio" name="agree_ch_4" id="agree_ch_4" value="N"/> 미동의</span>
					</div>
					<div>
						<span class="input2_title2">-개인정보 유효기간 3년지정<br/>(미동의시 1년)</span>
						<span><input type="radio" name="agree_ch_5" id="agree_ch_5" value="Y"/> 동의 <input type="radio" name="agree_ch_5" id="agree_ch_5" value="N"/> 미동의</span>
					</div>
					<div class="input2" style="text-align:right;">
						<input type="checkbox" name="check_all" id="check_all" /> 선택항목 전체동의
					</div>
					<div class="input2">
						<span class="input2_title2 fb">개인정보 수집 및 이용</span>
					</div>

					<table class="table table-bordered tb">
						<tbody>
							<tr>
								<td class="td1">구분</td>
								<td class="td2">선택</td>
							</tr>
							<tr>
								<td class="td1">목적</td>
								<td class="td2">맞춤정보 제공, 마케팅</td>
							</tr>
							<tr>
								<td class="td1">항목</td>
								<td class="td2">성별, 생년월일, 휴대폰번호</td>
							</tr>
							<tr>
								<td class="td1">보유기간</td>
								<td class="td2">회원탈퇴 후 5일까지</td>
							</tr>
						</tbody>
					</table>

				</div> -->

				<div>
					<input type="submit" value="회원가입하기" id="join_btn" style="height:50px;vertical-align:center;-webkit-border-radius: 5px 5px 5px 5px; border-radius: 5px 5px 5px 5px;" class="btn-block join_btn">
				</div>
		  </form>

		<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
			<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
		</div>


		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">이용약관</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
					
						<textarea style="width:100%;height:400px;"><!--#include virtual="/member/service_app.html"--></textarea>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>

		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">개인정보취급방침</h4>
			  </div>
			  <div class="modal-body" style="text-align:center;">
					
						<textarea style="width:100%;height:400px;"><!--#include virtual="/member/info_app.html"--></textarea>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="plan_input_03" data-dismiss="modal">확인</button>
				<!--button type="button" class="btn btn-primary">Save changes</button-->
			  </div>
			</div>
		  </div>
		</div>
		
 <!-- #include virtual = "/etc_work/mnb_app/footer.asp"-->
 
    </div><!-- /.container -->

  </body>
<form id="soFrm" name="soFrm" target="ifrm" method="post" action="/common/inc/sms_send_2.asp">
<input type="hidden" name="action" value="go">
<input type="hidden" name="type" value="join">
<input type="hidden" name="testflag" value="N">
<input type="hidden" name="rphone" value="">
</form>

<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>

<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	$(document).ready(function() {  
		var hp = $("#hp1").val() + "-" + $("#hp2").val() + "-" + $("#hp3").val();
	 
		var btnSms = jQuery("#btnSms");
		var btnSmsCheck = jQuery("#btnSmsCheck");

		btnSmsCheck.click(function(){
			cert_num = jQuery("#cert_num").val();
			if (cert_num == ""){
				alert("인증번호를 입력해 주세요");
				return false;
			}else{
				jQuery.post("/common/inc/sms_check.asp",{"cert_num":cert_num,"hp":hp},function(data,testStatus){
					switch(data) {
						case("1") :
							alert('인증번호를 입력해 주세요');
						break;
						case("2") :
							alert('인증받을 핸드폰 번호를 입력해 주세요');
						break;
						case("3") :
							alert('인증 되었습니다.');
							jQuery("#smsCheck").val("Y");
						break;
						case("4") :
							alert('인증번호를 다시 확인해 주세요');
						break;
					}
				});
			}
		});

		btnSms.click(function(){
			hp_1 = $("#hp1").val();
			hp_2 = $("#hp2").val();
			hp_3 = $("#hp3").val();
	 
			hp = hp_1 +"-"+ hp_2 +"-"+ hp_3

			if (hp_1 == "" || hp_2 == "" || hp_3 == "" ){
				alert("인증받을 핸드폰 번호를 입력해 주세요");
				return false;
			}else{
				jQuery("#soFrm").children("input").eq(3).val(hp);
				jQuery("#soFrm").submit();
			}
		});
 });
</script>

<script src="js/leftmenu.js"></script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript" charset="utf-8">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax_test.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
<!-- 달력추가 시작-->
<script src="//code.jquery.com/jquery-1.10.2.js"></script> 
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<!-- 달력 -->
   <script type="text/javascript"> 
		
		
		var join_btn = jQuery("#join_btn");
 
 
		join_btn.click(function(){
			if ($.trim(jQuery("#user_id").val()) == "") {
					alert("아이디를 입력하세요");
					$('#user_id').focus();
					return false;
			 
			}

			if ($.trim(jQuery("#post").val()) == "") {
					alert("우편번호를 입력하세요");
					$('#post').focus();
					return false; 
			}

			if ($.trim(jQuery("#address1").val()) == "") {
					alert("주소를 입력하세요");
					$('#address1').focus();
					return false; 
			}
			
			if ($.trim(jQuery("#address2").val()) == "") {
					alert("상세주소를 입력하세요");
					$('#address2').focus();
					return false; 
			}
			
/*			else{
				var email_id = jQuery("#user_id").val();
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  

				if(regex.test(email_id) === false) {  
					alert("잘못된 이메일 형식입니다.");
					$('#user_id').focus();
					return false;  
				} else {  
					//alert('ok');
				}  

			}
*/
			if ($.trim(jQuery("#user_pwd").val()) == "") {
				  
					alert("비밀번호를 입력하세요");
					$('#user_pwd').focus();
					return false;
			 
			}

			

			if ($.trim(jQuery("#user_pwd_re").val()) == "") {
				 
					alert("비밀번호를 재입력하세요");
					$('#user_pwd_re').focus();
					return false;
			}
				 
 
			if((jQuery("#user_pwd").val().length) < 6 || (jQuery("#user_pwd").val().length) > 15){
				alert("6자이상 15자 이하의 비밀번호를 입력하세요");
				$('#user_pwd').focus();
				return false;
			}

			if(jQuery("#user_pwd").val() != jQuery("#user_pwd_re").val()) {
				alert("비밀번호를 확인해주세요");
				$('#user_pwd').focus();
				return false;
			}
 
			
			if (jQuery("#user_pwd").val() != "" ) {
			   // 동일한 문자/숫자 4이상, 연속된 문자
				if(/(\w)\1\1\1/.test(jQuery("#user_pwd").val()) || isContinuedValue(jQuery("#user_pwd").val())) {
					alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다."); 
					return false;
				}
			}


			if ($.trim(jQuery("#hp1").val()) == "") {
				  
					alert("핸드폰번호를 입력하세요");
					$('#hp1').focus();
					return false;
			 
			}

			if ($.trim(jQuery("#hp2").val()) == "") {
				  
					alert("핸드폰번호를 입력하세요");
					$('#hp2').focus();
					return false;
			 
			}

			if ($.trim(jQuery("#hp3").val()) == "") {
				  
					alert("핸드폰번호를 입력하세요");
					$('#hp3').focus();
					return false;
			 
			}

			function isContinuedValue(value) {
				console.log("value = " + value);
				var intCnt1 = 0;
				var intCnt2 = 0;
				var temp0 = "";
				var temp1 = "";
				var temp2 = "";
				var temp3 = "";
		 
				for (var i = 0; i < value.length-3; i++) {
					console.log("=========================");
					temp0 = value.charAt(i);
					temp1 = value.charAt(i + 1);
					temp2 = value.charAt(i + 2);
					temp3 = value.charAt(i + 3);
		 
					console.log(temp0)
					console.log(temp1)
					console.log(temp2)
					console.log(temp3)
		 
					if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == 1
							&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == 1
							&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == 1) {
						intCnt1 = intCnt1 + 1;
					}
		 
					if (temp0.charCodeAt(0) - temp1.charCodeAt(0) == -1
							&& temp1.charCodeAt(0) - temp2.charCodeAt(0) == -1
							&& temp2.charCodeAt(0) - temp3.charCodeAt(0) == -1) {
						intCnt2 = intCnt2 + 1;
					}
					console.log("=========================");
				}
		 
				console.log(intCnt1 > 0 || intCnt2 > 0);
				return (intCnt1 > 0 || intCnt2 > 0);
			}

 

			if ($.trim(jQuery("#user_name").val()) == "") {
				 
					alert("이름을 입력하세요");
					$('#user_name').focus();
					return false;
			} 
 
			if ($('input:checkbox[id="over14_agree1"]').is(":checked") == false) {
						 
					alert("만14세이상 동의하기를 체크하세요");
					$('#over14_agree1').focus();
					return false;
			}
			if ($('input:checkbox[id="agree2"]').is(":checked") == false) {
						 
					alert("이용약관 동의하기를 체크하세요");
					$('#agree2').focus();
					return false;
			}
			if ($('input:checkbox[id="person_data_agree3"]').is(":checked") == false) {
						 
					alert("개인정보 수집 및 이용동의를 체크하세요");
					$('#person_data_agree3').focus();
					return false;
			}

			if(jQuery("#idCheck").val() == "N"){
			//	alert("아이디 중복 체크를 확인해주세요");
				$("#id_ment").show();
				$('#over_chk_btn').focus();
				return false;
			}
        });

     
		function check_id(){

			var form = document.join_fm;
		 
			var id_chk = form.user_id.value;
			if(id_chk == ""){
				alert("아이디를 입력해주세요");
				$('#user_id').focus();
			}else{
				var email_id = jQuery("#user_id").val();
				var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;   
		  
/*
				if(regex.test(email_id) === false) {  
					alert("잘못된 이메일 형식입니다.");
					$('#user_id').focus();
					return false;  
				} else {  
					//alert('ok');
				}
*/
				jQuery.post("./id_check.asp",{"user_id":$("#user_id").val()},function(data,testStatus){
 //console.log(data);
				if (data == 0) {
						//console.log("data1");
						alert("사용할 수 있는 아이디 입니다..");
						jQuery("#idCheck").val("Y");
					
					} else {
						alert('중복된 아이디입니다. 다른아이디를 선택하세요.');
					}
			}); 
			//	window.open('id_check.php?user_id='+id_chk, 'CheckWindow', 'width=400,height=200,toolbar=no,status=no,resizable=no'); 
			//	jQuery("#idCheck").val("Y");
			}
		}


		$(document).ready(function(){

			$("#post_btn").click(function() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = data.address; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 기본 주소가 도로명 타입일때 조합한다.
						if(data.addressType === 'R'){
							//법정동명이 있을 경우 추가한다.
							if(data.bname !== ''){
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if(data.buildingName !== ''){
								extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$("#post").val(data.zonecode); //5자리 새우편번호 사용
						$("#address1").val(fullAddr);

						// 커서를 상세주소 필드로 이동한다.
						$("#address2").val("");
						$("#address2").focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						document.getElementById('layer').style.display = 'none';
						$("body").css("overflow", "visible");
					},
					width : '100%',
					height : '100%'
				}).embed(document.getElementById('layer'));

				document.getElementById('layer').style.display = 'block';
				$("body").css("overflow", "hidden");

				initLayerPosition();
			});

			//최상단 체크박스 클릭
			$("#check_all").click(function(){
				//클릭되었으면
				if($("#check_all").prop("checked")){
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input:radio[name='agree_ch_1']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_2']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_3']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_4']:radio[value='Y']").prop("checked",true);
					$("input:radio[name='agree_ch_5']:radio[value='Y']").prop("checked",true);
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input:radio[name='agree_ch_1']").removeAttr("checked");
					$("input:radio[name='agree_ch_2']").removeAttr("checked");
					$("input:radio[name='agree_ch_3']").removeAttr("checked");
					$("input:radio[name='agree_ch_4']").removeAttr("checked");
					$("input:radio[name='agree_ch_5']").removeAttr("checked");
				}
			});

			
			$("#sanmo_name").click(function(){
				//클릭되었으면
				if($("#sanmo_name").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의 
					$("#customer_nm").val($("#user_name").val()); 
					//클릭이 안되있으면
				}else{
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
  
					$("#customer_nm").val(""); 
				}
					 
			});
 
		 
			$( "#datepicker" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 
			$( "#datepicker1" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 
			$( "#datepicker2" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 
			$( "#datepicker3" ).datepicker({
				  dateFormat: 'yy-mm-dd',
				  changeMonth: true, 
				  changeYear: true,
				  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
				  yearRange: 'c-100:c+30' // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			}); 

		});

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			document.getElementById('layer').style.display = 'none';
			$("body").css("overflow", "visible");
		}

        function initLayerPosition(){
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 460; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 1; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			document.getElementById('layer').style.width = width + 'px';
			document.getElementById('layer').style.height = height + 'px';
			document.getElementById('layer').style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			document.getElementById('layer').style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
			document.getElementById('layer').style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
		} 

	</script>

</html>
