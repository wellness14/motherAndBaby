<%
'======================================================================
'�� �� �� : �����غ��� - ������
'����� : ��ȭ��� ���� ����
'�� �� �� : service_call_view.asp
'�ۼ����� : 2015/06/22
'�� �� �� : ȫ����
'-----------------------------------------------------------------------
'��������   ������  ��������
'=======================================================================
'
'======================================================================= 
%>
<!-- #include virtual = "/common/asp/RSexec.asp" -->
<!-- #include virtual = "/common/asp/VarDef.asp"-->
<!-- #include virtual = "/common/asp/FunDef.asp"-->
<!-- #include virtual="/admin/common/asp/mobile_checkUser.asp"-->
<%	
	intIDX = fncRequest("idx")   
    If intIDX <> "" Then
		strTable = " FROM MO_BRD_SERVICE WITH(NOLOCK) "

		strWhere = " WHERE MS_CNLKBN='N' AND MS_IDX = '"& intIDX &"' "

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
		<div class="linemap">�����غ��̺� > ȸ������ > <strong>��ȭ������</strong></div>
		<div class="write">
			
			<br />
			<h1>��ȭ ��� ����</h1>
			<table class="tb_style02">
			<colgroup>
				<col width="5%" /><col />
			</colgroup>
			<thead>
			<tr>
				<th>����</th>
				<td><%=arrList(2,0)%></td>
			</tr>
			<tr>
				<th>�������</th>
				<td><%=Left(arrList(3,0),4)%>-<%=Mid(arrList(3,0),5,2)%>-<%=Right(arrList(3,0),2)%></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><%=arrList(4,0)%></td>
			</tr>
			<tr>
				<th>�ڵ�����ȣ</th>
				<td><%=arrList(5,0)%></td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td>
				<script>
						var geocoder = new daum.maps.services.Geocoder();
						// �ּҷ� ��ǥ�� �˻��մϴ�
						var tmp_address = '<%=arrList(7,0)%>' + ' ' + '<%=arrList(8,0)%>';
						geocoder.addr2coord(tmp_address, function(status, result) {
							// ���������� �˻��� �Ϸ������ 
							 if (status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
							} 
						});   
				</script>
					(<%=arrList(6,0)%>)&nbsp;<a href="#" onClick="window.open('http://map.daum.net/link/to/<%=arrList(7,0)%> <%=arrList(8,0)%>,<%=coords%>','��ã��', width= 700, height=500);return false"><%=arrList(7,0)%>&nbsp;<%=arrList(8,0)%></a>
				</td>
			</tr>	
			<tr>
				<th>��������</th>
				<td>
						<div id="map" style="width:100%;height:500px;"></div>
						<script>
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
							mapOption = {
								center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
								level: 4 // ������ Ȯ�� ����
							};  

						// ������ �����մϴ�    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
						var geocoder = new daum.maps.services.Geocoder();
						// �ּҷ� ��ǥ�� �˻��մϴ�
						var tmp_address = '<%=arrList(7,0)%>' + ' ' + '<%=arrList(8,0)%>';
						geocoder.addr2coord(tmp_address, function(status, result) {
							// ���������� �˻��� �Ϸ������ 
							 if (status == daum.maps.services.Status.OK) {
								var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
								
								// ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
								var marker = new daum.maps.Marker({
									map: map,
									position: coords
								});

								// ����������� ��ҿ� ���� ������ ǥ���մϴ�
								var infowindow = new daum.maps.InfoWindow({
									content: '<div style="padding:5px;"><%=arrList(7,0)%>&nbsp<%=arrList(8,0)%></div>'
								});
								infowindow.open(map, marker);
							} 
						});    
						</script>			
				</td>
			</tr>	
			<tr>
				<th>��û����</th>
				<td><%=Replace(arrList(9,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>�̿�Ⱓ</th>	
				<td><%=arrList(10,0)%></td>
			</tr>
			<tr>
				<th>�̿�����</th>	
				<td><%=arrList(11,0)%></td>
			</tr>
			<tr>
				<th>��꿹����</th>	
				<td><%=Left(arrList(12,0),4)%>-<%=Mid(arrList(12,0),5,2)%>-<%=Right(arrList(12,0),2)%></td>
			</tr>
			<tr>
				<th>���񽺽��� ������</th>	
				<td><%=Left(arrList(13,0),4)%>-<%=Mid(arrList(13,0),5,2)%>-<%=Right(arrList(13,0),2)%></td>
			</tr>
			<tr>
				<th>������ �̿�</th>	
				<td><%=arrList(14,0)%></td>
			</tr>
			<tr>
				<th>������</th>	
				<td><%=arrList(15,0)%></td>
			</tr>
			<tr>
				<th>Ư�̻���</th>	
				<td><%=Replace(arrList(16,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>��������</th>	
				<td><%=Replace(arrList(17,0),"||", ", ")%></td>
			</tr>
			<tr>
				<th>���ϷῩ��</th>	
				<td><%=arrList(24,0)%></td>
			</tr>
			<tr>
				<th>��㳻��</th>	
				<td><%=arrList(18,0)%></td>
			</tr>
			</thead>
			</table>
			<p>&nbsp;</p>

			<table border="0" cellpadding="0" cellspacing="0" bgcolor="white" style="width:100%; height:100px;">
				<tr>
					<td align="center">
						<input type="button" value="�� ��" id="btnSubmit" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" id="btnDelte" class="button">&nbsp;&nbsp;&nbsp;
						<input type="button" value="�� ��" class="button" onClick="location.href='./service_list.asp?<%=strLnkUrl%>';">
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
			location.href="./service_ins.asp?idx=<%=intIDX%>&<%=strLnkUrl%>";
		});

		del.click(function(){
			if (confirm("���� �Ͻðڽ��ϱ�?")) {
				jQuery('#ifrm').attr({'src':'/info/info_01_sql.asp?mode=del&idx=<%=intIDX%>&<%=strLnkUrl%>'});
			}
		});
	});
</script>

</html>