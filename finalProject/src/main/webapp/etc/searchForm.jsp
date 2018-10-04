<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<input type="hidden" id="jsyjsyjsy" value="jsy">
<input type="hidden" name="pg" id="pg" value="1">
<div class="searchForm_shop_wrap">
	<div class="searchForm_searchfield">
		<div class="searchForm_search_wrap" style="max-width:700px; margin: 0 auto; padding: 80px;">
			<form action="#">
				<div class="searchForm_searchinput" style="position:relative; border-bottom: 6px solid #000; height: 50px;">
					
					<div class="searchForm_suggestbx">
						<input class="searchForm_search-input" id="searchForm_Id" placeholder="Search" type="search" value='${param.header_search_text }' style="display: block; width: 90%; height: 100%; font-size: 30px;border: 0; background: #fff; color: 333; outline: none; float: left;">
					
					    <a href="" style="font-size: 30px; text-decoration: none; color: #000000;"><button class="searchBtn glyphicon glyphicon-search" aria-hidden="true" style="outline: none; border: 0; background: #fff; width: 25px; height: 25px;"></button></a>
						<a href="" style="font-size: 30px; text-decoration: none; color: #000000;"><button type="reset" class="clearBtn fa fa-close" aria-hidden="true" style="outline: none; border: 0; background: #fff; width: 25px; height: 25px; display:none;"></button></a>
					<!--<button type="button" class="searchForm_close" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>  -->
					<!-- <button class="searhForm_btn_search" style="float: right; border: 0; cursor: pointer; margin: 0;"></button>
					<button class="searchForm_btn_clear" style="float: right; border: 0; cursor: pointer; margin: 0;"><i class="fa fa-times"></i></button> -->
					</div><!--searchForm_suggestbx  -->
					
					<div class="searchForm_suggestbx" style="position:absolute; display:none; top:50px; width:100%; height: 500px; background-color: white; border: 1px solid lightgray; opacity: 0.8;">
							<ul class="keywordList">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div><!-- searchForm_suggest_layer -->
				</div><!--searchForm_searchinput  -->
			</form>
			<div class="searchForm_search_lst" style="height: 36px; padding-top: 18px;">
				<div class="searchForm_related" style="font-size: 14px;">
					<dl>
						<dt style="float:left; width: 90px; font-weight: 700;">연관검색어</dt>
						<dd style="height: 36px;">
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">카드케이스</a></span>
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">숄더백</a></span>
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">토트백</a></span>
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">클러치</a></span>
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">지갑</a></span>
							<span style="display:inline-block; margin-right: 15px;"><a href="#" style="font-size: 13px; color: #5d5d5d; outline:none; text-decoration: none;">레더백</a></span>
						</dd>
					</dl>
				</div>
			</div>
			
		</div><!-- searchForm_search_wrap -->
	</div><!-- searchForm_Searchfield -->
	
	<!-- <div class="searchForm_filter">
		<div class="searchForm_filter_title" style="float:left; width: 33%;">
			<span>PRICE</span>
		</div>
		<div class="searchForm_filter_range" style="float:left; width: 33%;">
			
		</div>
		<div class="searchForm_filter_btn" style="float:left; width: 33%;">
			<button type="text">적용</button>
		</div>
	</div>searchForm_filter -->
	
	<div class="searchForm_viewItem" style="margin-left: 13%; margin-top: 2%; width: 80%; overflow: hidden; height: auto;">
	</div>
	<div id="searchFormPagingDiv" style="padding: 30px; margin-left: 50%;"></div>
</div><!-- searchForm_shop_wrap -->

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 
	$('.searchForm_suggestbx:eq(0)').click(function(){
	$('.searchForm_suggestbx:eq(1)').toggle();		
	});
	
	$('.searchForm_search-input').click(function(){
		$('.clearBtn').show();
		$('.searchBtn').hide();
	});
	
	$('.clearBtn').click(function(){
		$('.searchBtn').show();
		$('.clearBtn').hide();
	});
	
 	if($('#searchForm_Id').val()!='') search(1); 
	
	//ajax - item띄우기
	$("form input").keydown(function(e){
		if(e.keyCode==13){
			search(1);
		}
	});
	
	function search(pg) {
		$.ajax({
			type : 'POST',
			url: '/finalProject/etc/search.do',
			data : 'name='+$('#searchForm_Id').val()+'&pg='+pg,
			dataType: 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				$('.searchForm_viewItem *').remove();
				$.each(data.list, function(index, item){
					$('.searchForm_viewItem').append($('<div/>',{
						class : 'itemAll',
						style : 'margin-top: 2%; margin-left: 4%; width: 20%; height: 50%; float: left;'
					}).append($('<a/>',{
						class : 'itemA',
						href : '#',
						style : 'color: black; text-decoration: none; font-size: 12pt; font-wdith: 800; '
					}).append($('<div/>',{
						class : 'itemInfo',
						style : 'width: 100%; height: 90%;'
					}).append($('<div/>',{
						class : 'itemImg',
						style : 'width: 100%; height: 75%;'
					}).append($('<img/>',{
						src : '../image/'+item.main_codename+"/"+item.img,
						style : 'height: 100%; width: 100%; object-fit: one_pdtForm;'
					}))).append($('<div/>',{
						class : 'itemText1',
						text : item.sub_codename,
						style : 'font-weight: 700; color: black; margin-top: 4%; text-decoration: underline;'
					})).append($('<div/>',{
						class : 'itemText2',
						text : item.name,
						style : 'color : #5d5d5d; font-size: 9pt; margin-top: 3%; text-decoration: none;'
					})).append($('<div/>',{
						class : 'itemText3',
						text : item.price,
						style : 'font-weight: 900; font-size: 10pt; color: black; text-decoration: none; margin-top: 2%;'
					})))).append($('<a/>').append($('<input/>',{
						type: 'hidden',
						id : 'wish'+item.seq,
						value : item.seq
					})).append($('<i/>',{
						style: 'color: red; font-size: 16px; cursor: pointer; padding-right: 10px;',
						id : 'myHeart',
						class : 'material-icons',
						text : 'favorite_border'
					}))).append($('<span/>',{
						style : 'padding-right: 30px;',
						text : 0
					})).append($('<a/>').append($('<i/>',{
						style: 'color: blue; font-size: 16px; cursor: pointer; padding-right: 10px;',
						class : 'material-icons',
						text : 'chat_bubble_outline'
					}))).append($('<span/>',{
						text : 0
					})));
				});
				$('#searchFormPagingDiv').html(data.searchFormPaging.pagingHTML);
			}//success
		});
	}
	//페이지클릭
	$('#searchFormPagingDiv').on('click','span',function(){
		location.href="#";
		var pg=$(this).prop('class');
		 search(pg); 
	});

 });	
 

 
 $(document).on('click','#myHeart',function(){
		if('${memberDTO}'=='') alert('로그인 하세요');
		else if($(this).text()=='favorite_border') {
			$(this).text('favorite');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/addWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {}
			});
		}else if($(this).text()=='favorite') {
			$(this).text('favorite_border');
			$.ajax({
				type : 'POST',
				url : '/finalProject/member/deleteWishList.do',
				data : {'seq' : $(this).prev().val(),
						'id' : '${memberDTO.id}'},
				dataType : 'json',
				success : function(data) {}
			});
		}
	});

</script>

</html>