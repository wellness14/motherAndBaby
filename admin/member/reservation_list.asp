<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ����Ȯ��
'�� �� �� : member_reser_list.asp
'�ۼ����� : 2014/04/12
'�� �� �� : �̼���
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp"-->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<HTML>
<HEAD>
	<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
	<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
	<link rel="stylesheet" type="text/css" href="/admin/common/css/style.css">
	<link type="text/css" rel="stylesheet" href="/admin/common/css/mega_admin2.css" />
	<style type="text/css">

	body{margin:0;padding:0;font:12px/1.3 Dotum;color:#ccc;}
		div,select, span, table,button,form{margin:0;padding:0;}
		#container{width:100%;}
		#container .linmap{}
		#container .linemap a{font:12px/1.3 Dotum;color:#ccc;text-decoration:none;}
		#container select{font:12px/1.3 Dotum;}
		#container .selection{padding:11px 15px 11px 15px;border:2px solid #AABAE0;margin-top:20px;margin-bottom:20px;}
		#container .selection *{vertical-align:middle;}
		.footerBtns{position:relative;width:100%;text-align:center;margin-top:20px;}
		.footerBtns .btns{}
 
		 .tb_style011 {
		  width: 100%;
		  border-collapse: collapse;
		  border-spacing: 0;
		  border: 1px solid #D1D1D1;
		  border-top: 2px solid #7C9BD2;
		}
	</style>
</head>
<%
'---------------------------------------------------------
'	Request
	Dim page_size : page_size = 1 
	page = fncRequest("page")
	startM = fncRequest("startM")
	If page = "" Then page = 1

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	smode	= fncRequest("smode")
	sword	= fncRequest("sword")

	strDftUrl = "smode=" & smode
	strDftUrl = strDftUrl & "&sword=" & sword
'---------------------------------------------------------

	startNum = (page-1) * page_size
	endNum = startNum + page_size

	startY = fncRequest("startY")   
	startM = fncRequest("startM") 
	startM2 = fncRequest("startM")   
	startD = fncRequest("startD")   

	endY = fncRequest("endY")   
	endM = fncRequest("endM")   
	endD = fncRequest("endD")   




	Dim NowDate, NowYear, NowMonth, NowDay, NowHour, NowMinute, NowSecond

'���糯¥
NowDate = Date()    '2011-07-08

'���� ��
NowYear = Year(Date())    '2011

'���� ��
NowMonth = Month(Date())    '7
NowMonth_2 = Month(Date())    '7
month_1 = month(now) 

   


'���� ��
NowDay = Day(Date())    '8

'���� ��
NowHour = Hour(Time())    '15

'���� ��
NowMinute = Minute(Time())    '13

'���� ��
NowSecond = Second(Time())    '43


weekDate = weekDay(now())
weekDate2 = weekDayName(weekDay(now))

 


	LastWDay = DateAdd("d",-7,now())  '��
	LastThDay = DateAdd("d",-6,now())  '��
	LastFDay = DateAdd("d",-5,now())  '��
	LastSDay = DateAdd("d",-4,now())  '��
	LastSuDay = DateAdd("d",-3,now())  '��
	LastMDay = DateAdd("d",-2,now())  '��
	LastTDay = DateAdd("d",-1,now())  'ȭ

'weekDate2 = weekDayName(weekDay(now))



If startY <> "" And startM <> ""  Then 

	Function Get_Lastday(startY, startM)
		Get_Lastday = Day(DateSerial(startY, startM + 1, 1 - 1))
	End Function
			lastDate = Get_Lastday(startY, startM)
Else

	Function Get_Lastday(NowYear, NowMonth)
		Get_Lastday = Day(DateSerial(NowYear, NowMonth + 1, 1 - 1))
	End Function
			lastDate = Get_Lastday(NowYear, NowMonth)
			stYMD = NowYear & fncSetNumber(NowMonth) &  "01"
			EndYMD = NowYear & fncSetNumber(NowMonth_2) &  lastDate

End if
 






 

 

	strSql = "  SELECT 	*    "
	strSql = strSql & " FROM MO_RESERVATION A WITH(NOLOCK) "
	strSql = strSql & " INNER JOIN MO_MEM_DTL B WITH(NOLOCK)  ON MR_MEM_ID = MD_MEM_ID  "
	strSql = strSql & " LEFT OUTER JOIN MO_HELPER_SERVICE C   ON A.MR_IDX = C.MR_IDX  "
	strSql = strSql & " WHERE MR_CNLKBN='N' "


If startY <> "" And startM <> ""  Then 
	
	YMD =  startY & fncSetNumber(startM) &  "01"
	EYMD = startY & fncSetNumber(startM2) &  lastDate
 


	strSql = strSql & "  AND ( '"& YMD &"'  <= MR_SERVICESDT " 
	strSql = strSql & "  AND  '"& EYMD &"'  >= MR_SERVICESDT ) " 

	strSql = strSql & "  or ( '"& YMD &"'  <=  MR_SERVICEEDT " 
	strSql = strSql & "  AND  '"& EYMD &"'  >=  MR_SERVICEEDT ) ORDER BY A.MR_MEM_NM ASC" 

else

	strSql = strSql & "  AND ( '"& stYMD &"'  <=  MR_SERVICESDT " 
	strSql = strSql & "  AND  '"& EndYMD &"'   >=  MR_SERVICESDT ) " 

	strSql = strSql & "  or ( '"& stYMD &"'   <=  MR_SERVICEEDT " 
	strSql = strSql & "  AND  '"& EndYMD &"'   >=  MR_SERVICEEDT  ) ORDER BY A.MR_MEM_NM ASC" 

End if

	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOF Then 
		arrList = Rs.GetRows()
	End If 
	 Call DBClose(Rs)  
%>


 
 
<%				If startM <> "" then
					Mbirth =  startM
					If Mbirth < 10 Then Mbirth = Right(Mbirth,1)

				Else
					Mbirth =  month_1
					If Mbirth < 10 Then Mbirth = Right(Mbirth,1)
				End if

 
%>
 

 
 
 
<body>
	<div id="container">
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>������Ȳ</strong></div>
		<div class="write">
			<form id="sFrm" name="sFrm" method="get" action="./reservation_list.asp">
 
			<div class="selection">
				�� �� : 
					<select name="startY" >
					<% For numY=Year(Date()) To Year(DateAdd("yyyy",-50,Date())) Step -1 %>
								<option value="<%=numY%>"><%=numY%></option>
							<% Next %>
					</select>
					<select name="startM"  >
							<% For numM=1 To 12 %>
								<% If startM <> "" then%>
									<option value="<%=numM%>" <%=fncSetSelectBox(numM,Mbirth)%>><%=numM%>��</option>
								<% else%>
									<option value="<%=numM%>" <%=fncSetSelectBox(numM,Mbirth)%>><%=numM%>��</option>	
								<% End if%>
							<% Next %>
					</select>


				<a onClick="jQuery('#sFrm').submit();" style="cursor:pointer;" class="button">�� ��</a>

				<!--<a onClick="location.href='./member_reser_list.asp';" style="cursor:pointer;" class="button">��ü ����Ʈ</a>
				<span style="margin-left:20px;">
					<a onClick="location.href='./member_reser_ins.asp'" style="cursor:pointer;" class="button">���</a>  
				</span>-->
			</div>
			</form>
			<br />
			<table border="1" style="width: 100%; border-collapse: collapse; border-spacing: 0;  border: 1px solid #D1D1D1; border-top: 3px solid #7C9BD2;">
			<colgroup>
			<col width="1%" />
			<col width="10%" />
			<col  />
			<col width="8%" />
			 
<%
For num=1 To lastDate	
%>
				<col width="2%" />
<% Next %>
			
			</colgroup>
			<thead>
			<tr>
				<th> ��<br/>ȣ </th>
				<th> ���� </th>
				<th> ���� �� </th>
				<th> ��𵵿�� </th>
				 

<%
 
%> 

<%


  For num = 1 To lastDate

  If len(num) = 1 Then
  
	num = "0" & num 

 End if
   
yymmdd = NowYear &"-"& NowMonth &"-"&num
 
 
 
%>

<% 
	weekDate2 = weekDayName(weekDay(yymmdd))


%>
 
<script> </script>

<%
	 
	If(weekDate2 = "�����") then%>
		<th> <font style="color:blue;"><%=num%></font> </th><%
	ElseIf(weekDate2 = "�Ͽ���") then%>
		<th>  <font style="color:red;"><%=num%></font> </th><%

	else%>

		<th> <font style="color:black;"><%=num%><font> </th><%
%>
 
 


<% End if %>
<% Next %>
 
			</tr>
			</thead>
			<tbody>
<!--			  seq       -->
<%
	If IsArray(arrList) Then 
		For num=0 To UBound(arrList,2)		
			idx			  = arrList(0,num)
			mem_id		  = arrList(1,num)
			mem_nm		  = arrList(2,num)
			service		  = arrList(9,num)
			period		  = arrList(10,num)
			service_type  = arrList(11,num)
			mo_helper_SEQ = arrList(47,num)


			service_sdt	= arrList(13,num)
			service_edt	= arrList(14,num)
			reg_dt		= Left(arrList(20,num),10)

			 
			startDay = Right(service_sdt,2)
			endDay = Right(service_edt,2)

'-----------------------------------------------------------------------------

'	��𵵿�� �̸� 

	if isNumeric(mo_helper_SEQ) then
	'response.write "������ �����Դϴ�."
	else
	mo_helper_SEQ = ""
	'response.write "������ ������ �ƴմϴ�."
	end if

	 




  If mo_helper_SEQ <> "" Then



 
	strSql = " select MD_HELPER_NAME from MO_HELPER where MD_HELPER_SEQ = '"& mo_helper_SEQ &"' "
	 
	Set Rs = DBExec(strSql,"main")
	If Not Rs.EOf Then 
		mo_helper_NM = Rs(0)
	End If 
	Call RSClose(Rs)

	End If 

'-----------------------------------------------------------------------------
%>
<script>

</script>
			 
			<tr>
				<td height="40" align="center"><%= page_size + num%></td>
				<td align="center"><%=mem_nm%><br><%If mem_id <> "" Then%>(<%=mem_id%>)<%End If%></td>
				<td align="center"><%=service%>&nbsp;<%=service_type%>&nbsp;<%=period%></td>
<%
 If mo_helper_SEQ <> "" Then
%>
				<td align="center"><%=mo_helper_NM%></td>
<% Else %>
				<td> </td>
<%
End if
%>				 	
	
				


<%If startY = "" And startM = ""  Then %>



 <!-- ���� ���ۿ��� ���� �������� �ٸ����� ���  -->
 <%  If NowMonth < Mid(service_edt,5,2) Then %>

 <%   namday =  lastDate-endDay
 For numDe1=2 To startDay %>
	<!-- ���� �Ⱓ ��׶��� ���� ä���-->
	<td></td>
<% Next %> 

<% edt_day =  Right(service_edt,2)
   str_dat = Right(service_sdt,2)

   hap_day = lastDate+1 - str_dat
%>
<td style="background-color:7FFFB7" colspan="<%=hap_day%>" align="center"><%=Mid(service_sdt,5,2)%>/<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>/<%=Right(service_edt,2)%> </td>
<%  For numDe2=startDay To lastDate %>
	<!-- ���� �Ⱓ ��׶��� �� ä���-->
 
<% Next %>

<!-- ���� ���ۿ��� ���� �������� �ٸ����� ���  �� -->


		
<!-- ���ۿ��� ��������� �������  -->
<%elseIf NowMonth > Mid(service_sdt,5,2) Then %>

<% edt_day =  Right(service_edt,2)
 
%>
<td style="background-color:7FFFB7" colspan="<%=edt_day%>" align="center"><%=Mid(service_sdt,5,2)%>/<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>/<%=Right(service_edt,2)%> </td>
<% For numDs1=1 To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä���-->
	 
<% Next %> 
<% For numDs2=endDay To lastDate -1 %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td> </td>
<% Next %> 		


 <!-- ���ۿ��� ��������� ������� �� -->



<!--���� ���ۿ��� ���� �������� ���� ���ϰ��  -->
<% elseIf NowMonth = Mid(service_edt,5,2) Then %>

<% For numDss=2 To startDay %>
   
		<td> </td>
   		 
<% Next %> 
<% edt_day =  Right(service_edt,2)
   str_dat = Right(service_sdt,2)

   hap_day = edt_day+1 - str_dat
%>
<td style="background-color:7FFFB7" colspan="<%=hap_day%>" align="center"><%=Mid(service_sdt,5,2)%>/<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>/<%=Right(service_edt,2)%> </td>
<% For numDs=startDay To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä��� -->
	 
	
<% Next %> 

<% For numDsb=endDay To lastDate-1  %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td> </td>
<% Next %> 		















<% End if%>

























<% Else %>
<!--  �˻���ư���� ��������   --->





 

  <!-- ���� ���ۿ��� ���� �������� �ٸ����� ���  -->
 <%  If startM <> Mid(service_edt,5,2) Then %>

 <%   namday =  lastDate-endDay
 For numDe1=2 To startDay %>
	<!-- ���� �Ⱓ ��׶��� ���� ä���-->
	<td></td>
<% Next %> 

<% edt_day =  Right(service_edt,2)
   str_dat = Right(service_sdt,2)

   hap_day = lastDate+1 - str_dat
%>
<td style="background-color:7FFFB7" colspan="<%=hap_day%>" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> </td>
<%  For numDe2=startDay To lastDate %>
	<!-- ���� �Ⱓ ��׶��� �� ä���-->
 
<% Next %>



































<!-- ���� ���ۿ��� ���� �������� �ٸ����� ���  �� -->


		
<!-- ���ۿ��� ��������� �������  -->
<%elseIf startM > Mid(service_sdt,5,2) Then %>

<% edt_day =  Right(service_edt,2)
 
%>
<td style="background-color:7FFFB7" colspan="<%=edt_day%>" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> </td>
<% For numDs1=1 To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä���-->
	 
<% Next %> 
<% For numDs2=endDay To lastDate -1 %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td> </td>
<% Next %> 		


 <!-- ���ۿ��� ��������� ������� �� -->



		
<!-- ���ۿ��� ��������� ������� 1�� ��ȸ 12��  -->
<%elseIf startM < Mid(service_sdt,5,2) Then %>

<% edt_day =  Right(service_edt,2)
 
%>
<td style="background-color:7FFFB7" colspan="<%=edt_day%>" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> </td>
<% For numDsn1=1 To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä���-->
	 
<% Next %> 
<% For numDs2=endDay To lastDate -1 %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td> </td>
<% Next %> 		


<!-- ���ۿ��� ��������� ������� 1�� ��ȸ 12��  -->













<!--���� ���ۿ��� ���� �������� ���� ���ϰ��  -->
<% elseIf startM = Mid(service_edt,5,2) Then %>

<% For numDss=2 To startDay %>
   
		<td> </td>
   		 
<% Next %> 
<% edt_day =  Right(service_edt,2)
   str_dat = Right(service_sdt,2)

   hap_day = edt_day+1 - str_dat
%>
<td style="background-color:7FFFB7" colspan="<%=hap_day%>" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> </td>
<% For numDs=startDay To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä��� -->
	 
	
<% Next %> 

<% For numDsb=endDay To lastDate-1  %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td> </td>
<% Next %> 		






<!--       -->


 
<!--���� ���� �۳��̰� ���� �������� �ٸ��⵵�� ���  -->
 
<%
jan = "01"
elseIf Trim(startM) = jan Then %>

<% For numDifey=2 To endDay %>
   
 <td style="background-color:red" colspan="" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> 		</td> 
   		 
<% Next %> 

<% edt_day =  Right(service_edt,2)
   str_dat = Right(service_sdt,2)

   hap_day = edt_day+1 - str_dat
%>
<td style="background-color:red" colspan="" align="center"><%=Mid(service_sdt,5,2)%>-<%=Right(service_sdt,2)%> ~ <%=Mid(service_edt,5,2)%>-<%=Right(service_edt,2)%> </td>
<% For numDs=startDay To endDay %>

	<!-- ���� �Ⱓ ��׶��� �� ä��� -->
	  
	
<% Next %> 

<% For numDsb=endDay To lastDate-1  %>
<!-- ���� �Ⱓ �ƴѳ�¥ ���� ä���-->
	<td>  </td>
<% Next %> 		









<!--       -->





 

<% End if%>


<% End if%>
 <!--���� ���ۿ��� ���� �������� ���� ���ϰ��  ��  -->

				

			</tr>
<%
		Next 
	Else
%>
			<tr>
				<td colspan="10" style="text-align:center;">��ϵ� ������ �����ϴ�.</td>
			</tr>
<%
	End If
%>
			</tbody>
			</table>
			<!--<div id="paging_wrap"></div>-->
		</div>
	</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js"></script>
<script type="text/javascript" src="/common/js/jquery/jquery.pager.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery('#paging_wrap').setAdminPager('<%=page%>','<%=strPathInfo%>?<%=strDftUrl%>','<%=intTotalCnt%>', { nppg : '<%=page_size%>'});
	});
</script>
</html>