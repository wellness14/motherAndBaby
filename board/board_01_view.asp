<!--#include virtual="/common/menu/head.asp"-->
<%
	intIDX	= fncRequest("idx")
	intNum	= fncRequest("num")
	brd_id	= fncRequest("brd_id")
	secFlg	= fncRequestForm("sec_flg")

	page = fncRequest("page")
	If page = "" Then page = 1

'If intIDX = "" then
'	intIDX	= "37"'fncRequest("idx")  '35
'	intNum	= ""'fncRequest("num")  '
'	brd_id	= "EVENT"'fncRequest("brd_id") 'EVENT 
'	secFlg	= "Y"'fncRequestForm("sec_flg")   ' Y
'End if

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






'------------comment 
		Dim mode : mode = "ins"


		strTable = " FROM MO_BRD_EVENT_COMMENT WITH(NOLOCK) "
	 
		strWhere = " WHERE BA_IDX = '"& intIDX &"'  ORDER BY BA_SEQ DESC  "

		strSql = ""
		strSql = strSql & "		SELECT "
		strSql = strSql & "			BA_SEQ "
		strSql = strSql & "			,BA_NAME "
		strSql = strSql & "			,BA_EMAIL "
		strSql = strSql & "			,BA_PW "
		strSql = strSql & "			,BA_COMMENT "
		strSql = strSql & "			,BA_ENT_DT "

		strSql = strSql & "			   "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			mode	= "upd"
'			comment_Seq		= Rs(0)
'			comment_name	= Rs(1)
'			comment_email	= Rs(2)
'			comment_pw		= Rs(3)
'			comment_comment	= Rs(4)
 
			arrList = Rs.GetRows()
		End If 
		Call DBClose(Rs) : DBClose(Rs1)







%>
<body>
<%If intIDX = 36 then%>
<map name="Map" id="Map">


  <area shape="rect" coords="80,1879,214,1910" href="http://mothernbaby.co.kr/info/info_01_event.asp?mOne=3&amp;mTwo=1&event_local=suwon" target="_blank"/>
  <area shape="rect" coords="227,1879,332,1908" href="http://mothernbaby.co.kr/comp/comp_07_suwon.asp?mOne=1&mTwo=7" target="_blank" />
  <area shape="rect" coords="364,1877,500,1909" href="http://mothernbaby.co.kr/info/info_01_event.asp?mOne=3&amp;mTwo=1&event_local=dongjak" target="_blank" />
  <area shape="rect" coords="510,1879,617,1908" href="http://mothernbaby.co.kr/comp/comp_07_dongjak.asp?mOne=1&mTwo=7" target="_blank" />

<!-- 
  <area shape="rect" coords="85,1961,222,1994" href="http://mothernbaby.co.kr/info/info_01_event.asp?mOne=3&amp;mTwo=1&event_local=suwon" target="_blank" />
  <area shape="rect" coords="235,1964,346,1993" href="http://mothernbaby.co.kr/comp/comp_07_suwon.asp?mOne=1&mTwo=7" target="_blank" />
  <area shape="rect" coords="384,1962,519,1994" href="http://mothernbaby.co.kr/info/info_01_event.asp?mOne=3&amp;mTwo=1&event_local=dongjak" target="_blank" />
  <area shape="rect" coords="534,1961,642,1992" href="http://mothernbaby.co.kr/comp/comp_07_dongjak.asp?mOne=1&mTwo=7" target="_blank" />
-->
 
</map>

<% End If %>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub04_subtitle0<%=mTwo%>.jpg" width="770" height="43" /></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:15px; padding-bottom:15px;"><div align="right"><a href="./board_0<%=mTwo%>.asp?<%=strParam%>&page=<%=page%>"><img src="/image/bt_0006.jpg" width="123" height="36" border="0" /></a></div></td>
			</tr>
			</table>
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="2">
			<tr>
				<td width="56" height="34" bgcolor="#979797" class="white_text"><div align="center">번호</div></td>
				<% If brd_id = "NOTICE" Then %>
				<td width="69" bgcolor="#979797" class="white_text"><div align="center">분류</div></td>
				<% End If %>
				<td width="442" bgcolor="#979797" class="white_text"><div align="center">제목</div></td>
				<td width="103" bgcolor="#979797" class="white_text"><div align="center">작성자</div></td>
				<td width="88" bgcolor="#979797" class="white_text"><div align="center">작성일</div></td>
			</tr>
			<tr>
				<td height="34" bgcolor="#ebebeb"><div align="center"><%=intNum%></div></td>
				<% If brd_id = "NOTICE" Then %>
				<td bgcolor="#ebebeb"><div align="center"><%=ba_type%></div></td>
				<% End If %>
				<td bgcolor="#ebebeb" style="padding-left:10px;"><%=title%></td>
				<td bgcolor="#ebebeb"><div align="center"><%=mem_nm%></div></td>
				<td bgcolor="#ebebeb"><div align="center"><%=reg_dt%></div></td>
			</tr>
			</table>
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<% If mOne = 4 And mTwo = 4 then%>
					<!--<td valign="top"><textarea style="width:100%; height:300px; overflow-y:scroll;" readonly><%=content%></textarea></td>--> 
					
					<td valign="top"><%rstStr = Replace(content, ". ", "<br/><br/>")%><%=rstStr%></td>
					
				<%
					else
				%>
					<td valign="top">

<%


If intIDX = 41 Then 

%>
	
					

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 
 
	<title>마더앤베이비 & 아이윙</title>
	<style type="text/css">
	<!--

			.iwing_02 {width:740px; height:233px; background-image:url("/image/iwing_02.jpg"); background-repeat:no-repeat; padding-left:0px;}
			.input_01 {width:225px; height:38px; padding-left:5px; margin-left:100px}
			.input_02 {width:225px; height:38px; padding-left:5px; }
			.pl_50 {padding-left:50px;}
			.pl_35 {padding-left:35px;}
			.pl_35_2 {padding-left:35px;}
			.pt_50 {padding-top:50px;}
			.pt_15 {padding-top:15px;}
	-->
	</style>
</head>

<body>

<table border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="ins">
			<input type="hidden" id="idCheck" name="idCheck" value="N">
			<input type="hidden" name="mOne" value="<%=mOne%>">
			<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<input type="hidden" id="login" name="login" value="<%=uId%>">
  
			<input type="hidden" name="intIDX" name="<%=intIDX%>">
			<input type="hidden" name="intNum" value="<%=intNum%>">
			<input type="hidden" name="brd_id" value="<%=brd_id%>">
			<input type="hidden "name="secFlg" value="<%=secFlg%>">
			
 	 
			 
		<div class="iwing_01" style="height:964px;width:740px;">
			<img src="/image/iwing_01.jpg" style="height:964px;"/>
		</div>

		<div class="iwing_02">
			<div class="pt_50">
				<input type="text" class="input_01" id="cert_mnb_id" name="cert_mnb_id"   placeholder="아이디" tabindex="1" /><!--마더앤 베이비 -->
				<span class="pl_50">
					<input type="text" class="input_02" id="cert_id" name="cert_id"  placeholder="아이디" tabindex="3" /><!--아이윙 아이디 -->
				</span>
			</div>

			<div class="pt_15">
				<input type="password" class="input_01" id="mnb_pwd2" name="mnb_pwd2" placeholder="비밀번호" tabindex="2" />
				<span class="pl_50">
					<input type="password" class="input_02" id="pwd2" name="pwd2" placeholder="비밀번호" tabindex="4" />
				</span>
			</div>

			<div class="pt_15">
				<span class="btn1_1">
					<img src="/image/iwing_btn_01.png" id="btnMnBCert" style="cursor:pointer;margin-left:100px;" />
					<span class="pl_35">
						<img src="/image/iwing_btn_02.png" onclick="join();"style="cursor:pointer;" />
					</span>
				</span>
				
				<!-- 마더앤베이비 인증 완료시 교체 -->
				<span class="btn1_2" style="display:none;margin-left:107px;">
					<img src="/image/iwing_btn_s_01.png" />
				</span>

				<span class="btn2_1 pl_50">
					<img src="/image/iwing_btn_01.png" id="btnIdCert" style="cursor:pointer;" />
					<span class="pl_35_2">
						<img src="/image/iwing_btn_02.png" onclick="fncOpenZip();" style="cursor:pointer;" />
					</span>
				</span>
				
				<!--아이윙 인증 완료시 교체-->
				<span class="btn2_2 pl_50" style="display:none;margin-left:10px;">
					<img src="/image/iwing_btn_s_02.png" />
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
		</td>
	</tr>
	</table>
</body>
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

	var mnb_login = jQuery("#login").val();
 
		if(jQuery("#login").val() == "") {
			 
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
						alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요!');
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
		var mnb_login_id = jQuery("#login").val();
		var cert_id = jQuery("#cert_id").val();
		var pwd2 = jQuery("#pwd2").val();

		console.log("mnb_id: " + mnb_id);
		console.log("mnb_login_id: " + mnb_login_id);

		if (mnb_login_id != "") {
			mnb_id = mnb_login_id;
		}

		if ($.trim(jQuery("#login").val()) == "") {
			//로그인 안했을시
				console.log("mnb_id: ");
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
											alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요!!!');
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
								alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요...');
								return false;
							break;
						}
					});
				}
			}
		}else{
			 	console.log("mnb_id:111 ");
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
							console.log("mnb_id:222 ");
								 //아이윙 인증되면 마더앤베이비 인증한 아이디 이벤트값 업데이트
									console.log("mnb_id: " + mnb_id);
									console.log("mnb_login_id: " + mnb_login_id);

									jQuery.post("/common/inc/mnb_check_update.asp",{"proc_type":'confirmUser',"user_id":mnb_login_id,"pwd":pwd2,"pn_mem_id":"mBaby"},function(data,testStatus){	
									
										switch(data) {
											case("2") :
												//alert('인증이 완료되었습니다.');
													$(".btn2_1").hide();
													$(".btn2_2").show();
											break;

											case("1") :
												alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요.');
												return false;
											break;
										}
									});
								//alert('인증이 완료되었습니다.');
							
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
								alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요..');
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
						alert('처리중 오류가 발생하였습니다. 관리자에게 문의하세요....');
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




					
					
					
<%
else
%>					
					
					<%=content%>
<%
End if
%>
					</td>
					
				<% End If %>
			</tr>
			</table>
			<% If re_content <> "" Then %>
			<p style="margin-top:10px;">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0" class="bbs_view">
			<tr>
				<% If mOne = 4 And mTwo = 4 then%>

					<td valign="top"><%rstStr = Replace(re_content, ". ", "<br/><br/>")%><%=rstStr%></td>

					<!--<td valign="top"><textarea style="width:100%; height:300px; overflow-y:scroll;" readonly><%=re_content%></textarea></td>-->
				<%
					else
				%>
					<td valign="top"><%=re_content%></td>
				<% End If %>
			 
			</tr>
			</table>
			<% End If %>




 

			
			<p style="margin-top:50px;">	  
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>



 
<script type="text/javascript">
/*

 function getBrowserType() {
          
        var _ua = navigator.userAgent;
        var rv = -1;
            
        //IE 11,10,9,8
        var trident = _ua.match(/Trident\/(\d.\d)/i);
        if( trident != null )
        {
            if( trident[1] == "7.0" ) return rv = "IE" + 11;
            if( trident[1] == "6.0" ) return rv = "IE" + 10;
            if( trident[1] == "5.0" ) return rv = "IE" + 9;
            if( trident[1] == "4.0" ) return rv = "IE" + 8;
        }
         
        //IE 7...
        if( navigator.appName == 'Microsoft Internet Explorer' ) return rv = "IE" + 7;
         
  
         
        //other
        var agt = _ua.toLowerCase();
        if (agt.indexOf("chrome") != -1) return 'Chrome';
        if (agt.indexOf("opera") != -1) return 'Opera'; 
        if (agt.indexOf("staroffice") != -1) return 'Star Office'; 
        if (agt.indexOf("webtv") != -1) return 'WebTV'; 
        if (agt.indexOf("beonex") != -1) return 'Beonex'; 
        if (agt.indexOf("chimera") != -1) return 'Chimera'; 
        if (agt.indexOf("netpositive") != -1) return 'NetPositive'; 
        if (agt.indexOf("phoenix") != -1) return 'Phoenix'; 
        if (agt.indexOf("firefox") != -1) return 'Firefox'; 
        if (agt.indexOf("safari") != -1) return 'Safari'; 
        if (agt.indexOf("skipstone") != -1) return 'SkipStone'; 
        if (agt.indexOf("netscape") != -1) return 'Netscape'; 
        if (agt.indexOf("mozilla/5.0") != -1) return 'Mozilla';
    }
       
    document.write( getBrowserType() );

	 

 
 */

	
	function COMMENT() {
		 if(confirm("댓글을 등록하시겠습니까?")) {

			var form = document.oFrm;
		 
			 if(form.mem_nm.value == ""){
				 alert("성함을 입력해주세요");
				 return false;
			 }
			 if(form.email.value == ""){
				 alert("이메일을 입력해주세요");
				 return false;
			 }
			 if(form.pw.value == ""){
				 alert("비밀번호를 입력해주세요");
				 return false;
			 }
			 if(form.content.value == ""){
				 alert("내용을 입력해주세요");
				 return false;
			 }
 

	
 
		form.action = "comment_sql.asp";
		form.target = "_self";
		form.submit();

 
   }

}

	function COMMENT2(seq,idx,name,email,pw,cmt,mode) {
		 if(confirm("댓글을 수정하시겠습니까?")) {
 

		var form2 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
		var m_name = name;
		var m_email = email;
		var m_pw = pw;
		var m_cmt = cmt;
		var m_mode = mode;
 
		
 

		form2.action = "comment_sql.asp?comment_Seq="+m_seq+"&idx="+m_idx+"&mem_nm="+m_name+"&email="+m_email+"&pw="+m_pw+"&content="+m_cmt+"&mode="+m_mode;
		//form2.action = "comment_sql.asp";
		form2.target = "_self";
		form2.submit();
 
   }

}

	function COMMENT_upd(seq,idx,pw,b_id,flag) {
		  if(confirm("수정화면으로 가시겠습니까?")) {
 

		var form2 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
		var m_pw = pw;
		
 

		form2.action = "board_01_view_upd.asp?mOne=4&mTwo=5&comment_Seq="+m_seq+"&idx="+m_idx+"&pw="+m_pw+"&brd_id="+b_id+"&secFlg="+flag;
		form2.target = "_self";
		form2.submit();
		  }
   

}


	function COMMENT_add(seq,idx) {
		 
 

		var form3 = document.oFrm_2;
		var m_seq = seq;
		var m_idx = idx;
 
		
 

		form3.action = "board_01_view_test_add.asp?mOne=4&mTwo=5&comment_Seq="+m_seq+"&idx="+m_idx;
		form3.target = "_self";
		form3.submit();
 
   

}
  

 


 

</script>

</html>
