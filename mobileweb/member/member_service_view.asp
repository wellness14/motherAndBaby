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
	intIDX = fncRequest("idx")
	If intIDX <> "" Then 
		strSql = ""
		strSql = strSql & " SELECT * "
		strSql = strSql & "		FROM MO_SERVICE WITH(NOLOCK) "
		strSql = strSql & "		INNER JOIN MO_SERVICE_INFO WITH(NOLOCK) ON MO_IDX = MS_SERVICE "
		strSql = strSql & " WHERE MS_IDX = '"& intIDX &"' AND MS_CNLKBN='N' "
		Set Rs = DBExec(strSql,"main")
		If Not Rs.EOF Then 
			ms_birth			= Rs(3)
			ms_childbirth		= Rs(4)
			ms_marry			= Rs(5)
			ms_type1			= Rs(6)
			ms_type2			= Rs(7)
			ms_type3			= Rs(8)
			ms_type4			= Rs(9)
			ms_type5			= Rs(10)
			ms_txt1				= Rs(11)
			ms_txt2				= Rs(12)
			ms_txt3				= Rs(13)
			ms_txt4				= Rs(14)
			ms_sel1				= Rs(15)
			ms_sel2				= Rs(16)
			ms_sel3				= Rs(17)
			ms_sel4				= Rs(18)
			ms_sel5				= Rs(19)
			ms_sel6				= Rs(20)
			ms_total			= Rs(22)
			mo_idx				= Rs(25)
			mo_service			= Rs(33)
			mo_charge			= Rs(34)

			strSql = " SELECT MS_SERVICE_NM FROM MO_SERVICE_LINK A WITH(NOLOCK) "
			strSql = strSql & " 	INNER JOIN MO_SERVICE_NM B WITH(NOLOCK) ON A.MS_IDX = B.MS_IDX "
			strSql = strSql & " WHERE MO_IDX='"& mo_idx &"' "
			strSql = strSql & " ORDER BY A.MS_IDX ASC "
			Set Rs1 = DBExec(strSql,"main")
			If Not Rs1.EOF Then 
				Do Until Rs1.EOF
					If service_nm <> "" Then service_nm = service_nm & ","
					service_nm = service_nm & Rs1(0)
					Rs1.movenext
				Loop
			End If 
		End If 
		Call RSClose(Rs)
	Else 
		response.redirect "./member_service.asp?" & strParam
		response.End 
	End If 
%>
         <div id="mcontainer13">
         
	<td width="360" valign="top">
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="360" style="padding-top:5px;"><img src="/mobileweb/html/images/sub06_subtitle05-3.jpg" width="360"  /></td>
			</tr> 
			<tr>
				<td width="360" height="42"><div align="right"><a href="./member_service.asp"><img src="/mobileweb/html/images/bt_0031.jpg" width="110" border="0" /></a></div></td>
			</tr>       
			</table>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="#f6f6f6" style="padding-top:20px; padding-bottom:20px;">
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td width="87" height="42"><img src="/mobileweb/html/images/text_0057.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=Left(ms_birth,4)%>년 <%=Mid(ms_birth,5,2)%>월 <%=Right(ms_birth,2)%>일</span></td>
					</tr>
					<tr>
						<td width="87" height="42"><img src="/mobileweb/html/images/text_0069.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=Left(ms_childbirth,4)%>년 <%=Mid(ms_childbirth,5,2)%>월 <%=Right(ms_childbirth,2)%>일</span></td>
					</tr>
					<tr>
						<td width="87" height="42"><img src="/mobileweb/html/images/text_0068.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=Left(ms_marry,4)%>년 <%=Mid(ms_marry,5,2)%>월 <%=Right(ms_marry,2)%>일</span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0058.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=ms_type1%></span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0059.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=ms_type2%></span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0060.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=ms_type3%></span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0070.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=ms_type4%></span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0061.jpg" height="31"/></td>
						<td colspan="2"><span style="font-weight:bold; font-size:12px; color:#000000">: <%=ms_type5%></span></td>
					</tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0062.jpg" height="31"/></td>
						<td width="200"><span style="font-weight:bold; font-size:13px; color:#000000">: <%=ms_txt1%>주</span></td>
						<td>
							
						</td>
					</tr>
                    <tr>
                    	<td>
                        </td>
                        
                        <td>
                        <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0주</td>
								<td width="230" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">40주</div></td>
							</tr>
							</table>
                        </td>
                    </tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0063.jpg" height="31"/></td>
						<td><span style="font-weight:bold; font-size:13px; color:#000000">: <%=ms_txt2%>cm</span></td>
						<td>
						
						</td>
					</tr>
                    
                    <tr>
                    	<td>
                        </td>
                        
                        <td>
                        	<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0mm</td>
								<td width="100" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">2m</div></td>
							</tr>
							</table>
                        </td>
                    </tr>
                    
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0064.jpg" height="31"/></td>
						<td><span style="font-weight:bold; font-size:13px; color:#000000">: <%=ms_txt3%>kg</span></td>
						<td>
						
						</td>
					</tr>
                    <tr>
                    	<td>
                        </td>
                       
                        <td>
                        	<table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="100" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
                        </td>
                    </tr>
					<tr>
						<td height="42"><img src="/mobileweb/html/images/text_0065.jpg" height="31"/></td>
						<td><span style="font-weight:bold; font-size:13px; color:#000000">: <%=ms_txt4%>kg</span></td>
						<td>
							
						</td>
					</tr>
                    <tr>
                    	<td>
                        </td>
                        <td>
                        <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td width="30">0kg</td>
								<td width="100" bgcolor="#d7d7d7"><img src="/mobileweb/html/images/img_0009.jpg" width="0" height="18" class="txtImg"/></td>
								<td width="40"><div align="right">200kg</div></td>
							</tr>
							</table>
                        </td>
                    </tr>
					</table>	
				</td>
			</tr>
			</table>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="42" colspan="2"><img src="/mobileweb/html/images/img_0010.jpg" width="360" height="7" /></td>
			</tr>
			<tr>
				<td width="360" bgcolor="#f6f6f6" style="font-size:12px; color:#000000"><div align="center">
				<br />산모님의 건강한 산후조리를 마더앤베이비가 함께하겠습니다.<br /><br />
				산모님께는 <span style="color:#ff015a; font-weight:bold;"><%=Replace(mo_service,"||",", ")%></span> <br />프로그램이 적합하시며, <br />
				<span style="color:#ff015a; font-weight:bold;">서비스요금은 <%=FormatNumber(mo_charge,0)%>원</span>입니다.<br />
				<br />
				또한, 추천 부가서비스로는,<br />
				<span style="color:#ff015a; font-weight:bold;"><%=service_nm%></span>를 권해드립니다.<br /><br /></div></td>
			</tr>
			<tr>
				<td height="70" colspan="2"><span style="font-size:12px; color:#000000; font-weight:bold;">* 추가서비스 </span></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#f6f6f6" style="padding-top:15px; padding-bottom:15px;">
					<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="163" height="50"><img src="/mobileweb/html/images/text_0074.jpg" height="21"/></td>
						<td width="188"><span style="font-weight:bold; font-size:12px; color:#000000"><%=ms_sel1%>회</span></td>
						<td width="161"><img src="/mobileweb/html/images/text_0079.jpg" height="21"/></td>
						<td width="188"><span style="font-weight:bold; font-size:12px; color:#000000">상담신청</span></td>
					</tr>
					<tr>
						<td height="50"><img src="/mobileweb/html/images/text_0075.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000"><%If ms_sel2 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td><img src="/mobileweb/html/images/text_0080.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000"><%If ms_sel3 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
					</tr>
					<tr>
						<td height="50"><img src="/mobileweb/html/images/text_0076.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000"><%If ms_sel4 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td><img src="/mobileweb/html/images/text_0081.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000"><%If ms_sel5 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
					</tr>
					<tr>
						<td height="50"><img src="/mobileweb/html/images/text_0077.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000">상담신청</span></td>
						<td><img src="/mobileweb/html/images/text_0082.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000">상담신청</span></td>
					</tr>
					<tr>
						<td height="50"><img src="/mobileweb/html/images/text_0078.jpg" height="21"/></td>
						<td><span style="font-weight:bold; font-size:12px; color:#000000"><%If ms_sel6 = "Y" Then%>선택<%Else%>선택안함<%End If%></span></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			<table width="360" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="42" colspan="2"><img src="/mobileweb/html/images/img_0010.jpg" width="360" height="7" /></td>
			</tr>
			<tr>
				<td width="66" bgcolor="#f6f6f6"><img src="/mobileweb/html/images/img_0012.jpg" width="72" height="68" /></td>
				<td width="310" bgcolor="#f6f6f6" style="font-size:12px; color:#000000; font-weight:bold;"><div align="center">산모님의 산후조리서비스 최종적인 예상비용은<br/> <span style="color:#ff015a; font-weight:bold;"> <%=FormatNumber(ms_total,0)%>원</span>입니다.</div></td>
			</tr>
			<tr>
				<td colspan="2" style="padding-bottom:50px; padding-top:30px;"><div align="right"><a href="./member_service.asp"><img src="/mobileweb/html/images/bt_0031.jpg" width="110" border="0" /></a></div></td>
			</tr>		
			</table>
		</td>
	</tr>
	</table>
      <!--#include virtual="/mobileweb/common/menu/foot_menu.asp"-->	 
      


	</div> 
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
<script type="text/javascript">
	var txtImg = jQuery(".txtImg");
	function fncSetbar(num, val){
		if (num ==0){
			if (val > 40){ val = 40; }
			val = val * 3.75;
		}else{
			if (val > 200){ val = 200; }
			val = val * 0.75;
		}
		txtImg.eq(num).attr({"width":val});
	}

	jQuery(document).ready(function(){
		fncSetbar(0, "<%=ms_txt1%>");
		fncSetbar(1, "<%=ms_txt2%>");
		fncSetbar(2, "<%=ms_txt3%>");
		fncSetbar(3, "<%=ms_txt4%>");
	});
</script>
</html>