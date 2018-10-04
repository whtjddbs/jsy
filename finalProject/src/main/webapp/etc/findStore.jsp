<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
	<title>빤브 매장찾기</title>
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	<script>
		function initialize() {

			var Y_point			= 37.571075;		// Y 좌표
			var X_point			= 126.992410;		// X 좌표

			var zoomLevel		= 16;						// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

			var markerTitle		= "BbanB";				// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
			var markerMaxWidth	= 300;						// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

			var contentString	= '<div>' +
									'<h2>빤브</h2>'+
										'<p>빤브(Bbanb)는 다양한 사이즈와 세련된 디자인으로 <br />' +
           									 '다양한 속옷상품을 판매하는 쇼핑몰입니다.</p>' +
								  '</div>';

			var myLatlng = new google.maps.LatLng(Y_point, X_point);
			var mapOptions = {
								zoom: zoomLevel,
								center: myLatlng,
								mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

			var marker = new google.maps.Marker({
													position: myLatlng,
													map: map,
													title: markerTitle
			});

			var infowindow = new google.maps.InfoWindow(
														{
															content: contentString,
															maxWidth: markerMaxWidth
														}
			);

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		}
	</script>
</head>

<body onload="initialize()">
	<div id="map_view" style="width:1000px; height:700px;"></div>
</body>

</html>