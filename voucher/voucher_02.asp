<!DOCTYPE html>
<html>
<head>

<title>voucher info</title>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
<style>
/* ȭ�� ���� 0�ȼ�~767�ȼ�*/
@media screen and (max-width: 767px){

}

/* ȭ�� ���� 768�ȼ�~959�ȼ�*/
@media screen and (min-width: 768px) and (max-width: 959px) {

}

/* ȭ�� ���� 960�ȼ�~�����ȼ�*/
@media screen and (min-width: 960px) {

}
</style>
</head>


<%
mOne = 2
mTwo = 2
%>
<!--#include virtual="/common/menu/head.asp"-->
<!--#include virtual="/voucher/voucher_top.asp"-->
<body>




	 
	<!--#include virtual="/voucher/voucher_left.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0px;">
	<tr>
		

		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">

		
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub03_subtitle03.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td style="padding-bottom:50px;">
				<img src="/image/sub_0010_voucher.jpg" border="0" /></td>
			</tr>

		</table>


<!--�⺻ ����-->



	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
	
		<td width="850" valign="top">
		
		<table width="770" border="0" align="center" cellpadding="0" cellspacing="0"style="margin-bottom:40px;">

			

				<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/voucher_text_01.jpg" width="770" height="49" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					
					<tr>

					<!--����-->

						<td><img src="/image/voucher_text_02.jpg" width="74" height="20" /></td>
						<td><label>
							<input type="text" name="mem_nm" class="textarea" size="35" valid="E|M=10|T=����|A=������ �Է��� �ּ���"/>
						</label></td>
					</tr>	

					<!--�������-->
				<tr>
						<td><img src="/image/voucher_text_04.jpg" width="74" height="20" /></td>
						<td><label>
							<select name="Ybirth" class="textarea" style="height:35px;" valid="E|A=��������� ������ �ּ���">
								<option value="">��</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
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
						</label></td>
					</tr>	  	  
					<tr>


					<tr>

					<!--����-->
						<td><img src="/image/voucher_text_03.jpg" width="74" height="20" /></td>
						<td height="40"><label>
							<input type="radio" name="radio1" value="2" valid="E|A=������ ������ �ּ���"/>����
							<input type="radio" name="radio1" value="1" />����
						</label></td>
					</tr>	 
					

						
						<!--�޴���-->
					<tr>
						<td><img src="/image/voucher_text_06.jpg" width="74" height="20" /></td>
						<td><label>
								<select id="hp_1" name="hp_1" class="textarea" style="height:35px;" valid="E|A=�ڵ�����ȣ�� ������ �ּ���">
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
							<input type="text" id="hp_2" name="hp_2" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>
							-
							<input type="text" id="hp_3" name="hp_3" class="textarea" size="5" maxlength="4" valid="E|A=�ڵ�����ȣ�� �Է��� �ּ���"/>&nbsp;&nbsp;
							<!--<input type="checkbox" name="check3" value="Y" />SMS ���ŵ���	-->	
						</td>
					</tr>



					 <!--�Ϲ���ȭ--> 	  
					<tr>
					<td><img src="/image/voucher_text_05.jpg" width="74" height="20" /></td>
						<td><label>
								<select name="phone_1" id="phone_1" class="textarea" style="height:35px;" valid="E|A=��ȭ��ȣ�� ������ �ּ���">
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
							<input type="text" name="phone_2" class="textarea" size="5" maxlength="4" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>
							-
							<input type="text" name="phone_3" class="textarea" size="5" maxlength="4" valid="E|A=��ȭ��ȣ�� �Է��� �ּ���"/>       
						</td>
					</tr>	
					
					
					
					<!--�ּ�-->
					<tr>
						<td><img src="/image/voucher_text_07.jpg" width="74" height="20" /></td>
						<td>
							<input type="text" id="post_1" name="post_1" class="textarea" size="5" maxlength="3" readonly valid="E|A=�����ȣ�� �Է��� �ּ���"/>
							-
							<input type="text" id="post_2" name="post_2" class="textarea" size="5" maxlength="3" readonly valid="E|A=�����ȣ�� �Է��� �ּ���"/>
							&nbsp;&nbsp;<img src="/image/bt_0004.jpg" width="107" height="28" border="0" align="absmiddle" onClick="fncOpenZip();" style="cursor:pointer;"/>
						</td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>z
							<input type="text" id="addr_1" name="addr_1" class="textarea" size="60" onClick="fncOpenZip();" readonly valid="E|A=�ּҸ� �Է��� �ּ���"/>
						</label></td>
					</tr>	
					<tr>
						<td>&nbsp;</td>
						<td><label>
							<input type="text" name="addr_2" class="textarea" size="35" valid="E|A=���ּҸ� �Է��� �ּ���"/>&nbsp;&nbsp;
						</label></td>
					</tr>
					
					</table>
				</td>	
			</tr>

	</table>

<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr>
	
		<td width="850" valign="top">
		
		<table width="770" border="0" align="center" cellpadding="0" cellspacing="0"style="margin-bottom:40px;">
			<tr>
				<td width="200" style="padding-top:30px; padding-bottom:5px;"><img src="/image/voucher_text_001.jpg" align="right;"  />
				</td>
			</tr>
			<table width="600" border="0" align="center" cellpadding="0" cellspacing="0"style="margin-bottom:40px;">
			<tr>
				<td width="350" style="padding-top:30px; padding-bottom:40px; "><img src="/image/voucher_text_20.jpg" width="200" height="81"align="right;" /><br /><br />
					<br />
					<label>
						<input type="checkbox" name="check4" value="Y" valid="E|A=�̿����� ������ �ּ���"/>
					</label>
					���� ����� �����մϴ�.
				</td>	
				<td width="350" style="padding-top:30px; padding-bottom:40px;align:right;"><img src="/image/voucher_text_21.jpg" width="200" height="81" /><br /><br />
				
					<br />
					<label>
						<input type="checkbox" name="check5" value="Y" valid="E|A=�������� ��޹�ħ�� ������ �ּ���"/>
					</label>
					���� �������� ���� �� �̿뿡 �����մϴ�. 
				</td>
			</tr>
		
		</table>
		</td>	
	</tr>
</table>




<!--�����̿��� ���� ����-->

	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
	
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">

			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-bottom:20px;"><img src="/image/voucher_text_08.jpg" width="770" height="50" />
					<table width="650" border="0" align="center" cellpadding="0" cellspacing="10">
					
						 

					
						<!--���񽺼���-->
						
						<td   width="74" height="20" ><img src="/image/voucher_text_09.jpg"/></td>
						<td>
							
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
							<select id="part" name="part" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">���񽺼���</option>
							</select>
						</td>
					</tr>
					<tr>
						<!--�̿�Ⱓ-->
						<td width="74" height="20"><img src="/image/voucher_text_10.jpg" /></td>
						<td>
							
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
							<select id="part" name="part" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">�̿�Ⱓ����</option>
							</select>
						</td>
					</tr>	  
					<tr>
						<!--�̿�����-->
						<td  width="74" height="20"><img src="/image/voucher_text_11.jpg" /></td>
						<td>
							
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
							<select id="part" name="part" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">�̿����¼���</option>
							</select>
						</td>
						
					</tr>	  	  
					
					<tr>
						<!--��꿹����-->
						<td width="74" height="20"><img src="/image/voucher_text_12.jpg"  /></td>
						<td width="511"><label>
							<select name="childbirth_y" class="textarea" style="height:35px;" valid="E|A=��꿹������ ������ �ּ���">
								<option value="">��</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="childbirth_m" class="textarea" style="height:35px;" valid="E|A=��꿹������ ������ �ּ���">
								<option value="">��</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="childbirth_d" class="textarea" style="height:35px;" valid="E|A=��꿹������ ������ �ּ���">
								<option value="">��</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</label></td>
					</tr>	 
					
					

					<tr>
						<!--���������-->
						<td  width="74" height="20"><img src="/image/voucher_text_13.jpg"  /></td>
						<td width="511"><label>
							<select name="serviceDt_y" class="textarea" style="height:35px;" valid="E|A=���񽺽��� �������� ������ �ּ���">
								<option>��</option>
							<% For num=Year(Date()) To Year(DateAdd("yyyy",2,Date())) %>
								<option value="<%=num%>"><%=num%></option>
							<% Next %>
							</select>
							<select name="serviceDt_m" class="textarea" style="height:35px;" valid="E|A=���񽺽��� �������� ������ �ּ���">
								<option>��</option>
							<% For num=1 To 12 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
							<select name="serviceDt_d" class="textarea" style="height:35px;" valid="E|A=���񽺽��� �������� ������ �ּ���">
								<option>��</option>
							<% For num=1 To 31 %>
								<option value="<%=num%>"><%=num%>��</option>
							<% Next %>
							</select>
						</label></td>
					</tr>		


					<tr>
					<!--��������-->
						<td width="74" height="20"><img src="/image/voucher_text_14.jpg" w /></td>
						<td>
							<select name="local" onChange="fncSetPart(this.value);" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">����</option>
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
							<select id="part" name="part" valid="E|A=������ ������ �ּ���" style="height:35px;">
								<option value="">��������</option>
							</select>
						</td>
					</tr>

					
					
					<tr>
					<!--�������̿�-->
						<td width="74" height="20"><img src="/image/voucher_text_15.jpg"  /></td>
						<td height="40"><label>
							<input type="radio" name="radio3" value="�̿���" valid="E|A=������ �̿뿩�θ� ������ �ּ���"/>�̿���&nbsp;&nbsp;
							<input type="radio" name="radio3" value="�̿����" />�̿����
						</label></td>
					</tr>
					

					<tr>
					<!--������-->
						<td width="74" height="20"><img src="/image/voucher_text_16.jpg"  /></td>
						<td height="40"><label>
							<input type="radio" name="radio4" value="�ʻ��" valid="E|A=�������� ������ �ּ���"/>�ʻ��&nbsp;&nbsp;
							<input type="radio" name="radio4" value="����" />���� 
						</label></td>
					</tr>

					<tr>
					<!--Ư�̻���-->
						<td width="74" height="20"><img src="/image/voucher_text_17.jpg"  /></td>
						<td height="40"><label>
							<input type="checkbox" name="check2" value="����" />����(�ش��ϴ� ������ ��� �����ϼ���.)&nbsp;&nbsp;</br>
							<input type="checkbox" name="check2" value="�ٵ���" />�ٵ���&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="�ӽż� �索" />�ӽż� �索 &nbsp;&nbsp;
							<input type="checkbox" name="check2" value="����" />����&nbsp;&nbsp;
							<input type="checkbox" name="check2" value="������" />������
						</label></td>
					</tr>
						

					<tr>
					<!--��������-->
						<td width="74" height="20"><img src="/image/voucher_text_18.jpg"/></td>
						<td height="40"><label>
							<input type="checkbox" name="check3" value="�θ��" valid="E|A=���������� ������ �ּ���"/>�θ��&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="����" />���� &nbsp;&nbsp;
							<input type="checkbox" name="check3" value="ū���� 1��" />ū���� 1��&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="ū���� 2���̻�" />ū���� 2���̻�&nbsp;&nbsp;
							<input type="checkbox" name="check3" value="��Ÿ����" />��Ÿ����
						</label></td>
					</tr>
						

					<tr>
					<!--��㳻���Է�-->
						<td width="74" height="20"><img src="/image/voucher_text_19.jpg"/></td>
						<td><label>
							<textarea name="textarea" class="textarea2" valid="E|A=��㳻���� �Է��� �ּ���"></textarea>
						</label></td>
					</tr>

					<tr>
				<td colspan="2" style="padding-top:30px; padding-bottom:50px;">
					<div align="center">
						<img src="/image/voucher_text_22.jpg" width="150" height="40" border="0" />
					</div>
				</td>	
					</tr>  

					</table>
				</td>	
			</tr>

	</table>




	<!--#include virtual="/voucher/voucher_footer.asp"-->

</body>
</html>


