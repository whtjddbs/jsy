<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

.addr_div{
	position: relative;
    margin-top: 10px;
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

#myConfirmDialog_frame {
	background-color: rgba(255,255,255,0.8);
    z-index: 1000;
    opacity: 1;
	display: none;
    position: fixed;
    overflow: hidden;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    text-align: center;
}
#myConfirmDialog {
	width: inherit;
    height: inherit;
    padding: 30px 40px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    width: 350px;
    height: 150px;
}
#myConfirmDialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}
#myConfirmDialog_okBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	left: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
#myConfirmDialog_cancelBtn {
	position: fixed;
	width: 80px;
	height: 30px;
	bottom: 20px;
	right: 80px;
	border: 1px solid black;
	background-color: black;
	color: white;
	outline: none;
	cursor: pointer;
}
</style>
</head>
<body>
<div align="center">
<font class="title">ADD EVENT</font>
<hr width="500" color="#000">
</div>

<form id="eventAdd" method="post" enctype="multipart/form-data" action="/finalProject/admin/eventAddOk.do">
<div class="container">
	<div class="content">
		<div class="join_content">
			<div class="join_row">
	            <div class="addr_div">
		            <label>이벤트명</label>
		            <span class="ps_box id_box">
		            	<input type="text" id="title" name="title" class="input id_inp">
		            </span>
		            <div id="titleDiv"></div>
	            </div>
	         </div>
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>이벤트 기간</label>
		            <div>
						<i class="material-icons" style="font-size:30px;">date_range</i>&emsp;
						<input type="date" name="startDate" class="datePicker"> ~ 
						<input type="date" name="endDate" class="datePicker">
					</div>
		            <div id="endDateDiv"></div>
	            </div>
	         </div>
	         
	         <br>
	         <div class="join_row">
	         	<label>이벤트 이미지</label>
	            <input type="file" name="image" id="img1" size="50">
	            <div id="imgDiv"></div>
	         </div>
	         
	         <br>
	         <div class="join_row">
	         	<label>이벤트 싱세이미지</label>
	            <input type="file" name="image" id="img2" size="50">
	            <div id="imgDiv"></div>
	         </div> 
	         
	        <div class="btn_area">
	        	<button type="button" id="eventAddBtn" class="btn_type btn_primary">이벤트 등록</button>
	        </div>
		</div>
	</div>
</div>
</form>

<!-- 날짜 입력 확인 다이얼로그 -->
<div id="myConfirmDialog_frame" style="display: none;">
	<div id="myConfirmDialog">
		<i class="material-icons" id="myConfirmDialog_closeBtn">clear</i>
		날짜를 입력하지 않았습니다<br>
		기간을 이번달로 설정하시겠습니까?
		<button id="myConfirmDialog_okBtn">확인</button>
		<button id="myConfirmDialog_cancelBtn">취소</button>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//시작날짜 수정시
	$("[name='startDate']").change(function(){
		if($("[name='endDate']").val()=='')
			$("[name='endDate']").val($("[name='startDate']").val());
	});
	$("[name='endDate']").change(function(){
		if($("[name='startDate']").val()=='')
			$("[name='startDate']").val($("[name='endDate']").val());
	});
	
	//등록 버튼 클릭시
	$('#eventAddBtn').click(function(){
		if($('#title').val() == ''){
			$('#titleDiv').text('이벤트명을 입력하세요').css('color','red').css('font-size','9pt');
		}else if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()=='') {
			$('#myConfirmDialog_frame').show();
			return true;
		}else if($('[name="startDate"]').val()=='' && $('[name="endDate"]').val()!=''){
			$('[name="startDate"]').val($('[name="endDate"]').val());
		}else if($('[name="startDate"]').val()!='' && $('[name="endDate"]').val()==''){
			$('[name="endDate"]').val($('[name="startDate"]').val());
		}else{
			$('#eventAdd').submit();
		}
		
	});
	
	//다이얼로그 이벤트
	$('#myConfirmDialog_closeBtn, #myConfirmDialog_cancelBtn').click(function(){
		$('#myConfirmDialog_frame').hide();
	});
	$('#myConfirmDialog_okBtn').click(function() {
		$('#myConfirmDialog_frame').hide();
		$('#eventAdd').submit();
	});
	
});
</script>
</body>
</html>