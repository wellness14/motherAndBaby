<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 

	menuCode1 = request("menuCode1") 
	menuCode2 = request("menuCode2") 

	If menuCode1 = "" Then menuCode1 = "50000" 
	If menuCode2 = "" Then menuCode2 = "A"

	If menuCode2="A" Then pageLink = "1"
	If menuCode2="B" Then pageLink = "2"
	If menuCode2="C" Then pageLink = "3"
	If menuCode2="D" Then pageLink = "4"
	If menuCode2="E" Then pageLink = "5"

	
	intIDX	= fncRequest("idx")
	intNum	= fncRequest("num")
	brd_id	= fncRequest("brd_id")
	secFlg	= fncRequestForm("sec_flg")
	
	'-----------------------------------------------------------------------------
	'	데이터 확인
		brd_tbl = "dbo.MO_BRD_"& brd_id &" "
	'-----------------------------------------------------------------------------

	'-----------------------------------------------------------------------------
	'	게시판 생성여부 확인
		strSql = "IF object_id(N'"& brd_tbl &"') IS NOT NULL SELECT 'Y' ELSE SELECT 'N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			If Rs(0) = "N" Then 
				response.Write "<script type='text/javascript'>alert('존재하지 않는 게시판 입니다.');history.back(-1);</script>"
				response.End 
			End If 
		End If 
		Call DBClose(Rs)
	'-----------------------------------------------------------------------------

	'--------------------------------------------------------------------------
	'	공지사항 리스트 호출
		If intIDX <> "" Then 
			strSql = ""
			strSql = strSql & "		SELECT "
			strSql = strSql & "			BA_IDX "
			If brd_id = "NOTICE" Then 
			strSql = strSql & "			,BA_TYPE "
			End If 
			strSql = strSql & "			,BA_MEM_NM  "
			strSql = strSql & "			,BA_TITLE   "
			strSql = strSql & "			,BA_CONTENT   "
			strSql = strSql & "			,BA_SEC_FLG "
			strSql = strSql & "			,BA_REG_DT	"
			strSql = strSql & "			,ROW_NUMBER( ) OVER (ORDER BY BA_SEQ DESC, BA_IDX DESC) ROWNUM "
			strSql = strSql & "		FROM "& brd_tbl &" WITH(NOLOCK) "
			strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_IDX='"& intIDX &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				If brd_id = "NOTICE" Then 
					ba_type		= Rs("BA_TYPE")
				End If 
				mem_nm		= Rs("BA_MEM_NM")
				title		= Rs("BA_TITLE")
				content		= Re_sqlFilter(Rs("BA_CONTENT"))
				sec_flg		= Rs("BA_SEC_FLG")
				reg_dt		= Left(Rs("BA_REG_DT"),10)
			End If 
			Call RSClose(Rs)
		Else
			response.Write "<script type='text/javascript'>history.back(-1);</script>"
			response.End 
		End If 
	'--------------------------------------------------------------------------

	'--------------------------------------------------------------------------
	'	비밀글 확인
		If sec_flg <> "N" And sec_flg <> secFlg Then 
			response.Write "<script type='text/javascript'>history.back(-1);</script>"
			response.End 
		End If 
	'--------------------------------------------------------------------------

	'--------------------------------------------------------------------------
	'	답변 확인
		If intIDX <> "" Then 
			strSql = ""
			strSql = strSql & "		SELECT "
			strSql = strSql & "			BA_TITLE   "
			strSql = strSql & "			,BA_CONTENT   "
			strSql = strSql & "		FROM "& brd_tbl &" WITH(NOLOCK) "
			strSql = strSql & "		WHERE BA_CNLKBN='N' AND BA_DPH=2 AND BA_PIDX='"& intIDX &"' "
			Set Rs = DBExec(strSql,"main")
			If Not Rs.EOF Then 
				re_title		= Rs("BA_TITLE")
				re_content		= Re_sqlFilter(Rs("BA_CONTENT"))
			End If 
			Call RSClose(Rs)
		End If 
	'--------------------------------------------------------------------------

	If menuCode2 = "D" Then 
	   tit = "<span style=""color:#ed587a;"">칭찬</span> <span style=""color:#919194;"">하기</span>"
	ElseIf menuCode2 = "E" Then  
	   tit = "<span style=""color:#ed587a;"">이벤트</span> <span style=""color:#919194;""></span>"
	End If
%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
	<link rel="stylesheet" type="text/css" href="css/old_mobile.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/jquery.rwdImageMaps.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('img[usemap]').rwdImageMaps();
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back" > <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<%=tit%>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu"alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<div class="mt20"></div>

		<!-- <table border="0" align="center" cellpadding="0" cellspacing="0" align="right">
		<tr>
			<td style="padding-top:4px; padding-bottom:15px;" width="100%"><div align="right" style="text-align:right;"><a href="./board_0<%=pageLink%>.asp?<%=strParam%>"><img src="/mobileweb/html/images/bt_0006.jpg" border="0" /></div></a></td>
		</tr>
		</table> -->

		<div style="text-align:right;padding-top:4px; padding-bottom:15px;">
			<a href="./board_0<%=pageLink%>.asp?<%=strParam%>"><img src="/mobileweb/html/images/bt_0006.jpg" border="0" style="width:123px;" /></a>
		</div>

		<table border="0" align="center" cellpadding="0" cellspacing="2" style="display:none;">
			<tr>
				<!-- <td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td> -->
				<% If brd_id = "NOTICE" Then %>
				<td width="69" bgcolor="#979797" class="white_text"><div align="center">분류</div></td>
				<% End If %>
				<td width="442" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
				<td width="103" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
				<td width="88" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
			</tr>
			<tr>
				<!-- <td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td> -->
				<% If brd_id = "NOTICE" Then %>
				<td bgcolor="#ebebeb"><div align="center"><%=ba_type%></div></td>
				<% End If %>
				<td bgcolor="#ebebeb" style="padding-left:10px;"><%=title%></td>
				<td bgcolor="#ebebeb"><div align="center"><%=mem_nm%></div></td>
				<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
			</tr>
		</table>
		<br/>
		<table class="table">
			<colgroup>
				<% If brd_id = "NOTICE" Then %>
				<!-- <col width="10%" /> -->
				<col width="20%" />
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
				<% Else %>
				<!-- <col width="10%" /> -->
				<col width="60%" />
				<col width="20%" />
				<col width="20%" />
				<% End If %>
			</colgroup>
			<thead>
				<!-- <th>번호</th> -->
				<% If brd_id = "NOTICE" Then %>
				<th style="padding:0px; padding-left:3px; padding-top:3px; padding-bottom:3px;">분류</th>
				<th style="padding:0px; padding-left:3px; padding-top:3px; padding-bottom:3px;">제목</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성자</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성일</th>
				<% Else %>
				<th style="padding:0px; padding-left:3px; padding-top:3px; padding-bottom:3px;">제목</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성자</th>
				<th style="padding:0px; padding-top:3px; padding-bottom:3px;">작성일</th>
				<% End If %>
			</thead>
			<tbody>
				<tr class="active">
					<!-- <td><%=intNum%></td> -->
					<% If brd_id = "NOTICE" Then %>
					<td style="padding:0px; padding-left:3px; padding-top:3px; padding-bottom:3px;"><%=ba_type%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=title%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=mem_nm%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=reg_dt%></td>
					<% Else %>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=title%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=mem_nm%></td>
					<td style="padding:0px; padding-top:3px; padding-bottom:3px;"><%=reg_dt%></td>
					<% End If %>
				</tr>
			</tbody>
		</table>
		
		<div style="text-align:left; border:1px solid #dddddd; padding:20px;">
			<% If intIDX = 41 Then %>
				<style type="text/css">
				<!--

						.iwing_02 {max-width:740px; height:100%; background-image:url("/image/iwing_02_mm.jpg"); background-repeat:repeat; padding-left:0px;padding-bottom:30px;}
						.input_01 {max-width:80px; height:38px; padding-left:5px;}
						.input_02 {max-width:80px; height:38px; padding-left:5px; }
						.pl_50 {padding-left:20px;}
						.pl_35 {padding-left:30px;}
						.pl_35_2 {padding-left:15px;}
						.pt_50 {padding-top:-20px;}
						.pt_15 {padding-top:15px;}
						
				-->
				</style>

				<form id="oFrm" name="oFrm" method="post">
				<input type="hidden" name="mode" value="ins">
				<input type="hidden" id="idCheck" name="idCheck" value="N">
				<input type="hidden" name="mOne" value="<%=mOne%>">
				<input type="hidden" name="mTwo" value="<%=mTwo%>">
				<input type="hidden" id="login" name="login" value="<%=uId%>">

				

				
					<div class="iwing_01">
						<img src="/image/iwing_0111.jpg">
					</div>

					<div class="iwing_02">
						<div style="position:relative; left:19%;">
							<input type="text" class="input_01" id="cert_mnb_id" name="cert_mnb_id"   placeholder="아이디" tabindex="1" /><!--마더앤 베이비 -->
							<span style="position:absolute; left:38%;">
								<input type="text" class="input_02" id="cert_id" name="cert_id"  placeholder="아이디" tabindex="3" /><!--아이윙 아이디 -->
							</span>
						</div>

						<div class="pt_15" style="position:relative; left:19%;">
							<input type="password" class="input_01" id="mnb_pwd2" name="mnb_pwd2" placeholder="비밀번호" tabindex="2" />
							<span style="position:absolute; left:38%;">
								<input type="password" class="input_02" id="pwd2" name="pwd2" placeholder="비밀번호" tabindex="4" />
							</span>
						</div>

						<div class="pt_15" style="position:relative; left:20%;">
							<span class="btn1_1">
								<img src="/image/iwing_btn_01.png" width="50"  height="20" id="btnMnBCert" style="cursor:pointer;" />
								<span>
									<img src="/image/iwing_btn_02.png" width="50" height="20" onclick="join();"style="cursor:pointer;" />
								</span>
							</span>
						
							<!-- 마더앤베이비 인증 완료시 교체 -->
							<span class="btn1_2" style="display:none;">
								<img src="/image/iwing_btn_s_01.png" style="cursor:pointer;width:100px;height:20px;"/>
							</span>
			 
							<span class="btn2_1" style="position:absolute; left:38%;">
								<img src="/image/iwing_btn_01.png" width="50"  height="20" id="btnIdCert" style="cursor:pointer;" />
								<span>
									<img src="/image/iwing_btn_02.png" width="50"  height="20"  onclick="fncOpenZip();" style="cursor:pointer;" />
								</span>
							</span>
			 
							<!--아이윙 인증 완료시 교체-->
							<span class="btn2_2" style="display:none;position:absolute; left:38%;">
								<img src="/image/iwing_btn_s_02.png" style="width:100px;height:20px;"/>
							</span>

						</div>
					</div>

					<div class="iwing_03">
						<img src="/image/iwing_03.jpg" usemap="#img3_map">

						<map name="img3_map">
							<area shape="rect" coords="264,170,376,206" href="https://itunes.apple.com/kr/app/aiwing-choegoui-donghwachaeg/id923670648?mt=8" target="_blank">
							<area shape="rect" coords="401,170,514,206" href="https://play.google.com/store/apps/details?id=kr.co.mflare.google.iwing" target="_blank">
						</map>
					</div>
					 
				</form>

				<script type="text/javascript" src="/common/js/frm_common.js"></script>
				<script type="text/javascript">
					var hp = "";
					var frm = jQuery("#oFrm");
					var tar	= jQuery("*[valid]");
					var btnSms = jQuery("#btnSms");
					var btnSmsCheck = jQuery("#btnSmsCheck");
					var btnSubmit = jQuery("#btnSubmit");
					var btnIdCheck = jQuery("#btnIdCheck");
					var btnIdCert = jQuery("#btnIdCert");
					var btnMnBCert = jQuery("#btnMnBCert");



					 
						if(jQuery("#login").val().trim() == "") {
						//if($.trim(jQuery("#login").val() == "")) {
					
						}else{
								$(".btn1_1").hide();
								$(".pl_35").hide();
								$(".btn1_2").show();
								jQuery("#idCheck").val("Y");
						}


						btnIdCheck.click(function(){
						var id = jQuery("#mem_id").val();
						
						if (id == ""){
							alert("ID를 입력해주세요.");
							return false;
						}else{
							jQuery.post("/common/inc/iwing_check.asp",{"proc_type":'checkUserId',"user_id":id},function(data,testStatus){
							 
								switch(data) {
									case("0000") :
										alert('등록가능합니다.');
									break;
									case("1000") :
										alert('중복된 아이디 입니다.');
										return false;
									break;
									case("1001") :
										alert('데이터를 정확히 입력해주세요.');
										return false;
									break;
									case("9999") :
										alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
										return false;
									break;
								}
							});
						}
					});

						btnMnBCert.click(function(){
						var id = jQuery("#cert_mnb_id").val();
						var mnb_pw = jQuery("#mnb_pwd2").val();
						 
							if (id == ""){
							alert("ID를 입력해주세요.");
							return false;
							}if(mnb_pw == ""){
							alert("비밀번호를 입력해주세요.");
							return false;
						}else{

						jQuery.post("/common/inc/check_id_pw_ax.asp",{"cert_mnb_id":id,"mnb_pwd2":mnb_pw},function(data,testStatus){
							switch(data) {
								case("1") :
									alert('인증하실 아이디를 입력해 주세요.');
								break;
								case("33") :
								//	alert('인증이완료되었습니다.');

										$(".btn1_1").hide();
										$(".btn1_2").show();

										jQuery("#idCheck").val("Y");

										//alert(jQuery("#idCheck").val());
								break;
								case("3") :
									alert('아이디 비밀번호가 틀렸거나 등록되지 않은 아이디입니다.');
								break;
								case("22") :
									alert('이미 이벤트에 참여하셨습니다. 이벤트는 한번만 참여하실 수 있습니다.');
									return false;
								case("34") :
									alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
									return false;
							}
						});
						}
					});


					btnIdCert.click(function(){
						var mnb_id = jQuery("#cert_mnb_id").val();
						var cert_id = jQuery("#cert_id").val();
						var pwd2 = jQuery("#pwd2").val();
				 
						if ($.trim(jQuery("#login").val() == "")) {
							//로그인 안했을시

						if (jQuery("#idCheck").val() == "N" ) {
							alert("마더앤베이비 회원인증을 먼저 해주세요.");
							return false;
						}
						else {
							if (cert_id == ""){
								alert("ID를 입력해주세요.");
								return false;
							}
							
					  
							if(pwd2 == ""){
								alert("비밀번호를 입력해주세요.");
								return false;
							}else{
								jQuery.post("/common/inc/iwing_cert_check.asp",{"proc_type":'confirmUser',"user_id":cert_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){
								 
									switch(data) {
										case("0000") :
										
										//아이윙 인증되면 마더앤베이비 인증한 아이디 이벤트값 업데이트
											jQuery.post("/common/inc/mnb_check_update.asp",{"proc_type":'confirmUser',"user_id":mnb_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){	
											
												switch(data) {
													case("2") :
														//alert('인증이 완료되었습니다.');
													break;

													case("1") :
														alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
														return false;
													break;
												}
											});

											//alert('인증이 완료되었습니다.');
											$(".btn2_1").hide();
											$(".btn2_2").show();

										break;
										case("1001") :
											alert('데이터를 정확히 입력해주세요.');
											return false;
										break;
										case("1002") :
											alert('아이디 혹은 비밀번호를 제대로 입력해주세요');
											return false;
										break;
										case("1003") :
											alert('이미 인증을 받은 아이디입니다.');
											//window.location.href = "http://mothernbaby.co.kr/member/member_iwing.asp?mOne=6&mTwo=2";
											return false;
										break;
										case("9999") :
											alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
											return false;
										break;
									}
								});
							}
						}
						}else{
									//로그인 했을시
								if (cert_id == ""){
									alert("ID를 입력해주세요.");
									return false;
								}
						  
								if(pwd2 == ""){
									alert("비밀번호를 입력해주세요.");
									return false;
								}else{
									jQuery.post("/common/inc/iwing_cert_check.asp",{"proc_type":'confirmUser',"user_id":cert_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){
									 
										switch(data) {
											case("0000") :
												//alert('인증이 완료되었습니다.');
												$(".btn2_1").hide();
												$(".btn2_2").show();
											break;
											case("1001") :
												alert('데이터를 정확히 입력해주세요.');
												return false;
											break;
											case("1002") :
												alert('아이디 혹은 비밀번호를 제대로 입력해주세요');
												return false;
											break;
											case("1003") :
												alert('이미 인증을 받은 아이디입니다.');
												//window.location.href = "http://mothernbaby.co.kr/member/member_iwing.asp?mOne=6&mTwo=2";
												return false;
											break;
											case("9999") :
												alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
												return false;
											break;
										}
									});
								}
						}
					});





						btnSubmit.click(function(){
							var id1 = jQuery("#mem_id").val();
							var pwd = jQuery("#pwd").val();
							var nickname = jQuery("#nickname").val();
							var hp_1 = jQuery("#hp_1").val();
							var hp_2 = jQuery("#hp_2").val();
							var hp_3 = jQuery("#hp_3").val();

							var hp_num = hp_1 + hp_2 + hp_3;
				 
							var cert_id = jQuery("#cert_id").val();
							var pwd2 = jQuery("#pwd2").val();


							var Ybirth = jQuery("#Ybirth").val();
							var Mbirth = jQuery("#Mbirth").val();
							var Dbirth = jQuery("#Dbirth").val();
				 
						if (id1 == ""){
							alert("ID를 입력해주세요.");
							return false;
						}else{
							jQuery.post("/common/inc/iwing_join_check.asp",{"proc_type":'insertUser',"user_id":id1,"pwd":pwd,"nickname":nickname,"Ybirth":Ybirth,"Mbirth":Mbirth,"Dbirth":Dbirth,"phone":hp_num,"pn_mem_id":"mBaby"},function(data,testStatus){
							 
								switch(data) {
									case("0000") :
										alert('회원가입이 완료되었습니다.');
									break;
									case("1000") :
										alert('중복된 아이디 입니다.');
										return false;
									break;
									case("1001") :
										alert('데이터를 정확히 입력해주세요.');
										return false;
									break;
									case("9999") :
										alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요');
										return false;
									break;
								}
							});
						}
					});

				  

					btnSubmit.click(function(){

						var id1 = jQuery("#mem_id").val();
						var pwd = jQuery("#pwd").val();
						var nickname = jQuery("#nickname").val();
						var hp_1 = jQuery("#hp_1").val();
						var hp_2 = jQuery("#hp_2").val();
						var hp_3 = jQuery("#hp_3").val();

						var hp_num = hp_1 + hp_2 + hp_3;
					//	var birth  = ;

				 
				 
				 

						var pw = jQuery("#pwd").val();
						if (!check_info(pw,"패스워드")){ return false }

						mem_pw = jQuery("#pwd").val();
						mem_pw_check = jQuery("#pwd_check").val();
						if (mem_pw != mem_pw_check){
							alert('비밀번호를 다시 확인해 주세요');
							return false;
						}

				 

						if  (!checkForm(frm,tar)){ return false }
						frm.submit();
					});


					frm.submit(function(){
					}).attr({
						"target" : "ifrm",
						"action" : ""
					});

				 
					function fncOpenZip(){
						window.open("/member/iwing.asp","pop_zipcode","width=500px, height=460px");
					}

					function join(){
						window.open('/member/member_join.asp?mOne=6&mTwo=2', '_blank'); 
					}
				</script>

				<script type="text/javascript" src="/common/js/ajax_common.js"></script>
				<script type="text/javascript">
					function fncSetPart(val){
						fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
					}
				</script>
				
			<% Else %>
				<%=Replace(content, Chr(10), "<br>")%>
			<% End If %>
		</div>
		
		<% If re_content <> "" Then %>
		<div style="text-align:left; border:1px solid #dddddd; padding:20px; margin-top:10px;">
			<%=Replace(re_content, Chr(10), "<br>")%>
		</div>
		<% End If %>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>

</html>
