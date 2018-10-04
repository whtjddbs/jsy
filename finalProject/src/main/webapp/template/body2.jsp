<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
</head>
<link rel="stylesheet" href="../css/template.css">
<style type="text/css">
a#BODY_MOVE_ON_BTN{
	position: fixed; /* 화면에 고정 */
	right: 3%; /* 버튼 위치 설정 */
	bottom : 50px; /* 버튼 위치 설정 */
	display: none; /*화면에서 숨김  */
	z-index: 999;/* 다른 태그들 보다 위에 오도록 */	
}
.js-load{
	display: none;
}
.js-load.active {
    display: block;
}
.is_comp.js-load:after {
    display: none;
}
.btn-wrap, .lists, .main {
    display: block;
}
.main {
    max-width: 640px;
    margin: 0 auto;
}
.lists {
    margin-bottom: 4rem;
}
.lists__item {
    padding: 20px;
    background: #EEE;
}
.lists__item:nth-child(2n) {
    background: #59b1eb;
    color: #fff;
}
.btn-wrap {
    text-align: center;
}
</style>

 <div class="body_content">
 	<div class="body_container_imageSlides">
	  <img class="body_mySlides" src="../image/main_pic2.jpg">
	  <img class="body_mySlides" src="../image/main_pic3.jpg">
	  <img class="body_mySlides" src="../image/main_pic4.jpg">
	  <img class="body_mySlides" src="../image/main_pic5.jpg">
	  <img class="body_mySlides" src="../image/main_pic1.jpg">
	</div>
	
	
	<div class="body_imageSlide_center">
	  <div class="body_imageSlide_btn_section">
	    <a class="body_btn_prev" onclick="plusDivs(-1)">
	    	<img src="../image/body_prev.png" id="prevImg"></a>
	    <a class="body_btn_next" onclick="plusDivs(1)">
	    	<img src="../image/body_next.png" id="nextImg"></a>
	  </div>
	</div>  
	
	<div class="body_imageSlide_btn" align="center">
	  <button class="body_imageSlide_btn slideBtn" onclick="currentDiv(1)">1</button> 
	  <button class="body_imageSlide_btn slideBtn" onclick="currentDiv(2)">2</button> 
	  <button class="body_imageSlide_btn slideBtn" onclick="currentDiv(3)">3</button> 
	  <button class="body_imageSlide_btn slideBtn" onclick="currentDiv(4)">4</button> 
	  <button class="body_imageSlide_btn slideBtn" onclick="currentDiv(5)">5</button> 
	</div> 
	
	<div class="body_thumbnail_layout">
		<div class="body_style_story">
			<h2 class="body_tit_main">style story</h2>
			<ul class="test">
				<li class="test_list">
					<a href="">
						<img src="../image/1.jpg">
						<strong>프로젝트X콜라보레이션</strong>
						<p>"여기는 여자 사진으로"</p>
					</a>
				</li>
				<li class="test_list">
					<a href="">
						<img src="../image/2.jpg">
						<strong>프로젝트X콜라보레이션</strong>
						<p>"여기는 남자 사진으로"</p>
					</a>
				</li>
				<li class="test_list">
					<a href="">
						<img src="../image/2.jpg">
						<strong>프로젝트X콜라보레이션</strong>
						<p>"여기는 스포츠 사진으로"</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="body_mainPic">
		<img class="body_mainPic_img" src="../image/mainPic.jpg">
	</div>
	
	<div class="body_video">
		<embed src="https://dm.victoriassecret.com/appfeatures/1268132919181/BLMxVS_LONGFORM_1L_HD_ProRHQ_1600x900.mp4" width="100%" height="600" autostart="true">
	</div>
	
	<div class="body_monthly_event_layout">
		<h2 align="center">Monthly Event</h2>
		<div class="body_women_event" style="border: 1px solid gold; float: left; width: 33%;">
			<ul class="body_event1">
					<h2>여자 이벤트</h2></li>
					<li><a href=""><img src="../image/1.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/2.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/3.jpg" width="100%" height="100px"></a></li>
			</ul>
		</div>	
		<div class="body_men_event" style="border: 1px solid gold; float: left; width: 33%;">
			<ul class="body_event2">
					<li><h2>남자 이벤트</h2></li>
					<li><a href=""><img src="../image/4.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/5.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/6.jpg" width="100%" height="100px"></a></li>
			</ul>
		</div>
		<div class="body_sport_event" style="border: 1px solid gold; float: left; width: 33%;">
			<ul class="body_event3">
					<li><h2>스포츠이벤트</h2></li>
					<li><a href=""><img src="../image/7.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/8.jpg" width="100%" height="100px"></a></li>
					<li><a href=""><img src="../image/9.jpg" width="100%" height="100px"></a></li>
			</ul>
		</div>	
			
		
	</div>
	
	
	<div id="contents">
		<div id="js-load" class="main">
			<ul class="lists">
				<li class="lists__item js-load">
				 	<div class="body_bottom_imgSlides">
						<h1 align="center">#LIFE WITH BBANBE #BBANBE IN ACTION</h1>
						<!-- <div class="body_bottom_slideshow_container">
						<div class="body_bottom_mySlides fade">
						   <img class="body_bottom_bottom_mySlides" src="../image/1.jpg" width="300px">
						   <img class="body_bottom_bottom_mySlides" src="../image/2.jpg" width="300px">
						   <img class="body_bottom_bottom_mySlides" src="../image/3.jpg" width="300px">
						</div>
						
						<div class="body_bottom_mySlides fade">
						  <img class="body_bottom_bottom_mySlides" src="../image/4.jpg" width="300px">
						  <img class="body_bottom_bottom_mySlides" src="../image/5.jpg" width="300px">
						  <img class="body_bottom_bottom_mySlides" src="../image/6.jpg" width="300px">
						</div>
						
						<div class="body_bottom_mySlides fade">
						  <img class="body_bottom_bottom_mySlides" src="../image/7.jpg" width="300px">
						  <img class="body_bottom_bottom_mySlides" src="../image/8.jpg" width="300px">
						  <img class="body_bottom_bottom_mySlides" src="../image/9.jpg" width="300px">
						</div>
						
						</div> -->
						
						<div class="body_bottom_imgSlides_dot" style="text-align:center">
						  <span class="bottom_dot"></span> 
						  <span class="bottom_dot"></span> 
						  <span class="bottom_dot"></span> 
						</div>
						
					</div> 
				</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				<li class="lists__item js-load">test1</li>
				
				
			</ul>
		<div id="js-btn-wrap" class="btn-wrap"> <a href="javascript:;" class="button">더보기</a> </div>
	</div>
</div><!-- body_more_contents -->





<a id="BODY_MOVE_ON_BTN" href="#"><img src="../image/Back_to_Btn.png" width="65px" height="65px"></a>
</div><!--body_content  -->

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
	
	/*body_top_slideImages  */
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function currentDiv(n) {
	  showDivs(slideIndex = n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("body_mySlides");
	  var dots = document.getElementsByClassName("slideBtn");
	  if (n > x.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	     dots[i].className = dots[i].className.replace(" w3-red", "");
	  }
	  x[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " w3-red";
	}
	
	/*body_bottom_slideImages  */
/*   	var bottom_slideIndex = 0;
	bottom_showSlides();

	function bottom_showSlides() {
	    var j;
	    var bottom_slides = document.getElementsByClassName("body_bottom_mySlides");
	    var bottom_dots = document.getElementsByClassName("bottom_dot");
	    for (j = 0; j < bottom_slides.length; j++) {
	    	bottom_slides[j].style.display = "none";  
	    }
	    bottom_slideIndex++;
	    if (bottom_slideIndex > bottom_slides.length) {bottom_slideIndex = 1}    
	    for (j = 0; j < bottom_dots.length; j++) {
	        bottom_dots[i].className = bottom_dots[i].className.replace(" bottom_active", "");
	    }
	    bottom_slides[bottom_slideIndex-1].style.display = "block";  
	    bottom_dots[bottom_slideIndex-1].className += " bottom_active";
	    setTimeout(bottom_showSlides, 2000); // Change image every 2 seconds
	}  */
	/* more 더보기버튼 */
	$(window).on('load', function () {
	    load('#js-load', '1');
	    $("#js-btn-wrap .button").on("click", function () {
	        load('#js-load', '1', '#js-btn-wrap');
	    })
	});
	 
	function load(id, cnt, btn) {
	    var girls_list = id + " .js-load:not(.active)";
	    var girls_length = $(girls_list).length;
	    var girls_total_cnt;
	    if (cnt < girls_length) {
	        girls_total_cnt = cnt;
	    } else {
	        girls_total_cnt = girls_length;
	        $('.button').hide()
	    }
	    $(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
</script>


</html>