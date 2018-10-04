<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/template.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
a#BODY_MOVE_ON_BTN{
	position: fixed; /* 화면에 고정 */
	right: 3%; /* 버튼 위치 설정 */
	bottom : 50px; /* 버튼 위치 설정 */
	display: none; /*화면에서 숨김  */
	z-index: 999;/* 다른 태그들 보다 위에 오도록 */	
}
</style>
</head>

<body>
<header>
	<jsp:include page="../template/header.jsp"/>
</header>

<section style="overflow:hidden; height:auto; width: 100%; min-width: 1200px; padding-bottom: 150px;">
		<jsp:include page="${display }"/>
</section>

<footer>
	<jsp:include page="../template/footer.jsp"/>
</footer>

<a id="BODY_MOVE_ON_BTN" href="#"><img src="../image/move_on_top.png" width="65px" height="65px"></a>
</body>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	/* top버튼 */
	$("body").scrollTop(0);
	$(function(){
		$(window).scroll(function(){
			if($(this).scrollTop() > 400){
				$('#BODY_MOVE_ON_BTN').fadeIn();
			}else{
				$('#BODY_MOVE_ON_BTN').fadeOut();
			}/*스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고 사라지도록 설정   */
		});
		
		$('#BODY_MOVE_ON_BTN').click(function(){//버튼 클릭 이벤트 
			$('html, body').animate({scrollTop: 0}, 400);//animation을 걸어서 화면 맨위로 이동하도록 설정 
			return false;
		}); 
	});
</script>
</html>