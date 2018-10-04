<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">
<style>
#container, #footer, #header {
    min-width: 300px;
    margin: 0 10px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

hr{
	height: 4px;
	width: 520px;
    color: #000;
    background-color: #000;
    border: none;
}

.title{
	font-size : 40px;
	font-family: 'Rubik', sans-serif;
}


.content {
    width: 460px;
    margin: 0 auto;
}


.join_title{
	margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 400;
    color : #6c6c6c;
}


.ps_box, .ps_box_disable {
    display: block;
    position: relative;
    width: 100%;
    height: 43px;
    border: solid 1px #dadada;
    padding: 10px 110px 10px 14px;
    background: #fff;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    vertical-align: top;
}

.input{
	display: block;
    position: relative;
    width: 110%;
    height: 29px;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10;
    apperance: none;
    -webkit-apperance: none;
    
    cursor : text;
}

.textarea{
	display: block;
    position: relative;
    width: 100%;
    height: 300px;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    /* font-size: 15px; */
    /* -webkit-box-sizing: border-box;
    box-sizing: border-box;
    z-index: 10;
    apperance: none;
    -webkit-apperance: none; */
    
    cursor : text;
}

.id_box{
	display: inline-block;
    width: 100%;
    padding: 10px 15px 10px 14px;
    vertical-align: top;
}

.id_inp{
	width : 100%;
}

.idChk_btn{
	position: absolute;
    top: 0;
    right: 0px;
    width: 115px;
    height: 43px;
    text-align: center;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-decoration: none;
    
    display: block;
    font-size: 15px;
    background: #000;
    color: #fff;
    border: 1px solid #303033;
    cursor: pointer;
}

.tel_box{
	display: table;
    width: 100%;
}

.tel1, .tel2, .tel3{
	display: table-cell;
    table-layout: fixed;
    width: 147px;
    vertical-align: middle;
}

.join_tel .ps_box{
	padding: 11px 14px;
}

.addr_div{
	position: relative;
    margin-top: 10px;
}

.addr_div #id{
	font-size : 24px;
}

.addr_btn{
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

.btn_area{
	margin: 30px 0 9px;
}

.btn_type{
	display: block;
    width: 100%;
    padding: 21px 0 17px;
    font-size: 20px;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.btn_primary {
    color: #fff;
    background-color: #000;
}

.join_row .edit_in{
	position:relative;
	width:250px
}

.join_row   .edit_in   .btn_black{
	position:absolute;
	top:0;
	left:103%
}

i{
	cursor: pointer;
}
</style>
</head>
<body>

<div align="center">
<font class="title">후기 쓰기</font>
<hr width="500" color="#000">
</div>

<form id="itemViewReviewForm" method="post" enctype="multipart/form-data" action="/finalProject/itemView/itemViewReview.do">
<div class="container">
	<div class="content">
		<div class="join_content">
			<div class="join_row">
	            <div class="addr_div">
		            <label>아이디  : </label>
		            <label id="id">${memberDTO.id}</label>
		            <input type="hidden" name="seq" value="${seq}">
	            </div>
	         </div>
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>별점  : </label>
		            	<i id="star1" class="far fa-star" style="color: black;"></i>
		            	<i id="star2" class="far fa-star" style="color: black;"></i>
		            	<i id="star3" class="far fa-star" style="color: black;"></i>
		            	<i id="star4" class="far fa-star" style="color: black;"></i>
		            	<i id="star5" class="far fa-star" style="color: black;"></i>
		            	<input type="hidden" name="star" id="starCnt" value="0">
	            </div>
	         </div>
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>내용</label>
		            <div class="textarea">
		            	<textarea cols="65" rows="10" id="comments" name="comments"></textarea>
		            </div>
		            <div id="commentDiv"></div>
	            </div>
	         </div>
	         
	         <br>
	         <div class="join_row">
	         	<label>상품이미지</label>
	            <input type="file" name="image" id="img" size="50">
	            <div id="imgDiv"></div>
	         </div>
	         
	         
	        <div class="btn_area">
	        	<button type="button" id="itemViewReviewBtn" class="btn_type btn_primary">상품후기 등록</button>
	        </div>
		</div>
	</div>
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//위시 리스트 추가
	$(document).on('click','.far.fa-star',function(){ // 빈 별
		/* $(this).prop('class','fas fa-star'); */
		if($(this).attr("id") == 'star1') {
			$('#star1').prop('class','fas fa-star');
			$('#starCnt').val(1);
		}
		else if($(this).attr("id") == 'star2') {
			$('#star1').prop('class','fas fa-star');
			$('#star2').prop('class','fas fa-star');
			$('#starCnt').val(2);
		}
		else if($(this).attr("id") == 'star3') {
			$('#star1').prop('class','fas fa-star');
			$('#star2').prop('class','fas fa-star');
			$('#star3').prop('class','fas fa-star');
			$('#starCnt').val(3);
		}
		else if($(this).attr("id") == 'star4') {
			$('#star1').prop('class','fas fa-star');
			$('#star2').prop('class','fas fa-star');
			$('#star3').prop('class','fas fa-star');
			$('#star4').prop('class','fas fa-star');
			$('#starCnt').val(4);
		}
		else if($(this).attr("id") == 'star5') {
			$('#star1').prop('class','fas fa-star');
			$('#star2').prop('class','fas fa-star');
			$('#star3').prop('class','fas fa-star');
			$('#star4').prop('class','fas fa-star');
			$('#star5').prop('class','fas fa-star');
			$('#starCnt').val(5);
		}  
		 
	});
	//위시 리스트 제거
	$(document).on('click','.fas.fa-star',function(){ // 꽉 찬 별
		/* $(this).prop('class','far fa-star'); */
		if($(this).attr("id") == 'star1') $('#star1').prop('class','far fa-star');
		else if($(this).attr("id") == 'star2') {
			$('#star1').prop('class','far fa-star');
			$('#star2').prop('class','far fa-star');
		}
		else if($(this).attr("id") == 'star3') {
			$('#star1').prop('class','far fa-star');
			$('#star2').prop('class','far fa-star');
			$('#star3').prop('class','far fa-star');
		}
		else if($(this).attr("id") == 'star4') {
			$('#star1').prop('class','far fa-star');
			$('#star2').prop('class','far fa-star');
			$('#star3').prop('class','far fa-star');
			$('#star4').prop('class','far fa-star');
		}
		else if($(this).attr("id") == 'star5') {
			$('#star1').prop('class','far fa-star');
			$('#star2').prop('class','far fa-star');
			$('#star3').prop('class','far fa-star');
			$('#star4').prop('class','far fa-star');
			$('#star5').prop('class','far fa-star');
		}
		$('#starCnt').val(0);
	});
	
	$('#itemViewReviewBtn').click(function(){
		if($('#comments').val() == ''){
			$('#commentDiv').text('내용을 입력하세요').css('color','red').css('font-size','9pt');
		}
		/* else if($('#img').val() == ''){
			$('#contentDiv').text('이미지를 등록하세요').css('color','red').css('font-size','9pt');
		} */
		else $('#itemViewReviewForm').submit();
	});
});
</script>
</body>
</html>