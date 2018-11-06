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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new daum.maps.LatLng(37.5139926476, 127.0430861388), // 지도의 중심좌표
			level: 3, // 지도의 확대 레벨
			mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		}; 

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 지도에 마커를 생성하고 표시한다
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.5139926476, 127.0430861388), // 마커의 좌표
		map: map // 마커를 표시할 지도 객체
	});
	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);


</script>
</html>
