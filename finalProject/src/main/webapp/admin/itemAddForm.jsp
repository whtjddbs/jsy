<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

:root .sel {
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    -webkit-background-size: 20px 8px;
    background-size: 20px 8px;
}

.sel {
    width: 100%;
    height: 38px;
    padding: 7px 8px 6px 7px\9;
    font-size: 15px;
    line-height: 18px;
    color: #000;
    border: none;
    border-radius: 0;
    -webkit-appearance: none;
    padding-left:10px;
}

.selbx{
	display:inline-block;
	position:relative;
	height:40px;
	border:1px solid #d4d4d4
}

.selbx, .selbx   select{
	width:100%;
	vertical-align:top;
	box-sizing:border-box;
	
}

.addr_div{
	position: relative;
    margin-top: 10px;
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
</style>
</head>
<body>
<div align="center">
<font class="title">ADD ITEMS</font>
<hr width="500" color="#000">
</div>

<form id="itemAdd" method="post" enctype="multipart/form-data" action="/finalProject/admin/itemAdd.do">
<div class="container">
	<div class="content">
		<div class="join_content">
			<div class="join_row">
	            <div class="addr_div">
		            <label>상품명</label>
		            <span class="ps_box id_box">
		            	<input type="text" id="name" name="name" class="input id_inp">
		            </span>
		            <div id="nameDiv"></div>
	            </div>
	         </div>
	         
			<div class="join_row join_tel">   
	            <div class="join_title">
	               <label>상위카테고리</label>
	            </div>
	            <div class="tel_box">
	            	<div class="tel1">
	            		<span class="selbx">
				            <select id="mainItem" name="main_codename" class="sel">
								<option value="bras">bras</option>
								<option value="panties">panties</option>
								<option value="mens">mens</option>
								<option value="sport">sport</option>
							</select>
						</span>
	            	</div>
	            </div>
					<div id="telDiv"></div>
			</div>
	         
	         <div class="join_row join_tel">   
	            <div class="join_title">
	               <label>하위카테고리</label>
	            </div>
	            <div class="tel_box">
	            	<div class="tel1">
	            		<span class="selbx">
				            <select id="subItem" name="sub_codename" class="sel">
				            	<option value="strapless">strapless</option>
								<option value="pushup">pushup</option>
								<option value="wireless">wireless</option>
								<option value="bralette">bralette</option>
								<option value="demi">demi</option>
								<option value="perfect coverage">perfect coverage</option>
							</select>
						</span>
	            	</div>
	            </div>
					<div id="telDiv"></div>
			</div>
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>색깔</label>
		            <span class="ps_box id_box">
		            	<input type="text" id="color" name="color" class="input id_inp">
		            </span>
		            <div id="colorDiv"></div>
	            </div>
	         </div>
	         
	         <div class="join_row join_tel">   
	            <div class="join_title">
	               <label>사이즈</label>
	            </div>
	            <div class="tel_box">
	            	<div class="tel1">
	            		<span class="selbx">
				            <select name="size1" id="size1" class="sel">
				            	<option value='65'>65</option>
				            	<option value='70'>70</option>
				            	<option value='75'>75</option>
				            	<option value='80'>80</option>
				            	<option value='85'>85</option>
				            	<option value='90'>90</option>
				            	<option value='95'>95이상</option>
							</select>
						</span>
	            	</div>
	            </div>
					<div id="telDiv"></div>
			</div>
	         
 	         <div class="join_row join_tel">   
	            <div class="join_title">
	               <label>사이즈(브라)</label>
	            </div>
	            <div class="tel_box">
	            	<div class="tel1">
	            		<span class="selbx">
				            <select name="size2" id="size2" class="sel">
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
								<option value="D">D</option>
								<option value="E">E</option>
								<option value="F">F이상</option>
							</select>
						</span>
	            	</div>
	            </div>
					<div id="telDiv"></div>
			</div> 
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>가격(원)</label>
		            <span class="ps_box id_box">
		            	<input type="number" id="price" name="price" class="input id_inp">
		            </span>
		            <div id="priceDiv"></div>
	            </div>
	         </div>
	         
	         <div class="join_row">
	            <div class="addr_div">
		            <label>수량(개)</label>
		            <span class="ps_box id_box">
		            	<input type="number" id="qty" name="qty" class="input id_inp">
		            </span>
		            <div id="qtyDiv"></div>
	            </div>
	         </div>
	         
	         <br>
	         <div class="join_row">
	         	<label>상품이미지</label>
	            <input type="file" name="image" id="img1" size="50">
	            <div id="img1Div"></div>
	         </div>
	         
	         <br>
	         <div class="join_row">
	         	<label>상품 싱세이미지</label>
	            <input type="file" name="image" id="img2" size="50">
	            <div id="img2Div"></div>
	         </div> 
	         
	        <div class="btn_area">
	        	<button type="button" id="itemAddBtn" class="btn_type btn_primary">상품등록</button>
	        </div>
		</div>
	</div>
</div>
</form>


<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//상위 카테고리 변경 시 디비 갔다오기
	$("#mainItem").change(function(){
		$('#subItem').empty();
		$.ajax({
			type : "POST",
			url : "/finalProject/admin/getSubList.do",
			dataType : "json",
			data : {'main_codename' : $("#mainItem").val()},
			success : function(data){
				$.each(data.list,function(index,items){
					$('#subItem').append("<option value='"+items+"'>"+items+"</option>")
				});
			}
		}); 
		
		// 상위카테고리가 브라일 경우 사이즈 변경
		if($("#mainItem").val() == 'bras'){
			$('#size1').empty();
			$('#size1').append("<option value='65'>65</option>");
			$('#size1').append("<option value='70'>70</option>");
			$('#size1').append("<option value='75'>75</option>");
			$('#size1').append("<option value='80'>80</option>");
			$('#size1').append("<option value='85'>85</option>");
			$('#size1').append("<option value='90'>90</option>");
			$('#size1').append("<option value='95'>95이상</option>");
		}else{
			$('#size1').empty();
			$('#size1').append("<option value='S'>S</option>");
			$('#size1').append("<option value='M'>M</option>");
			$('#size1').append("<option value='L'>L</option>");
			$('#size1').append("<option value='XL'>XL</option>");
			
			$('#size2').empty();
			$('#size2').val('null');
			/* $('#size2').prop("disabled", true); */
		}
		
	});
	
	
	$('#itemAddBtn').click(function(){	
		$('#nameDiv').empty();
		$('#colorDiv').empty();
		$('#priceDiv').empty();
		$('#qtyDiv').empty();
		$('#imgDiv').empty();
		
		if($('#name').val() == "")
			$('#nameDiv').text('상품명을 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#color').val() == "")
			$('#colorDiv').text('색깔을 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#price').val() == "")
			$('#priceDiv').text('가격을 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#qty').val() == "")
			$('#qtyDiv').text('수량을 입력하세요').css('color','red').css('font-size','9pt');
		else if($('#img1').val() == "")
			$('#img1Div').text('이미지를 등록하세요').css('color','red').css('font-size','9pt');
		else if($('#img2').val() == '')
			$('#img2Div').text('상세 이미지를 등록하세요').css('color','red').css('font-size','9pt');
		else 
			$('#itemAdd').submit();
	});
});

</script>
</body>
</html>