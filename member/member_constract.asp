<!--#include virtual="/common/menu/head.asp"-->
<%
	If uId = "" Then 
		Response.Redirect "/member/login.asp?mOne=6&mTwo=1"
	End If 



	If uId <> "" Then 
		strTable = " from  MO_CONTRACT  WITH(NOLOCK) "
		strTable = strTable & "   "
		strWhere = " where  MO_CONTRACT_CUSTOMER_ID  = '"& uId &"' order by MO_CONTRACT_SEQ desc "

		strSql = ""
		strSql = strSql & "	SELECT   * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			
			idx					= Rs(0)
			company_name		= Rs(1)
			company_post		= Rs(2)
			company_addr1		= Rs(3)
			company_addr2		= Rs(4)
			company_hp			= Rs(5)
			customer_id			= Rs(6)
			customer_nm			= Rs(7)
			customer_post		= Rs(8)
			customer_addr1		= Rs(9)
			customer_addr2		= Rs(10)
			customer_hp			= Rs(11) 
			product_name		= Rs(12)
			constract_date		= Rs(13) '�����
			constract_tel		= Rs(14)
			constract_type		= Rs(15)
			constract_bank		= Rs(16)
			constract_account	= Rs(17)
			start_date			= Rs(18)
			end_date			= Rs(19)
			product_no			= Rs(20)
			contnent_intro		= Rs(21)
			contnent1			= Rs(22)
			contnent2			= Rs(23)
			contnent3			= Rs(24)
			contnent4_price		= Rs(25)
			contnent4_deposit	= Rs(26)
			contnent4_set		= Rs(27)
			contnent4_out_pay	= Rs(28)
			contnent4_total		= Rs(29)
			contnent4_human		= Rs(30)
			now_date			= Rs(31)
			customer_nm2		= Rs(32)
			arrList = Rs.getRows()
		Else 
			response.Write "<script type='text/javascript'>alert('�Ӵ��� ��������� �����ϴ�.');location.href='http://mothernbaby.co.kr';</script>"
			response.End 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>alert('�α��� �� �̿� �����մϴ�.');location.href='http://mothernbaby.co.kr';</script>"
		response.End 
	End If 

'-----------------------------------------------------------------------------
'	���� ���� ȣ��
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





	NowDate = Date()    '2011-07-08

		If NowDate <> "" Then 
		arrNowDate	= Split(NowDate,"-")
		NowDate_1		= arrNowDate(0)
		NowDate_2		= arrNowDate(1)
		NowDate_3		= arrNowDate(2)
		End If 

%>
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td width="770" style="padding-top:40px;text-align:center;"> <h1>�� �� �� �� �� ��</h1><!--<img src="/image/sub06_subtitle05.jpg" width="770" height="41" />--></td>
				</tr>
				<tr>
					<td width="770" height="40"><spacer type="block"></td>
				</tr>  
				<form id="oFrm" name="oFrm" method="post">
				<input type="hidden" name="mode" value="upd">
				<input type="hidden" name="mOne" value="<%=mOne%>">
				<input type="hidden" name="mTwo" value="<%=mTwo%>">
				<input type="hidden" name="mem_id" value="<%=uId%>">
				<input type="hidden" name="idx" value="<%=idx%>">
		     </table>

			<div style="margin-left:20px;width:800px;">
			   �Ӵ��� : <%=company_name%>   <span style="margin-left:420px;">��๰ǰ : <%=product_name%></span>  <br/>
			   �� �� : <%=company_post%>&nbsp; <%=company_addr1%>&nbsp;<%=company_addr2%><span style="margin-left:30px;"> ����ó : <%=company_hp%></span> <span style="margin-left:73px;">����� : <%=constract_date%></span><br/>
			   ������ : <input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=customer_nm%>"><span style="margin-left:30px;"> ����ó : <%=customer_hp%></span> <span style="margin-left:207px;">��ȭ : <%=constract_tel%></span><br/>
			   �� �� : <%=customer_post%>&nbsp; <%=customer_addr1%>&nbsp; <%=customer_addr2%> <span style="margin-left:318px;">�Ӵ���� : <%=constract_type%></span><br/>
			   <strong><font style="font-weight: bold">����� �����ڷ� : </font></strong> �뿩������ : <%=Left(start_date,4)%>-<%=Mid(start_date,5,2)%>-<%=Right(start_date,2)%><br/>
				<span style="margin-left:111px;">�뿩������ : <%=Left(end_date,4)%>-<%=Mid(end_date,5,2)%>-<%=Right(end_date,2)%></span> <span style="margin-left:325px;">�Աݰ��� : <%=constract_account%>(<%=constract_bank%>) </span><br/>
				 <strong><font style="font-weight: bold">����� ��ǰ��ȣ : </font></strong> <%=product_no%>
			</div>
 
			<div style="margin-left:20px;">
				<h2>��� �Ӵ��ΰ� �������� �Ӵ��� ����� ü���ϰ� �� ������ 2�� �ۼ��Ͽ� �� 1�ξ� �����Ѵ�.</h2>
				<h2>�������</h2>	
				�� �Ӵ� ����� ���Ͻ����ڸ������� �Ӵ��ϰ� <input type="text" id="contract_in_name" name="contract_in_name" size="10" value="<%=contnent_intro%>" disabled>�� �����Ͽ� �̷���� ����̴�.<br/><br/>

				<strong><font style="font-weight: bold">1. �Ӵ��� �Ⱓ </font></strong><br/>
				�� ��ǰ�� �Ӵ��� �Ⱓ�� ��ǰ�� �뿩�����Ϸκ��� �뿩�����ϱ����� �Ѵ�.<br/>
				�ּ� �Ӵ��� �Ⱓ�� <input type="text" id="contract_1_term" name="contract_1_term" size="10" value="<%=contnent1%>" disabled>�̴�.<br/><br/>
				
				<strong><font style="font-weight: bold">2. �Ӵ�� �� ���ҹ�� </font></strong><br/>
				�� ��ǰ�� �Ӵ��� �⺻ <input type="text" id="contract_2" name="contract_2" size="10" value="<%=contnent2%>" disabled>���̸� �������� ���� �뿩�Ⱓ�� �ش��ϴ� �Ӵ�Ḧ �����Ͽ��� �Ѵ�.<br/><br/>
				
				<strong><font style="font-weight: bold">3. ��ġ�� </font></strong><br/>
				�������� ���ÿ� ��ġ�� <input type="text" id="contract_3" name="contract_3" size="10" value="<%=contnent3%>" disabled>���� �Ӵ��ο��� �����Ͽ��� �Ѵ�.<br/>
				��, ����� �ؾ� �� �Ӵ�Ⱓ�� ���⿡ ���� ����Ǿ��� ���, �Ӵ����� �����ο��� ��ġ���� ��ȯ�Ѵ�.<br/><br/>
				
				<strong><font style="font-weight: bold">4. �������� �Ǹ� </font></strong><br/>
				�������� ���� ��ǰ�� �뵵 �� ������ �°� �������� ����� �� �ִ�.<br/><br/>

				<strong><font style="font-weight: bold">5. ���ع�� </font></strong><br/>
				���� ��ǰ�� �뿩 ���õ� �� �������� �����Ƿ� ���� �߻��� ��ǰ�� ���, �Ѽյ ���� �������� ���ع���� �ǹ��� ����.<br/><br/>

				<strong><font style="font-weight: bold">6. ��ǰ�� ���� </font></strong><br/>
				��ǰ�� �ε��� �� ��ǰ��ü�� ���� ���ڰ� �߻��� �Ӵ����� ����� ������ �ش�.<br/><br/>

				<strong><font style="font-weight: bold">7. �Ӵ��� ��� �ڵ����� </font></strong><br/>
				�������� �뿩 �����ϱ��� ��ǰ�� ��ȯ���� �ʰų�, ��ȯ�� ��û���� ���� ���, �ּ� �Ӵ����Ⱓ�� �ش��ϴ� �Ⱓ���� �߰��� �Ӵ�������� �����Ǿ� �������� �Ӵ��ο��� �߰� �Ӵ�Ḧ �����ؾ� �ϸ�, �뿩 �����ϵ� �ڵ� ����ȴ�.<br/><br/>

				<strong><font style="font-weight: bold">8. �Ӵ��� ����� �ؾ� </font></strong><br/>
				�������� ������ ���׿� �ش�Ǿ� ��� ������ �Ұ����� ���, �Ӵ����� �� ����� ��ü���� �ؾ��� �� �ִ�.<br/>
				1) �Ӵ���� ü���� �߻��� ���, 2) ������ ���������� ������ ���.<br/><br/>

				<strong><font style="font-weight: bold">9. ��ǰ�� ��ȯ �� ��޷� </font></strong><br/>
				���׿� ���� ����� �ؾ� �� �Ӵ� �Ⱓ�� ���� � ���� ����Ǿ��� ��쿡�� �������� ��ü���� ��ǰ�� �Ӵ��ο��� ��ȯ�Ѵ�. �������� Ư���� ��ġ���� ��ǰ�� ��� �Ǵ� �ݳ� �������� �� ȸ�� ������ �湮�� �䱸�Ͽ� ���������� Ư����ġ���� �湮 �� ��� �湮 �����ᰡ �߰��ȴ�.<br/>(����� ��� �� �ݳ� ��û�� �湮������ : ����ù湮 �պ� 10,000��, ��⵵�湮 �պ� 20,000�� ��⵵ �ù�� �պ��ù�� ���δ�)<br/><br/>

				<strong><font style="font-weight: bold">10. ������ �ذ� </font></strong><br/>
				�� ����� ������ �ƴ��� ���� �Ǵ� �� ����� �ؼ��� ���Ͽ� ���ǰ� �߻��� ���� �Ӵ��ΰ� �������� �����Ͽ� �ذ��Ѵ�.<br/><br/>


				<strong><font style="font-weight: bold">11. �Ǹ��� �ǹ��� �絵 </font></strong><br/>
				�� ��࿡ ���� �Ǹ��� �ǹ��� �Ϻ� �Ǵ� ���θ� �ֹ��� ���� ���� Ÿ�ο��� �絵�� �� ����.<br/><br/>

				<strong><font style="font-weight: bold">�������� </font></strong><br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_pay" name="contract_11_pay" size="10" value="<%=contnent4_price%>" disabled>  <br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_deposit" name="contract_11_deposit" size="10" value="<%=contnent4_deposit%>" disabled>  <br/>
				�Ҹ�ǰ��Ʈ : <input type="text" id="contract_11_set" name="contract_11_set" size="10" value="<%=contnent4_set%>" disabled>  <br/>
				��&nbsp; ��&nbsp;&nbsp; �� :  <input type="text" id="contract_11_out" name="contract_11_out" size="10" value="<%=contnent4_out_pay%>" disabled> <br/>
				�� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  �� :  <input type="text" id="contract_11_total" name="contract_11_total" size="10" value="<%=contnent4_total%>" disabled> <span style="margin-left:20px;">������<input type="text" id="contract_11_pay_man" name="contract_11_pay_man" size="10" value="<%=contnent4_human%>" disabled></span><br/>

			<span style="margin-left:550px;"> 
			<input type="text" id="contract_11_yy" name="contract_11_yy" size="5" readonly value="<%=NowDate_1%>" disabled>�� 
			<input type="text" id="contract_11_yy" name="contract_11_mm" size="3" readonly value="<%=NowDate_2%>" disabled>�� 
			<input type="text" id="contract_11_dd" name="contract_11_dd" size="3" readonly value="<%=NowDate_3%>" disabled>��</span><br/>
			<span style="margin-left:350px;"></span><br/>
			<span style="margin-left:550px;">������ ����  <input type="text" id="contract_11_name" name="contract_11_name" size="10" value="<%=customer_nm2%>"></span><br/>
			</div>

		</form>
		<br/>
				<div align="center">
					<img src="/image/bt_0003.jpg" width="150" height="40" border="0" id="btnSubmit" style="cursor:pointer;"/>&nbsp;&nbsp;
					<img src="/image/bt_0002.jpg" width="150" height="40" border="0" onclick="location.reload();" style="cursor:pointer;"/>
				</div>
		 <br/>
	
	</td>
</tr> 
</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<iframe id="ifrm" name="ifrm" width="0" height="0" style="display:none;"></iframe>
<script type="text/javascript" src="/common/js/frm_common.js"></script>
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
		"action" : "./contract_sql.asp"
	});

	function InputPostInfo(postcd1,postcd2,postcd,addrnm){
		jQuery("#post_1").val(postcd1);
		jQuery("#post_2").val(postcd2);
		jQuery("#addr_1").val(addrnm);
	}

	function fncOpenZip(){
		window.open("/common/inc/pop_zipcode.asp","pop_zipcode","width=500px, height=460px");
	}
</script>
<script type="text/javascript" src="/common/js/ajax_common.js"></script>
<script type="text/javascript">
	function fncSetPart(val,cd){
		fncAxListHtml("/common/inc/local_ax.asp?local="+val+"&localCd="+cd,"#part");
	}

	fncSetPart("<%=local_nm%>","<%=md_local%>");
</script>
</html>
