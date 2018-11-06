<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% 

response.charset = "utf-8"

Dim menuCode1, menuCode2 
menuCode1 = "10000" 
menuCode2 = "B"

%>
<!DOCTYPE html>
<html>
<head>
	    <!--#include virtual="/mobileweb/common/menu/top_head.asp"-->
</head>
<body>
	<div id="wrap">
        <div id="msub_menu"> </div>    
		<div id="mheader">
         <!--#include virtual="/mobileweb/common/menu/top_all_menu.asp"-->	
        </div>
         <div id="mnav" class="menu">
			<!--#include virtual="/mobileweb/common/menu/sub_menu.asp"-->	
        </div>
        <!----------------------------------------- 본문 ----------------------------------------->
<%
	If uId = "" Then 
		Response.Redirect "/member/login.asp?mOne=6&mTwo=1"
	End If 

	If uId <> "" Then 
		strTable = " FROM MO_MEM_MAS WITH(NOLOCK) "
		strTable = strTable & " INNER JOIN MO_MEM_DTL WITH(NOLOCK) ON MM_MEM_ID = MD_MEM_ID "
		strWhere = " WHERE MM_DEL_DT IS NULL AND  MD_MEM_ID = '"& uId &"'"

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
			response.Write "<script type='text/javascript'>alert('회원정보가 올바르지 않습니다.');location.href='http://mothernbaby.co.kr/mobileweb/main';</script>"
			response.End 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='http://mothernbaby.co.kr/mobileweb/member/login.asp';</script>"
		response.End 
	End If 

'-----------------------------------------------------------------------------
'	지점 정보 호출
	md_local = arrList(16,0)
	strSql = "SELECT KOR_NM FROM ( "
	strSql = strSql & "	SELECT REPLACE(CC_KOR_NM,'-' + CC_KOR_NM2,'') KOR_NM "
	strSql = strSql & "	FROM MO_COMM_CD WITH(NOLOCK) "
	strSql = strSql & "	WHERE CC_COMM_KIND='88' AND CC_USE_YN='Y' AND CC_COMM_CD='"& md_local &"' "
	strSql = strSql & ") T1 "
	strSql = strSql & "GROUP BY KOR_NM "
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		local_nm = Rs(0)
	End If 
	Call RSClose(Rs)
'-----------------------------------------------------------------------------

'-----------------------------------------------------------------------------
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
'-----------------------------------------------------------------------------
%>
         <div id="mcontainer">
			<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="360" style="padding-top:0;"><img src="/mobileweb/html/images/sub68.jpg" width="360" /></td>
			</tr>
			<tr>
				<td width="360" height="40"><spacer type="block"></td>
			</tr>  
			<form id="oFrm" name="oFrm" method="post">
			<input type="hidden" name="mode" value="upd">
			<input type="hidden" name="mem_id" value="<%=uId%>">
			<tr>
				<td bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/mobileweb/html/images/text_0007.jpg" width="360" height="49" />
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td class="mjoin" width="74"><img src="/mobileweb/html/images/text_0008.jpg" width="61"  /></td>
						<td width="400" height="35" style="font-size:15px; font-weight:bold; color:#000000;"><%=uId%></td>
					</tr>
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0032.jpg" width="61" /></td>
						<td><label>
							<input type="password" name="mem_old_pw" class="textarea" size="20" valid="E|A=패스워드를 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0033.jpg" width="61" /></td>
						<td><label>
							<input type="password" id="mem_pw" name="mem_pw" class="textarea" size="20" style="ime-mode:disabled;"/>
						</label></td>
					</tr>	  
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0010.jpg" width="61" /></td>
						<td><label>
							<input type="password" id="mem_pw_check" name="mem_pw_check" class="textarea" size="20" style="ime-mode:disabled;"/>
						</label></td>
					</tr>
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0011.jpg" width="61" /></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%=arrList(1,0)%></span></label></td>
					</tr>	
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0012.jpg" width="61" /></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%If arrList(5,0) = 1 Then%>남자<%Else%>여자<%End If%></span></label></td>
					</tr>	  
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0013.jpg" width="61"/></td>
						<td height="35"><label><span style="font-size:15px; font-weight:bold; color:#000000;"><%=Left(arrList(6,0),4)%>년 <%=Mid(arrList(6,0),5,2)%>월 <%=Right(arrList(6,0),2)%>일</span></label></td>
					</tr>	  	  
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0014.jpg" width="61" /></td>
						<td><label>
						<%
							arrPhone = Split(arrList(3,0),"-")
						%>
								<select name="phone_1" class="textarea" style="height:35px;" valid="E|A=전화번호를 선택해 주세요">
									<option value="">선택</option>
									<option value="02" <%=fncSetSelectBox("02",arrPhone(0))%>>02</option>
									<option value="031" <%=fncSetSelectBox("031",arrPhone(0))%>>031</option>
									<option value="032" <%=fncSetSelectBox("032",arrPhone(0))%>>032</option>
									<option value="033" <%=fncSetSelectBox("033",arrPhone(0))%>>033</option>
									<option value="041" <%=fncSetSelectBox("041",arrPhone(0))%>>041</option>
									<option value="042" <%=fncSetSelectBox("042",arrPhone(0))%>>042</option>
									<option value="043" <%=fncSetSelectBox("043",arrPhone(0))%>>043</option>
									<option value="051" <%=fncSetSelectBox("051",arrPhone(0))%>>051</option>
									<option value="052" <%=fncSetSelectBox("052",arrPhone(0))%>>052</option>
									<option value="053" <%=fncSetSelectBox("053",arrPhone(0))%>>053</option>
									<option value="054" <%=fncSetSelectBox("054",arrPhone(0))%>>054</option>
									<option value="055" <%=fncSetSelectBox("055",arrPhone(0))%>>055</option>
									<option value="061" <%=fncSetSelectBox("061",arrPhone(0))%>>061</option>
									<option value="062" <%=fncSetSelectBox("062",arrPhone(0))%>>062</option>
									<option value="063" <%=fncSetSelectBox("063",arrPhone(0))%>>063</option>
									<option value="064" <%=fncSetSelectBox("064",arrPhone(0))%>>064</option>
									<option value="070" <%=fncSetSelectBox("070",arrPhone(0))%>>070</option>
								</select>
							</label>
							-
							<input type="text" name="phone_2" class="textarea" size="5" maxlength="4" value="<%=arrPhone(1)%>" valid="E|A=전화번호를 입력해 주세요"/>
							-
							<input type="text" name="phone_3" class="textarea" size="5" maxlength="4" value="<%=arrPhone(2)%>" valid="E|A=전화번호를 입력해 주세요"/>   
						</td>
					</tr>	  	  	    	  
					<tr>
						<td class="mjoin"><img src="/mobileweb/html/images/text_0015.jpg" width="61" /></td>
						<td><label>
						<%
							arrHp = Split(arrList(4,0),"-")
						%>
							<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
								<option value="">선택</option>
								<option value="010" <%=fncSetSelectBox("010",arrHp(0))%>>010</option>
								<option value="011" <%=fncSetSelectBox("011",arrHp(0))%>>011</option>
								<option value="016" <%=fncSetSelectBox("016",arrHp(0))%>>016</option>
								<option value="017" <%=fncSetSelectBox("017",arrHp(0))%>>017</option>
								<option value="018" <%=fncSetSelectBox("018",arrHp(0))%>>018</option>
								<option value="019" <%=fncSetSelectBox("019",arrHp(0))%>>019</option>
							</select>
						</label>
						-
						<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" value="<%=arrHp(1)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>
						-
						<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" value="<%=arrHp(2)%>" valid="E|A=핸드폰번호를 입력해 주세요"/>&nbsp;&nbsp;<br/>
						<input type="checkbox" name="check3" value="Y" <%=fncSetCheckBox("Y",arrList(11,0))%>/>SMS 수신동의	
					</td>
				</tr>
				<tr>
					<td class="mjoin"><img src="/mobileweb/html/images/text_0016.jpg" width="61" /></td>
					<td>
						<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" value="<%=Left(arrList(7,0),3)%>" readonly valid="E|A=우편번호를 입력해 주세요"/>
						-
						<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" value="<%=Right(arrList(7,0),3)%>" readonly valid="E|A=우편번호를 입력해 주세요"/>
						<!--&nbsp;&nbsp;<img src="/mobileweb/html/images/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onclick="fncOpenZip();" style="cursor:pointer;"/>-->
                        
                        <a onclick="fncOpenZip_layer()" style="cursor:pointer;"><img src="/mobileweb/html/images/bt_0004.jpg" width="107" height="28" border="0" /></a>
                        
                        
					</td>
				</tr>	
				<tr>
					<td>&nbsp;</td>
					<td><label>
						<input type="text" id="addr_1" name="addr_1" class="textarea" size="30" value="<%=arrList(8,0)%>" readonly valid="E|A=주소를 입력해 주세요"/>
					</label></td>
				</tr>	
				<tr>
					<td>&nbsp;</td>
					<td><label>
						<input type="text" name="addr_2" class="textarea" size="30" value="<%=arrList(9,0)%>" valid="E|A=상세주소를 입력해 주세요"/>&nbsp;&nbsp;
					</label></td>
				</tr>	
				<tr>
					<td class="mjoin"><img src="/mobileweb/html/images/text_0017.jpg" width="61" /></td>
					<td><label>
						<input type="text" name="email" class="textarea" size="30" value="<%=arrList(10,0)%>" valid="E|A=이메일 주소를 입력해 주세요"/>&nbsp;&nbsp;
						<input type="checkbox" name="check4" value="Y" <%=fncSetCheckBox("Y",arrList(12,0))%>/>이메일 수신동의 
					</label></td>
				</tr>
				</table>
			</td>	
		</tr>
		<tr>
			<td height="50">&nbsp;</td>
		</tr>   
		<tr>
			<td bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/mobileweb/html/images/text_0022.jpg" width="360" height="50" />
				<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">	  
				<tr>
					<td id="bt" class="mjoin"><img src="/mobileweb/html/images/text_0085.png" width="61" /></td>
					<td height="40">
						<select name="local" onchange="fncSetPart(this.value,'');" class="textarea" style="height:35px;">
							<option value="">지역</option>
						<%
							If IsArray(arrLocal) Then 
								For num = 0 To UBound(arrLocal,2)
						%>
							<option value="<%=arrLocal(0,num)%>" <%If local_nm = arrLocal(0,num) Then%>selected<%End If%>><%=arrLocal(0,num)%></option>
						<%
								Next 
							End If 
						%>
						</select>
						<select id="part" name="part" class="textarea" style="height:35px;">
							<option value="">지점</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="mjoin" width="74"><img src="/mobileweb/html/images/text_0018.jpg" width="61" /></td>
					<td width="400"><label>
						<%
						If Trim(arrList(13,0)) <> "" Then 
							Mchildbirth = Mid(arrList(13,0),5,2)
							If Mchildbirth < 10 Then Mchildbirth = Right(Mchildbirth,1)
							Dchildbirth = Right(arrList(13,0),2)
							If Dchildbirth < 10 Then Dchildbirth = Right(Dchildbirth,1)
						End If 
					%>
						<select name="childbirth_y" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">년</option>
						<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Left(arrList(13,0),4))%>><%=num%></option>
						<% Next %>
						</select>
						</label>
						<label>
						<select name="childbirth_m" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">월</option>
						<% For num=1 To 12 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Mchildbirth)%>><%=num%>월</option>
						<% Next %>
						</select>
						</label>
						<label>
						<select name="childbirth_d" valid="E|A=출산예정일을 선택해 주세요">
							<option value="">일</option>
						<% For num=1 To 31 %>
							<option value="<%=num%>" <%=fncSetSelectBox(num,Dchildbirth)%>><%=num%>일</option>
						<% Next %>
						</select>
					</label></td>
				</tr>	  	  
				<tr>
					<td class="mjoin"><img src="/mobileweb/html/images/text_0019.jpg" width="61" /></td>
					<td height="40"><label>
						<input type="radio" name="radio3" value="초산" <%=fncSetCheckBox("초산",arrList(14,0))%>/>초산&nbsp;&nbsp;
						<input type="radio" name="radio3" value="1명" <%=fncSetCheckBox("1명",arrList(14,0))%>/>1명&nbsp;&nbsp;
						<input type="radio" name="radio3" value="2명이상" <%=fncSetCheckBox("2명이상",arrList(14,0))%>/>2명이상
					</label></td>
				</tr>	  	  	    	  
				<tr>
					<td class="mjoin"><img src="/mobileweb/html/images/text_0020.jpg" width="61" /></td>
					<td height="40">
					<label>
						<input type="radio" name="radio4" value="바우처" <%=fncSetCheckBox("바우처",arrList(15,0))%>/>바우처&nbsp;&nbsp;
						<input type="radio" name="radio4" value="일반" <%=fncSetCheckBox("일반",arrList(15,0))%>/>일반  
					</label></td>
				</tr>
				</table>
			</td>	
		</tr>
		</form>
		<tr>
			<td style="padding-top:30px; padding-bottom:50px;">
				<div align="center" id="btn11">
					<div class="btn00"><img src="/mobileweb/html/images/bt_0003.jpg" width="110" border="0" id="btnSubmit" style="cursor:pointer;"/></div>
					<div class="btn00"><img src="/mobileweb/html/images/bt_0002.jpg" width="110" border="0" onclick="location.reload();" style="cursor:pointer;"/></div>
				</div>
			</td>	
		</tr>    
		</table>
	</td>
	</tr>
	</table>
      <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->	 
	</div> 
    
    <style type="text/css">
     #AreaZip{
	  width:100%; height:80%; background:#ffffff; color:#fff; 
	  position:fixed; top:60px; left:0px; text-align:center; 
	  border:2px solid #000;
	   }
 	 </style>



	 <!-- 우편번호 찾기 레이어 -->                  
     <div id="AreaZip" style="display:none;">
	 
	 
	 </div>
	 <!-- 우편번호 찾기 레이어 --> 
        
</body>    
<script>
	$('document').ready(function(){
    $('.menu').fixedMenu();
    });
</script>
<script type="text/javascript">
	$(document).ready(function(){			   
		$(".ani-bg").animate({
			marginTop:"75px"       
		}, 0 );	
	});
</script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				// Define any icon actions before calling the toolbar
				$('.toolbar-icons a').on('click', function( event ) {
					event.preventDefault();
				});
				$('#normal-button-bottom').toolbar({content: '#user-options', position: 'bottom'});
			});
</script>
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