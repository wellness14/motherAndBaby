<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=1190">
	<title>마더앤베이비</title>
</head>

<!--#include virtual="/common/menu/head.asp"-->
<body>
	<!--#include virtual="/common/menu/top.asp"-->
	<table width="1050" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<!--#include virtual="/common/menu/left.asp"-->
		<td width="850" valign="top">
			<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2" style="padding-top:40px;"><img src="/image/sub02_subtitle04.jpg" width="770" height="44" /></td>
			</tr>
			<tr>
				<td colspan="2" ><img src="/image/sizur_027.jpg" /></td>	
			</tr>
			<tr>
				<td colspan="2" style="padding-bottom:20px;"><img src="/image/bodycare_01.png" /></td>	
			</tr>

			<tr>
				<td width="386"  style="padding-bottom:50px;"><div id="map" style="width:350px;height:250px;"></div><div style="width:349px;height:30px; background-color: #FFFFFF;  border:1px solid gray;line-height:30px;vertical-align:center;"> <img src="/image/ico_street.gif" style="width:10px;margin-left:10px;height:14px;" align="center"/><a href="http://map.daum.net/link/to/마더앤베이비,37.49943865363411,127.03509823157841" target="_blank" ><span style="font-size:10px;?"> 길찾기&nbsp; </span></a> | <a href="http://map.daum.net/link/map/마더앤베이비,37.49943865363411,127.03509823157841" style="color:black" target="_blank"><span style="font-size:10px;?"> 큰지도보기 </span></a></div></td>	
			    <td width="410" style="padding-bottom:50px;"><img src="/image/bodycare_02.png" border="0" /></td>
			</tr>
			</table>
		</td>
	</tr>
	</table>
	<!--#include virtual="/common/menu/bottom.asp"-->
</body>

<script src="//apis.daum.net/maps/maps3.js?apikey=f7eafc9375c91973a27fae424fe59b49"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.49943865363411, 127.03509823157841), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 지도에 마커를 생성하고 표시한다
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.49943865363411, 127.03509823157841), // 마커의 좌표
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

