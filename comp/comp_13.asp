<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top"><table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td style="padding-top:40px;"><img src="/image/sub05_subtitle06.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td style="padding-top:40px; padding-bottom:50px;">
					<!-- <iframe src="http://dna.daum.net/include/tools/routemap/map_view.php?width=770&height=450&latitude=37.49943865363411&longitude=127.03509823157842&contents=&zoom=4" width="770" height="485" scrolling="no" frameborder="0"></iframe> -->
					<div id="map" style="width:770x;height:485px;"></div>
					<br /><br /><br />
					<img src="/image/text_0031.jpg" />
				</td>	
			</tr>
		</table></td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>
<script src="//apis.daum.net/maps/maps3.js?apikey=f7eafc9375c91973a27fae424fe59b49"></script>
<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		mapOption = {
			center: new daum.maps.LatLng(37.5139926476, 127.0430861388), // ������ �߽���ǥ
			level: 3, // ������ Ȯ�� ����
			mapTypeId : daum.maps.MapTypeId.ROADMAP // ��������
		}; 

	// ������ �����Ѵ� 
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.5139926476, 127.0430861388), // ��Ŀ�� ��ǥ
		map: map // ��Ŀ�� ǥ���� ���� ��ü
	});
	// ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
	var mapTypeControl = new daum.maps.MapTypeControl();

	// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

	// ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
	var zoomControl = new daum.maps.ZoomControl();

	// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


</script>
</html>
