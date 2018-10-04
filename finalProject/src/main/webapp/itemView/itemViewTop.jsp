<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/itemView.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.option_lstbx {
	width: 100%;
	height: auto;
	overflow: hidden;
	margin-bottom: 30px;
	margin-top: 20px;
	
}
.option_color {
	float: left;
	width: 15%;
}

.option_size1 {
	float: left;
	width: 15%;
}

.option_size2 {
	float: left;
	width: 15%;
}

.option_num{
	float: left;
	width: 25%;
}

.option_price{
	float: left;
	width: 15%;
	padding-top: 1px;
}

.numcountbx button{
	float: left;
	position: relative;
    width: 28px;
    height: 28px;
    border: 1px solid #cdcdcd;
    border-radius: 0;
    background: #fff;
    font-size: 15px;
    color: #5d5d5d;
    cursor: pointer;
    text-decoration: none;
    margin: 0px;
}

.numcountbx input{
	float: left;
	width: 35px;
    height: 28px;
    border: 1px solid #cbcbcb;
    border-width: 1px 0;
    margin: 0px;
    font-size: 13px;
    color: #666;
    text-align: center;
    box-sizing: border-box;
}


#deleteBtn{
	overflow: visible;
    width: 16px;
    height: 16px;
    margin:0px 0px 0px 7px;
    padding: 1px;
    box-sizing: border-box;
    background: transparent;
    float: right;
    cursor: pointer;
}

.result_total{
	border-top: 2px solid #000;
	text-align: right;
    line-height: 32px;
}

.num{
	font-size: 22px;
    color: #ff4800;
}
a#MOVE_ON_BTN{
   position: fixed; /* 화면에 고정 */
   right: 3%; /* 버튼 위치 설정 */
   bottom : 50px; /* 버튼 위치 설정 */
   display: none; /*화면에서 숨김  */
   z-index: 999;/* 다른 태그들 보다 위에 오도록 */   
}

#dialog_frame {
	background-color: transparent;
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

#moveCart{
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
}


#dialog_closeBtn {
	position: fixed;
	top: 5px;
	right: 5px;
	cursor: pointer;
}

#dialogClear {
	width: inherit;
    height: inherit;
    padding: 50px 40px 40px;
    background-color: rgb(255, 255, 255);
    box-shadow: rgba(0, 0, 0, 0.5) 20px 20px 80px 0px;
    opacity: 1;
    transform: translate(-50%, -50%) scale(1);
    position: absolute;
    top: 50%;
    left: 50%;
    box-sizing: border-box;
    min-width: 300px;
}

#itemViewTotalDiv {width: 80%; min-width: 1000px; margin: 0px 10%;}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/itemView.js">
</script>

</head>
<body>
<div id="itemViewTotalDiv">
<form id="itemViewForm" action="/finalProject/order/checkout.do" method="POST">
<div class="detail_category">
	<ul >
	    <li class="category1" >
            <select id="stat1">
            	<option>MAIN</option>
            </select>
	    </li>
	    <li class="category2" >
              <select id="stat2">
           		<option>SUBMAIN</option>
              </select>
	    </li>
	</ul>
</div>

 <!---->
<div  class="image" id="ProductDetail">
	<img  class="imagebox"  id="ProductImage">
   	<div  class="item_detail_view">
		<h3  class="name" id = "ProductName"></h3>  
		<div  class="sale">
			<div  class="o" id="ProductPrice"></div>
		    <div  class="s" id="ProductDiscount"></div>
		</div>
		<div class="policy" id="savePoint"></div>
		<div id="allSelect">
			<div id="select1" class="selbx">
				<select id="colorSlt">
					<option value="">COLOR를 선택해주세요</option>
				</select>
			</div>               
			<div id="select2" class="selbx">
				<select  id="sizeSlt">
					<option  value="">SIZE를 선택해주세요</option>
				</select>
			</div>
			<div id="select3" class="selbx" style="display:none;">
				<select  id="cupSlt">
					<option  value="">SIZE를 선택해주세요</option>
				</select>
			</div>
	
			<div id=totalPrice style="float: left; width: 100%;" align="center"></div>
				<input type="hidden" id="inputBtn" value="submit">
			<div id=totalResult style="float: left; width: 100%;" align="center">
				<div  class="result_total">
					<span  class="total_price">총 상품 금액 : </span>
					<span  class="num"><span id="priceNum"></span>원</span>
				</div>
	        </div>
			

			<div  class="chooseBox">  
				<div>               	
	 				<a  class="shopbag" id="checkLogin1">SHOPPING BAG</a>
	  				<a  class="buyNow" id="checkLogin2">BUY NOW</a>
				</div>
			</div>
		</div>	
	</div>
</div>
</form>
<!---->
<!---->
       
<a id="MOVE_ON_BTN" href="#"><img src="../image/move_on_top.png" width="65px" height="65px"></a>

<div>
  <jsp:include page="../itemView/itemViewMid1.jsp"/>
</div>


<div id="dialog_frame" class="clear_frame">
	<div id="dialogClear">
		<i class="material-icons" id="dialog_closeBtn"><img src="../image/close.png" width="50" height="50"></i>
			이미 선택된 옵션입니다.<br>
	</div>		
</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

   /* top버튼 */
  $("body").scrollTop(0);
  $(function(){
		$(window).scroll(function(){
		   if($(this).scrollTop() > 400){
		      $('#MOVE_ON_BTN').fadeIn();
		   }else{
		      $('#MOVE_ON_BTN').fadeOut();
		   }/*스크롤 위치에 따라 화면에서 맨위로 올라가는 버튼을 나타내고 사라지도록 설정   */
		});
		
		$('#MOVE_ON_BTN').click(function(){//버튼 클릭 이벤트 
		   $('html, body').animate({scrollTop: 0}, 400);//animation을 걸어서 화면 맨위로 이동하도록 설정 
		   return false;
		}); 
		
//////////////////////////////////////////////////////////////////////		
		//맨 위에 셀렉 박스
		$.ajax({
			type : 'GET',
			url : '/finalProject/itemView/checkMain_codename.do',
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$.each(data.list, function(index, item){				
					$('.category1 > select').append($('<option/>',{
						value : item,
						text : item
					}))
				});
			}
		});
		$('.category1 select').change(function(){
			$.ajax({
				type : 'GET',
				url : '/finalProject/itemView/checkSub_codename.do',
				data : {'main_codename' : $(this).val() }, 
				dataType : 'json',
				success : function(data){
					//alert(JSON.stringify(data));
					$('#stat2 > option:gt(0)').remove();
					
					$.each(data.list, function(index, item){
						$('#stat2').append($('<option/>', {
							value : item,
							text : item
						}))
					});
				}
			});
		});
		
		$('#stat2').change(function(){
			location.href='/finalProject/new/itemDisplay.do?main_codename='+$('#stat1').val()+'&sub_codename='+$(this).val()+'&pg=1';
		});

//////////////////////////////////////////////////////////////////////   
 		//장바구니 담기
 		$('#checkLogin1').click(function(){
 			if($('.option_resultbx').length==0) {
				alert("상품 옵션을 선택해주세요");
			}else {
				//DB처리
				/* alert($('#itemViewForm').serialize());
				$.ajax({
					type : 'POST',
					url : '/finalProject/order/addShoppingBag.do',
					data : $('#itemViewForm').serialize(),
					dataType : 'json',
					success : function(data) {
						alert(JSON.stringify(data));
					}
				}); */
				
				$('#itemViewForm').prop('action','/finalProject/order/addShoppingBag.do').submit();
			}
		});
		
		//즉시 구매
		$('#checkLogin2').click(function(){
			$('#itemViewForm').prop('action','/finalProject/order/checkout.do').submit();	
		});
//////////////////////////////////////////////////////////////////////
		//color 상품 DB가져와야됨
		$.ajax({
			type : 'POST',
			url : '/finalProject/itemView/getColor.do',
			data : 'seq=${param.seq}',
			dataType : 'json',
			success : function(data) {
				//alert('color:'+JSON.stringify(data));
				$.each(data.list, function(index, item){
					$('#colorSlt').append($('<option/>',{
						value : item,
						text : item.toUpperCase()
					}));
				});
			}
		});	
//////////////////////////////////////////////////////////////////////		
		//size1
		$('#colorSlt').change(function(){
			var count=$('#colorSlt option:selected').val();
			$('#sizeSlt').children('option:gt(0)').remove();
			
			if(count == ""){
				
			} else {
				$.ajax({
					type : 'POST',
					url : '/finalProject/itemView/getSize1.do',
					data : 'seq=${param.seq}&color='+$('#colorSlt').val(),
					dataType : 'json',
					success : function(data) {
						//alert(JSON.stringify(data));
						$.each(data.list, function(index, item){
							$('#sizeSlt').append($('<option/>',{
								value : item,
								text : item.toUpperCase()
							}));					
						});
					}
				});	
			 }
		});
		
/////////////////////////////////////////////////////////////////////		
		// 
		
		//상품 이미지, 상품명, 가격, 디스카운트 가져와야됨
		$.ajax({
			type : 'POST',
			url : '/finalProject/itemView/getProductDetail.do',
			data : 'seq=${param.seq}',
			dataType : 'json',
			success : function(data) {
				//alert(JSON.stringify(data));
				
				$('img#ProductImage').prop('src', '../image/'+data.itemDTO.main_codename+'/'+data.itemDTO.img);
				$('#ProductName').text(data.itemDTO.name);
				$('#ProductPrice').text(data.itemDTO.price);
				if(data.itemDTO.discount == '0'){
					$('#ProductPrice').text(data.itemDTO.price).css('color','red').css('font-size','20pt').css('text-decoration','none');
					$('#ProductDiscount').hide();
				} else {
					$('#ProductDiscount').text(data.itemDTO.price*(1-data.itemDTO.discount));
				}
				$('#savePoint').text('적립금 : '+ data.itemDTO.price*(1-data.itemDTO.discount)*0.01).css('font-size','11pt');
				
				if(data.itemDTO.main_codename=='bras') $('#select3').show(); //사이즈2를 미리 숨겨놓고 브라스 일 때 생성					
			}
		});
 
//////////////////////////////////////////////////////////////////////
	// 아래 지정된 가격 창 뜨게 하기		
		if('${itemDTO.main_codename}'=='bras') {
			$('#totalResult').hide();
			
			$('#cupSlt').change(function(){
				$("#selectWhole option:eq(0)").prop("selected",true);
				$('#totalResult').show();
			});
			
			//size2
			$('#sizeSlt').change(function(){
				var count=$('#sizeSlt option:selected').val();
				$('#cupSlt').children('option:gt(0)').remove();
				
				if(count == ""){
					
				} else {
					$.ajax({
						type : 'POST',
						url : '/finalProject/itemView/getSize2.do',
						data : 'seq=${param.seq}&color='+$('#colorSlt').val()+'&size1='+$('#sizeSlt').val(),
						dataType : 'json',
						success : function(data) {
							//alert(JSON.stringify(data));
							$.each(data.list, function(index, item){
								$('#cupSlt').append($('<option/>',{
									value : item,
									text : item.toUpperCase()
								}));					
							});
						}
					});	
				 }
			});
					
			$('#cupSlt').change(function(){
				var check = '';
				//선택된 옵션창 띄우기
				$('.option_lstbx').each(function(index){
					var color = $(this).children().eq(0).children().eq(0).text();
					var size = $(this).children().eq(1).children().eq(0).text();
					var cup = $(this).children().eq(2).children().eq(0).text();
					if(color == $('#colorSlt').val() && size == $('#sizeSlt').val() && cup == $('#cupSlt').val()) {
						$('.clear_frame').show();
						check='true';
					}
					
				});
			
				if(check!='true') {
				
				//총 합계 창 보여주기
				$('#totalResult').show();
				
				$('<div/>',{ 
					class : 'option_resultbx'
				}).append($('<div/>',{
					class : 'option_lstbx'
				}).append($('<div/>',{
					class : 'option_color'
				}).append($('<span/>',{
					text: $('#colorSlt option:selected').val()	//셀렉 박스에 선택된 값 들어오게 하기		
				}))).append($('<div/>',{
					class : 'option_size1'
				}).append($('<span/>',{
					text: $('#sizeSlt option:selected').val() //셀렉 박스에 선택된 값 들어오게 하기
				}))).append($('<div/>',{
					class : 'option_size2'
				}).append($('<span/>',{
					text: $('#cupSlt option:selected').val() //셀렉 박스에 선택된 값 들어오게 하기
				}))).append($('<div/>',{
					class : 'option_num'
				}).append($('<span/>',{
					class : 'numcountbx'
				}).append($('<button/>',{
					type : 'button',
					text: '-',	
					id : 'minus'
				})).append($('<input/>',{
					type: 'number',
					name : 'count',
					value: '1'
				})).append($('<button/>',{
					type : 'button',
					id : 'plus',
					text:'+'
				})))).append($('<div/>',{
					class :'option_price',
					text: $('#ProductPrice').text() //
				})).append($('<div/>',{
					style : 'float : left;'
				}).append($('<i/>',{
					class : 'material-icons',
					id : 'deleteBtn',
					text: 'highlight_off'
				}))).append($('<input/>',{
					name : 'color',
					type : 'hidden',
					value :  $('#colorSlt option:selected').val()
				})).append($('<input/>',{
					name : 'size1',
					type : 'hidden',
					value : $('#sizeSlt option:selected').val()
				})).append($('<input/>',{
					name : 'size2',
					type : 'hidden',
					value : $('#cupSlt option:selected').val()
				})).append($('<input/>',{
					name : 'price',
					type : 'hidden',
					value : $('#ProductPrice').text()
				})).append($('<input/>',{
					name : 'seq',
					type : 'hidden',
					value : '${param.seq}'
				}))).appendTo($('#totalPrice'));
				
				$('#totalPrice').show();
				}
				
				var sum = 0;
				$('.option_price').each(function(index){
					sum += parseInt($(this).text());
				});
				
				$('#priceNum').text(sum);
				//셀렉박스 초기화
				$('#colorSlt option:eq(0)').prop("selected",true);
				$('#sizeSlt option:eq(0)').prop("selected",true);
				$('#cupSlt option:eq(0)').prop("selected",true);
				$('#sizeSlt option:gt(0)').remove();
				$('#cupSlt option:gt(0)').remove();
				

			});

	} else {	
		//총합계 상품 골랐을시에 뜨게 만듬 	
		$('#totalResult').hide();
		
		$('#sizeSlt').change(function(){
			$("#selectWhole option:eq(0)").prop("selected",true);
			$('#totalResult').show();
		});
		
		$('#sizeSlt').change(function(){
			var check = '';
			$('.option_lstbx').each(function(index){
				var color = $(this).children().eq(0).children().eq(0).text();
				var size = $(this).children().eq(1).children().eq(0).text();
				if(color == $('#colorSlt').val() && size == $('#sizeSlt').val()) {
					$('.clear_frame').show();
					check='true';
				}					
			});
			
			if(check!='true') {
			
			//총 합계 창 보여주기
			$('#totalResult').show();
			
			$('<div/>',{ 
				class : 'option_resultbx'
			}).append($('<div/>',{
				class : 'option_lstbx'
			}).append($('<div/>',{
				class : 'option_color'
			}).append($('<span/>',{
				text: $('#colorSlt option:selected').val()	//셀렉 박스에 선택된 값 들어오게 하기		
			}))).append($('<div/>',{
				class : 'option_size1'
			}).append($('<span/>',{
				text: $('#sizeSlt option:selected').val() //셀렉 박스에 선택된 값 들어오게 하기
			}))).append($('<div/>',{
				class : 'option_num'
			}).append($('<span/>',{
				class : 'numcountbx'
			}).append($('<button/>',{
				type : 'button',
				text: '-',	
				id : 'minus'
			})).append($('<input/>',{
				type: 'number',
				name : 'count',
				value: '1'
			})).append($('<button/>',{
				type : 'button',
				id : 'plus',
				text:'+'
			})))).append($('<div/>',{
				class :'option_price',
				text: $('#ProductPrice').text() //
			})).append($('<div/>',{
				style : 'float : left;'
			}).append($('<i/>',{
				class : 'material-icons',
				id : 'deleteBtn',
				text: 'highlight_off'
			}))).append($('<input/>',{
				name : 'color',
				type : 'hidden',
				value :  $('#colorSlt option:selected').val()
			})).append($('<input/>',{
				name : 'size1',
				type : 'hidden',
				value : $('#sizeSlt option:selected').val()
			})).append($('<input/>',{
				name : 'price',
				type : 'hidden',
				value : $('#ProductPrice').text()
			})).append($('<input/>',{
				name : 'seq',
				type : 'hidden',
				value : '${param.seq}'
			}))).appendTo($('#totalPrice'));
			
			$('#totalPrice').show();
			}
			
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
			//셀렉박스 초기화
			$('#colorSlt option:eq(0)').prop("selected",true);
			$('#sizeSlt option:eq(0)').prop("selected",true);
			$('#sizeSlt option:gt(0)').remove();
		});
	}
//////////////////////////////////////////////////////////////////////
//+- 클릭이벤트
	$(document).on('click','#plus',function(){
		
		var count = parseInt($(this).prev().val())+1;
		$(this).prev().val(count);
	
		$(this).parent().parent().next().text(parseInt($('#ProductPrice').text())*count);
		
		//결과값 도출
		var sum = 0;
		$('.option_price').each(function(index){
			sum += parseInt($(this).text());
		});
		
		$('#priceNum').text(sum);
	});	
	$(document).on('click','#minus',function(){
		if($(this).next().val()!='0') {
			var count = parseInt($(this).next().val())-1;
			$(this).next().val(count);
			$(this).parent().parent().next().text(parseInt($('#ProductPrice').text())*count);
		
			//결과값 도출
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
		
		}
	});

//////////////////////////////////////////////////////////////////////	



		
//이모티콘 x누를시 삭제 개별적으로 하나씩 삭제 &삭제될시 총합계도 삭제	
		$('#totalPrice').on('click','#deleteBtn',function(){
			$(this).parent().parent().remove();
			
			if($('.option_lstbx').text() == '') { //마지막 상자가 사라지면 총 합계 hide
				$('#totalResult').hide();
			}
			//결과값 도출
			var sum = 0;
			$('.option_price').each(function(index){
				sum += parseInt($(this).text());
			});
			
			$('#priceNum').text(sum);
			
		});

		$('#dialog_closeBtn').click(function(){
			$('.clear_frame').hide();
		});
		
 });
   	
</script>
</body>
</html>