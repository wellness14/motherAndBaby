<!-- 전환페이지 설정 -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
<script type="text/javascript"> 
var _nasa={};
_nasa["cnv"] = wcs.cnv("5","10"); // 전환유형, 전환가치 설정해야함. 설치매뉴얼 참고
</script> 
<!--#include virtual="/common/menu/head.asp"-->
<%


	event_local	= fncRequest("event_local")  '35

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

channel = request("channel")

If channel = "" Then
	channel = "menu"
End If
%>


<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
		<form id="oFrm" name="oFrm" method="post">
		<input type="hidden" name="mode" value="ins">
		<input type="hidden" name="mOne" value="<%=mOne%>">
		<input type="hidden" name="mTwo" value="<%=mTwo%>">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" style="padding-top:40px;"><img src="/image/sub03_subtitle01.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td colspan="2"><img src="/image/text_0040.jpg" /></td>
			</tr>  
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;">
					<img src="/image/text_0041.jpg" width="770" height="50" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="74" class="consult-label">
<!-- 							<img src="/image/text_0011.jpg" width="74" height="20" /> -->
							성명
						</td>
						<td width="546"><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=5|T=이름|A=이름을 입력해 주세요"/>
						</label></td>
					</tr>
					<tr>
						<td class="consult-label">
<!-- 							<img src="/image/text_0013.jpg" width="74" height="20" /> -->
							출산예정일
						</td>
						<td><label>
							<input type="text" name="birth" id="birth" class="textarea datepicker" size="28" valid="E|A=출산예정일을 선택해 주세요" readonly>
						</label></td>
					</tr>	  
					<tr style="display:none">
						<td>
							<img src="/image/text_0014.jpg" width="74" height="20" />
						</td>
						<td>
							<label>
								<select name="phone_1" class="textarea" style="height:35px;">
									<option value="">선택</option>
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="070">070</option>
								</select>
							</label>
							-
							<input type="text" name="phone_2" class="textarea" size="5" maxlength="4"/>
							-
							<input type="text" name="phone_3" class="textarea" size="5" maxlength="4"/>
						</td>
					</tr>	  	  	    	  
					<tr>
						<td class="consult-label">
<!-- 							<img src="/image/text_0015.jpg" width="74" height="20" /> -->
							핸드폰번호
						</td>
						<td>
							<label>
								<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=핸드폰번호를 선택해 주세요">
									<option value="">선택</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</label>
							-
							<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
							-
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=핸드폰번호를 입력해 주세요"/>
						</td>
					</tr>
					<tr>
						<td class="consult-label">
							주소
							<!-- <img src="/image/text_0016.jpg" width="74" height="20" /> -->
						</td>
						<td>
							<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="7" readonly valid="E|A=우편번호를 입력해 주세요"/>
							&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" onClick="fncOpenZip();" readonly valid="E|A=주소를 입력해 주세요"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=상세주소를 입력해 주세요"/>
							&nbsp;&nbsp;</label>
						</td>
					</tr>                    
                    <tr>
						<td class="consult-label">
<!-- 							<img src="/image/text_0085.png" /> -->
							지점선택
						</td>
						<td>
							<select name="local" onChange="fncSetPart(this.value);" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지역</option>
								<!-- 									For num = 0 To UBound(arrLocal,2)       -->
								<!-- 									Next -->
							<%
								If IsArray(arrLocal) Then 
							%>
								<option value="<%=arrLocal(0,3)%>"><%=arrLocal(0,3)%></option>
								<option value="<%=arrLocal(0,0)%>"><%=arrLocal(0,0)%></option>
								<option value="<%=arrLocal(0,4)%>"><%=arrLocal(0,4)%></option>
								<option value="<%=arrLocal(0,1)%>"><%=arrLocal(0,1)%></option>
								<option value="<%=arrLocal(0,5)%>"><%=arrLocal(0,5)%></option>
							<%

								End If 
							%>
							</select>
							<select id="part" name="part" valid="E|A=지점을 선택해 주세요" style="height:35px;">
								<option value="">지점선택</option>
							</select>
						</td>

					</tr>
					<tr>
						<td class="consult-label">
							<!-- <img src="/image/text_0052.jpg" width="103" height="19" /> -->
							상담내용
						</td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=상담내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>	  	  
                    </table>	
                    
					
				</td>	
			</tr> 
			<tr>
				<td height="50" colspan="2">&nbsp;</td>
			</tr>   
<!-- 			2017.10.12 spacemonkey -->
<!-- 			: 차장님 요청으로 하단 서비스정보 감춤 -->
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0042.jpg" width="770" height="50" />
					<table width="750" border="0" align="center" cellpadding="0" cellspacing="10">	  
					<!-- <tr>
						<td><img src="/image/text_0043.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="checkbox" name="check1" value="베이직프로그램" valid="E|A=신청서비스를 선택해 주세요"/>베이직프로그램&nbsp;
								<input type="checkbox" name="check1" value="프리미엄프로그램" />프리미엄프로그램&nbsp;
								<input type="checkbox" name="check1" value="VIP프로그램" />VIP프로그램&nbsp;
								<input type="checkbox" name="check1" value="프라이빗프로그램" />프라이빗프로그램&nbsp;<br>
								<input type="checkbox" name="check1" value="과체중" />과체중&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="워킹맘" />워킹맘&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="35세이상" />35세이상&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="산후조리원을 내집" />산후조리원을 내집에&nbsp;&nbsp;<br>
								<input type="checkbox" name="check1" value="다둥이" />다둥이&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="상담 후 결정" />상담 후 결정&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="바우처프로그램" />바우처프로그램
							</label>
						</td>
					</tr> -->
					<!-- <tr>
						<td><img src="/image/text_0044.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="radio" name="radio1" value="1주" valid="E|A=이용기간을 선택해 주세요"/>1주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="2주" />2주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="3주" />3주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="4주" />4주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="6주" />6주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="8주" />8주&nbsp;&nbsp;
								<input type="radio" name="radio1" value="기타" />기타
							</label>
						</td>
					</tr> -->
					<tr>
						<td class="consult-label">
							이용형태
							<!-- <img src="/image/text_0045.jpg" width="103" height="19" /> -->
						</td>
						<td height="40">
							<label>
							<input type="radio" name="radio2" value="출퇴근 주5일" valid="E|A=이용형태를 선택해 주세요"/>출퇴근 + 주5일&nbsp;&nbsp;
                            <input type="radio" name="radio2" value="출퇴근 주6일" />출퇴근 + 주6일&nbsp;&nbsp;
							<input type="radio" name="radio2" value="입주 주5일" />입주&nbsp;&nbsp;
							</label>
						</td>
					</tr>	  	  	  
					<!-- <tr>
						<td width="109"><img src="/image/text_0046.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<input type="text" name="child_birth" id="child_birth" class="textarea datepicker" size="28" valid="E|A=출산예정일을 선택해 주세요" readonly>
						</label></td>
					</tr>	 
					<tr>
						<td width="109"><img src="/image/text_0047.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<input type="text" name="service_start" id="service_start" class="textarea datepicker" size="28" valid="E|A=서비스시작 예정일을 선택해 주세요" readonly>
						</label></td>
					</tr>	 	   	   -->
					<tr>
						<td class="consult-label">
							조리원이용
							<!-- <img src="/image/text_0048.jpg" width="103" height="19" /> -->
						</td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="이용함" valid="E|A=조리원 이용여부를 선택해 주세요"/>이용함&nbsp;&nbsp;
							(<input type="radio" name="radio3_1" value="1주" disabled/>1주
							<input type="radio" name="radio3_1" value="2주" disabled/>2주
							<input type="radio" name="radio3_1" value="3주" disabled/>3주
							<input type="radio" name="radio3_1" value="4주이상" disabled/>4주이상)
							<input type="radio" name="radio3" value="이용안함" />이용안함
							<input type="radio" name="radio3" value="모름" />모름
						</label></td>
					</tr>	  	  	    	  
					<!-- <tr>
						<td><img src="/image/text_0049.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="radio" name="radio4" value="초산모" valid="E|A=출산경험을 선택해 주세요"/>초산모&nbsp;&nbsp;
							<input type="radio" name="radio4" value="경산모" />경산모 
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0050.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check2" value="없음" valid="E|A=특이사항을 선택해 주세요" />없음&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="다둥이" />다둥이&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="임신성 당뇨" />임신성 당뇨 &nbsp;&nbsp;
							<input type="checkbox" name="check2" value="부종" />부종&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="고혈압" />고혈압
						</label></td>
					</tr>	  
					<tr>
						<td><img src="/image/text_0051.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check3" value="부모님" valid="E|A=가족사항을 선택해 주세요"/>부모님&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="남편" />남편 &nbsp;&nbsp;
							<input type="checkbox" name="check3" value="큰아이 1명" />큰아이 1명&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="큰아이 2명이상" />큰아이 2명이상&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="기타가족" />기타가족
						</label></td>
					</tr>	
					<tr>
						<td><img src="/image/text_0052.jpg" width="103" height="19" /></td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=상담내용을 입력해 주세요"></textarea>
						</label></td>
					</tr>	 -->  	  
					</table>
				</td>	
			</tr>   
			<tr>
				<td width="400" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0005.jpg" width="78" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include virtual="/member/service.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check4" value="Y" valid="E|A=이용약관을 선택해 주세요"/>
					</label>
					위의 약관에 동의합니다.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include virtual="/member/info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check5" value="Y" valid="E|A=개인정보 취급방침을 선택해 주세요"/>
					</label>
					위의 개인정보 수집 및 이용에 동의합니다. 
				</td>
			</tr>
			<tr>
				<td colspan="2" style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/bt_0014.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
						<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onClick="location.reload();" style="cursor:pointer;"/>
					</div>
				</td>	
			</tr>    
			</table>
		</form>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
<script> 
$(document).ready(function() {	   
	$( ".datepicker" ).datepicker({
		  dateFormat: 'yy-mm-dd',
		  changeMonth: true, 
		  changeYear: true,
		  minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.
		   yearRange: 'c-100:c+30', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		  monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	}); 
});
</script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if (!checkForm(frm,tar)){ return false }

		var radio3 = $(':radio[name="radio3"]:checked').val();
		var radio3_1 = $(':radio[name="radio3_1"]:checked').val();

		if (radio3 == "이용함") {
			if (radio3_1 == undefined) {
				alert("산후조리원 이용기간을 선택해 주세요.");
				$(':radio[name="radio3_1"]:eq(0)').focus();
				return false;
			}
		}

		frm.submit();
	});

	frm.submit(function(){
		var channel = "<%=channel%>";

		consultResult(channel);
	}).attr({
		"target" : "ifrm",
		"action" : "./info_01_sql.asp?<%=strLnkUrl%>"
	});

	$(':radio[name="radio3"]:eq(0)').click(function() {
		$(':radio[name="radio3_1"]').attr("disabled", false);
	});

	$(':radio[name="radio3"]:eq(1)').click(function() {
		$(':radio[name="radio3_1"]').attr("checked", false);
		$(':radio[name="radio3_1"]').attr("disabled", true);
	});

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function fncOpenZip(){
		//window.open("/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
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
				if (data.postcode == "") {
					$("#post_1").val(data.zonecode); //5자리 새우편번호 사용
				} else {
					$("#post_1").val(data.postcode);
				}

				$("#addr_1").val(fullAddr);

				// 커서를 상세주소 필드로 이동한다.
				$("#addr_2").val("");
				$("#addr_2").focus();
			}
		}).open();
	}
</script>



<script type="text/javascript" src="/common/js/ajax_common.js"></script>




<script type="text/javascript">
	function fncSetPart(val){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val,"#part");
	}
</script>

</html>
