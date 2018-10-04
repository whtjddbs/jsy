<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<link href="https://fonts.googleapis.com/css?family=Cute+Font&amp;subset=korean" rel="stylesheet">
<!-- bootstrap icon사용  -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--font-awesome사용  -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css" rel="stylesheet"/>
</head>"C:/Users/elly9/Desktop/finalProject/src/main/webapp/template/header.jsp"
<link rel="stylesheet" href="../css/myDialog.css">
<link rel="stylesheet" href="../css/template.css">
<style>
@media only screen and (max-width: 1350px) {
.header_search:eq(1) {background-color:red; top:224px;}
}
	#header_search_layer {  
	  position:absolute;  
	  z-index:9000;  
	  background: hsla(0,0%,100%,.98);
	  display:none;  
	  left:0;
	  top:0;
	}

</style>


<body>

<div class="header_container">
	<div  class="header_layout">
		<div class="header_banner_pc_view">
			<div class="header_banner_text">Bbanb 첫구매시 무료 배송</div>
			<div class="header_banner_text2">
				<i class="fa fa-truck">Free Shipping for the First Order</i></div>
			
		</div>
		<div  class="header_wrap">
			<c:if test="${memberDTO.code == 9 }">
				<a href="/finalProject/admin/itemControll.do"><i class="fa fa-user">ADMIN</i></a>
			</c:if>
			<c:if test="${memberDTO.code != 9 }">
				<a href="/finalProject/myPage/myPageIndex.do"><i class="fa fa-user">MYPAGE</i></a>
			</c:if>	
			<a href="/finalProject/myPage/wishList.do"><i class="fa fa-heart">MYHEART</i></a>
			<a href="/finalProject/order/shoppingBag.do"><i class="fa fa-shopping-basket">SHOPPINGBAG</i></a>
			<c:if test="${memberDTO == null }">
				<a href="/finalProject/member/loginForm.do"><i class="fa fa-sign-in">LOGIN</i></a>
			</c:if>
			<c:if test="${sessionScope.memberDTO != null}">
				<a id="logoutBtn"><i class="fa fa-sign-out">LOGOUT</i></a>
			</c:if>
		</div>
	</div>	

	<div class="header_clearfix" style="margin-top:30px; width: 100%; min-width: 1000px;">
		<a href="#" onclick="location.href='/finalProject/main/index.do'"><img src="../image/logoName.jpg" style="margin-left:20px;"></a> 
		<div class="header_global-nav" style="padding: 10px 0;">
			<ul class="header_nav" style="margin-left:10%;">
				<li>
					<a href="/finalProject/new/newIndex.do" style="color:#000000; font-size: 20px; text-decoration: none;">NEW</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=bras" style="color:#000000; font-size: 20px; text-decoration: none;">BRAS</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=panties" style="color:#000000; font-size: 20px; text-decoration: none;">PANTIES</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=mens" style="color:#000000; font-size: 20px; text-decoration: none;">MEN'S</a>
					<a href="/finalProject/new/itemDisplay.do?main_codename=sport" style="color:#000000; font-size: 20px; text-decoration: none;">SPORT</a>
				</li>
			</ul>
			<ul class="header_nav">
				<li>
					<a href="/finalProject/new/bestIndex.do" class="subMenu2" style="color:#000000; font-size: 20px; text-decoration: none;">BEST</a>
					<a href="/finalProject/new/event.do" class="subMenu2" style="color:#000000; font-size: 20px; text-decoration: none;">EVENT</a>
				</li>
			</ul>
			<c:if test="${param.button != 'jsy' }">
			<div  class="header_search_Btn" style="float: right; margin-right: 20px;">
				<a href="#"><button id="searchId" class="glyphicon glyphicon-search" aria-hidden="true" style="border:0; outline: 0; background:transparent; font-size:50px; text-decoration: none; color: #000000;"></button></a>			
			</div>
			</c:if>
		</div>
		
		<div id="header_search_layer" style="justify-flex:content-end; padding: 0 50px;">
			<div class="header_search_area" style="margin: 0;">
				<div class="header_search_in">
					
					<button class="clearBtn fa fa-close fa-5x" aria-hidden="true" style="outline: none; border: 0; background: #fff; width: 50px; height: 50px; float:right; margin:0 10px 100px 0;"></button></a>
					
					<div  class="header_search" style="clear: both; padding-right: 5px; border-bottom: 6px solid #000; width: 600px; margin: 0 auto; border-bottom: 4px solid #000; margin-right:40px; margin-top: 20px;">
						<form action="/finalProject/etc/searchForm.do">
							<input type="text" name="header_search_text" id="header_search_text" placeholder="Search" style="width: 90%; height: 100%; border: 0; background: #fff; color: #000; outline: none; font-size: 27px; font-weight: 600;"/>
							<a href="#"><button type="submit" name="button" id="searchId" value="jsy" class="glyphicon glyphicon-search" aria-hidden="true" style="font-size: 30px; color:#000000;"></button></a>
						</form>
					</div>
				</div><!-- header_search_in -->
			</div><!-- header_search_area -->
			<div class="header_search_list" style="float: right; margin-top: 30px; margin-right: 10%;">
				<div class="header_search_newest" style="float: left; margin-right: 180px;" >
					<h2 style="margin-bottom: 10px; font-size: 26px; line-height: 30px; color: #303033;">최근검색어</h2>
					<div>최근검색어 내역이 없습니다.</div>
				</div>
				<div class="header_search_recommend" style="float: right;">
					<h2 style="margin-bottom: 10px; font-size: 26px; line-height: 30px; color: #303033;">인기검색어</h2>
					<ul>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">Push-up Bra</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">Trunk</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">Demi Bra</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">Draws</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">Sport Bra</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">G String</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">교환/배송 문의</a></li>
						<li><a style="font-size : 15px; text-decoration: none; color:#000000;">서비스 센터</a></li>
					</ul>
				</div><!-- header_search_recommend -->
			</div> <!-- header_search_list -->
			
		</div><!-- header_search_layer -->
	
	</div>	

</div>


<div id="logoutDialog_frame">
	<div id="logoutDialog">
		<i class="material-icons" id="logoutDialog_closeBtn">clear</i>
			정상적으로 로그아웃되었습니다.
	</div>		
</div>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('.btn-example').click(function(){
	    var $href = $(this).attr('href');
	    layer_popup($href);
	});
	$('.header_search:eq(0)').click(function(){
		$('.header_search:eq(1)').toggle();
	});	
	
    
	//막 띄우기
	$('#searchId').click(function(e){
		e.preventDefault();
		wrapWindowByMask();
		
		$.ajax({
			type: 'POST',
			url: '/finalProject/main/recentlyText.do',
			dataType : 'json',
			success : function(data) {
				alert(JSON.stringify(data));
			}
		});
	});

	
	//닫기 버튼을 눌렀을 때
	$('.clearBtn').click(function (e) {  
	    //링크 기본동작은 작동하지 않도록 한다.
	    $('#header_search_layer').hide();  
	}); 
	
	$('#logoutBtn').click(function(){
		$.ajax({
			type: 'GET',
			url: '/finalProject/member/logout.do',
			dataType : 'text',
			success : function(data) {
				if(data == 'logout'){
					$('#logoutDialog_frame').show();
				}
			}
		});
	});
	
	$('#logoutDialog_closeBtn').click(function(){
		$('#logoutDialog_frame').hide();
		$(location).attr('href','/finalProject/main/index.do');
	});
});


function wrapWindowByMask(){
	//화면의 높이와 너비를 구한다.
	var maskHeight = $(document).height();  
	var maskWidth = $(window).width();  

	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
	$('#header_search_layer').css({'width':maskWidth,'height':maskHeight});  

	//애니메이션 효과 - 투명한 정도   
	$('#header_search_layer').fadeTo("slow",0.99);    

}

</script>

