<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		
		<form id="oFrm" name="oFrm" method="post">
		<input type="hidden" id="mode" name="mode" value="">
		<input type="hidden" id="totlachange" name="totlachange" value="">
		<input type="hidden" id="mo_idx" name="mo_idx" value="">
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub02_subtitle03.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td><img src="/image/text_0056.jpg" /></td>	
			</tr>
			<tr>
				<td bgcolor="#f6f6f6" style="padding-top:20px; padding-bottom:20px;">
					<table width="750" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="203" height="60"><img src="/image/text_0057.jpg" /></td>
						<td colspan="2">
							<select name="Ybirth" class="textarea" style="height:35px;" valid="E|A=��������� ������ �ּ���">
								<option value="">��</option>
							<% For num=Year(DateAdd("yyyy", 2, Date())) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="Mbirth" class="textarea" style="height:35px;" valid="E|A=��������� ������ �ּ���">
								<option value="">��</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="Dbirth" class="textarea" style="height:35px;" valid="E|A=��������� ������ �ּ���">
								<option value="">��</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</td>
					</tr>
					<tr>
						<td width="203" height="60"><img src="/image/text_0069.jpg" /></td>
						<td colspan="2">
							<select name="childbirth_y" class="textarea" style="height:35px;" valid="E|A=��꿹������ ������ �ּ���">
								<option value="">��</option>
							<% For num=Year(DateAdd("yyyy", 2, Date())) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="childbirth_m" class="textarea" style="height:35px;" valid="E|A=��꿹������ �Է��� �ּ���">
								<option value="">��</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="childbirth_d" class="textarea" style="height:35px;" valid="E|A=��꿹������ �Է��� �ּ���">
								<option value="">��</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</td>
					</tr>	  
					<tr>
						<td width="203" height="60"><img src="/image/text_0068.jpg" /></td>
						<td colspan="2">
							<select name="marry_y" class="textarea" style="height:35px;" valid="E|A=��ȥ������� ������ �ּ���">
								<option value="">��</option>
							<% For num=Year(DateAdd("yyyy", 2, Date())) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="marry_m" class="textarea" style="height:35px;" valid="E|A=��ȥ������� �Է��� �ּ���">
								<option value="">��</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="marry_d" class="textarea" style="height:35px;" valid="E|A=��ȥ������� �Է��� �ּ���">
								<option value="">��</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</td>
					</tr>	  	  
					<tr>
						<td height="60"><img src="/image/text_0058.jpg" /></td>
						<td colspan="2">
							<input type="radio" name="radio1" value="�ʻ�" valid="E|A=�������� ������ �ּ���"/>�ʻ��&nbsp;&nbsp;
							<input type="radio" name="radio1" value="���" />���� 
						</td>
					</tr>	

					<tr>
						<td height="60"><img src="/image/text_0059.jpg" /></td>
						<td colspan="2">
							<input type="radio" name="radio2" value="����" valid="E|A=ù���������� ������ �ּ���"/> ����&nbsp;&nbsp;
							<input type="radio" name="radio2" value="1��" /> 1��&nbsp;&nbsp;
							<input type="radio" name="radio2" value="2��" /> 2��&nbsp;&nbsp;
							<input type="radio" name="radio2" value="3�� �̻�" /> 3�� �̻�
						</td>
					</tr>	
					<tr>
						<td height="60"><img src="/image/text_0060.jpg" /></td>
						<td colspan="2">
							<input type="radio" name="radio3" value="�̿���" valid="E|A=������ �̿뿩�θ� ������ �ּ���"/> �̿���&nbsp;&nbsp;
							<input type="radio" name="radio3" value="�̿����" /> �̿����
						</td>
					</tr>	
					<tr>
						<td height="60"><img src="/image/text_0070.jpg" /></td>
						<td colspan="2">
							<input type="radio" name="radio4" value="�ڿ��и�" valid="E|A=�и����¸� ������ �ּ���"/> �ڿ��и�&nbsp;&nbsp;
							<input type="radio" name="radio4" value="��������" /> �������� 
						</td>
					</tr>		  	
					<tr>
						<td height="60"><img src="/image/text_0061.jpg" /></td>
						<td colspan="2">
							<input type="radio" name="radio5" value="���Ƹ�" valid="E|A=���������� ������ �ּ���"/> ���Ƹ�&nbsp;&nbsp;
							<input type="radio" name="radio5" value="��ŷ��" /> ��ŷ�� 
						</td>
					</tr>		    	    
					<tr>
						<td height="60"><img src="/image/text_0062.jpg" /></td>
						<td width="102">
							<input type="text" name="txt1" class="textarea txtArea" size="4" maxlength="2" style="ime-mode:disabled;" valid="E|A=���� �ּ��� �Է��� �ּ���"/> ��
						</td>
						<td width="405">
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0��</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">40��</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0063.jpg" /></td>
						<td>
							<input type="text" name="txt2" class="textarea txtArea" size="4" maxlength="3" style="ime-mode:disabled;" valid="E|A=Ű�� �Է��� �ּ���"/> cm
						</td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">1m</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">2m</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0064.jpg" /></td>
						<td>
							<input type="text" name="txt3" class="textarea txtArea" size="4" maxlength="3" style="ime-mode:disabled;" valid="E|A=�ӽ��� �����Ը� �Է��� �ּ���"/> kg
						</td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="60"><img src="/image/text_0065.jpg" /></td>
						<td>
							<input type="text" name="txt4" class="textarea txtArea" size="4" maxlength="3" style="ime-mode:disabled;" valid="E|A=���� �����Ը� �Է��� �ּ���"/> kg
						</td>
						<td>
							<table width="370" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="300" bgcolor="#d7d7d7"><img src="/image/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
						</td>
					</tr>
					</table>
				</td>	
			</tr>
			<tr>
				<td style="padding-top:30px; padding-bottom:30px;"><div align="center"><img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnCheck" style="cursor:pointer;"/></div></td>	
			</tr>    
			</table>
			
			<table id="serviceArea" width="770" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none;">
			<tr>
				<td height='60' colspan='2'><img src='/image/img_0010.jpg' width='770' height='7' /></td>
			</tr>
			<tr id="serviceInfo"></tr>
			<tr>
				<td height='70' colspan='2'><img src='/image/text_0073.jpg' /></td>
			</tr>
			<tr>
				<td colspan='2' bgcolor='#f6f6f6' style='padding-top:15px; padding-bottom:15px;'>
					<table width='700' border='0' align='center' cellpadding='0' cellspacing='0'>
					<tr>
						<td width='163' height='50'><img src='/image/text_0074.jpg' /></td>
						<td width='188'>
							<select name='sel1' class='textarea' style='height:35px;'>
								<option value="">����</option>
							<% For num=1 To 20%>
								<option value="<%=num%>"><%=num%>ȸ</option>
							<% Next %>
							</select>
						</td>
						<td width='161'><img src='/image/text_0079.jpg' /></td>
						<td width='188'><span style='font-weight:bold; color:#000000'>����û</span></td>
					</tr>
					<tr>
						<td height='50'><img src='/image/text_0075.jpg' /></td>
						<td>
							<select name='sel2' class='textarea' style='height:35px;'>
								<option value="N">���þ���</option>
								<option value="Y">����</option>
							</select>
						</td>
						<td><img src='/image/text_0080.jpg' /></td>
						<td>
							<select name='sel3' class='textarea' style='height:35px;'>
								<option value="N">���þ���</option>
								<option value="Y">����</option>
							</select>
						</td>
					</tr>
					<tr>
						<td height='50'><img src='/image/text_0076.jpg' /></td>
						<td>
							<select name='sel4' class='textarea' style='height:35px;'>
								<option value="N">���þ���</option>
								<option value="Y">����</option>
							</select>
						</td>
						<td><img src='/image/text_0081.jpg' /></td>
						<td>
							<select name='sel5' class='textarea' style='height:35px;'>
								<option value="N">���þ���</option>
								<option value="Y">����</option>
							</select>
						</td>
					</tr>
					<tr>
						<td height='50'><img src='/image/text_0077.jpg' /></td>
						<td><span style='font-weight:bold; color:#000000'>����û</span></td>
						<td><img src='/image/text_0082.jpg' /></td>
						<td><span style='font-weight:bold; color:#000000'>����û</span></td>
					</tr>
					<tr>
						<td height='50'><img src='/image/text_0078.jpg' /></td>
						<td>
							<select name='sel6' class='textarea' style='height:35px;'>
								<option value="N">���þ���</option>
								<option value="Y">����</option>
							</select>
						</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan='2'style='padding-top:30px; padding-bottom:30px;'><div align='center'><img src='/image/bt_0003.jpg' width='150' height='40' border='0' id="btnFinal" style="cursor:pointer;"/></div></td>
			</tr>		
			</table>

			<table id="finalArea" width="770" border="0" align="center" cellpadding="0" cellspacing="0" style="display:none;">
			<tr>
				<td height="60" colspan="2"><img src="/image/img_0010.jpg" width="770" height="7" /></td>
			</tr>
			<tr id="serviceFinal"></tr>
			<tr>
				<td colspan="2" style="padding-top:15px; padding-bottom:15px;"><div align="center"><img src="/image/text_0083.jpg" /></div></td>
			</tr>
			<tr>
				<td colspan="2"style="padding-top:30px; padding-bottom:80px;"><div align="center"><img src="/image/bt_0030.jpg" border="0" id="btnSubmit" style="cursor:pointer;"/></div></td>
			</tr>
			</table>
		</td>
		</form>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
<script type="text/javascript">
	var frm = jQuery("#oFrm");
	var tar	= jQuery("*[valid]");
	var btnFinal = jQuery("#btnFinal");
	var btnCheck = jQuery("#btnCheck");
	var btnSubmit = jQuery("#btnSubmit");

	btnSubmit.click(function(){
		if ("<%=uid%>" == ""){
			alert("�α��� �� ��밡���մϴ�.");
			return false;
		}
		if (!checkForm(frm,tar)){ return false }
		jQuery("#totlachange").val(jQuery("#total").val());
		jQuery("#mo_idx").val(jQuery("#service").val());
		jQuery("#mode").val("ins");
		frm.submit();
	});

	btnFinal.click(function(){
		if (!checkForm(frm,tar)){ return false }
		jQuery("#mode").val("type2");
		frm.submit();
	});

	btnCheck.click(function(){
		if (!checkForm(frm,tar)){ return false }
		jQuery("#mode").val("type1");
		frm.submit();
	});

	frm.submit(function(){
	}).attr({
		"target" : "ifrm",
		"action" : "/service/service_03_ax.asp?<%=strLnkUrl%>"
	});

	function fncSetServiceInfo(html){
		tar = jQuery("#serviceInfo");
		if (html != ""){
			jQuery("#serviceArea").show();
			tar.html(html);
		}
	}

	function fncSetServiceFinal(html){
		tar = jQuery("#serviceFinal");
		if (html != ""){
			jQuery("#finalArea").show();
			tar.html(html);
		}
	}

	var txtArea = jQuery(".txtArea");
	var txtImg = jQuery(".txtImg");

	txtArea.keyup(function(){
		num = txtArea.index(this);
		val = txtArea.eq(num).val();
		if (num ==0){
			if (val > 40){ val = 40; }
			val = val * 7.5;
		}else{
			if (val > 200){ val = 200; }
			val = val * 1.5;
		}
		txtImg.eq(num).attr({"width":val});
	});
</script>
</html>
