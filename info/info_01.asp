<!-- ��ȯ������ ���� -->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script> 
<script type="text/javascript"> 
var _nasa={};
_nasa["cnv"] = wcs.cnv("5","10"); // ��ȯ����, ��ȯ��ġ �����ؾ���. ��ġ�Ŵ��� ����
</script> 
<!--#include virtual="/common/menu/head.asp"-->
<%


	event_local	= fncRequest("event_local")  '35

'-----------------------------------------------------------------------------
'	���� ���� ȣ��
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
							����
						</td>
						<td width="546"><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=5|T=�̸�|A=�̸��� �Է��� �ּ���"/>
						</label></td>
					</tr>
					<tr>
						<td class="consult-label">
<!-- 							<img src="/image/text_0013.jpg" width="74" height="20" /> -->
							��꿹����
						</td>
						<td><label>
							<input type="text" name="birth" id="birth" class="textarea datepicker" size="28" valid="E|A=��꿹������ ������ �ּ���" readonly>
						</label></td>
					</tr>	  
					<tr style="display:none">
						<td>
							<img src="/image/text_0014.jpg" width="74" height="20" />
						</td>
						<td>
							<label>
								<select name="phone_1" class="textarea" style="height:35px;">
									<option value="">����</option>
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
							�ڵ�����ȣ
						</td>
						<td>
							<label>
								<select name="hp_1" class="textarea" style="height:35px;" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
									<option value="">����</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</label>
							-
							<input type="text" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							-
							<input type="text" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
						</td>
					</tr>
					<tr>
						<td class="consult-label">
							�ּ�
							<!-- <img src="/image/text_0016.jpg" width="74" height="20" /> -->
						</td>
						<td>
							<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="7" readonly valid="E|A=�����ȣ�� �Է��� �ּ���"/>
							&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" onClick="fncOpenZip();" readonly valid="E|A=�ּҸ� �Է��� �ּ���"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=���ּҸ� �Է��� �ּ���"/>
							&nbsp;&nbsp;</label>
						</td>
					</tr>                    
                    <tr>
						<td class="consult-label">
<!-- 							<img src="/image/text_0085.png" /> -->
							��������
						</td>
						<td>
							<select name="local" onChange="fncSetPart(this.value);" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">����</option>
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
							<select id="part" name="part" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">��������</option>
							</select>
						</td>

					</tr>
					<tr>
						<td class="consult-label">
							<!-- <img src="/image/text_0052.jpg" width="103" height="19" /> -->
							��㳻��
						</td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=��㳻���� �Է��� �ּ���"></textarea>
						</label></td>
					</tr>	  	  
                    </table>	
                    
					
				</td>	
			</tr> 
			<tr>
				<td height="50" colspan="2">&nbsp;</td>
			</tr>   
<!-- 			2017.10.12 spacemonkey -->
<!-- 			: ����� ��û���� �ϴ� �������� ���� -->
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/text_0042.jpg" width="770" height="50" />
					<table width="750" border="0" align="center" cellpadding="0" cellspacing="10">	  
					<!-- <tr>
						<td><img src="/image/text_0043.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="checkbox" name="check1" value="���������α׷�" valid="E|A=��û���񽺸� ������ �ּ���"/>���������α׷�&nbsp;
								<input type="checkbox" name="check1" value="�����̾����α׷�" />�����̾����α׷�&nbsp;
								<input type="checkbox" name="check1" value="VIP���α׷�" />VIP���α׷�&nbsp;
								<input type="checkbox" name="check1" value="�����̺����α׷�" />�����̺����α׷�&nbsp;<br>
								<input type="checkbox" name="check1" value="��ü��" />��ü��&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="��ŷ��" />��ŷ��&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="35���̻�" />35���̻�&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="������������ ����" />������������ ������&nbsp;&nbsp;<br>
								<input type="checkbox" name="check1" value="�ٵ���" />�ٵ���&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="��� �� ����" />��� �� ����&nbsp;&nbsp;
								<input type="checkbox" name="check1" value="�ٿ�ó���α׷�" />�ٿ�ó���α׷�
							</label>
						</td>
					</tr> -->
					<!-- <tr>
						<td><img src="/image/text_0044.jpg" width="103" height="19" /></td>
						<td height="40">
							<label>
								<input type="radio" name="radio1" value="1��" valid="E|A=�̿�Ⱓ�� ������ �ּ���"/>1��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="2��" />2��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="3��" />3��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="4��" />4��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="6��" />6��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="8��" />8��&nbsp;&nbsp;
								<input type="radio" name="radio1" value="��Ÿ" />��Ÿ
							</label>
						</td>
					</tr> -->
					<tr>
						<td class="consult-label">
							�̿�����
							<!-- <img src="/image/text_0045.jpg" width="103" height="19" /> -->
						</td>
						<td height="40">
							<label>
							<input type="radio" name="radio2" value="����� ��5��" valid="E|A=�̿����¸� ������ �ּ���"/>����� + ��5��&nbsp;&nbsp;
                            <input type="radio" name="radio2" value="����� ��6��" />����� + ��6��&nbsp;&nbsp;
							<input type="radio" name="radio2" value="���� ��5��" />����&nbsp;&nbsp;
							</label>
						</td>
					</tr>	  	  	  
					<!-- <tr>
						<td width="109"><img src="/image/text_0046.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<input type="text" name="child_birth" id="child_birth" class="textarea datepicker" size="28" valid="E|A=��꿹������ ������ �ּ���" readonly>
						</label></td>
					</tr>	 
					<tr>
						<td width="109"><img src="/image/text_0047.jpg" width="103" height="19" /></td>
						<td width="511"><label>
							<input type="text" name="service_start" id="service_start" class="textarea datepicker" size="28" valid="E|A=���񽺽��� �������� ������ �ּ���" readonly>
						</label></td>
					</tr>	 	   	   -->
					<tr>
						<td class="consult-label">
							�������̿�
							<!-- <img src="/image/text_0048.jpg" width="103" height="19" /> -->
						</td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="�̿���" valid="E|A=������ �̿뿩�θ� ������ �ּ���"/>�̿���&nbsp;&nbsp;
							(<input type="radio" name="radio3_1" value="1��" disabled/>1��
							<input type="radio" name="radio3_1" value="2��" disabled/>2��
							<input type="radio" name="radio3_1" value="3��" disabled/>3��
							<input type="radio" name="radio3_1" value="4���̻�" disabled/>4���̻�)
							<input type="radio" name="radio3" value="�̿����" />�̿����
							<input type="radio" name="radio3" value="��" />��
						</label></td>
					</tr>	  	  	    	  
					<!-- <tr>
						<td><img src="/image/text_0049.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="radio" name="radio4" value="�ʻ��" valid="E|A=�������� ������ �ּ���"/>�ʻ��&nbsp;&nbsp;
							<input type="radio" name="radio4" value="����" />���� 
						</label></td>
					</tr>
					<tr>
						<td><img src="/image/text_0050.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check2" value="����" valid="E|A=Ư�̻����� ������ �ּ���" />����&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="�ٵ���" />�ٵ���&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="�ӽż� �索" />�ӽż� �索 &nbsp;&nbsp;
							<input type="checkbox" name="check2" value="����" />����&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="������" />������
						</label></td>
					</tr>	  
					<tr>
						<td><img src="/image/text_0051.jpg" width="103" height="19" /></td>
						<td height="40"><label>
							<input type="checkbox" name="check3" value="�θ��" valid="E|A=���������� ������ �ּ���"/>�θ��&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="����" />���� &nbsp;&nbsp;
							<input type="checkbox" name="check3" value="ū���� 1��" />ū���� 1��&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="ū���� 2���̻�" />ū���� 2���̻�&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="��Ÿ����" />��Ÿ����
						</label></td>
					</tr>	
					<tr>
						<td><img src="/image/text_0052.jpg" width="103" height="19" /></td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=��㳻���� �Է��� �ּ���"></textarea>
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
						<input type="checkbox" name="check4" value="Y" valid="E|A=�̿����� ������ �ּ���"/>
					</label>
					���� ����� �����մϴ�.
				</td>	
				<td width="370" style="padding-top:30px; padding-bottom:40px;"><img src="/image/text_0006.jpg" width="137" height="18" /><br /><br />
					<textarea class="textarea3"><!--#include virtual="/member/info.html"--></textarea>
					<br /><br />
					<label>
						<input type="checkbox" name="check5" value="Y" valid="E|A=�������� ��޹�ħ�� ������ �ּ���"/>
					</label>
					���� �������� ���� �� �̿뿡 �����մϴ�. 
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
		  minDate: '-100y', // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
		   yearRange: 'c-100:c+30', // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
		  monthNamesShort : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
		  monthNames : ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��']
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

		if (radio3 == "�̿���") {
			if (radio3_1 == undefined) {
				alert("���������� �̿�Ⱓ�� ������ �ּ���.");
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
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

				// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				var fullAddr = ''; // ���� �ּ� ����
				var extraAddr = ''; // ������ �ּ� ����

				// ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
				if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
					fullAddr = data.roadAddress;

				} else { // ����ڰ� ���� �ּҸ� �������� ���(J)
					fullAddr = data.jibunAddress;
				}

				// ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
				if(data.userSelectedType === 'R'){
					//���������� ���� ��� �߰��Ѵ�.
					if(data.bname !== ''){
						extraAddr += data.bname;
					}
					// �ǹ����� ���� ��� �߰��Ѵ�.
					if(data.buildingName !== ''){
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
					fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
				}

				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				if (data.postcode == "") {
					$("#post_1").val(data.zonecode); //5�ڸ� �������ȣ ���
				} else {
					$("#post_1").val(data.postcode);
				}

				$("#addr_1").val(fullAddr);

				// Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
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
