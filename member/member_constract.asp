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
			constract_date		= Rs(13) '계약일
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
			response.Write "<script type='text/javascript'>alert('임대차 계약정보가 없습니다.');location.href='http://mothernbaby.co.kr';</script>"
			response.End 
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>alert('로그인 후 이용 가능합니다.');location.href='http://mothernbaby.co.kr';</script>"
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
					<td width="770" style="padding-top:40px;text-align:center;"> <h1>임 대 차 계 약 서</h1><!--<img src="/image/sub06_subtitle05.jpg" width="770" height="41" />--></td>
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
			   임대인 : <%=company_name%>   <span style="margin-left:420px;">계약물품 : <%=product_name%></span>  <br/>
			   주 소 : <%=company_post%>&nbsp; <%=company_addr1%>&nbsp;<%=company_addr2%><span style="margin-left:30px;"> 연락처 : <%=company_hp%></span> <span style="margin-left:73px;">계약일 : <%=constract_date%></span><br/>
			   임차인 : <input type="text" id="mem_nm" name="mem_nm" size="20" value="<%=customer_nm%>"><span style="margin-left:30px;"> 연락처 : <%=customer_hp%></span> <span style="margin-left:207px;">전화 : <%=constract_tel%></span><br/>
			   주 소 : <%=customer_post%>&nbsp; <%=customer_addr1%>&nbsp; <%=customer_addr2%> <span style="margin-left:318px;">임대경유 : <%=constract_type%></span><br/>
			   <strong><font style="font-weight: bold">사용인 관련자료 : </font></strong> 대여개시일 : <%=Left(start_date,4)%>-<%=Mid(start_date,5,2)%>-<%=Right(start_date,2)%><br/>
				<span style="margin-left:111px;">대여종료일 : <%=Left(end_date,4)%>-<%=Mid(end_date,5,2)%>-<%=Right(end_date,2)%></span> <span style="margin-left:325px;">입금계좌 : <%=constract_account%>(<%=constract_bank%>) </span><br/>
				 <strong><font style="font-weight: bold">유축기 제품번호 : </font></strong> <%=product_no%>
			</div>
 
			<div style="margin-left:20px;">
				<h2>상기 임대인과 임차인은 임대차 계약을 체결하고 본 서류를 2부 작성하여 각 1부씩 보관한다.</h2>
				<h2>계약조건</h2>	
				본 임대 계약은 웰니스인텔리전스가 임대하고 <input type="text" id="contract_in_name" name="contract_in_name" size="10" value="<%=contnent_intro%>" disabled>이 임차하여 이루어진 계약이다.<br/><br/>

				<strong><font style="font-weight: bold">1. 임대차 기간 </font></strong><br/>
				본 제품의 임대차 기간은 제품의 대여개시일로부터 대여만기일까지로 한다.<br/>
				최소 임대차 기간은 <input type="text" id="contract_1_term" name="contract_1_term" size="10" value="<%=contnent1%>" disabled>이다.<br/><br/>
				
				<strong><font style="font-weight: bold">2. 임대료 및 지불방법 </font></strong><br/>
				본 제품의 임대료는 기본 <input type="text" id="contract_2" name="contract_2" size="10" value="<%=contnent2%>" disabled>원이며 임차인은 계약시 대여기간에 해당하는 임대료를 지불하여야 한다.<br/><br/>
				
				<strong><font style="font-weight: bold">3. 예치금 </font></strong><br/>
				임차인은 계약시에 예치금 <input type="text" id="contract_3" name="contract_3" size="10" value="<%=contnent3%>" disabled>원을 임대인에게 지불하여야 한다.<br/>
				단, 계약이 해약 및 임대기간의 만기에 의해 종료되었을 경우, 임대인은 임차인에게 예치금을 반환한다.<br/><br/>
				
				<strong><font style="font-weight: bold">4. 임차인의 권리 </font></strong><br/>
				임차인은 계약된 제품을 용도 및 목적에 맞게 자유로이 사용할 수 있다.<br/><br/>

				<strong><font style="font-weight: bold">5. 손해배상 </font></strong><br/>
				계약된 제품이 대여 개시된 후 임차인의 부주의로 인해 발생한 제품의 멸실, 훼손등에 대해 임차인은 손해배상의 의무를 진다.<br/><br/>

				<strong><font style="font-weight: bold">6. 제품의 보수 </font></strong><br/>
				제품이 인도된 후 제품자체에 의한 하자가 발생시 임대인이 무료로 보수해 준다.<br/><br/>

				<strong><font style="font-weight: bold">7. 임대차 계약 자동연장 </font></strong><br/>
				임차인이 대여 만기일까지 제품을 반환하지 않거나, 반환을 요청하지 않을 경우, 최소 임대차기간에 해당하는 기간동안 추가로 임대차계약이 성립되어 임차인은 임대인에게 추가 임대료를 지불해야 하며, 대여 만기일도 자동 연장된다.<br/><br/>

				<strong><font style="font-weight: bold">8. 임대차 계약의 해약 </font></strong><br/>
				임차인이 다음의 사항에 해당되어 계약 이행이 불가능할 경우, 임대인은 본 계약을 지체없이 해약할 수 있다.<br/>
				1) 임대료의 체불이 발생할 경우, 2) 계약시의 인적사항이 상이할 경우.<br/><br/>

				<strong><font style="font-weight: bold">9. 제품의 반환 및 배달료 </font></strong><br/>
				전항에 의한 계약이 해약 및 임대 기간의 만기 등에 의해 종료되었을 경우에는 임차인은 지체없이 제품을 임대인에게 반환한다. 임차인이 특정한 위치까지 제품의 배달 또는 반납 목적으로 본 회사 직원의 방문을 요구하여 본사직원이 특정위치까지 방문 할 경우 방문 수수료가 추가된다.<br/>(유축기 배달 및 반납 요청시 방문수수료 : 서울시방문 왕복 10,000원, 경기도방문 왕복 20,000원 경기도 택배시 왕복택배비 고객부담)<br/><br/>

				<strong><font style="font-weight: bold">10. 이의의 해결 </font></strong><br/>
				본 계약이 정하지 아니한 사항 또는 본 계약의 해석에 대하여 이의가 발생한 때는 임대인과 임차인이 합의하여 해결한다.<br/><br/>


				<strong><font style="font-weight: bold">11. 권리와 의무의 양도 </font></strong><br/>
				본 계약에 따른 권리나 의무의 일부 또는 전부를 쌍방의 합의 없이 타인에게 양도할 수 없다.<br/><br/>

				<strong><font style="font-weight: bold">영수내역 </font></strong><br/>
				대&nbsp; 여&nbsp;&nbsp; 료 :  <input type="text" id="contract_11_pay" name="contract_11_pay" size="10" value="<%=contnent4_price%>" disabled>  <br/>
				보&nbsp; 증&nbsp;&nbsp; 금 :  <input type="text" id="contract_11_deposit" name="contract_11_deposit" size="10" value="<%=contnent4_deposit%>" disabled>  <br/>
				소모품세트 : <input type="text" id="contract_11_set" name="contract_11_set" size="10" value="<%=contnent4_set%>" disabled>  <br/>
				출&nbsp; 장&nbsp;&nbsp; 료 :  <input type="text" id="contract_11_out" name="contract_11_out" size="10" value="<%=contnent4_out_pay%>" disabled> <br/>
				합 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  계 :  <input type="text" id="contract_11_total" name="contract_11_total" size="10" value="<%=contnent4_total%>" disabled> <span style="margin-left:20px;">영수자<input type="text" id="contract_11_pay_man" name="contract_11_pay_man" size="10" value="<%=contnent4_human%>" disabled></span><br/>

			<span style="margin-left:550px;"> 
			<input type="text" id="contract_11_yy" name="contract_11_yy" size="5" readonly value="<%=NowDate_1%>" disabled>년 
			<input type="text" id="contract_11_yy" name="contract_11_mm" size="3" readonly value="<%=NowDate_2%>" disabled>월 
			<input type="text" id="contract_11_dd" name="contract_11_dd" size="3" readonly value="<%=NowDate_3%>" disabled>일</span><br/>
			<span style="margin-left:350px;"></span><br/>
			<span style="margin-left:550px;">임차인 성명  <input type="text" id="contract_11_name" name="contract_11_name" size="10" value="<%=customer_nm2%>"></span><br/>
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
