<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/itemList.css">	
<link rel="stylesheet" href="../css/myDialog.css">
<link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
#pdtForm {
	width: 600px;
	height: 500px;
	margin-right: 20px;
	object-fit: cover;
}

#pdtForm a:hover {text-decoration: none;}

#pdtForm div {
	color : black;
}

#pdtView {
	position: relative;
	display: flex;
	padding: 10px 50px;
	/* padding-right:50px; */
	overflow: hidden;
}

#center {
	margin-left: 280px;
	width: 80%;
}

#one_pdtForm {
	height: 55%;
	width: 100%;
	object-fit: cover;
}

#leftScroll {
	position: absolute;
	width: 200px;
	height: auto;
	left: 50px;
	top: 250px;
	object-fit: cover;
	margin-right: 200px;
}

body div a {
	text-decoration: none;
}

#see_more {
	margin-left: 90%;
}

#category_name {
	/* font-family: 'Anton', sans-serif; */
	font-family: 'Oswald', sans-serif;
	font-size: 50px;
	border-bottom: 5px solid #000000;
}

.leftCategory_name {
	font: italic bold 1.5em/1em Georgia, serif;
	font-size: 50px;
	border-bottom: 5px solid #000000;
	margin-bottom: 20%;
}

.selected {
	color: blue;
}

#category_view img {
	height: 100%;
	width: 100%;
	object-fit: one_pdtForm;
}
#category_view  {text-decoration: none;}	
.itemAll{margin-left: 2%; width: 15%;}

.btn_bor {
    display: inline-block;
    width: 161px;
    margin-top: 24px;
    border: 1px solid #d4d4d4;
    border-radius: 2px;
    font-size: 14px;
    color: #5d5d5d;
    line-height: 40px;
    text-align: center;
    box-sizing: border-box;
    padding-right: 20px;
}

#dialog a {
	outline : none;
	text-decoration : none;
}

#loginTitle{
	font-size : 24px;
}

#arrowIcon{
	font-size: 15px;
    position: absolute;
    padding-top: 12px;
    padding-left: 8px;
}

.seeMoreBtn{
	position: absolute;
    top: 0;
    right: 137px;
    width: 115px;
    height: 43px;
    text-align: center;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-decoration: none;
    
    display: block;
    font-size: 15px;
    background: #fff;
    color: #000;
    border: 1px solid #303033;
    cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	//왼쪽 디스플레이		
	$.ajax({
		type:'POST',
		url:'/finalProject/new/getCategory.do',
		dataType : 'json',
		async: false,
		success: function(data){	
			 $.each(data.list, function(index, item){
				  $('<tr/>').append($('<td/>').append($('<a/>',{
					 style : 'color:black;',
					 href : '/finalProject/new/bestDisplay.do?main_codename='+item.main_codename,							 
					 text: item.main_codename						 
				 }))).appendTo($('#codename')); 
			});
		}		 
	});
	
	//왼쪽 디스플레이 클릭 이벤트
	$('#codename').on('click','a',function(){
		var url = '/finalProject/new/bestDisplay.do?main_codename='+$(this).text()+'&pg=1';
		location.href=url;
	});
		
	//중앙 디스플레이	
	$('#codename a').each(function(index){			
		var main_codename = $(this).text();
		
		$.ajax({
			type: 'POST',
			url: '/finalProject/new/getBestImageList.do',
			data : {'main_codename' : main_codename},
			dataType : 'json',
			async: false,
			success: function(data){
				$('#category_view').append($('<div/>',{
					id: 'category_name',
					text: main_codename
				})).append($('<div/>',{
					id: 'ulDiv',
				}).append($('<ul/>',{							
					id:'pdtView'
				})));				
				// 그림 밑에 see more 쓰고 싶다		
					
				$.each(data.list, function(index1, item){
					$('#category_view ul:eq('+index+')').append($('<li/>',{
							id : 'pdtForm'																
						}).append($('<a/>',{
							href : "/finalProject/itemView/itemViewTop.do?seq="+item.SEQ
						}).append($('<div/>',{
							id : 'one_pdtForm'
						}).append($('<img/>',{
							src : '../image/'+main_codename+'/'+item.IMG,
							height: '100%', 
							width: '100%', 
							'object-fit': 'one_pdtForm'
						}))).append($('<div/>',{
							class : 'itemText1',
							text:item.SUB_CODENAME								
						})).append($('<div/>',{
							class : 'itemText2',
							text:item.NAME
						})).append($('<div/>',{
							class : 'itemText3',
							text:item.PRICE+'원'								
						}))).append($('<a/>',{
							id : 'wish'+item.SEQ
						}).append($('<input/>',{
							type : 'hidden',
							id : 'wish'+item.SEQ,
							value : item.SEQ
						})).append($('<i/>',{
							class : 'far fa-heart',
							style : 'color : red; margin-right : 5px;'
						}))).append($('<span/>',{
							style : 'margin-right : 40px;',
							text : item.WISHLISTCOUNT
						})).append($('<a/>').append($('<i/>',{
							class : 'far fa-comment-alt',
							style : 'margin-right : 5px;'
						}))).append($('<span/>',{
							text : item.REVIEWCOUNT
						})))
				 	}); //each
				
				} // success
	 		});
		});

/*
 $('#ulDiv').append($('<div/>',{
						id: 'see_more',							
					}).append($('<input/>',{
						type : 'button',
						class : 'seeMoreBtn',
						id : 'seeMoreBtn',
						value : 'see More',
					})).append($('<i/>',{
						class : 'fas fa-angle-double-right'
					})))  	 
		
	<input type="button" class="seeMoreBtn" id="addrBtn" value="주소찾기">	
	href:"/finalProject/new/bestDisplay.do?main_codename="+main_codename,
*/
	
	//스크롤 이동
	var floatPosition = parseInt($("#floatMenu").css('top'));
	
	$(window).scroll(function(){
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
		
		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
	}).scroll();
	
		
	//옵션에서 선택된 것 활성화, 안된것 비활성화
	/* $('#floatMenu a').click(function(){
		$('#floatMenu a').removeClass('selected');
		$(this).addClass('selected');
	}); */
	
	$('#empty Heart').click(function(){
		$(this).toggleClass('.fas fa-heart');
	});	
		
	//위시 리스트 로딩
	if('${memberDTO}'!='') {
		$.ajax({
			type : 'POST',
			url : '/finalProject/member/getWishList.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.wishList, function(index, seq){
					$('#wish'+seq+' > i').prop('class','fas fa-heart');
				});
			}
		});
	}
	
	//위시 리스트 추가
	$(document).on('click','.far.fa-heart',function(){
		var thisisme = $(this).parent().next();
		if('${memberDTO}'=='') $('#dialog_frame').show();
		else {
			$(this).prop('class','fas fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/addWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					thisisme.text(parseInt(thisisme.text())+1);
				}
			});
		}
	});
	//위시 리스트 제거
	$(document).on('click','.fas.fa-heart',function(){
		var thisisme = $(this).parent().next();
		if('${memberDTO}'=='') $('#dialog_frame').show();
		else {
			$(this).prop('class','far fa-heart');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/deleteWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {
					thisisme.text(parseInt(thisisme.text())-1);
				}
			});
		}
	});
	
	/* 로그인하러 가기 버튼 눌렀을 때 */
	$('#loginGoBtn').click(function(){
		location.href="/finalProject/member/loginForm.do"
	});
	
	$('#dialog_closeBtn').click(function(){
		$('#dialog_frame').hide();
	});
});
</script>
</head>
<body>
	<div>
		<!-- 왼쪽 ------------------------------------------------------->
		<div id="floatMenu" style=" width: 10%; float: left; margin-left: 1%; margin-right: 3%;">
			<div>
				<span onclick="location.href='bestIndex.do'" style="cursor: pointer;"><h3>BEST</h3></span>
				<div style="width: 99%; border: 2px solid black;"></div>
				<table class="codename" id="codename">
				</table>
			</div>
		</div>

		<!--가운데 ------------------------------------------------------- -->
		<div id="center">
			<div id="category_view"></div>
		</div>
	</div>
	
<!-- 기본 다이얼로그 -->
<div id="dialog_frame">
	<div id="dialog">
		<i class="material-icons" id="dialog_closeBtn">clear</i>
		<div id="loginTitle">로그인하세요</div>
		<a class="btn_bor" id="loginGoBtn">로그인하러 가기
		<!-- <i class="far fa-angle-right" style="font-size:24px;"></i></a> -->
		<i class="material-icons" id="arrowIcon">arrow_forward_ios</i></a>
	</div>
</div>
</body>
</html>