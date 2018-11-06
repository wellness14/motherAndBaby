<%
'======================================================================
'업 무 명 : 마더앤베이 - 관리자
'모듈기능 : 전화상담 내역 보기
'파 일 명 : service_call_view.asp
'작성일자 : 2015/06/22
'작 성 자 : 홍성주
'-----------------------------------------------------------------------
'변경일자   변경자  변동내역
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/checkUser.asp"-->
<%	
	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM MO_SERVICE_CALL WITH(NOLOCK) "

		strWhere = " WHERE MO_CALL_SEQ = '"& intIDX &"' "

		strSql = ""
		strSql = strSql & "	SELECT * "
		strSql = strSql & strTable
		strSql = strSql & strWhere
		Set Rs = DBExec(strSql,"main")	
		If Not Rs.EOF Then 
			arrList = Rs.getRows()
		End If 
		Call RSClose(Rs)
	Else 
		response.Write "<script type='text/javascript'>history.back(-1);</script>"
		response.End 
	End If 	  
%>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=32c5af9c21c6232852df18057f9425e7&libraries=services"></script>
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
	</style>
</head>
<body>
	<div id="container">
		<div class="linemap">마더앤베이비 > 회원관리 > <strong>전화상담관리</strong></div>
		<div class="write">
			
			<br />
			<h1>전화 상담 내역</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>Q1</th>
				<td>마더앤베이비를 알게 된 경로 : <%=arrList(1,0)%></td>
			</tr>
			<tr>
				<th>Q2</th>
				<td>이름 : <%=arrList(2,0)%>  <span style="margin-left:30px;"></span> 전화번호 : <%=arrList(3,0)%> <span style="margin-left:30px;"></span> 핸드폰번호 : <%=arrList(4,0)%></td>
			</tr>
			<tr>
				<th>Q3</th>
				<td>
				<script>
						var geocoder = new daum.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						var tmp_address = '<%=arrList(5,0)%>' + ' ' + '<%=arrList(6,0)%>';
						geocoder.addr2coord(tmp_address, function(status, result) {
							// 정상적으로 검색이 완료됐으면 
							 if (status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
							} 
						});   
				</script>
					(<%=arrList(5,0)%>)&nbsp;<a href="#" onClick="window.open('http://map.daum.net/link/to/<%=arrList(6,0)%> <%=arrList(7,0)%>,<%=coords%>','길찾기', width= 700, height=500);return false"><%=arrList(6,0)%>&nbsp;<%=arrList(7,0)%></a>
				</td>
			</tr>	
			<tr>
				<th>지도보기</th>
				<td>
						<div id="map" style="width:100%;height:500px;"></div>
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							mapOption = {
								center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level: 4 // 지도의 확대 레벨
							};  

						// 지도를 생성합니다    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new daum.maps.services.Geocoder();
						// 주소로 좌표를 검색합니다
						var tmp_address = '<%=arrList(6,0)%>' + ' ' + '<%=arrList(7,0)%>';
						geocoder.addr2coord(tmp_address, function(status, result) {
							// 정상적으로 검색이 완료됐으면 
							 if (status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
								
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new daum.maps.Marker({
									map: map,
									position: coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new daum.maps.InfoWindow({
									content: '<div style="padding:5px;"><%=arrList(6,0)%>&nbsp<%=arrList(7,0)%></div>'
								});
								infowindow.open(map, marker);
							} 
						});    
						</script>			
				</td>
			</tr>	
			
			<tr>
				<th>Q4</th>	
				<td>분만예정일 : <%=Left(arrList(8,0),4)%>-<%=Mid(arrList(8,0),5,2)%>-<%=Right(arrList(8,0),2)%> <span style="margin-left:30px;"></span>서비스실시 예정일 :   <%=Left(arrList(9,0),4)%>-<%=Mid(arrList(9,0),5,2)%>-<%=Right(arrList(9,0),2)%></td>
			</tr>
			<tr>
				<th>Q5</th>	
				<td><%=arrList(10,0)%><span style="margin-left:30px;"></span> 자녀 : <%=arrList(11,0)%> 명 <span style="margin-left:30px;"></span>나이 : <%=arrList(12,0)%> 세<span style="margin-left:30px;"></span>분만형태 : <%=arrList(13,0)%></td>
			</tr>
			<tr>
				<th>Q6</th>	
				<td>산후조리원 : <%=arrList(14,0)%><span style="margin-left:30px;"></span> <%=arrList(15,0)%> 주 </td>
			</tr>
			<tr>
				<th>Q7</th>	
				<td>원하시는 서비스 프로그램은 무엇입니까?<span style="margin-left:30px;"></span> <%=arrList(16,0)%></td>
			</tr>
			<tr>
				<th>Q8</th>	
				<td>서비스 내용중출퇴근과 입주 서비스 중 어떤 서비스 이용을 원하십니까? <span style="margin-left:30px;"></span><%=arrList(17,0)%> 
				<% If arrList(18,0) <> "" Then %> <%=arrList(18,0)%>  주 <span style="margin-left:30px;"></SPAN>  입주 <%=arrList(19,0)%> 주
				<% End if%> 
				</td>
			</tr>
			<tr>
				<th>Q9</th>	
				<td>산후관리사 서비스는 몇 주를 원하십니까? <span style="margin-left:30px;"></span><%=arrList(20,0)%></td>
			</tr>
			<tr>
				<th>10</th>	
				<td>추가가족 여부  <span style="margin-left:30px;"></span> 
				
				<% If arrList(21,0) <>"" Then  %>
				<%=arrList(21,0)%><span style="margin-left:10px;"></span><%=arrList(22,0)%>명<span style="margin-left:10px;"></span>
				<% End If %>
				<% If arrList(23,0) <> "" Then %>
				<%=arrList(23,0)%><span style="margin-left:10px;"></span><%=arrList(24,0)%>명<span style="margin-left:10px;"></span>
				<% End if%>
				<% If arrList(25,0) <> "" Then %>
				<%=arrList(25,0)%><span style="margin-left:10px;"></span><%=arrList(26,0)%>명<span style="margin-left:10px;"></span>
				<% End if%>
				<% If arrList(27,0) <> "" Then %>
				<%=arrList(27,0)%><span style="margin-left:10px;"></span><%=arrList(28,0)%>명<span style="margin-left:10px;"></span>
				<% End If %>
				<% If arrList(29,0) <> "" Then %>
				<%=arrList(29,0)%><span style="margin-left:10px;"></span><%=arrList(30,0)%>명
				<% End If %>
				</td>
			</tr>
			<tr>
				<th>Q11</th>	
				<td>어떤 성향의 관리사를 원하십니까? (관리사의 업무 주안점은 무엇입니까?) <span style="margin-left:5px;"></span> 
				<%=arrList(31,0)%> <span style="margin-left:5px;"></span> <%=arrList(32,0)%> <span style="margin-left:5px;"></span> <%=arrList(33,0)%> <span style="margin-left:5px;"></span> <%=arrList(34,0)%> <span style="margin-left:5px;"></span> <%=arrList(35,0)%> <span style="margin-left:5px;"></span> <%=arrList(36,0)%> </td>
			</tr>
			<tr>
				<th>Q12</th>	
				<td>1) 유축기 : <%=arrList(37,0)%> / <%=arrList(38,0)%> / <%=arrList(39,0)%> 주 <span style="margin-left:5px;"></span><%=arrList(40,0)%> 원 <span style="margin-left:5px;"></span>  2) 조사기 <span style="margin-left:10px;"></span><%=Left(arrList(41,0),4)%>-<%=Mid(arrList(41,0),5,2)%>-<%=Right(arrList(41,0),2)%> 년 </td>
			</tr>
			<tr>
				<th>Q13</th>	
				<td>전신마사지  산전 : <span style="margin-left:10px;"></span>  <%=arrList(42,0)%> <span style="margin-left:10px;"></span>  산후 : <%=arrList(43,0)%> 회  <span style="margin-left:10px;"></span>  추가 : <%=arrList(44,0)%> 회  </td>
			</tr>
			<tr>
				<th>Q14</th>
				<td>방문간호사  산전 : <span style="margin-left:10px;"></span><%=arrList(45,0)%>  회  <span style="margin-left:10px;"></span>  산후 : <%=arrList(46,0)%>  회     </td>
			</tr>
			<tr>
				<th>Q15</th>	
				<td>소독서비스 <span style="margin-left:10px;"></span> <% If arrList(47,0) = "Y" Then %> 신청함 <% Else %> 신청안함 <% End If %> </td>
			</tr>
			<tr>
				<th>Q16</th>
				<td>출산선물선택 <span style="margin-left:10px;"></span> <%=Left(arrList(48,0),4)%>-<%=Mid(arrList(48,0),5,2)%>-<%=Right(arrList(48,0),2)%> <span style="margin-left:10px;"></span><%=arrList(49,0)%> <span style="margin-left:10px;"></span><%=arrList(50,0)%> </td>
			</tr>
			<tr>
				<th>Q17</th>
				<td>출산선물박스 택배일  <span style="margin-left:10px;"></span> <%=Left(arrList(51,0),4)%>-<%=Mid(arrList(51,0),5,2)%>-<%=Right(arrList(51,0),2)%></td>
			</tr>
			<tr>
				<th>비고</th>
				<td> <%=arrList(52,0)%> </td>
			</tr>
			<!--tr>
				<th>지점</th>
				<td><%=arrList(50,0)%> </td>
			</tr-->
			<tr>
				<th>기타</th>
				<td>출퇴근,입주시간 : <span style="margin-left:10px;"></span> <%=arrList(54,0)%>  <span style="margin-left:10px;"></span> 
				휴일수당 : <span style="margin-left:10px;"></span><%=arrList(55,0)%> <span style="margin-left:10px;"></span> 
				휴식시간 : <span style="margin-left:10px;"></span><%=arrList(56,0)%> <span style="margin-left:10px;"></span>
				홈페이지 가입 : <span style="margin-left:10px;"></span><%=arrList(57,0)%></td>
			</tr>



			<!-- 
			<tr>
				<th>신청서비스</th>
				<td><%=Replace(arrList(9,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>이용기간</th>	
				<td><%=arrList(10,0)%></td>
			</tr>
			<tr>
				<th>이용형태</th>	
				<td><%=arrList(11,0)%></td>
			</tr>
			<tr>
				<th>출산예정일</th>	
				<td><%=Left(arrList(12,0),4)%>-<%=Mid(arrList(12,0),5,2)%>-<%=Right(arrList(12,0),2)%></td>
			</tr>
			<tr>
				<th>서비스시작 예정일</th>	
				<td><%=Left(arrList(13,0),4)%>-<%=Mid(arrList(13,0),5,2)%>-<%=Right(arrList(13,0),2)%></td>
			</tr>
			<tr>
				<th>조리원 이용</th>	
				<td><%=arrList(14,0)%></td>
			</tr>
			<tr>
				<th>출산경험</th>	
				<td><%=arrList(15,0)%></td>
			</tr>
			<tr>
				<th>특이사항</th>	
				<td><%=Replace(arrList(16,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>가족사항</th>	
				<td><%=Replace(arrList(17,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>상담완료여부</th>	
				<td><%=arrList(24,0)%></td>
			</tr>
			<tr>
				<th>상담내용</th>	
				<td><%=arrList(18,0)%></td>
			</tr>
			-->
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="수 정" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="삭 제" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="목 록" class="button" onClick="location.href='./service_call_list.asp?<%=strLnkUrl%>';">
					</td>
				</tr>  
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" src="/common/js/jquery/jquery-latest.js" /></script>
<iframe id="ifrm" name="ifrm" width="0" height="0"></iframe>
<script type="text/javascript">
	jQuery(document).ready(function(){
		var btn = jQuery('#btnSubmit');
		var del	= jQuery('#btnDelte');

		btn.click(function(){
			location.href="./service_call_ins.asp?idx=<%=intIDX%>&<%=strLnkUrl%>";
		});

		del.click(function(){
			if (confirm("삭제 하시겠습니까?")) {
				jQuery('#ifrm').attr({'src':'./service_call_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>

</html>