<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!--#include virtual="/mobileweb/common/asp/RSexec.asp"-->
<!--#include virtual="/mobileweb/common/asp/FunDef.asp"-->
<% 
	Response.CharSet = "utf-8"

	Dim menuCode1, menuCode2 
	menuCode1 = "10000" 
	menuCode2 = "B"
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" type="text/css" href="css/mobile_index.css" />
    <title>마더앤베이비모바일</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/leftmenu.css" rel="stylesheet">
	<script src="js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
		});
	</script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#post_btn").click(function() {
				new daum.Postcode({
					oncomplete: function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if(data.userSelectedType === 'R'){
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
					}
				}).open();
			});
		});
	</script>
</head>

<body>

<div id="wrap">
	<header id="gnb" class="">
		<div class="topbar">
			<span class="btn-left" id="back"> <!-- #include virtual = "/mobileweb/ver_02/nav.asp" --> </span>
			<h2 class="top_title">
				<span style="color:#ed587a;">회원정보</span> <span style="color:#919194;">수정</span>
				<img src="/mobileweb/html/images/menu_bar_02.png" class="mini_menu" alt=""/>
			</h2>
			<span class="btn-right go-call" style="right:50px;"><a href="javascript:;" onclick="mainCall();">
				전화
			</a></span>
		</div>
	</header>

	<!-- #include virtual = "/mobileweb/ver_02/inc/submenu.asp" -->

	<div id="container" class="p10">
		<%
			If uid = "" Then 
				Response.Redirect "/mobileweb/ver_02/login.asp"
			End If 

			If uid <> "" Then 
				strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
				strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
				strWhere = " WHERE MM_DEL_DT IS NULL AND  MD_MEM_ID = '"& uid &"'"

				strSql = ""
				strSql = strSql & "	SELECT "
				strSql = strSql & "			MM_MEM_ID "
				strSql = strSql & "			,MM_MEM_NM "
				strSql = strSql & "			,MM_ENT_DT "
				strSql = strSql & "			,MD_PHONE "
				strSql = strSql & "			,MD_HP "
				strSql = strSql & "			,MD_SEX "
				strSql = strSql & "			,MD_BIRTH "
				strSql = strSql & "			,MD_POST "
				strSql = strSql & "			,MD_ADDR1 "
				strSql = strSql & "			,MD_ADDR2 "
				strSql = strSql & "			,MD_EMAIL "
				strSql = strSql & "			,MD_SNS_FLG "
				strSql = strSql & "			,MD_EMAIL_FLG "
				strSql = strSql & "			,MD_CHILDBIRTH "
				strSql = strSql & "			,MD_CHILD_FLG "
				strSql = strSql & "			,MD_TYPE "
				strSql = strSql & "			,MD_LOCAL "
				strSql = strSql & strTable
				strSql = strSql & strWhere
				Set Rs = DBExec(strSql,"main")	
				If Not Rs.EOF Then 
					arrList = Rs.getRows()
				Else 
					response.Write "<script type='text/javascript'>alert('회원정보가 올바르지 않습니다.');location.href='/mobileweb/ver_02/';</script>"
					response.End 
				End If 
				Call RSClose(Rs)
			Else 
				response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='login.asp';</script>"
				response.End 
			End If
		%>
		<div style="background-color:#F6F6F6;" class="tal pb50 pl5">
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="upd">
			<input type="hidden" name="mem_id" value="<%=uid%>">
			<div class="mt20">
				<img src="/mobileweb/html/images/text_0007.jpg" />
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0008.jpg" />
				<b><%=uid%></b>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0032.jpg" />
				<input type="password" name="mem_old_pw" class="textarea" size="18" valid="E|A=패스워드를 입력해 주세요"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0033.jpg" />
				<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="18" style="ime-mode:disabled;"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0010.jpg" />
				<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="18" style="ime-mode:disabled;"/>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0011.jpg" />
				<b><%=arrList(1,0)%></b>
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0015.jpg" />
				<%
					arrHp = Split(arrList(4,0),"-")
				%>
				<select id="hp_1" name="hp_1" class="textarea" style="height:35px;">
					<option value="">선택</option>
					<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
					<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
					<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
					<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
					<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
					<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
				</select>
				-
				<input type="text" id="hp_2" name="hp_2" class="textarea" size="3" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
				-
				<input type="text" id="hp_3" name="hp_3" class="textarea" size="3" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
			</div>

			<div class="mt10 pl80">
				<input type="checkbox" name="check3" value="Y" <%=fncSetCheckBox("Y",arrList(11,0))%> /> SMS 수신동의
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0017.jpg" />
				<input type="text" name="email" class="textarea" size="18" value="<%=arrList(10,0)%>" valid="E|A=이메일 주소를 입력해 주세요"/>
			</div>

			<div class="mt10 pl80">
				<input type="checkbox" name="check4" value="Y" <%=fncSetCheckBox("Y",arrList(12,0))%> />이메일 수신동의 
			</div>

			<div class="mt20">
				<img src="/mobileweb/html/images/text_0016.jpg" /><input type="text" id="post" name="post" class="textarea" size="6" readonly value="<%=arrList(7,0)%>" valid="E|A= 우편번호를 입력해 주세요"/> <img src="/mobileweb/html/images/bt_0004.jpg" border="0" align="absmiddle" id="post_btn" style="margin-top:12px;cursor:pointer;" border="0"  valign="bottom" /><br>
				<span style="margin-left:74px;"></span> <input type="text" id="address1" name="address1" class="textarea" readonly value="<%=arrList(8,0)%>" valid="E|A= 주소를 입력해 주세요"/><br>
				<span style="margin-left:74px;"></span> <input type="text" id="address2" name="address2" class="textarea"  value="<%=arrList(9,0)%>" valid="E|A= 상세주소를 입력해 주세요"/>
			</div>


		</div>

		<div class="mt20" style="width:100%;">
			<img src="/mobileweb/html/images/bt_0003.jpg" style="width:150px; height:40px;" border="0" id="btnSubmit" style="cursor:pointer;"/>
			<img src="/mobileweb/html/images/bt_0002.jpg" style="width:150px; height:40px;" border="0" onClick="location.reload();" style="cursor:pointer;"/>
		</div>
	</div>

	<!-- #include virtual="/mobileweb/ver_02/inc/footer.asp" -->
</div>

</body>
<script type="text/javascript" src="/mobileweb/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }

		mem_pw = jQuery("#mem_pw").val();
		mem_pw_check = jQuery("#mem_pw_check").val();
		if (mem_pw != mem_pw_check){
			alert('');
			return false;
		}

		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "./member_sql.asp"
	});

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function fncOpenZip(){
		window.open("/mobileweb/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}

	function fncOpenZip_layer(){
            
		    jQuery.get("./pop_zipcode_ax.asp",{"type":"", "idx":""},function(data,testStatus){
         
		    if (data != ""){
				jQuery("#AreaZip").html(data);
			}

		});

		document.getElementById('AreaZip').style.display = "block";

    }

	function div1_closeLayer(IdName){
	 var pop = document.getElementById(IdName);
	 pop.style.display = "none";
	}

</script>
<script type="text/javascript" src="/mobileweb/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/mobileweb/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>