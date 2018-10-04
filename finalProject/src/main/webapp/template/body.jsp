<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>
</head>
<link rel="stylesheet" href="../css/template.css">

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
	    <a class="body_btn_prev" onclick="body_top_plusDivs(-1)">
	    	<img src="../image/body_prev.png" id="prevImg"></a>
	    <a class="body_btn_next" onclick="body_top_plusDivs(1)">
	    	<img src="../image/body_next.png" id="nextImg"></a>
	  </div>
	</div>  
	
	<div class="body_imageSlide_btn" align="center">
		<a href="#" onclick="body_top_currentDiv(1)"><img src="../image/body_dot.jpg"></a>
		<a href="#" onclick="body_top_currentDiv(2)"><img src="../image/body_dot.jpg"></a>
		<a href="#" onclick="body_top_currentDiv(3)"><img src="../image/body_dot.jpg"></a>		
		<a href="#" onclick="body_top_currentDiv(4)"><img src="../image/body_dot.jpg"></a>		
		<a href="#" onclick="body_top_currentDiv(5)"><img src="../image/body_dot.jpg"></a>
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
	

		<div class="body_recommendation">
			<h1 class="body_recommendation_title">recommendations</h1>
			<ul class="body_recommendation_link_group">
				<li class="body_recommendation_active" data-target=".recommendation_thumbnail_list1">
					<button type="button">
						<span>ALL</span>
					</button>
				</li>
				<li class="body_recommendation_active" data-toggle="modal" data-target=".recommendation_thumbnail_list2">
					<button type="button">
						<span>BRAS</span>
					</button>
				</li>
				<li class="body_recommendation_active" data-target=".recommendation_thumbnail_list3">
					<button type="button">
						<span>PANTIES</span>
					</button>
				</li>
				<li class="body_recommendation_active" data-target=".recommendation_thumbnail_list4">
					<button type="button">
						<span>MEN'S</span>
					</button>
				</li>
				<li class="body_recommendation_active" data-target=".recommendation_thumbnail_list5">
					<button type="button">
						<span>SPORT</span>
					</button>
				</li>
			</ul>
			<div class="recommendation_thumbnail_list recommendation_thumbnail_list1" id="reco_main_bt">
				<ul>
					<li>
						<a href="">
							<div>
								<img src="../image/1.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/5.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/2.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/3.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/4.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list1-->
			<!-- 
			<div class="recommendation_thumbnail_list recommendation_thumbnail_list2" id="reco_main_bt">
				<ul>
					<li>
						<a href="">
							<div>
								<img src="../image/1.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/5.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/2.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/3.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/4.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list2-->
			
<!-- 		<div class="recommendation_thumbnail_list recommendation_thumbnail_list3 active" id="reco_main_bt">
				<ul>
					<li>
						<a href="">
							<div>
								<img src="../image/1.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/5.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/2.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/3.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/4.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list3-->
			
			<!-- <div class="recommendation_thumbnail_list recommendation_thumbnail_list4 active" id="reco_main_bt">
				<ul>
					<li>
						<a href="">
							<div>
								<img src="../image/1.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/5.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/2.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/3.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/4.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list4-->
			
		<!-- 	<div class="recommendation_thumbnail_list recommendation_thumbnail_list5 active" id="reco_main_bt">
				<ul>
					<li>
						<a href="">
							<div>
								<img src="../image/1.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/5.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/2.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/3.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
					<li>
						<a href="">
							<div>
								<img src="../image/4.jpg">
							</div>
							<div class="recommendation_text max">
								<div class="recommendation_text_wrap">
									<div class="recommendation_product ellipsis">[Drama Collection] Slit Cuffs Ta...</div>
								</div>
								<div class="recommendation_price">
									<span class="recommendation_discount_price">39,000</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
			</div> <!-- recommendation_thumbnail_list5-->

		</div><!-- body_recommendation -->
	</div>
</div><!-- body_more_contents -->



<!-- <a id="BODY_MOVE_ON_BTN" href="#"><i class="fa fa-chevron-circle-up"></i></a> -->
<a id="BODY_MOVE_ON_BTN" href="#"><img src="../image/move_on_top.png" width="65px" height="65px"></a>
</div><!--body_content  -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$('.recommendation')
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
	var body_top_slideIndex = 1;
	body_top_showDivs(body_top_slideIndex);
	
	function body_top_plusDivs(n) {
		body_top_showDivs(body_top_slideIndex += n);
	}
	
	function body_top_currentDiv(n) {
		body_top_showDivs(body_top_slideIndex = n);
	}
	
	function body_top_showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("body_mySlides");
	  var dots = document.getElementsByClassName("slideBtn");
	  if (n > x.length) {body_top_slideIndex = 1}    
	  if (n < 1) {body_top_slideIndex = x.length} ;
	  for (i = 0; i < x.length; i++) {
	     x[i].style.display = "none";  
	  }
	   for (i = 0; i < dots.length; i++) {
	     dots[i].className = dots[i].className.replace(" w3-red", "");
	  }
	  x[body_top_slideIndex-1].style.display = "block";  
	  dots[body_top_slideIndex-1].className += " w3-red"; 
	}

	 
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